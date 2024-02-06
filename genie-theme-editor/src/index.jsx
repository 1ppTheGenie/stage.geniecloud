/* @refresh reload */
import { render } from "solid-js/web";
import { createEffect, createSignal } from "solid-js";
import { vanillaToast } from "vanilla-toast";

import { ColorPicker, FontPicker } from "@/components";
import { updateTheme } from "@/utilities";

import "./index.css";
import "../node_modules/vanilla-toast/vanilla-toast.css";

const settings = {
	"Body Color": { key: "body-color", fontKey: "body-font" },
	"Body Background Color": { key: "body-background", hasFont: false },
	"Heading Color": { key: "heading-color", fontKey: "heading-font" },
	"Sub Heading Color": { key: "sub-heading-color", fontKey: "sub-heading-font" },
	"Outline/Emphasis": { key: "emphasis-color", hasFont: false },
};

const root = document.querySelector(":root");

const slugify = str => str.toLowerCase().replaceAll(" ", "-");

function App() {
	const [name, setName] = createSignal("");
	const [style, setStyle] = createSignal("");
	const [colors, setColors] = createSignal({
		"body-color": "#ffffff",
		"body-background": "#000000",
		"heading-color": "#ffffff",
		"sub-heading-color": "#c6c6c6",
		"emphasis-color": "#c6c6c6",
	});

	const [fonts, setFonts] = createSignal({
		"body-font": "Roboto",
		"heading-font": "Roboto",
		"sub-heading-font": "Roboto",
	});

	const save = () => {
		const data = {
			name: name(),
			style: style(),
			colors: colors(),
			fonts: fonts(),
			slug: `${slugify(name())}-${slugify(style())}`,
		};

		updateTheme(data);

		vanillaToast.success("Saved", { duration: 3000, fadeDuration: 500 });
	};
	createEffect(() => {
		Object.keys(colors()).forEach(key =>
			root.style.setProperty(`--theme-${key}`, colors()[key])
		);
	});

	createEffect(() => 
		Object.keys(fonts()).forEach(key => root.style.setProperty(`--theme-${key}`, fonts()[key]))
	);

	return (
		<main>
			<h1>Genie Theme Editor</h1>

			<div class="sample">
				<div className="genie-asset-background">
					<div className="genie-asset-outline">
						<h4 className="genie-asset-heading">Lorem ipsum dolor</h4>
						<h5 className="genie-asset-subtitle">Fusce sapien lorem dolor cursus</h5>

						<p className="genie-asset-body">
							Pellentesque euismod neque in malesuada eleifend. Donec blandit turpis
							nec purus consequat egestas.
						</p>
					</div>
				</div>
			</div>
			<p>
				<label>
					Theme Name:{" "}
					<input type="text" value={name()} onChange={e => setName(e.target.value)} />
				</label>
				<br />
				<small>Visible to users, so choose appropriately</small>
			</p>

			<p>
				<label>
					Theme Style:{" "}
					<input type="text" value={style()} onChange={e => setStyle(e.target.value)} />
				</label>
				<br />
				<small>Typically 'Light' or 'Dark', but other terms can be used.*</small>
			</p>

			<p>
				<Show when={name() !== "" && style() !== ""}>
					API param: <strong>{`${slugify(name())}-${slugify(style())}`}</strong>
				</Show>
			</p>

			{Object.keys(settings).map(k => (
				<div class="css-setting">
					<span>{k}</span>
					<ColorPicker
						color={colors()[settings[k].key]}
						setColor={newColor =>
							setColors({ ...colors(), [settings[k].key]: newColor })
						}
					/>

					<div>
						<Show when={settings[k].fontKey}>
							<FontPicker
								font={fonts()[settings[k].fontKey]}
								setFont={newFont =>
									setFonts({ ...fonts(), [settings[k].fontKey]: newFont })
								}
							/>
						</Show>
					</div>
				</div>
			))}

			<button disabled={name() === "" || style() === ""} onClick={() => save()}>
				Save
			</button>
		</main>
	);
}

render(() => <App />, document.getElementById("root"));
