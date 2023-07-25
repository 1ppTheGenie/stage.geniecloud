const GENIE = "genie/v1/";

const getThemes = async () => await apiCall(`get-themes`);

const updateTheme = async data => await apiCall(`update-theme`, data, "POST");

export { getThemes, updateTheme };

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
	console.log(url, args);
	const response = await fetch(url, args);

	return response.json();
}
