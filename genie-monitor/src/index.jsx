/* @refresh reload */
import { render } from "solid-js/web";
import { app, view } from "@/utilities";
import { Render } from "@/components";

//import Home from "@/assets/home.svg";

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
					Genie Monitor
				</h1>
			</div>
			<main id="renders" style="margin: 4rem;">
				<Show when={app.store.activity?.reRenders}>
					<For each={Object.keys(app.store.activity?.reRenders)}>
						{r => <Render renderId={r} renderDate={app.store.activity?.renders[r]} reRenderDate={app.store.activity?.reRenders[r]} />}
					</For>
				</Show>
			</main>
		</>
	);
}

render(() => <App />, document.getElementById("root"));
