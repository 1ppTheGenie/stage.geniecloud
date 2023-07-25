"use strict";
import { dirname } from "path";
import { PDFDocument } from "pdf-lib";
import puppeteer from "puppeteer-core";
import chromium from "@sparticuz/chromium";
import {
	ListObjectsV2Command,
	DeleteObjectCommand,
	GetObjectCommand,
	PutObjectCommand,
	S3Client,
} from "@aws-sdk/client-s3";
import { SQSClient, SendMessageCommand } from "@aws-sdk/client-sqs";

chromium.setGraphicsMode = false;

const BUCKET = process.env.BUCKET;
const SQS_QUEUE =
	process.env.SQS_QUEUE ??
	"https://sqs.eu-west-2.amazonaws.com/584678469437/genie-renders";

const region = process.env.REGION ?? "eu-west-2";

const s3Client = new S3Client({});

export const direct = async params => {
	let batch = [],
		failures = [],
		browser = null,
		output = null,
		mimeType = null,
		s3Url = null,
		response = {
			statusCode: 200,
			body: { success: false },
			headers: {
				"Content-Type": "application/json",
			},
		};

	if (params.Records) {
		for (const record of params.Records) {
			let s3Key = "";
			if (record.s3) {
				console.log("record.s3", record.s3);
				s3Key = record.s3.object.key;
				batch.push(
					await jsonFromS3(record.s3.object.key, record.s3.bucket.name)
				);
				console.log("yeah", batch);
			} else if (record.sqs) {
				if (record.sqs.body == "genie-retry") {
					s3Key = `${record.sqs.messageAttributes.S3Key.stringValue} (retry)`;
					batch.push(
						await jsonFromS3(
							record.sqs.messageAttributes.S3Key.stringValue,
							record.sqs.messageAttributes.S3Bucket.stringValue
						)
					);
				}
			}
			console.log(`From s3: ${s3Key}`);
		}
	} else {
		batch.push(params);
	}
	console.log("batch", batch);
	//try {
	browser = await puppeteer.launch({
		args: [
			...chromium.args,
			"--font-render-hinting=none",
			"--force-color-profile=srgb",
		],
		defaultViewport: {
			width: parseInt(batch[0].width) || 1200,
			height: parseInt(batch[0].height) || 628,
			deviceScaleFactor: batch[0].scale || 1,
		},

		executablePath: await chromium.executablePath(),
		headless: chromium.headless,
		ignoreHTTPSErrors: true,
	});

	const page = await browser.newPage();
	const waitUntil = ["networkidle0", "load", "domcontentloaded"];

	for (const render of batch) {
		console.log("#render", render);

		const isWebp = render.suffix == "webp";
		response.tempKey = render.s3Key;

		if (render.url && render.url.length > 10) {
			await page.goto(render.url, { waitUntil, timeout: 90000 });
		} else {
			// Array'ed HTML is dealt with in the loop
			if (!Array.isArray(render.html)) {
				await page.setContent(render.html, {
					waitUntil: waitUntil,
					timeout: 90000,
				});
			}
		}

		await page.evaluateHandle("document.fonts.ready");

		if (render.suffix == "mp4") {
			let options = {};

			if (render.clip) {
				options.clip = {
					x: render.clipX || 0,
					y: render.clipY || 0,
					width: render.clipWidth || page.viewport().width,
					height: render.clipHeight || page.viewport().height,
				};
			}
			const frame_folder = "frames-" + Date.now();

			let i = 0;
			while (render.html.length > 0) {
				await page.setContent(render.html.shift(), {
					waitUntil: waitUntil,
					timeout: 90000,
				});

				let screenshot = await page.screenshot(options);

				await s3_upload(
					render.bucket || BUCKET,
					`${frame_folder}/${i}.png`,
					screenshot,
					"image/png"
				);

				i++;
			}

			response.body = {
				success: true,
				frameFolder: frame_folder,
				renderID: render.renderID,
				s3Url: true, // just needs a value to validate at the other end
			};
		} else if (render.suffix == "pdf") {
			let options = {
				scale: render.scale || 1,
				preferCSSPageSize: render.CSSPageSize || false,
				width: render.width, // || `${Math.round(render.width / 2)}mm`,
				height: render.height, // || `${Math.round(render.height / 2)}mm`,
				printBackground: true,
			};

			page.emulateMediaType("print");

			output = await page.pdf(options);
			mimeType = "application/pdf";
		} else {
			let options = {};

			if (render.clip) {
				options.clip = {
					x: render.clipX || 0,
					y: render.clipY || 0,
					width: render.clipWidth || page.viewport().width,
					height: render.clipHeight || page.viewport().height,
				};
			}

			output = await page.screenshot(options);
			mimeType = isWebp ? "image/webp" : "image/png";
		}

		if (output) {
			if (isWebp) {
				// https://github.com/bubblydoo/lambda-layer-sharp/releases
				const sharp = require("sharp");

				output = await sharp(output).webp().toBuffer();
			}

			s3Url = await s3_upload(
				render.bucket || BUCKET,
				render.totalPages > 1
					? `${render.s3Key}/interim/page-${render.pageIndex}.pdf`
					: render.s3Key,
				output,
				mimeType
			);

			if (s3Url) {
				response.body = {
					success: true,
					s3Url: s3Url,
				};

				if (render.totalPages && render.totalPages > 1) {
					const interims = await listS3Folder(
						`${render.s3Key}/interim/`,
						render.bucket
					);

					if (interims && interims.length == render.totalPages) {
						// Natural sorting function
						const collator = new Intl.Collator(undefined, {
							numeric: true,
							sensitivity: "base",
						});
						const naturalSort = array =>
							array.sort((a, b) => collator.compare(a, b));

						// Sort the array using the natural sort algorithm
						const sortedKeys = naturalSort(interims.map(i => i.Key));

						const mergedPdf = await PDFDocument.create();

						for (const interimKey of sortedKeys) {
							console.log("interimKey2", render.bucket, interimKey);
							let buffer = await fromS3(interimKey, render.bucket);

							const pdf = await PDFDocument.load(buffer);
							const copiedPages = await mergedPdf.copyPages(
								pdf,
								pdf.getPageIndices()
							);
							copiedPages.forEach(page => {
								mergedPdf.addPage(page);
							});

							await s3Client.send(
								new DeleteObjectCommand({
									Bucket: render.bucket,
									Key: interimKey,
								})
							);
						}

						output = Buffer.from(await mergedPdf.save());

						await s3_upload(
							render.bucket || BUCKET,
							render.s3Key,
							output,
							"application/pdf"
						);
					}
				}

				/*
				if (render.sourceS3Key) {
					await s3Client.send(
						new DeleteObjectCommand({
							Bucket: render.sourceS3Bucket,
							Key: render.sourceS3Key,
						})
					);
				}*/
				/// just return the response otherwise
			} else {
				failures.push({
					Bucket: render.sourceS3Bucket,
					Key: render.sourceS3Key,
				});
			}
		} else {
			failures.push({
				Bucket: render.sourceS3Bucket,
				Key: render.sourceS3Key,
			});
		}
	}
	/*} catch (err) {
		response.statusCode = 500;
		response.body = { message: err.message };
		console.log("!Error!", response.tempKey, params, err.message);
	} finally {*/

	if (browser) await browser.close();

	if (failures.length > 0) {
		const sqs = new SQSClient({ region });

		for (const fail of failures) {
			if (fail) {
				const sqsMessage = {
					QueueUrl: SQS_QUEUE,
					MessageAttributes: {
						S3Bucket: {
							DataType: "String",
							StringValue: fail.Bucket,
						},
						S3Key: {
							DataType: "String",
							StringValue: fail.Key,
						},
					},
					MessageBody: "genie-retry",
					DelaySeconds: 30,
				};

				await sqs.send(new SendMessageCommand(sqsMessage));
			}
		}
	}
	//}

	return response;
};

