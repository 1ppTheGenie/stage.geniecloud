"use strict";

import { DateTime } from "luxon";
import { randomUUID } from "crypto";
import { basename, dirname } from "path";
import pkg from "jstoxml";
const { toXML } = pkg;

// prettier-ignore
import { getAreaBoundary, getUser, impersonater, updateHubAsset,getListing,areaName } from "./genieAI.js";
// prettier-ignore
import { userSetting,embedsAPI, getRenderJSON, listS3Folder,toS3, getCollection, setRenderDefaults, genieGlobals, copyObject, headObject, jsonFromS3, fromS3, queueMsg, getAssets, getThemes, getCollections, getCollectionTemplates, generateQR, areaFromMlsNumber, getDimensions, assetSetting, getAsset, BUCKET  } from "./utils/index.js";

export const JSON_MIME = "application/json";

export const api = async event => {
	let routes = [],
		routeParams = [];

	let response = {
		statusCode: 200,
		body: { success: false },
		headers: {
			"Content-Type": "application/json",
		},
	};

	if (event.Records) {
		for (const record of event.Records) {
			//console.log("record.eventSource", record);
			if (record.eventSource == "aws:sqs") {
				switch (record.body) {
					case "prepare":
						//console.log(record);
						routes.push("/prepare");

						const processKey = `_processing/${record.messageAttributes.collectionId.stringValue}/prepare.json`;

						let s3Params = await jsonFromS3(processKey);
						if (s3Params) {
							routeParams.push(s3Params);
						} else {
							console.log(`Failed to get ${processKey}`);
						}
						break;

					default:
						break;
				}
			} else if (record.eventSource == "aws:s3") {
				if (record.s3.object.key.endsWith("prep.json")) {
					routes.push("/process");

					let s3Params = await fromS3(record.s3.object.key).then(buffer =>
						buffer && buffer.length > 0 ? JSON.parse(buffer) : null
					);
					routeParams.push({ ...s3Params, sourceKey: record.s3.object.key });
				}
			}
		}
	} else if (event.rawPath) {
		routes.push(event.rawPath);
		if (event.queryStringParameters) {
			routeParams.push(event.queryStringParameters);
		} else {
			routeParams.push(JSON.parse(event.body ?? "{}"));
		}
	}

	for (let i = 0; i < routes.length; i++) {
		const route = routes[i];
		let params = routeParams[i];

		if (params) {
			try {
				if (params?.impersonaterId) impersonater.id = params.impersonaterId;

				if (route.startsWith("/genie-embed")) {
					response.body = await embedsAPI(
						route.replace("/genie-embed/v2/", ""),
						params
					);
				} else {
					switch (route) {
						case "/get-themes":
							const themes = await getThemes();
							response.body = { success: true, ...themes };
							break;

						case "/get-collection-templates":
							const templates = await getCollectionTemplates();
							response.body = { success: true, ...templates };
							break;

						case "/get-collections":
							const collections = await getCollections();
							response.body = { success: true, ...collections };
							break;

						case "/make-qrcode":
							const qr = await generateQR();
							response.body = { success: true, ...qr };
							break;

						case "/get-assets":
							const assets = await getAssets();
							response.body = { success: true, ...assets };
							break;

						case "/clear-cache":
							// DELETE S3(`_cache/${key}`
							break;

						case "/re-render":
							if (params.collectionId) {
								// Save to the processing folder for onward processing and final render
								const collectionExists = await headObject(
									`_processing/${params.collectionId}/prepare.json`
								);

								if (collectionExists) {
									await queueMsg("prepare", {
										collectionId: {
											DataType: "String",
											StringValue: params.collectionId,
										},
									});

									response.body.success = true;
									response.body.msg = `${params.collectionId} re-render under way`;
								} else {
									throw new Error(
										`${params.collectionId}: no such collection exists`
									);
								}
							} else {
								throw new Error("[collectionId] is required for a re-render");
							}
							break;

						case "/process":
							if (params) {
								const r = await processAsset(params);

								if (r) {
									let { sourceKey, ...reducedParams } = params;

									await toS3(
										sourceKey.replace("-prep.", "-xslt."),
										Buffer.from(JSON.stringify({ ...reducedParams, ...r })),
										null,
										JSON_MIME
									);
								}
							}

							break;

						case "/prepare":
							if (params.collection) {
								const collection = await getCollection(params.collection);

								if (collection) {
									// Do the template first
									await prepareAsset(`collections/${collection.template}`, {
										...params,
										asset: `collections/${collection.template}`,
										size: "Landing Page",
										isCollectionTemplate: true,
									});

									await Promise.all(
										collection.sections.map(async section => {
											await Promise.all(
												section.assets.map(async asset => {
													const assetParams = {
														...params,
														asset: asset.asset,
														size: asset.size,
														lpo: asset.lpo,
														qrUrl: asset.qrDestination ?? asset.qrUrl,
													};

													return await prepareAsset(asset.asset, assetParams);
												})
											);
										})
									);
								}
							} else {
								await prepareAsset(params.asset, params);
							}
							break;

						case "/create":
							try {
								// This line will succeed or have a error thrown that will be caught below
								await validateRenderParams(params);

								// VERY IMPORTANT LINE! Determines the uniqueness of all links
								params.collectionId = randomUUID();
								params.theme =
									params.theme ?? (await userSetting(params.userId, "theme"));

								const { s3Key } = await getS3Key(
									params.asset || (params.collection && "collection"),
									params
								);

								params.s3Key = s3Key;

								params = await setRenderDefaults(params);

								// Save to the processing folder for onward processing and final render
								const r = await toS3(
									`_processing/${params.collectionId}/prepare.json`,
									Buffer.from(JSON.stringify(params)),
									null,
									JSON_MIME
								);

								await queueMsg("prepare", {
									collectionId: {
										DataType: "String",
										StringValue: params.collectionId,
									},
								});

								if (
									params.collection ||
									params.asset.startsWith("landing-pages")
								) {
									// Create a holding page - should have a cache max-age set to 0
									await copyObject(
										"_assets/_reference/collection-rendering.html",
										s3Key
									);
								}

								if (s3Key) {
									response.body.success = true;
									// Remove trailing index.html if it exists: S3 routing will default to that file on a folder request
									response.body.availableAt = `${genieGlobals.GENIE_HOST}${s3Key}`; //.replace(										"/index.html",										""										);
									response.body.reRender = `${genieGlobals.GENIE_API}re-render?collectionId=${params.collectionId}`;
								}
							} catch (e) {
								response.body.error = e.message;
							}
							break;
					}
				}
			} catch (error) {
				console.log("GenieAPI failed: ", error);
				response.body.error = error;
			} finally {
				response.body = JSON.stringify(response.body);
			}
		}
	}

	return response;
};

