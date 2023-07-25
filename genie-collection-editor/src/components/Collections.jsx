import { app } from "@/utilities";

export const Collections = () => {
	const selectCollection = id => app.setStore("collectionIndex", id);
	return (
		<div>
			<h1>Genie Collections</h1>

			<ul id="collections">
				<li onClick={() => selectCollection("new-collection")}>
					<em>Create New Collection</em>
				</li>

				<Show when={app.store.allCollections}>
					<For each={Object.keys(app.store.allCollections)}>
						{key => (
							<li onClick={() => selectCollection(key)}>
								{app.store.allCollections[key].name}
							</li>
						)}
					</For>
				</Show>
			</ul>
		</div>
	);
};
