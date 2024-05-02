import { settings } from "@/utilities";

export const getRenderJson = async renderId =>  await apiCall( settings.s3, `_processing/${renderId}/render.json`, null, "GET" );

export const getRenders = async () => await apiCall( settings.api, `genie-admin/v2/recent-renders` );

export const getErrors = async () => await apiCall( settings.api, `genie-admin/v2/render-errors` );

export const triggerReRender = async renderId => await apiCall( settings.api, `re-render`, {renderId} );

export const getAgent = async agentId => await apiCall( settings.api, `genie-admin/v2/get-agent`, {agentId}  );

async function apiCall( domain, endpoint, data = null, method = "POST" ) {
	const url = `${domain}${endpoint}`;

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
	}

	const response = await fetch(url, args);

	return await response.json();
}