const renderKeyParams = async params => {
	let listing,
		areaId = params.areaId,
		propertyType = 0,
		listingStatus = "";

	if (params.mlsNumber) {
		if (!params.propertyType || !params.listingStatus) {
			listing = await getListing(params.userId, params.mlsNumber, params.mlsId);

			if (!params.areaId && listing.preferedAreaId) {
				params.areaId = listing.preferedAreaId;
			}
		}

		if (!params.areaId) {
			const area = await areaFromMlsNumber(
				params.mlsNumber,
				params.mlsId,
				params.userId
			);

			if (area) {
				areaId = area.areaId;
			}
		}

		propertyType = params.propertyType ?? listing.propertyType;
		listingStatus = params.listingStatus ?? listing.listingStatus;
	}

	const area = await areaName(params.userId, areaId);

	return {
		reportDate: new Date().getTime() / 1000,
		areaName: area?.areaName ?? "unknown",
		propertyType,
		propertyCaption: params.propertyCaption ?? "",
		mlsNumber: params.mlsNumber ?? "",
		listingStatus,
	};
};

const processAsset = async params => {
	const prepareKey = `_processing/${params.collectionId}/prepare.json`;

	let s3Params = await jsonFromS3(prepareKey);
	if (s3Params) {
		const renderRoot = await getRenderJSON({ ...s3Params, ...params });

		return {
			transformXml: toXML(
				{ renderRoot },
				{ attributeFilter: (key, val) => val === null }
			),
			transformXsl: (await fromS3(`_assets/_xsl/${params.asset}.xsl`))
				.toString()
				.replaceAll(/[\t|\n|\t]/g, ""),
		};
	} else {
		console.log(`processAsset failed for ${prepareKey}`);
	}
};

