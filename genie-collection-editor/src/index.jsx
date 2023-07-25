/* @refresh reload */
import { render } from "solid-js/web";
import { app, view } from "@/utilities";
import { Collections, Collection } from "@/components";

import Home from "@/assets/home.svg";
Home;

const containerStyle = {
	border: "1px solid black",
	padding: "0.3em",
	"max-width": "200px",
};
const itemStyle = {
	border: "1px solid blue",
	padding: "0.3em",
	margin: "0.2em 0",
};

import "./index.css";

function App() {
	return (
		<>
			<div style="background-color: var(--genie-background);color:var(--genie-white);">
				<span style="float:right;font-size:75%; font-weight: bold; margin: 1rem;">{`v${__APP_VERSION__}`}</span>
				<h1 style="margin: 0; padding: 2rem; display: flex; align-items: center;">
					<Show when={app.store.currentView !== view.COLLECTIONS}>
						<Home
							onClick={() => app.setStore("collectionIndex", null)}
							style="fill:var(--genie-white);cursor:pointer;margin-right:1rem;height:35px;"
						/>
					</Show>
					Genie Collection Editor
					<Show when={app.store.currentView !== view.COLLECTIONS}>
						{" - "} {app.currentCollection()?.name}
					</Show>
				</h1>
			</div>
			<main style="margin: 4rem;">
				<Show when={app.store.currentView === view.COLLECTIONS}>
					<Collections />
				</Show>
				<Show when={app.store.currentView !== view.COLLECTIONS}>
					<Collection index={app.store.collectionIndex} />
				</Show>
			</main>
		</>
	);
}

render(() => <App />, document.getElementById("root"));
