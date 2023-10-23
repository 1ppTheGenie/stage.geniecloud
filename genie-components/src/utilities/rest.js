const GENIE = "genie-embed/v2/";

const getAgentData = async agent_id => {
	const r = await apiCall("get-agent-data", { agent_id });

	//console.log("agent", r.result.agent);
	return r.result.agent;
};

const getAreaData = async params => {
	const r = await apiCall(`get-area-data`, params);

	const p = {
		stats: r.result.statistics,
		areaName: r.result.areaName,
	};

	return p;
};

const getAreaProperties = async (areaId, areaPeriod, agentId) => {
	const r = await apiCall(`get-area-properties`, {
		areaId,
		areaPeriod,
		agentId,
	});

	return r.result;
};

const getAreaMonthly = async area_settings => {
	const r = await apiCall(`get-area-monthly`, area_settings, "POST");

	return {
		stats: r.result.statistics,
		areaName: r.result.areaName,
	};
};

const getAreaPolygon = async areaId => {
	const r = await apiCall("get-area-polygon", { areaId });

	return r.success ? r.result.polygon : {};
};

const getListingData = async (mlsNo, mlsId = 0) =>
	await apiCall("get-listing-data", { mlsId, mlsNo });

const getMlsDisplay = async (mlsId = 0) =>
	await apiCall("get-mls-display", { mlsId });

const createLead = async data => await apiCall(`add-lead`, data, "POST");

const updateLead = async data => await apiCall(`update-lead`, data, "POST");

const landingPageData = async data => await apiCall(`get-landing-data`, data);

const searchAddress = async place_id => {
	if (place_id) {
		const r = await apiCall(`address-search`, { place_id });

		if (r.success === true && r.result.properties) {
			if (r.result.properties.length > 0) {
				return r.result.properties[0];
			}
		}
	}
};

const getShortData = async data => await apiCall(`get-short-data`, data);

const getPropertyQR = async data => await apiCall(`get-qr-property`, data);

const getProperty = async (property_id, agent_id, create_lead = false) =>
	await apiCall(`get-property`, { property_id, agent_id, create_lead }, "POST");

export {
	getAgentData,
	getAreaData,
	getAreaProperties,
	getAreaMonthly,
	getAreaPolygon,
	getListingData,
	getMlsDisplay,
	getProperty,
	getPropertyQR,
	getShortData,
	createLead,
	updateLead,
	searchAddress,
	landingPageData,
};

async function apiCall(endpoint, data = null, method = "GET") {
	let url = `${window.ghub.apiUrl}${GENIE}${endpoint}`;

	const headers = new Headers();
	headers.append("Content-Type", "application/json");
	headers.append("Accept", "application/json");

	const args = {
		method: method,
		mode: "cors",
		cache: "no-cache",
		headers: headers,
		referrerPolicy: "no-referrer",
	};

	if (method === "POST") {
		args.body = data && JSON.stringify(data);
	} else if (data) {
		url += `?${new URLSearchParams(Object.entries(data)).toString()}`;
	}

	const response = await fetch(url, args);

	return response.json();
}
