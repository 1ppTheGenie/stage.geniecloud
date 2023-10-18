import { createStore } from "solid-js/store";
import { createRoot, createSignal, createEffect } from "solid-js";
export const view = { COLLECTIONS: 0, ASSETS: 1 };

const GENIE = "genie/v1/";

const settings = await (async () => {
	const data = await fetch("/settings.json");

	return await data.json();
})();

const getAssets = async () => await apiCall(`get-assets`);
const getCollections = async () => await apiCall(`get-collections`);
const saveCollection = async data =>
	await apiCall(`save-collection`, data, "POST");

export { getCollections, getAssets, saveCollection };

async function apiCall(endpoint, data = null, method = "POST") {
	const url = `${settings.endpoint}${endpoint}`;

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

export const app = createRoot(() => {
	const [store, setStore] = createStore({
		allCollections: null,
		allAssets: null,
		currentView: view.COLLECTIONS,
		collectionIndex: null,
	});

	createEffect(() =>
		setStore(
			"currentView",
			store.collectionIndex !== null ? view.ASSETS : view.COLLECTIONS
		)
	);

	const currentCollection = () =>
		store.collectionIndex ? store.allCollections[store.collectionIndex] : null;

	return {
		store,
		setStore,
		reloadCollections: async () => {
			const collections = await getCollections();
			app.setStore("allCollections", collections.result);
		},
		currentCollection,
		currentLandingPages: (incLPOs = false) => {
			let landingPages = [];

			if (currentCollection() && currentCollection().sections) {
				Object.keys(currentCollection().sections).forEach(folder => {
					currentCollection().sections[folder]?.assets?.forEach(asset => {
						if (asset.folder == "landing-pages" && (!asset.lpo || incLPOs)) {
							landingPages.push(asset.knownAs || asset.stylesheet);
						}
					});
				});
			}

			return landingPages;
		},
	};
});

(async () => {
	let result = await getCollections();
	app.setStore("allCollections", result.collections);

	result = await getAssets();

	const excludes = ["cush", "funn", "embe"];
	Object.keys(result.assets).map(asset => {
		if (excludes.includes(asset.substring(0, 4))) {
			delete result.assets[asset];
		}
	});

	app.setStore("allAssets", result.assets);
})();
