import { createSignal, createEffect, createMemo, Show, onMount } from "solid-js";
import { unwrap } from "solid-js/store";
import { app, saveCollection, vNotify } from "@/utilities";
import { Editable, Section } from "@/components";

const STRUCTURE_VERSION = 2;

const emptyCollection = {
	unsaved: true,
	version: STRUCTURE_VERSION,
	name: "Name this Collection",
	sections: [
		{
			name: "Available Assets",
			meta: {},
			assets: [],
		},
	],
};

const upgrade = storeIndex => {
	const json = unwrap(app.store.allCollections[storeIndex]);

	switch (json.version) {
		case STRUCTURE_VERSION:
			break;

		case 1:
			json.sections = [];

			for (const [name, props] of Object.entries(json.folders)) {
				json.sections.push({
					...props,
					name,
				});
			}

			json.version = STRUCTURE_VERSION;

			break;

		default:
			json.sections = [];
			if (json.folders) {
				for (const [name, assets] of Object.entries(json.folders)) {
					json.sections.push({
						meta: { caption: "", description: "" },
						assets: assets ?? [],
						name,
					});
				}
			}
			break;
	}
	delete json.folders;
	json.version = STRUCTURE_VERSION;

	app.setStore("allCollections", storeIndex, json);

	return json;
};

export const Collection = props => {
	if (props.index !== "new-collection") upgrade(props.index);

	const [filename, setFilename] = createSignal(
		props.index.replace(".json", "")
	);

	const [collection, setCollection] = createSignal(
		props.index !== "new-collection"
			? app.store.allCollections[props.index]
			: emptyCollection
	);

	const updateCollection = (prop, value) => {
		setCollection(c => ({ ...c, [prop]: value }));
	};

	createEffect(() => setCollection(app.store.allCollections[props.index]));

	const localSave = async message => {
		const data = unwrap(collection());
		delete data.unsaved;
		delete data.folders;

		await saveCollection({ template: filename(), collection: data });

		vNotify.success({ text: message });

		app.setStore("allCollections", props.index, data);
	};

	return (
		<>
			<div class="collection-box collection-header">
				<div class="input-grid">
					<span>Collection:</span>

					<input
						class="focussed"
						placeholder="Collections must have name"
						type="text"
						onChange={e => updateCollection("name", e.target.value)}
						value={collection().name}
					/>
					<span>Collection Template:</span>
					<select
						aria-label="Collection Template"
						class="focussed"
						onChange={e => updateCollection("template", e.target.value)}
						default="default"
						value={collection().template}>
						{console.log("app.store.allAssets", app.store.allAssets)}
						<For each={Object.keys(app.store.allAssets)}>
							{a => (
								<Show when={a.startsWith("collection")}>
									<option value={a}>{app.store.allAssets[a].name}</option>
								</Show>
							)}
						</For>
					</select>

					<span>Filename:</span>
					<input
						class="focussed"
						placeholder={
							collection().name.replaceAll(" ", "-").toLowerCase() ?? ""
						}
						type="text"
						onChange={e => setFilename(e.target.value)}
						value={filename()}
					/>
				</div>

				<div class="flex-row" style="margin-top: 2rem;">
					<button
						type="button"
						onClick={async () => await localSave("Collection saved!")}>
						Save
					</button>
					<button
						type="button"
						onClick={async () => {
							setFilename(f => `${f}-duplicate`);
							updateCollection("name", `${collection().name}-duplicate`);

							await localSave("Collection duplicated!");
						}}>
						Duplicate
					</button>
				</div>
			</div>

			<div id="sections">
				<h2>Sections</h2>
				<For each={collection().sections}>
					{(section, index) => (
						<>
							<Section
								name={section.name}
								section={section}
								updateName={newName => {
									if (newName !== section.name) {
										let sections = unwrap(collection().sections);

										sections[index()].name = newName;

										setCollection(c => ({ ...c, sections }));
									}
								}}
								removeSection={() => {
									let sections = unwrap(collection().sections).filter(
										(s, i) => i != index()
									);

									setCollection(c => ({ ...c, sections }));
								}}
								update={updatedSection => {
									let sections = unwrap(collection().sections);

									sections[index()] = updatedSection;

									setCollection(c => ({ ...c, sections }));
								}}
							/>
						</>
					)}
				</For>
				<button
					type="button"
					onClick={() =>
						setCollection(c => ({
							...c,
							sections: [...c.sections, { name: "New Section" }],
						}))
					}>
					Add Section
				</button>
			</div>
		</>
	);
};

