const GENIE = "genie/v1/";

const getAssets = async () => await apiCall(`get-assets`);

const getCollections = async () => await apiCall(`get-collections`);

const saveCollection = async data =>
	await apiCall(`update-collection`, data, "POST");

export { getCollections, getAssets, saveCollection };

async function apiCall(endpoint, data = null, method = "POST") {
	const url = `${window.ghub.site_url}/wp-json/${GENIE}${endpoint}`;

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

	return response.json();
}
