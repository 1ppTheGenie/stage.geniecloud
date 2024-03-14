import { createSignal, Show } from "solid-js";
import { currency, dateFormat, useAgentData } from "@/utilities";
import { LeafletMap, LeadCaptureForm, Marker, ClosePopup } from "@/components";

export const HomeValuationResult = props => {
	const { place, property, withLeadCapture = true } = props;
	const [leadCaptured, setLeadCaptured] = createSignal(!withLeadCapture);

	return (
		<>
			<h2 class="home-value-title no-background">
				Get your personalized home report
			</h2>
			<div class="home-value-result">
				<ClosePopup />

				<LeafletMap
					id="genie-result-map"
					style="width:100%; height:380px"
					mapStyle="satellite-streets-v11"
					center={[
						place().geometry.location.lat(),
						place().geometry.location.lng(),
					]}
					zoom={22}>
					<Marker
						position={[
							place().geometry.location.lat(),
							place().geometry.location.lng(),
						]}
					/>
				</LeafletMap>

				<div style="margin:-5vh 5vw;padding-bottom: 4vh;z-index:999999;position:relative;">
					<div
						class="invert center"
						style="padding: 1vw; border-radius: 10px; box-shadow: 0px 2px 10px #0003;">
						{leadCaptured && <h3>Home Value Range Report for</h3>}

						<h4 style="font-size: 100%">{place().formatted_address}</h4>
					</div>

					<Show when={withLeadCapture && !leadCaptured()}>
						<h3>
							Fill out the fields below and we'll send you your personalized
							report
						</h3>
						<LeadCaptureForm
							setLeadCaptured={setLeadCaptured}
							leadNote="A new home valuation lead from TheGenie!"
							existingData={property() && { propertyId: property().propertyID }}
						/>
					</Show>

					<Show when={leadCaptured()}>
						<PropertyResponse property={property()} />
					</Show>
				</div>
			</div>
		</>
	);
};

const PropertyResponse = props => {
	const { property } = props;
	return (
		<>
			{typeof property === "undefined" && (
				<p class="invert" style="text-align:left;padding:2vw">
					Sorry, we were not able to locate a home valuation for your property
					above. Not a problem, we will look into this and get back to you
					shortly. I look forward to discussing the information with you very
					soon and to help you get top dollar for your home.
					<Signature />
				</p>
			)}

			{typeof property !== "undefined" && (
				<>
					<div class="invert" style="text-align:left;padding:1vw;margin:2vh 0">
						{property.firstOwnerFirstName &&
							property.firstOwnerFirstName !== "" && (
								<p style="text-transform:capitalize">
									Hi {property.firstOwnerFirstName.toLowerCase()}
								</p>
							)}

						<p>
							Here is the initial valuation we found for your address. This
							automated valuation is one way to get a general idea, but it is
							important to realize an algorithm can't provide the accuracy
							you'll want if you are thinking about selling. Many factors that
							can't be squeezed into a data field impact your market value, from
							updates and improvements you have (or have not yet) made, to
							what's located next door or a block away, to recent, sometimes
							rapidly changing, market trends. Our role as realtors is to take
							all of this into consideration. If you are thinking about selling,
							please call for a real-time, real-world value for your most
							important investment! Looking forward to helping you get top
							dollar for your home.
							<Signature />
						</p>
					</div>

					<h3 style="margin-bottom:1vh;color:var(--theme-heading-color);">
						Confirm Home Details
					</h3>

					<div class="invert home-value-details">
						{[
							{
								value: Intl.NumberFormat("en-US").format(
									property.sumBuildingSqFt
								),
								title: "SQUARE FT",
							},
							{ value: property.bedrooms, title: "BEDS" },
							{ value: property.bathrooms, title: "FULL BATHS" },
							{ value: property.yearBuilt, title: "BUILT IN" },
							{
								value: property.saleDate
									? dateFormat(Date.parse(property.saleDate))
									: "n/a",
								title: "PURCHASED",
							},
							{ value: "Unknown", title: "LAST RENO" },
						].map((s, i) => (
							<div key={s.title}>
								<img
									src={`/_assets/_img/valuation-icon-${i + 1}.png`}
									alt={`${s.title} icon`}
								/>
								<h4>{s.title}</h4>
								<h5>{s.value}</h5>
							</div>
						))}
					</div>

					<div
						class="home-value-estimate"
						style="color:var(--theme-heading-color)">
						<h4>Estimated Value Range:</h4>
						<h5>{`${currency(property.avmLow)} - ${currency(
							property.avmHigh
						)}`}</h5>
					</div>
				</>
			)}
		</>
	);
};

const Signature = () => {
	const agent = useAgentData();

	return (
		<Show when={!agent.loading && agent()}>
			<br />
			<br />
			Sincerely,
			<br />
			<br />
			{agent()?.displayName}
			<br />
			{agent()?.phone}
			<br />
			{agent()?.email}
		</Show>
	);
};
