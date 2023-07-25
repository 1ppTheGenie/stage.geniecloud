import { createSignal, createEffect, onMount } from "solid-js";
import { app } from "@/utilities";
import Choices from "choices.js";

import "@/../node_modules/choices.js/public/assets/styles/choices.min.css";

import Plus from "@/assets/plus.svg";

export const NewAsset = props => {
	const [asset, setAsset] = createSignal();

	let ref;

	onMount(() => {
		new Choices(ref, {
			allowHTML: false,
			searchPlaceholderValue: "Search for desired asset",
		});
	});

	return (
		<tr>
			<td>
				<select
					aria-label="Assets"
					ref={ref}
					onChange={e => {
						let names = e.target.value.split("/");

						setAsset({
							folder: names[0],
							stylesheet: names[1].replace(".xsl", ""),
						});
					}}>
					<For each={Object.keys(app.store.allAssets)}>
						{key => (
							<optgroup label={key}>
								<For each={Object.keys(app.store.allAssets[key])}>
									{key2 => (
										<option value={`${key}/${key2}`}>
											{app.store.allAssets[key][key2].name}
										</option>
									)}
								</For>
							</optgroup>
						)}
					</For>
				</select>
			</td>

			<td colSpan="3" class="actions">
				<Plus
					style="fill:var(--genie-primary);"
					onClick={() => asset() && props.addAsset(asset())}
				/>
			</td>
		</tr>
	);
};
