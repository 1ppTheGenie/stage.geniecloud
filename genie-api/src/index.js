"use strict";

import { DateTime } from "luxon";
import { randomUUID } from "crypto";
import { basename } from "path";
import pkg from "jstoxml";
const { toXML } = pkg;

// prettier-ignore
import { getAreaBoundary, getUser, impersonater, getListing, areaName } from "./genieAI.js";
// prettier-ignore
import { userSetting,embedsAPI, getRenderJSON, listS3Folder,toS3, getCollection, setRenderDefaults, genieGlobals, copyObject, headObject, jsonFromS3, fromS3, queueMsg, getAssets, getThemes, getCollections, getCollectionTemplates, generateQR, areaFromMlsNumber, getDimensions, assetSetting, getAsset, BUCKET, deleteObject  } from "./utils/index.js";

const CLOUDFLARE_KEY = process.env.GENIE_USER ?? "genieApiHub2";

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
			if (record.eventSource == "aws:sqs") {
				switch (record.body) {
					case "clear-cache":
						let tempParams = {};
						routes.push("/clear-cache");

						Object.keys(record.messageAttributes).map(key => {
							if (["tags", "prefixes", "hosts"].includes(key)) {
								tempParams[key] =
									record.messageAttributes[key].dataType == "String"
										? record.messageAttributes[key].stringValue
										: "";
							}
						});
						routeParams.push(tempParams);
						break;

					case "prepare":
						routes.push("/prepare");

						const processKey = `_processing/${record.messageAttributes.renderId.stringValue}/prepare.json`;

						let s3Params = await jsonFromS3(processKey);
						if (s3Params) {
							Object.keys(record.messageAttributes).map(key => {
								if (key !== "renderId") {
									s3Params[key] =
										record.messageAttributes[key].dataType == "String"
											? record.messageAttributes[key].stringValue
											: "";
								}
							});

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
					routeParams.push({
						...s3Params,
						sourceKey: record.s3.object.key,
					});
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

	//	console.log("routeParams", routeParams);

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
							const processedCollections = {};

							for (const index in collections) {
								if (collections[index].Key.endsWith("json")) {
									processedCollections[basename(collections[index].Key)] =
										JSON.parse(
											(await fromS3(collections[index].Key)).toString()
										);
								}
							}

							response.body = {
								success: true,
								collections: processedCollections,
							};
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
							if (CLOUDFLARE_KEY && Array.isArray(params.prefixes)) {
								const url =
									"https://api.cloudflare.com/client/v4/zones/identifier/purge_cache";

								const options = {
									method: "POST",
									headers: {
										"Content-Type": "application/json",
										"X-Auth-Key": CLOUDFLARE_KEY,
									},
									body: `{"prefixes": ["${params.prefixes.join('","')}"}`,
								};

								await fetch(url, options);
							}

							break;

						case "/log":
							if (params.renderId && params.assetId) {
								await toS3(
									`genie-pages/${params.renderId}/${params.assetId}/access.json`,
									Buffer.from(JSON.stringify({ accessed: Date.now() })),
									null,
									JSON_MIME
								);

								const json = await jsonFromS3(
									`_processing/${params.renderId}}/prepare.json`
								);
								if (json.mlsNumber) {
									const updated = await mlsListingLastUpdate({
										mlsId: json.mlsId,
										mlsNumber: json.mlsNumber,
										userId: json.userId,
									});

									console.log(updated.key); // updated.key is UTC
									// ToDo if update.key > render timestamp of index.html file, then trigger re-render
								}

								response.body = {
									success: true,
									renderId: params.renderId,
								};
							}
							break;

						case "/re-render":
							if (params.renderId) {
								if (params.renderId) {
									const r = await reRenderCollection(params.renderId);

									if (r) {
										response.body.success = true;
										response.body.msg = `${params.renderId} re-render under way`;
									}
								}
							} else if (
								params.assetId ||
								params.userId ||
								params.mlsNumber ||
								params.areaId
							) {
								let reRenders = [];

								const r = await listS3Folder("_processing");
								await Promise.all(
									r.map(async t => {
										if (t.Key.endsWith("prepare.json") && t.Size > 0) {
											const json = await jsonFromS3(t.Key);

											// Rerenders based on asset don't distinguish on user/area/mlsNumber basis
											if (params.assetId) {
												//Todo
											} else if (
												// ToDo mlsId must match as well as as mlsNumber
												(!params.userId || params.userId == json.userId) &&
												(!params.mlsNumber ||
													params.mlsNumber == json.mlsNumber) &&
												(!params.areaId || json.areaIds.includes(params.areaId))
											) {
												// ToDo Consider skipping collections that are single assets BUT NOT landing pages

												// ToDo? And access.json updates in last N hours/days?

												//Rerender: key will be `_processing/{renderId}/prepare.json`
												reRenders.push(r.Key.split("/")[1]);
											}
										}
									})
								);

								if (reRenders.length > 0) {
									reRenders = reRenders.filter(
										(value, index, array) => array.indexOf(value) === index
									);

									for (const index in reRenders) {
										const r = await reRenderCollection(
											reRenders[index],
											params.assetId ?? null
										);
									}

									response.body.success = true;
									response.body.msg = `${reRenders.length} re-renders under way`;
								}
								break;
							} else {
								throw new Error(
									"[renderId] or [userId] or [mlsNumber] is required for a re-render"
								);
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

									await deleteObject(sourceKey);
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
														qrDestination: asset.qrDestination,
														qrUrl: asset.qrUrl,
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
								params.renderId = randomUUID();
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
									`_processing/${params.renderId}/prepare.json`,
									Buffer.from(JSON.stringify(params)),
									null,
									JSON_MIME
								);

								await queueMsg("prepare", {
									renderId: {
										DataType: "String",
										StringValue: params.renderId,
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
									response.body.reRender = `${genieGlobals.GENIE_API}re-render?renderId=${params.renderId}`;
									response.body.renderId = params.renderId;
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
		reportDate: Math.round(new Date().getTime() / 1000),
		areaName: area?.areaName ?? "unknown",
		propertyType,
		propertyCaption: params.propertyCaption ?? "",
		mlsNumber: params.mlsNumber ?? "",
		listingStatus,
	};
};

const processAsset = async params => {
	const prepareKey = `_processing/${params.renderId}/prepare.json`;

	let s3Params = await jsonFromS3(prepareKey);

	if (s3Params) {
		const renderRoot = await getRenderJSON({ ...s3Params, ...params });

		return {
			transformXml: toXML(
				{ renderRoot },
				{
					attributeFilter: (key, val) => val === null,
					attributeExplicitTrue: true,
				}
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
		//console.log("lpo", params.lpo, s3Key);

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
					s3Key: params.overrideKey ?? s3Key,
					bucket: BUCKET,
					renderId: params.renderId,
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

				if (params.qrDestination || params.qrUrl) {
					let qrUrl =
						params.qrDestination ??
						(await getLandingQrCodeUrl(params.qrUrl, params.renderId));
					if (!qrUrl.startsWith("http")) qrUrl = `https://${qrUrl}`;

					render.customizations = { qrUrl };
				}

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
							`${basename(pageParams.asset)}-download.pdf`
						);
						render.downloadUrl = `/${overrideKey}`;

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
					`_processing/${params.renderId}/${cleanKey}${
						pageParams.asset.startsWith("landing-pages")
							? `-${basename(pageParams.asset)}`
							: ""
					}-p${i}-prep.json`,
					Buffer.from(JSON.stringify(render)),
					null,
					JSON_MIME
				);

				console.log("colAsset", asset, params.overrideKey ?? s3Key);
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

const reRenderCollection = async (renderId, assetId = null) => {
	// Save to the processing folder for onward processing and final render
	const collectionExists = await headObject(
		`_processing/${renderId}/prepare.json`
	);

	if (collectionExists) {
		let msgAttrbs = {
			renderId: {
				DataType: "String",
				StringValue: renderId,
			},
		};

		if (assetId) {
			msgAttrbs.assetId = {
				DataType: "String",
				StringValue: assetId,
			};
		}

		await queueMsg("prepare", msgAttrbs);

		return true;
	} else {
		throw new Error(`${renderId}: no such collection exists`);
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

		// areaID or mlsNumber:
		// ToDo: args.mlsId must exist if args.mlsNumber exists
		if (!args.areaId && !args.mlsNumber) {
			errors.push("[areaId] or [mlsNumber] are required");
		}

		// Test area Size
		if (args.areaId && !args.ignoreBoundaryError) {
			let boundary = await getAreaBoundary(args.areaId);

			if ((boundary?.mapArea?.geoJSON ?? "").length > 200000) {
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
			} else {
				console.log(args, a);
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

const getLandingQrCodeUrl = async (asset, renderId) => {
	let s3Key = `genie-files/${renderId}/${asset}-qr.svg`;

	// Saving location of the rendered landing page
	const qrKey = await getS3Key(`landing-pages/${asset}`, { renderId });

	// S3 url of the rendered landing page
	const qrSVG = await generateQR(`${genieGlobals.GENIE_HOST}/${qrKey}`);

	await toS3(s3Key, Buffer.from(qrSVG), null, "image/svg+xml");

	return `${genieGlobals.GENIE_HOST}/${s3Key}`;
};

export const getS3Key = async (asset, params) => {
	let s3Key = `failed/${params.renderId}.png`;

	try {
		// params.s3Key is the final destination for the render. All are public urls.
		if (asset.startsWith("collection")) {
			s3Key = `genie-collection/${params.renderId}/index.html`;
		} else if (asset.startsWith("landing-pages")) {
			const base =
				typeof params.lpo !== "undefined"
					? `${basename(params.lpo)}/${basename(asset)}`
					: basename(asset);

			s3Key = `genie-pages/${params.renderId}/${base}/index.html`;
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
				REPORTDATE: DateTime.fromSeconds(keyParams.reportDate).toFormat(
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

			s3Key = `genie-files/${params.renderId}/${params.theme}/${renderKey}.${
				fileExtension || (hasPages && "pdf") || "png"
			}`;
		}
	} catch {}

	return {
		s3Key,
		renderKey: typeof renderKey != "undefined" ? renderKey : null,
		hasPages: typeof hasPages != "undefined" ? hasPages : null,
	};
};
