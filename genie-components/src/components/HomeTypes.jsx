import { Show } from "solid-js";
import { DataPeriod } from "./DataPeriod";
import {
	useSettings,
	Context4Settings,
	sharedEmbedStore,
	setSharedEmbedStore,
} from "@/utilities";

import "@/assets/css/home-types.css";

const g = window.ghub;

export const HomeTypes = props => {
	const { optionTabs, container, style, showPeriod = true } = props;
	const settings = useSettings(Context4Settings);

	return (
		<Show when={true}>
			<Show when={optionTabs === true}>
				<div
					class="custom-check"
					style="display:flex; flex-direction: column; align-items: center">
					<Show when={showPeriod}>
						<DataPeriod style="margin-bottom:2rem" />
					</Show>

					{parseInt(settings.propertyType) === -1 && (
						<div id="hometypes-choice" style={style} class="curved-tabs">
							<span
								class={
									sharedEmbedStore.propertyType === g.SINGLE ? "active" : ""
								}
								onClick={() => setSharedEmbedStore({ propertyType: g.SINGLE })}>
								Single Family Homes
							</span>
							<span
								class={
									sharedEmbedStore.propertyType === g.CONDO ? "active" : ""
								}
								onClick={() => setSharedEmbedStore({ propertyType: g.CONDO })}>
								Condos
							</span>
						</div>
					)}
				</div>
			</Show>
			<Show when={optionTabs !== true}>
				<div id="hometypes-choice" style={style}>
					{parseInt(settings.propertyType) === -1 && (
						<>
							<label>
								<input
									name={`${container}-hometypes`}
									type="radio"
									onClick={() =>
										setSharedEmbedStore({ propertyType: g.SINGLE })
									}
									checked={sharedEmbedStore.propertyType === g.SINGLE}
								/>
								Single Family Homes
							</label>
							<label>
								<input
									name={`${container}-hometypes`}
									type="radio"
									onClick={() => setSharedEmbedStore({ propertyType: g.CONDO })}
									checked={sharedEmbedStore.propertyType === g.CONDO}
								/>
								Condos
							</label>
						</>
					)}
					<Show when={showPeriod}>
						<DataPeriod style="margin-bottom:2rem" />
					</Show>
				</div>
			</Show>
		</Show>
	);
};
