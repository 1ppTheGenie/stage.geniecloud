import { createStore } from "solid-js/store";
import { createRoot, createSignal, createEffect } from "solid-js";

import { getRenders, getErrors } from "@/utilities"

export const view = { COLLECTIONS: 0, ASSETS: 1 };

const GENIE = "genie/v1/";

export const settings = await (async () => {
	const data = await fetch("/settings.json");

	return await data.json();
})();


export const app = createRoot(() => {
	const [store, setStore] = createStore({
		renders: null,
	});

	return {
		store,
		setStore,
	};
});

(async () => {
	let result = await getRenders();
	app.setStore( "activity", result );


	result = await getErrors();
	app.setStore( "errors", result );
})();