const prepareAsset = async (asset, params) => {
	const settings = await assetSetting(asset, "all");

	if (Object.keys(settings).length > 0) {
		let pages, suffix, dims, size;

		const { s3Key } = await getS3Key(asset, params);

		if (params.pages) {
			pages = params.pages;
		} else if (settings.pages && settings.pages !== "") {
			pages = settings.pages.map(s => ({ asset: s }));
		} else {
			pages = [{ asset: asset.trim() }];
		}

		if (params.totalPages) {
			pages = pages.slice(0, params.totalPages + 1);
		}

		size = (
			params.size ||
			(Array.isArray(settings?.sizes) && settings.sizes[0]) ||
			genieGlobals.DEFAULT_SIZE
		)
			.replaceAll(" ", "-")
			.trim()
			.toLowerCase();

		dims = getDimensions(size) ?? { width: 1200, height: 628 };

		switch (true) {
			case params.isCollectionTemplate:
			case params.isLandingPage:
				suffix = "html";
				break;

			case params.webp:
				suffix = "webp";
				break;

			case size == "video":
				suffix = "mp4";
				dims = { width: 1920, height: 1080 };
				break;

			case params.asPDF:
			case pages.length > 1:
				suffix = "pdf";
				break;

			default:
				suffix = "png";
		}

		await Promise.all(
			pages.map(async (p, i) => {
				const pageParams = {
					...params,
					...p,
					pageIndex: pages.length > 0 ? i + 1 : null,
					totalPages: pages.length > 0 ? pages.length + 1 : null,
					isSample: Boolean(params.isSample),
					size,
				};

				pageParams.themeShade = pageParams.theme.includes("dark")
					? "Dark"
					: "Light";

				// Watermarking samples
				if (settings.permission) {
					const user = await getUser(params.userId);
					pageParams.isSample = !user.permissions.includes(settings.permission);
				}

				const isA5 = ["landing-pages", "funnels", "embeds"].find(start =>
					params.asset.startsWith(start)
				); // The rendered output of funnels and embeds is an A5 PDF

				const withBleed = params?.renderSettings?.withBleed ?? false;
				const width =
					suffix === "pdf"
						? isA5
							? "216mm"
							: `${Math.round(dims.width) / 100 + (withBleed ? 0.25 : 0)}in`
						: Math.round(dims.width);
				const height =
					suffix === "pdf"
						? isA5
							? "279mm"
							: `${Math.round(dims.height) / 100 + (withBleed ? 0.25 : 0)}in`
						: Math.round(dims.height);

				const render = {
					s3Key,
					bucket: BUCKET,
					collectionId: params.collectionId,
					suffix,

					size,

					landscape: isA5 || dims.height < dims.width ? true : false,
					width,
					height,

					withBleed,

					dims, // required for the screen grab size

					scale: 1, // ToDo: some decision making
					cssPageSize: false, // ToDo: some decision making

					/*
						ToDo?
						render.clip
						render.clipX
						render.clipY
						render.clipWidth
						render.clipHeight
					*/

					noPuppeteer: s3Key.endsWith("html"),
					isCollection: params.collection, // Flag for use by XSLT processor

					pageIndex: pageParams.pageIndex,
					totalPages: params.totalPages ?? pages.length,

					asset: pageParams.asset,
				};

				if (suffix === "mp4") {
					render.music = params.music ?? null;
					render.slideLength = params?.page?.slideLength ?? 5;
				}

				// Create the download file is there isn't one (the url is required for the render data)
				if (settings.defaultDownload && i == 0) {
					if (params.downloadUrl) {
						render.downloadUrl = params.downloadUrl;
					} else {
						let overrideKey = s3Key.replace(
							"index.html",
							`${basename(pageParams.asset)}-download`
						);
						render.downloadUrl = `${overrideKey}.pdf`;

						const downloadSize = await assetSetting(
							settings.defaultDownload,
							"size"
						);

						await prepareAsset(settings.defaultDownload, {
							...params,
							overrideKey,
							size: downloadSize,
						});
					}
				}

				// Save to the processing folder to trigger onward processing and final render
				const cleanKey = basename(render.s3Key).replaceAll(/[.\/]/g, "-");
				await toS3(
					`_processing/${params.collectionId}/${cleanKey}${
						pageParams.asset.startsWith("landing-pages")
							? `-${basename(pageParams.asset)}`
							: ""
					}-p${i}-prep.json`,
					Buffer.from(JSON.stringify(render)),
					null,
					JSON_MIME
				);
			})
		);
	}
};

