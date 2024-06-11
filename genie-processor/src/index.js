import http from "http";
import url from "url";
import querystring from "querystring";
import fs from "fs";
import { basename } from "path";
import SaxonJS from "saxon-js/SaxonJS2N.js";

// prettier-ignore
import { S3Client,DeleteObjectCommand, GetObjectCommand, PutObjectCommand, ListObjectsV2Command } from "@aws-sdk/client-s3";

const JSON_MIME = "application/json";
const REGION = process.env.REGION ?? "eu-west-2";
const BUCKET = process.env.BUCKET ?? "genie-hub-2";
const GENIE_URL =
	process.env.GENIE_URL ?? "https://genie-hub-2.s3.eu-west-2.amazonaws.com/";

const s3Client = new S3Client({ region: REGION });

const TEMP_DIR = process.env.TEMP_DIR ?? "";

const transform = (
	xml,
	xslt,
	xsltBaseUri,
	method = "xml",
	initialTemplate = null
) => {
	try {
		const result = SaxonJS.XPath.evaluate(
			`transform(
				map {
					'stylesheet-text' : $pXslt,
					'stylesheet-base-uri' : $pXsltBaseUri,
					'source-node' : parse-xml($pXml),
					'delivery-format' : 'raw'` +
				(initialTemplate
					? ",'initial-template' : QName('', $pInitialTemplate)"
					: "") +
				`}
			)`,
			[],
			{
				params: {
					pXml: xml,
					pXslt: xslt,
					pXsltBaseUri: xsltBaseUri,
					...(initialTemplate && { pInitialTemplate: initialTemplate }),
				},
			}
		);

		return SaxonJS.serialize(result.output, { method });
	} catch (error) {
		return { failed: true, msg: error.message };
	}
};

const copyFilesToLocal = async () => {
    if (!TEMP_DIR.includes("public/_assets/_xls")) {
        const imports = await listS3Folder("_assets/_xsl_imports/");
        await Promise.all(
            imports.map(async s3File => {
                const tempFile = `${TEMP_DIR}${basename(s3File.Key)}`;
                try {
                    await fs.promises.access(tempFile, fs.constants.F_OK);
                } catch (err) {
                    const fileData = await fromS3(s3File.Key);
                    await fs.promises.writeFile(tempFile, fileData);
                }
            })
        );
    }
};


export const xslt = async event => {
    if (!event.Records) {
        return;
    }

    await copyFilesToLocal();

    await Promise.all(
        event.Records.map(async r => {
            if (r.s3) {
                let { transformXml, transformXsl, ...params } = await fromS3(
                    r.s3.object.key
                ).then(buffer =>
                    buffer && buffer.length > 0 ? JSON.parse(buffer) : null
                );
                const renderAsBlank =
                    params.s3Key.endsWith("pdf") &&
                    transform(
                        transformXml,
                        transformXsl,
                        `file://${TEMP_DIR}`,
                        "html",
                        "include-in-render"
                    ) === "false";

                let transformedXML = transform(
                    transformXml,
                    transformXsl,
                    `file://${TEMP_DIR}`,
                    params.s3Key.endsWith("html") ? "html" : "xml"
                );

                if (transformedXML) {
                    if (typeof transformedXML === "object" && transformedXML.failed) {
                        await toS3(
                            `_errors/${params.renderId}-${Date.now()}-api.json`,
                            Buffer.from(
                                JSON.stringify({
                                    error: transformedXML.msg,
                                    params,
                                    transformXml,
                                    transformXsl,
                                })
                            ),
                            null,
                            JSON_MIME
                        );

                        console.log(
                            "XSLT failed:",
                            params.asset,
                            transformedXML,
                            transformXml,
                            transformXsl
                        );
                    } else {
                        const s3Target = params.noPuppeteer
                            ? params.s3Key
                            : r.s3.object.key.replace("-xslt.json", ".html");

                        params.url = `${GENIE_URL}${s3Target}`;

                        if (params.noPuppeteer) {
                            const htmlTags = {
                                finalRender: true,
                                ...params.tags,
                                "Genie-Delete": "extended",
                            };
                            await toS3(
                                s3Target,
                                transformedXML,
                                htmlTags,
                                "text/html"
                            );
                        } else {
                            await toS3(
                                s3Target,
                                transformedXML,
                                { finalRender: true },
                                "text/html"
                            );

                            await toS3(
                                r.s3.object.key.replace("xslt.json", "puppeteer.json"),
                                JSON.stringify({ ...params, renderAsBlank }),
                                { "Genie-Delete": true },
                                "application/json"
                            );
                        }

                        if (
                            params.noPuppeteer ||
                            (params.isCollection &&
                                params.suffix === "pdf" &&
                                (params.pageIndex <= 2 || !params.pageIndex))
                        ) {
                            const revisedSuffix = `${params.noPuppeteer ? "" : "-"}grab-${
                                params.pageIndex ?? 0
                            }.webp`;
                            const width = params.noPuppeteer ? 800 : params.dims.width;
                            const height = params.noPuppeteer ? 1200 : params.dims.height;

                            await toS3(
                                r.s3.object.key.replace(
                                    "xslt.json",
                                    `grab-${params.pageIndex ?? 0}-puppeteer.json`
                                ),
                                JSON.stringify({
                                    url: params.url,
                                    bucket: params.bucket,
                                    width,
                                    height,
                                    webp: true,
                                    tags: params.tags,
                                    s3Key: params.s3Key.replace(
                                        /(index\.html|\.pdf)/g,
                                        revisedSuffix
                                    ),
                                }),
                                { "Genie-Delete": true },
                                "application/json"
                            );
                        }

                        if (!params.isDebug) {
                            await s3Client.send(
                                new DeleteObjectCommand({
                                    Bucket: BUCKET,
                                    Key: r.s3.object.key,
                                })
                            );
                        }
                    }
                } else {
                    console.log("Failed on ", params.asset);
                }
            }
        })
    );
};

