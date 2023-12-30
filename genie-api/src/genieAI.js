import { DateTime } from "luxon";
import crypto from "crypto";
import { dateFormat, toS3, jsonFromS3, timeAgo } from "./utils/index.js";

const API_URL = process.env.GENIE_URL ?? "https://app.thegenie.ai/api/Data/";
const API_PASS = process.env.GENIE_PASS ?? "iLAE9k1P!fL3";
const API_USER = process.env.GENIE_USER ?? "genieApiHub2";

const API_AUTH =
	"Basic " + Buffer.from(`${API_USER}:${API_PASS}`).toString("base64");

const HOUR_IN_SECONDS = 60 * 60;
const CACHE_FOR = {
	GetAddressPredictions: HOUR_IN_SECONDS * 36,
	GetSavedSearches: HOUR_IN_SECONDS * 36,
};
const AS_JSON = "application/json";

export const impersonater = {};

const from_cache = async (key, endpoint) => {
	const since = new Date();
	since.setHours(
		since.getSeconds() -
			(CACHE_FOR[endpoint.split("/")[0]] ?? HOUR_IN_SECONDS / 2)
	);

	// ToDo: some "skip cache" code?
	return await jsonFromS3(`_cache/${key}`, since);
};

const to_cache = async (data, endpoint, key, timeout_hours = 4) => {
	const timeout = CACHE_FOR[endpoint.split("/")[0]] ?? timeout_hours;

	if (timeout > 0) {
		await toS3(`_cache/${key}`, Buffer.from(data), {
			genieCache: endpoint?.toString(),
			ExpireFile: "GenieCache",
			timeout,
		});
	}
};

const cache_key = (endpoint, params, verb) => {
	const strParams = JSON.stringify(Object.entries(params ?? {}));
	const hash = crypto
		.createHash("md5")
		.update(`${endpoint}.${verb}.${strParams}`)
		.digest("hex");

	return `genie-${hash}.json`;
};

export const areaName = async (userId, areaId) =>
	await call_api("GetAreaName", { areaId, userId });

export const rename_area = async (user_id, area_id, new_name) =>
	await call_api("RenameArea", {
		areaId: area_id,
		userId: user_id,
		newName: new_name,
	});

export const area_statistics = async (
	user_id,
	area_id,
	range = [1, 3, 6, 9, 12]
) =>
	await call_api("GetAreaStatistics", {
		areaId: area_id,
		userId: user_id,
		SoldMonthRangeIntervals: range,
	});

export const areaStatisticsWithPrevious = async (
	userId,
	areaId,
	month_count = 12,
	end_timestamp = null
) =>
	await call_api("GetAreaStatisticsWithPreviousInterval", {
		areaId,
		userId,
		numberOfMonthsToLookBack: month_count,
		endDate: dateFormat(end_timestamp),
	});

export const areaStatisticsMonthly = async (userId, areaId, years = 1) =>
	await call_api("GetAreaStatisticsSoldMonthly", {
		areaId,
		userId,
		years,
	});

export const address_predictions = async address =>
	await call_api("GetAddressPredictions", {
		address: address,
		sessionToken: "",
	});

export const agentProperties = async (userId, includeOpenHouses = false) => {
	const callback = results => {
		if (results.properties) {
			// Make sure we have a list of unique properties
			results.properties = [...new Set(results.properties)];

			const yearAgo = timeAgo({ year: -1 });
			results.properties = results.properties.filter(
				p => p.soldDate === null || DateTime.fromISO(p.soldDate) > yearAgo
			);
		}

		if (results.openHouses) {
			const threeMonthsAgo = timeAgo({ quarter: -1, seconds: -90 });

			results.openHouses = results.openHouses.filter(
				p => DateTime.fromISO(p.startDateUtc) > threeMonthsAgo
			);
		}

		return results;
	};

	return await call_api(
		"GetAgentProperties",
		{ userId, includeOpenHouses },
		"POST",
		callback
	);
};

export const getAssessorProperty = async (property_id, agent_id) =>
	await call_api("GetAssessorPropertyDetail", {
		PropertyId: property_id,
		userId: agent_id,
	});

