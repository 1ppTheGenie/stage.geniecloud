import { createResource, createSignal, Suspense, Show } from "solid-js";
import { areaDataStore, useSettings, searchAddress } from "@/utilities";
import {
	AutoComplete,
	Editable,
	LeafletMap,
	LeafletPane,
	GeoArea,
	HomeValuationResult,
	ClosePopup,
} from "@/components";

import "@/index.css";
import "@/assets/css/home-value.css";

export default props => {
	const { withCopy = false, buttonCaption = "Get your Value!" } = props;
	const { areaId, mapStyle, withLeadCapture } = useSettings();

	const [showResult, setShowResult] = createSignal(false);
	const [place, setPlace] = createSignal();
	const [placeID, setPlaceID] = createSignal();
	const [property] = createResource(placeID, searchAddress);

	return (
		<>
			<Show when={showResult() === true}>
				<HomeValuationResult
					place={place}
					property={property}
					withLeadCapture={true}
				/>
			</Show>

			<Show when={showResult() === false}>
				<h2 class="home-value-title no-background">Let's find your home</h2>
				<div
					id="map-place-getter"
					style="border-radius: 20px; width: 50vw; min-height: 450px;">
					<ClosePopup />

					<LeafletMap
						style="width:100%;height:450px;margin:0;"
						mapStyle={mapStyle || "satellite-streets-v11"}
						zoom={18}>
						<>
							<Suspense>
								<GeoArea areaId={areaId} fillColor="var (--theme-color)" />
							</Suspense>

							<LeafletPane>
								<>
									{withCopy && <EditableCopy />}

									<div style="min-width:80%">
										<AutoComplete
											containerStyle="display:flex;min-width:80%;"
											inputStyle="padding:10px 15px; border-radius:20px;border:2px solid black;outline:none;flex-basis:70%;flex-grow:1"
											placeChanged={place => {
												setPlaceID(place.place_id);
												setPlace(place);
											}}>
											<button
												style="border-radius:20px;border:2px solid black;background-color:black;color:#fff;margin-left:-35px;outline:none;cursor:pointer"
												onClick={() => setShowResult(true)}>
												{buttonCaption}
											</button>
										</AutoComplete>
									</div>
								</>
							</LeafletPane>
						</>
					</LeafletMap>
				</div>
			</Show>
		</>
	);
};

const EditableCopy = () => {
	return (
		<>
			<Editable class="upper center" id="home-valuation-heading-1">
				<h1>What’s My {areaDataStore.areaName} Home Value?</h1>
			</Editable>
			<Editable id="home-valuation-para-1">
				<p>GET A FREE QUOTE - NO STRINGS ATTACHED</p>
			</Editable>
			<Editable id="home-valuation-para-2">
				<p>
					Thinking of selling? Let us assess your home’s value to help you decide if now’s
					the time to move.
				</p>
			</Editable>
		</>
	);
};
