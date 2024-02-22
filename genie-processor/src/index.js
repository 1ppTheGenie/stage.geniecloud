import fs from "fs";
import { basename } from "path";
import SaxonJS from "saxon-js/SaxonJS2N.js";

// prettier-ignore
import { S3Client,DeleteObjectCommand, GetObjectCommand, PutObjectCommand, ListObjectsV2Command } from "@aws-sdk/client-s3";

const REGION = process.env.REGION ?? "eu-west-2";
const BUCKET = process.env.BUCKET ?? "genie-hub-2";
const GENIE_URL =
	process.env.GENIE_URL ?? "https://genie-hub-2.s3.eu-west-2.amazonaws.com/";

const JSON_MIME = "application/json";

const KEEP_RENDER_FOR = process.env?.KEEP_RENDER_FOR || 52;
const WEEK_IN_MILLISECONDS = 60 * 60 * 24 * 1000;

// Set up the S3 client
const s3Client = new S3Client({ region: REGION });

const TEMP_DIR =
	process.env.TEMP_DIR ??
	"D:/Dropbox/development/genie-marketing-hub-master/GenieHub/genie-hub-cloud/public/_assets/_xsl_imports/";

const transform = (xml, xslt, xsltBaseUri, method='xml') => {
	try {
		const result = SaxonJS.XPath.evaluate(
			`
				  transform(
					  map {
						  'stylesheet-text' : $pXslt,
						  'stylesheet-base-uri' : $pXsltBaseUri,
						  'source-node' : parse-xml($pXml),
						  'delivery-format' : 'raw'
					  }
				  )
			  `,
			[],
			{
				params: {
					pXml: xml,
					pXslt: xslt,
					pXsltBaseUri: xsltBaseUri,
				},
			}
		);

		return SaxonJS.serialize(result.output, { method });
	} catch (error) {
		return { failed: true, msg: error.message };
	}
};

const copyFilesToLocal = async () => {
	// Files imported via xsl:import have to exist on a "local" drive
	if (
		TEMP_DIR !==
		"D:/Dropbox/development/genie-marketing-hub-master/GenieHub/genie-hub-cloud/public/_assets/_xsl_imports/" // &&!fs.existsSync(iconsPath) might want this on there to avoid doing this each time
	) {
		const imports = await listS3Folder("_assets/_xsl_imports/");
		await Promise.all(
			imports.map(async s3File => {
				const fileData = await fromS3(s3File.Key);
				const tempFile = `${TEMP_DIR}${basename(s3File.Key)}`;

				fs.writeFileSync(tempFile, fileData);
			})
		);
	}
};

export const xslt = async event => {
	if (!event.Records) return;

	await copyFilesToLocal();

	await Promise.all(
		event.Records.map(async r => {
			if (r.s3) {
				let { transformXml, transformXsl, ...params } = await fromS3(
					r.s3.object.key
				).then(buffer =>
					buffer && buffer.length > 0 ? JSON.parse(buffer) : null
				);

				const transformedXML = transform(
					transformXml,
					transformXsl,
					`file://${TEMP_DIR}`,
					params.s3Key.endsWith("html") ? "html" : "xml"
				);

				if (transformedXML) {
					if (typeof transformedXML == "object" && transformedXML.failed) {
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
							await toS3(
								s3Target,
								transformedXML,
								{ finalRender: true, ...params.tags,"Genie-Delete": "extended" },
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
								JSON.stringify(params),
								{ "Genie-Delete": true },
								"application/json"
							);
						}

						// Make a screen grab?
						if (
							params.noPuppeteer ||
							(params.isCollection &&
								params.suffix == "pdf" &&
								params.pageIndex <= 2)
						) {
							const revisedSuffix = `${params.noPuppeteer ? "" : "-"}grab-${
								params.pageIndex
							}.webp`;
							const width = params.noPuppeteer ? 800 : params.dims.width;
							const height = params.noPuppeteer ? 1200 : params.dims.height;

							await toS3(
								r.s3.object.key.replace(
									"xslt.json",
									`grab-${params.pageIndex}-puppeteer.json`
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
		return Buffer.concat(
			await (
				await s3Client.send(
					new GetObjectCommand({
						Bucket: bucket ?? BUCKET,
						Key: key,
					})
				)
			).Body.toArray()
		);
	} catch (err) {
		if (!err.Code == "NoSuchKey") console.log("Retrieve S3: ", err);
	}
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
	if (tags && typeof tags == "object") {
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
				Tagging: tags,
			})
		);

		return res.ETag;
	} catch (err) {}
};

const testXSL = async testKey => {
	const transformXsl = (await fromS3(`_assets/_xsl/${testKey}.xsl`)).toString();
	const transformXml = (
		await fromS3("_assets/_reference/_genie-sample.xml")
	).toString();

	const r = transform(transformXml, transformXsl, `file://${TEMP_DIR}`);

	console.log(r);
};
/*
await testXSL("direct-mail-postcards-back/coit-mailer-back");

let r = await xslt({
	Records: [
		{
			s3: {
				object: {
					key: "_processing/56947122-946d-429e-b39c-32cb0b32a45a/lc-prop-post-03a-png-p0-xslt.json",
				},
			},
		},
	],
});

const promises = r.map(async s3 => {
	try {
		let transformXsl;
		try {
			let buffer,
				i = 0;
			while (!buffer && i <= 4) {
				buffer = await fromS3(s3.Key);
				if (typeof buffer !== "undefined") {
					transformXsl = buffer.toString();
					i = 6;
				} else {
					i++;
				}
			}

			if (i != 6) console.log("Failed on:", s3.Key);
		} catch (e) {
			console.log("Nope:", s3.Key.replace(`_assets/_xsl/`, ""), e);
		}
		if (transformXsl) {
			const r = transform(transformXml, transformXsl, `file://${TEMP_DIR}`);

			if (typeof r == "object" && r.failed) {
				console.log(s3.Key.replace(`_assets/_xsl/`, ""), "\t", r.msg);
			}
		}
	} catch (e) {
		console.log(s3.Key.replace(`_assets/_xsl/`, ""));
		console.log("Failed: ", s3.Key, e);
	}
});

for (const promise of promises) {
	await promise;
}
*/