const getPropertyCaption = (id, custom = null) => {
	if (custom) return custom;

	switch (id) {
		case 3:
			return "Condos";

		default:
			return "Homes";
	}
};

export const validateRenderParams = async args => {
	const errors = [];
	const msgs = [];

	try {
		// userID is required
		if (!args.userId) {
			errors.push("[userId] is required");
		} else {
			let user = await getUser(args.userId);

			if (!user.emailAddress) {
				errors.push(`Genie User not found for "${args.userId}"`);
			}
		}

		// areaID or mlsNumber
		if (!args.areaId && !args.mlsNumber) {
			errors.push("[areaId] or [mlsNumber] are required");
		}

		// Test area Size
		if (args.areaId && !args.ignoreBoundaryError) {
			let boundary = await getAreaBoundary(args.areaId);

			if ((boundary.mapArea.geoJSON ?? "").length > 200000) {
				const errMsg = "Area boundary size risks render fail";
				if (!args.ignoreBoundaryFail) {
					errors.push(errMsg);
				} else {
					msgs.push(errMsg);
				}
			}
		}

		// ToDO support folder/stylesheet params
		if (!args.asset && !args.collection && !args.pages) {
			errors.push("One of [asset] or [collection] or [pages] is required");
		}

		if (args.asset) {
			let a;
			try {
				a = await getAsset(args.asset, true);
			} catch (e) {
				console.log("Validate getAsset failure:", e);
			}

			if (!a) {
				errors.push(`Asset '${args.asset}' does not exist`);
			}
		}

		if (args.collection) {
			let c;
			try {
				c = await getCollection(args.collection, true);
			} catch (e) {
				console.log("Validate getCollection failure:", e);
			}

			if (!c) {
				errors.push(`Collection '${args.collection}' does not exist`);
			}
		}
	} catch (err) {
		console.log("Render validation error:", err);
	}

	if (errors.length > 0) {
		throw new Error(errors.join("; "));
	}

	return msgs;
};