export const assessor_properties = async (mlsGroupID, area_id) =>
	await call_api("GetAssessorProperties", {
		mlsGroupID: mlsGroupID,
		areaID: area_id,
	});

export const getAssessorPropertiesDetail = async address_id =>
	await call_api(`GetAssessorPropertiesDetail/${address_id}`);

export const available_areas = async agent_id =>
	await call_api(
		"GetAvailableAreas",
		{ userId: agent_id, includeTerritories: false },
		"POST"
	);

export const getAreaBoundary = async areaId =>
	await call_api(`GetAreaBoundary/${areaId}`, null, "POST");

export const getListing = async (user_id, mls_number, mls_id = -1) => {
	let listing;

	if (mls_id > -1) {
		const r = await call_api(
			"GetUserMlsListing",
			{ mlsId: mls_id, mlsNumber: mls_number, userId: user_id },
			"POST"
		);

		listing = r.listing ?? null;

		if (listing && r.preferredAreaId) {
			listing.preferredAreaId = r.preferredAreaId;
		}
	} else {
		const r = await call_api(
			"GetListingByMlsNumber",
			{ mlsNumber: mls_number },
			"POST"
		);

		listing = r?.listings[0] ?? null;
	}

	if (listing?.errorCode == 0) {
		return listing;
	}
};

export const mlsListingLastUpdate = async data =>
	await call_api(`GetMlsListingLastUpdate`, data, "POST");

export const mlsDisplaySettings = async mls_id =>
	await call_api(`GetMlsDisplaySettings/${mls_id}`, null, "POST");

export const mlsProperties = async (
	mlsGroupID,
	area_id,
	startDate = null,
	include_open_houses = false
) => {
	startDate = startDate ?? dateFormat(timeAgo({ months: -1 }));
	let r;

	try {
		r = await call_api("GetMlsProperties", {
			mlsGroupID: mlsGroupID,
			areaID: area_id,
			startDate: startDate,
			includeOpenHouses: include_open_houses,
		});
	} catch (err) {
		console.log("GetMlsProperties failed", err);
	}

	return r ? r?.properties ?? { success: false } : { success: false };
};

export const openhouseByMlsNumber = async (mlsID, mlsNumber) =>
	await call_api("GetOpenHouseByMlsNumber", { mlsID, mlsNumber });

export const getPropertyBoundary = async (
	mls_id,
	mls_number,
	fips,
	property_id
) => {
	const args = {};

	if (mls_id) {
		args["MlsID"] = mls_id;
	}

	if (mls_number) {
		args["MlsNumber"] = mls_number;
	}

	if (fips) {
		args["FIPS"] = fips;
	}

	if (property_id) {
		args["PropertyID"] = property_id;
	}

	return await call_api("GetPropertyBoundary", args);
};

export const propertySurroundingAreas = async (
	mls_number,
	mls_id,
	user_id,
	fips = "",
	property_id = -1
) => {
	const r = await call_api("GetPropertySurroundingAreas", {
		AspNetUserId: user_id,
		mlsID: mls_id,
		mlsNumber: mls_number,
		fips: fips,
		propertyID: property_id,
	});

	return r.success && r.areas;
};

export const savedSearches = async (userId, areaId) =>
	await call_api("GetSavedSearches", { userId, areaId });

export const getShortData = async (shortUrlDataId, token, agentId = null) => {
	const r = await call_api(
		"GetShortUrlData",
		{ shortUrlDataId: shortUrlDataId, token: token },
		"POST"
	);

	if (r.data) {
		if (agentId) {
			const capture = r.data;

			capture.shortUrlDataId = shortUrlDataId;

			capture.trackingData = {
				utmSource: capture.utm_source ?? null,
				utmMedium: capture.utm_medium ?? null,
				utmCampaign: capture.utm_campaign ?? null,
				utmTerm: capture.utm_term ?? null,
				utmContent: capture.utm_content ?? null,
			};

			delete capture.mlsId;
			delete capture.mlsNumber;
			delete capture.phoneNumbers;
			delete capture.emailAddresses;
			delete capture.inquiryType;
			delete capture.utm_source;
			delete capture.utm_medium;
			delete capture.utm_campaign;
			delete capture.utm_term;
			delete capture.utm_content;

			const lead = await createLead(agentId, capture);

			if (typeof lead == "object" && typeof lead.key !== "undefined") {
				r.data.genieLeadId = lead.key;
			}
		}

		r.data.salutation = [r.data.firstName, r.data.lastName].join(" ");

		return r.data;
	}
};

