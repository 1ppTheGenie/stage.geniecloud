/* @refresh reload */
import { render } from "solid-js/web";
//import { app, view } from "@/utilities";

import "./index.css";

function App() {
	return (
		<>
			<div style="background-color: var(--genie-background);color:var(--genie-white);">
				<span style="float:right;font-size:75%; font-weight: bold; margin: 1rem;">{`v${__APP_VERSION__}`}</span>
				<h1 style="margin: 0; padding: 2rem; display: flex; align-items: center;">
					Genie Error Viewer
				</h1>
			</div>
			<main style="margin: 4rem;"></main>
		</>
	);
}

render(() => <App />, document.getElementById("root"));