const fromS3 = async (key, bucket = null) => {
    try {
        const data = await s3Client.send(
            new GetObjectCommand({
                Bucket: bucket ?? BUCKET,
                Key: key,
            })
        );
        const stream = data.Body;
        return await streamToBuffer(stream);
    } catch (err) {
        if (err.Code !== "NoSuchKey") console.log("Retrieve S3: ", err);
    }
};

const streamToBuffer = async (stream) => {
    return new Promise((resolve, reject) => {
        const chunks = [];
        stream.on('data', chunk => chunks.push(chunk));
        stream.on('end', () => resolve(Buffer.concat(chunks)));
        stream.on('error', reject);
    });
};

const listS3Folder = async (folderPath, bucket = null) => {
	try {
		const response = await s3Client.send(
			new ListObjectsV2Command({
				Bucket: bucket ?? BUCKET,
				Prefix: folderPath,
			})
		);

		return response.Contents || [];
	} catch (err) {
		console.error("Error:", err);
	}
};

const toS3 = async (
    key,
    buffer,
    tags = null,
    mimeType = null,
    bucket = null
) => {
    if (tags && typeof tags === "object") {
        tags = Object.keys(tags)
            .map(key => `${key}=${tags[key]}`)
            .join("&");
    }

    try {
        const res = await s3Client.send(
            new PutObjectCommand({
                Bucket: bucket ?? BUCKET,
                Key: key,
                Body: buffer,
                ContentType: mimeType,
                CacheControl: "max-age=30",
                Tagging: tags,
            })
        );

        return res.ETag;
    } catch (err) {
        console.log("Upload to S3 failed: ", err);
    }
};

if (process.argv.length > 2) {
	console.log("Processing command line: ", process.argv);
	try {
		if (process.argv[2] == "test") {
			const assetDir = process.cwd() + "/../public/_assets/_xsl/";
			const dataDir = process.cwd() + "/../public/_assets/_reference/";

			const server = http.createServer(async (req, res) => {
				try {
					const parsedUrl = url.parse(req.url);
					const queryParams = querystring.parse(parsedUrl.query);

					const assetPath = `${assetDir}${queryParams.xsl}.xsl`;
					const dataPath = `${dataDir}${
						queryParams?.xml ?? "_genie-sample"
					}.xml`;

					if (!fs.existsSync(assetPath)) {
						res.writeHead(200, { "Content-Type": "text/plain" });
						res.end(`Asset ${queryParams.xsl} does not exist`);
						return;
					}

					if (!fs.existsSync(dataPath)) {
						res.writeHead(200, { "Content-Type": "text/plain" });
						res.end(`Data file ${dataPath} does not exist`);
						return;
					}

					const output = await testXSL(assetPath, dataPath, null);

					res.writeHead(200, { "Content-Type": "text/html" });
					res.end(typeof output == "string" ? output : JSON.stringify(output));
				} catch (err) {
					res.end(`Failed with ${err.toString()}`);
				}
			});

			const PORT = process.env.PORT || 3000;

			server.listen(PORT, () => {
				console.log(`Server is running on port ${PORT}`);
			});
		}
	} catch (err) {
		console.log("Error:", err);
	}
}

const testXSL = async (
	xslKey,
	xmlKey = "_assets/_reference/_genie-sample.xml",
	outName = "output.svg"
) => {
	const transformXsl = fs.existsSync(xslKey)
		? fs.readFileSync(xslKey, "utf8")
		: (await fromS3(`_assets/_xsl/${xslKey}.xsl`)).toString();
	const transformXml = fs.existsSync(xmlKey)
		? fs.readFileSync(xmlKey, "utf8")
		: (await fromS3(xmlKey)).toString();

	let r = transform(
		transformXml,
		transformXsl,
		`file://${TEMP_DIR}`,
		"html",
		"include-in-render"
	);

	if (r == "false") {
		r = "no dice";
	} else {
		r = transform(transformXml, transformXsl, `file://${TEMP_DIR}`, "html");
	}

	if (outName) {
		fs.writeFile(outName, r, err => {
			if (err) throw err;
			console.log(`Data has been written to the ${out}.`);
		});
	}

	return r;
};