const s3_upload = async (bucket, key, file, mimeType = null) => {
	key = key || "failed/no-key-given.png";

	console.log("Bucket:", bucket, "Key:", key);
	const command = new PutObjectCommand({
		Bucket: bucket,
		Key: key,
		Body: file,
		ContentType: mimeType,
	});

	try {
		const [res, region] = await Promise.all([
			s3Client.send(command),
			s3Client.config.region(),
		]);

		if (res.ETag) {
			return `https://${bucket}.s3.${region}.amazonaws.com/${key}`;
		}
	} catch (err) {}
};

export const jsonFromS3 = async (key, bucket = null) => {
	bucket = bucket ?? BUCKET;
	try {
		const r = await fromS3(key, bucket);

		if (r) {
			console.log("parse", JSON.parse(r));
			return JSON.parse(r);
		}
	} catch (err) {
		console.log("jsonFromS3: ", err);
	}
};

export const fromS3 = async (key, bucket = null) => {
	bucket = bucket ?? BUCKET;

	try {
		const buffer = Buffer.concat(
			await (
				await s3Client.send(
					new GetObjectCommand({
						Bucket: bucket,
						Key: key,
					})
				)
			).Body.toArray()
		);

		return buffer;
	} catch (err) {
		if (!err.Code == "NoSuchKey") console.log("Retrieve JSON: ", err);
	}
};

export const listS3Folder = async (folderPath, bucket = null) => {
	try {
		const listParams = {
			Bucket: bucket ?? BUCKET,
			Prefix: folderPath,
		};

		const response = await s3Client.send(new ListObjectsV2Command(listParams));

		return response.Contents;
	} catch (err) {
		console.error("Error:", err);
	}
};
