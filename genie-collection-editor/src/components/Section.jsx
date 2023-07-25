import { Asset } from "@/components";
import { NewAsset } from "./NewAsset";
import { isIterable } from "@/utilities";

export const Section = props => {
	const reorderAssets = (currentIndex, move = 0) => {
		let newAssets = [...props.section.assets];
		const items = newAssets.splice(currentIndex, 1);

		// If shuffling rather than removing...
		if (move != 0) {
			newAssets.splice(currentIndex + move, 0, items[0]);
		}

		props.update({ ...props.section, assets: newAssets });
	};

	const addAsset = newAsset => {
		let newAssets = isIterable(props.section?.assets)
			? [...props.section.assets]
			: [];
		newAssets.push(newAsset);

		props.update({ ...props.section, assets: newAssets });
	};

	const updateAsset = (updatedAsset, index) => {
		let newAssets = [...props.section.assets];
		newAssets[index] = updatedAsset;

		props.update({ ...props.section, assets: newAssets });
	};

	return (
		<div class="collection-box">
			<div class="input-grid">
				<span>Section Name:</span>

				<input
					class="focussed"
					placeholder="Section Name"
					type="text"
					onChange={e => props.updateName(e.target.value)}
					value={props.name}
				/>

				<span>Section Caption:</span>

				<input
					class="focussed"
					type="text"
					onChange={e =>
						props.update({
							...props.section,
							meta: { ...props.section.meta, caption: e.target.value },
						})
					}
					value={props.section.meta?.caption ?? ""}
				/>

				<span style="align-self: baseline;">Section Description:</span>
				<textarea
					class="focussed"
					onChange={e =>
						props.update({
							...props.section,
							meta: { ...props.section.meta, description: e.target.value },
						})
					}>
					{props.section.meta?.description ?? ""}
				</textarea>
			</div>

			<h3>Assets</h3>

			<table style="width:100%">
				<Show when={props.section?.assets?.length > 0}>
					<thead style="text-align: left;">
						<tr>
							<th>Asset Name</th>
							<th>Name Override</th>
							<th>Type</th>
							<th>Supports</th>
							<th>LPO for</th>
							<th>QR Destination</th>
							<th></th>
						</tr>
					</thead>
				</Show>
				<tbody>
					<For each={props.section.assets}>
						{(item, index) => (
							<Asset
								asset={item}
								index={index}
								count={props.section.assets.length}
								remove={() => reorderAssets(index())}
								moveDown={() => reorderAssets(index(), 1)}
								moveUp={() => reorderAssets(index(), -1)}
								update={updated => updateAsset(updated, index())}
							/>
						)}
					</For>
					<NewAsset currentAssets={props.section.assets} addAsset={addAsset} />
				</tbody>
			</table>

			<div class="flex-row" style="margin-top: 2rem;">
				<button type="button" onClick={() => props.removeSection()}>
					Remove <strong>{props.name}</strong>
				</button>
			</div>
			{/*
				<For each={props.section.assets}>
					{ (item, index) => {
						const asset =
							app.store.allAssets[item.folder][item.stylesheet + ".xsl"];
						const name = item.knownAs || asset.knownAs || asset.name;

						const customCSS = () => {
							if (name === asset.name) {
								return "";
							} else if (name === asset.knownAs) {
								return "font-style:italic";
							} else if (name === item.knownAs) {
								return "font-weight:bold;font-style:italic;";
							}
						};

						return (
							<>
								<Editable
									style={`cursor:pointer;${customCSS()}`}
									title={`${item.folder}/${item.stylesheet}`}
									default={name}
									store={value => {
										let newAssets = [...props.section.assets];
										newAssets[index()] = {
											...item,
											knownAs: value,
										};

										props.update({ ...props.section, assets: newAssets });
									}}>
									{name}
								</Editable>
							</>
						);
					}}
			</For>
				*/}
		</div>
	);
};
