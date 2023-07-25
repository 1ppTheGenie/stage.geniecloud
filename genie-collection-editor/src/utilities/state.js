import { createStore } from "solid-js/store";
import { createRoot, createSignal, createEffect } from "solid-js";

import { getAssets, getCollections } from "@/utilities";

export const view = { COLLECTIONS: 0, ASSETS: 1 };

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

window.onload = () => {
	(async () => {
		const collections = await getCollections();
		app.setStore("allCollections", collections.result);

		const assets = await getAssets();

		// Some assets are not available for collections
		["cush", "funnels", "embeds"].forEach(
			folder => delete assets.result.assets[folder]
		);

		app.setStore("allAssets", assets.result.assets);
	})();
};


