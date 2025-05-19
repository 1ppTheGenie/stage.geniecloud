import { fromS3, jsonFromS3, headObject, deleteObject, searchS3ByPrefix } from "./aws.js";

export * from "./dates.js";
export * from "./aws.js";
export * from "./render-data.js";
export * from "./cloudHubAPI.js";
export * from "./embedsAPI.js";

export const genieGlobals = {
	DEFAULT_SIZE: "Facebook Post",
	GOOGLE_KEY:
		process.env.GOOGLE_KEY ?? "AIzaSyDLFcQk1FV7U4tf_aXU3NiLItNxy_b0AzU",
	MAPBOX_KEY:
		process.env.MAPBOX_KEY ??
		"pk.eyJ1IjoiMXBhcmtwbGFjZSIsImEiOiJjbHZxc2R6NDMwZncxMmlxaW41MzVrdzV2In0.fl0G_yHPzEc_rzAaJ58v6Q",
	GENIE_HOST:
		process.env.GENIE_HOST ?? "https://genie-hub-2.s3.eu-west-2.amazonaws.com/",
	GENIE_NO_CACHE_HOST:
		process.env.GENIE_NO_CACHE_HOST ?? "https://genie-cloud.s3.us-west-1.amazonaws.com/",
	GENIE_API:
		process.env.GENIE_API ??
		"https://dqohcd54xpkdwnueu2wn2nkxge0aboae.lambda-url.eu-west-2.on.aws/",
	ASSET_HEADERS: {
		name: "Asset Name",
		knownAs: "Known As",
		thumbnail: "Thumbnail",
		access: "Access",
		permission: "Permission",
		approved: "Approved",
		tags: "Tags",
		sizes: "Sizes",
		roles: "Roles",
		component: "Component",
		supports: "Supports",
		version: "Version",
		pages: "Pages",
		renderKey: "Render Key",
		defaultDownload: "Default Download",
	},
};

export const DAY_IN_SECONDS = 24 * 60 * 60;
export const MINUTE_IN_SECONDS = 60;

export const getAsset = async (asset, headOnly = false) => {
	const fullKey = `_assets/_xsl/${asset}.xsl`;

	return headOnly ? await headObject(fullKey) : await fromS3(fullKey);
};

export const getCollection = async (collection, headOnly = false) => {
	const fullKey = `genie-tools/collections/${collection}.json`;

	return headOnly ? await headObject(fullKey) : await jsonFromS3(fullKey);
};

export const assetSetting = async (assetKey, setting = null) => {
	let matches = {};

	try {
		const xsl = await getAsset(assetKey);

		if (typeof xsl !== "undefined") {
			const keys = !Array.isArray(setting) ? [setting] : setting;

			keys.forEach(key => {
				switch (key) {
					case "size":
						const sizes = getFileData(xsl, {
							sizes: genieGlobals.ASSET_HEADERS.sizes,
						})
							.sizes.split(",")
							.map(s => s.trim());
						const size = Array.isArray(sizes) && sizes.length ? sizes[0] : null;

						matches.size = (size ?? genieGlobals.DEFAULT_SIZE).trim();

						break;

					case "roles":
					case "pages":
					case "tags":
					case "sizes":
					case "supports":
						matches[key] = getFileData(xsl, {
							[key]: genieGlobals.ASSET_HEADERS[key],
						})
							[key]?.split(",")
							.map(s => s.trim());
						break;

					case "all":
						matches = getFileData(xsl, genieGlobals.ASSET_HEADERS);

						["roles", "pages", "tags", "sizes", "supports"].forEach(key => {
							matches[key] = matches[key]?.split(",").map(s => s.trim());
						});
						break;

					case "renderKey":
						const data = getFileData(xsl, { renderKey: "Render Key" });
						matches.renderKey = data.renderKey ?? assetKey;
						break;

					default:
						if (genieGlobals.ASSET_HEADERS[key]) {
							matches[key] = getFileData(xsl, {
								[key]: genieGlobals.ASSET_HEADERS[key],
							});
						}
						break;
				}
			});
		}
	} catch (e) {
		console.log("assetSetting err:", e);
	}

	return Object.keys(matches).length > 1 ? matches : matches[setting] ?? {};
};