export const updateHubAsset = async (hubAssetUrl, userId, hubAssetId) =>
	await call_api("UpdateHubAsset", { userId, hubAssetId, hubAssetUrl }, "POST");

export const getUser = async user_id =>
	await call_api(`GetUserProfile/${user_id}`, null, "POST");

const expiry_time = token => {
	decoded = JSON.parse(
		Buffer.from(
			token.split(".")[1].replaceAll("-", "+").replaceAll("_", "/")
		).toString("base64")
	);

	return decoded.exp;
};

export const getPropertyFromId = async (property_id, agent_id) => {
	const r = await getAssessorProperty(property_id, agent_id);

	if (r.hasProperty) {
		r.property.boundary = await getPropertyBoundary(
			null,
			null,
			r.property.fips,
			r.property.propertyID
		);

		return r.property;
	}
};

export const createLead = async (userId, args) => {
	args.userId = userId;

	const r = await call_api("CreateNewLead", args, "POST");

	if (!r) {
		console.log("Failed to create new lead: ", r);
	}

	return r;
};

export const updateLead = async (userId, args) =>
	await call_api("UpdateLead", { ...args, userId }, "POST");

export const getQRProperty = async (qrID, token) => {
	const lead = await getQRCodeLead(qrID, token);

	if (lead.property) {
		const property = lead.property;

		property.salutation = `${lead.firstName} ${lead.lastName}`;

		property.boundary = await getPropertyBoundary(
			null,
			null,
			property.fips,
			property.propertyID
		);

		const capture = {
			email: lead.email ?? null,
			phoneNumber: lead.phoneNumber ?? null,
			trackingData: lead.trackingData ?? null,
			qrCodeId: qrID,
			token: token,
		};

		const leadCreate = await createQRCodeLead(capture);

		if (typeof leadCreate == "object" && leadCreate.success) {
			property.genieLeadId = leadCreate.key;
		}

		return property;
	}
};

export const createQRCodeLead = async args => {
	const r = await call_api("CreateQRCodeLead", args, "POST");

	if (!r.success) {
		console.log("Failed to capture lead: ", r);
	}

	return r;
};

export const getQRCodeLead = async (qrCodeId, token) =>
	await call_api("GetQRCodeLead", { qrCodeId: qrCodeId, token: token }, "POST");

// prettier-ignore
const call_api = async ( endpoint, params, verb = "POST", pre_cache = null ) => {
	// Assign here in case null is passed
	params = params ?? {};

	if ( impersonater.id ) {
		params.ImpersonatedByAspNetUserId = impersonater.id;
	}

	const cacheKey = cache_key( endpoint, params, verb );

	let result = await from_cache( cacheKey, endpoint );
	
	if (!result) {
		// Flag the API call as coming from Hub2
		params.consumer = 2;

		result = await fetch(API_URL + endpoint, {
			method: verb,
			httpversion: "1.1",
			headers: {
				Authorization: API_AUTH,
				"cache-control": "no-cache",
				"content-type": AS_JSON,
				Accept: AS_JSON,
			},
			timeout: 60,
			body: Object.keys(params).length > 0 ? JSON.stringify(params) : null,
		}).then(response => response.json());

		// Only cache successful API calls
		if (result.success) {
			if (pre_cache && typeof pre_cache == "function") {
				// Allow calling functions to pre-process before result is cached
				result = pre_cache(result);
			}

			to_cache( JSON.stringify( result ), endpoint, cacheKey );
			console.log( 'cache to', endpoint,cacheKey );
		} else {
			if (
                typeof result !== 'object' ||
                !result?.responseDescription ||
                result.responseDescription !== 'Asset Url has already been set'
            ) {
                console.log(`GenieAPI error (${endpoint}): `, result)
            }
		}
	} else {
		console.log( 'cache from', endpoint,cacheKey );
	}

	return result;
};