export const getS3Key = async (asset, params) => {
	let s3Key = `failed/${params.collectionId}.png`;

	try {
		// params.s3Key is the final destination for the render. All are public urls.
		if (asset.startsWith("collection")) {
			s3Key = `genie-collection/${params.collectionId}/index.html`;
		} else if (asset.startsWith("landing-pages")) {
			const base =
				typeof params.lpo !== "undefined"
					? `${basename(params.lpo)}/${basename(asset)}`
					: basename(asset);

			s3Key = `genie-pages/${params.collectionId}/${base}/index.html`;
		} else {
			const fileExtension = params?.asPDF
				? "pdf"
				: params?.webp
				? "webp"
				: null;
			const keyParams = await renderKeyParams(params);

			let { renderKey, pages } = await assetSetting(asset, [
				"renderKey",
				"pages",
			]);

			const hasPages =
				params.pages || (Array.isArray(pages) && pages.length > 0);

			const replaces = {
				REPORTDATE: DateTime.fromMillis(keyParams.reportDate).toFormat(
					"LLL-yyyy"
				),
				PROPTYPE: getPropertyCaption(
					keyParams.propertyType,
					keyParams.propertyCaption
				),
				AREASLUG: keyParams.areaName.replaceAll(" ", "-"),
				MLSNUMBER: keyParams.mlsNumber || "mls",
				LISTSTATUS: keyParams.listingStatus || "market",
			};

			renderKey = basename(renderKey);

			Object.keys(replaces).map(
				key => (renderKey = renderKey.replace(key, replaces[key]))
			);

			s3Key = `genie-files/${params.collectionId}/${
				params.theme
			}/${renderKey}.${fileExtension || (hasPages && "pdf") || "png"}`;
		}
	} catch {}

	return {
		s3Key,
		renderKey: typeof renderKey != "undefined" ? renderKey : null,
		hasPages: typeof hasPages != "undefined" ? hasPages : null,
	};
};
/*
console.log(
	await api({
		Records: [
			{
				eventSource: "aws:s3",
				s3: {
					object: {
						key: "_processing/56947122-946d-429e-b39c-32cb0b32a45a/lc-prop-post-03a-png-p0-prep.json",
					},
				},
			},
		],
	})
);


console.log(
	await api({
		rawPath: "/create",
		body: JSON.stringify({
			collection: "just-listed-kit",
			userId: "4865455f-29a0-4c8f-9938-8c4bab261ef6",
			theme: "ed-kaminsky-light",
			mlsNumber: "230012718",
			mlsId: 0,
			areaId: 6766,
		}),
	})
);

await api({
	Records: [
		{
			messageId: "c4006aea-484e-4478-a068-3f942e26cc38",
			receiptHandle:
				"AQEBFnwpfQpVI39SRbTOOGl9O37zI6b5y6HaIOFgray37FU/jVbIV1HeF1rsRwvgXPn28qTvyoln7YeO8tV+bGPUsOyQB+wX6EzM1/RNhvmY9ViPB8B/jsd2hEFUWEcTlQ8HqGSDhrOHn0iHDZ54+T0CWOXsPYtrmGHjoWkCUQ2tp4sVSXUTKQinY6IMyhVobBFBmS1XRvjV4ejhhVZPWau1dPOlg8vDWUR6FlK+OvvfLDitgDa2a8YpD9vIn2DnoRstR2EtC/wZe8+dsLvbzAp2pZtL7CfvVTHZZtJo+RTEKMsdM1cgI1cKRiE+y1zZ6XpJlpoqyiWjfsc20ZKa9TH5uapfHPpChXrkFZGq9zuRzfB2wetH/u8vCbKxRWHvcJztbTT7AA+NISgzagyQ3CZN9A==",
			body: "prepare",
			attributes: {
				ApproximateReceiveCount: "1",
				AWSTraceHeader:
					"Root=1-649c748b-570e3184513e8acf5d5313c6;Parent=03e686620f43884c;Sampled=0;Lineage=2941b67d:0",
				SentTimestamp: "1687975051323",
				SenderId: "AROAYQIMNN46TCMGPPXXJ:GenieAPI",
				ApproximateFirstReceiveTimestamp: "1687975051326",
			},
			messageAttributes: {
				collectionId: {
					stringValue: "bfeae884-3980-4915-ac36-2795f771b2b4",
					stringListValues: [],
					binaryListValues: [],
					dataType: "String",
				},
			},
			md5OfMessageAttributes: "3d9ffc24b4ac72135880f6456c44ab3b",
			md5OfBody: "5075140835d0bc504791c76b04c33d2b",
			eventSource: "aws:sqs",
			eventSourceARN: "arn:aws:sqs:eu-west-2:584678469437:genie-cloud",
			awsRegion: "eu-west-2",
		},
	],
});
*/