export const getFileData = (buffer, headers) => {
	let result = {};

	if (typeof buffer !== "undefined") {
		const KB_IN_BYTES = 1024;
		let fileData = buffer.slice(0, KB_IN_BYTES).toString("utf8") || ""; // Look only the first 8KB of the file

		fileData = fileData.replace(/\r/g, "\n");

		Object.keys(headers).forEach(key => {
			const matches = fileData.match(
				new RegExp(
					"^(?:[ \\t]*<\\?php)?[ \\t\\/*#@]*" +
						escapeRegExp(headers[key]) +
						":(.*)$",
					"mi"
				)
			);

			result[key] =
				matches && matches.length > 0 ? cleanComment(matches[1]) : null;
		});
	}

	return result;
};

// Helper function to escape regular expression special characters
const escapeRegExp = str => str.replace(/[.*+\-?^${}()|[\]\\]/g, "\\$&");
const cleanComment = str => str.replace(/\s*(?:\*\/|\?>).*/, "").trim();

export const endOfLastMonth = () => {
	let date = new Date();

	date.setHours(0, 0, 0, 0); // set to midnight
	date.setDate(0); // set to the last day of the previous month

	return date.getTime() - MINUTE_IN_SECONDS * 1000;
};

export const currencyFormat = (size, precision = 2) => {
	const suffixes = ["", "k", "m"];
	const base = Math.log(size) / Math.log(1000);

	if (!isNaN(base)) {
		return (
			"$" +
			Math.round(Math.pow(1000, base - Math.floor(base)), precision) +
			suffixes[Math.floor(base)]
		);
	}
};

export const getDimensions = (size = null) => {
	let dims;

	switch ((size ?? "").replaceAll(" ", "-").trim().toLowerCase()) {
		case "door-hanger":
			dims = [1275, 3300];
			break;

		case "ipad-landscape":
			dims = [2160, 1620];
			break;

		case "video":
			dims = [1980, 1020];
			break;

		case "facebookstory":
			dims = [1080, 1920];
			break;

		case "instagram-square":
			dims = [1080, 1080];
			break;

		case "instagram-ad":
			dims = [1080, 566];
			break;

		case "linkedin":
			dims = [736, 1104];
			break;

		case "pinterest":
			dims = [1200, 800];
			break;
		
		case "twitter":
			dims = [1200, 675];
			break;

		case "letter":
			dims = [1458, 1883];
			break;

		case "us-letter":
			dims = [850, 1100];
			break;

		case "a4":
			dims = [827, 1169];
			break;

		// For sizes going to print, values should be inches * 100, eg 11" x 6" = 1100 x 600
		// Please DO NOT CHANGE these values
		case "postcard":
			dims = [1100, 600];
			break;
		case "tabloid-flyer":
				dims = [1700,1100];
			break;
		// End of print
	
		case "facebook-ad":
		case "facebook-post":
		case "facebook-video-ad":
			dims = [555, 555];
			break;

		case "instagram-story":
			dims = [1080, 1920];
			break;

		case "a5":
			dims = [2126, 2753];
			break;

		case "facebook":
		default:
			dims = [1200, 628];
			break;
	}

	return { width: dims[0], height: dims[1] };
};

// Helper function to filter renderIds based on mlsNumber or areaId
export const filterRenderIds = async (renderIds, params) => {
    const filteredIds = [];
    for (const renderId of renderIds) {
        const renderJsonKey = `_processing/${renderId}/render.json`;
        try {
            const renderJson = await jsonFromS3(renderJsonKey);
            if (renderJson) {
                if (params.mlsNumber && renderJson.mlsNumber === params.mlsNumber) {
                    filteredIds.push(renderId);
                } else if (params.areaId && renderJson.areaIds && renderJson.areaIds.includes(params.areaId)) {
                    filteredIds.push(renderId);
                }
            }
        } catch (error) {
            console.error(`Error reading render.json for ${renderId}:`, error);
        }
    }
    return filteredIds;
};

export const getPropertyCaption = (id, custom = null) => {
    if (custom) return custom;

    switch (id) {
        case 3:
            return 'Condos';

        default:
            return 'Homes';
    }
};
