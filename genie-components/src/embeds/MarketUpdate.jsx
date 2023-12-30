import { Show } from "solid-js";
import { format, sub } from "date-fns";
import {
	areaDataStore,
	useSettings,
	Context4Settings,
	percent,
	currency,
	getCssVar,
} from "@/utilities";
import { HomeTypes, LeafletMap, GeoArea, CircleMarker } from "@/components";

import Arrow from "@/assets/arrow.svg";

import "@/assets/css/market-update.css";

export default () => {
	const settings = useSettings(Context4Settings);

	return (
		<div
			class="flex-row"
			style="width:100%;padding:30px 15px 15px;align-items:stretch;">
			<div class="snapshot-details">
				<h1 class="upper" style="color: var(--theme-heading-color)">
					{(areaDataStore.areaName || "").trim() +
						" " +
						areaDataStore.propertyTypeCaptionAbbr.trim()}
				</h1>

				<h2 class="mt-2">
					<span class="upper">Market Update</span>
					<span class="today-date">
						{` as of ${format(new Date(), "MMMM d, Y")}`}
					</span>
				</h2>

				<p>
					<Show when={!isNaN(areaDataStore.percentChange)}>
						{`The ${
							areaDataStore.areaName
						} area has seen the average sale price of ${
							areaDataStore.propertyTypeCaption
						} ${
							areaDataStore.percentChange > 0 ? "increase" : "decrease"
						} by ${percent(
							Math.abs(areaDataStore.percentChange)
						)} over the last ${
							areaDataStore.areaPeriod > 1
								? `${areaDataStore.areaPeriod} months`
								: "30 days"
						} . `}
					</Show>
					Take a look at the details below!
				</p>

				<HomeTypes
					/*showPeriod={parseInt(settings.period) === -1}*/
					container={`MarketSnapshot-${areaDataStore.areaId}`}
					style="width:100%"
				/>

				<h3>
					Highest home price of <span>{areaDataStore.propertyTypeCaption}</span>
				</h3>

				<Show when={areaDataStore.propertyStats}>
					<p>
						{currency(areaDataStore.propertyStats.maxSale.salePrice, false)}

						<span>{`Sold on ${format(
							new Date(areaDataStore.propertyStats.maxSale.soldOn),
							"MMMM d, Y"
						)}`}</span>
					</p>

					<Show when={areaDataStore.propertyStats.avgSalePrice > 0}>
						<div class="snapshot-area">
							<h3>
								Average home price of{" "}
								<span>{areaDataStore.propertyTypeCaption}</span>
							</h3>
							<p class="large-number">
								{currency(areaDataStore.propertyStats.avgSalePrice, false)}
							</p>
							<p id="snapshot-delta">
								<Arrow
									style={`width:20px;margin-right:0.25rem;vertical-align:middle;${
										areaDataStore.percentChange > 0
											? "color:green;"
											: "color:red;transform:rotate(180deg);"
									}`}
								/>
								{`${areaDataStore.percentChange > 0 ? "Up" : "down"} ${percent(
									Math.abs(areaDataStore.percentChange)
								)} since `}

								<br />
								{`${format(
									sub(new Date(), { months: areaDataStore.areaPeriod }),
									"MMMM, Y"
								)}`}
							</p>
						</div>
					</Show>

					<Show when={areaDataStore.propertyStats.medSalePrice > 0}>
						<h3>
							Median home price of{" "}
							<span>{areaDataStore.propertyTypeCaption}</span>
						</h3>
						<p class="large-number">
							{currency(areaDataStore.propertyStats.medSalePrice, false)}
						</p>
					</Show>
				</Show>
			</div>

			<div class="snapshot-details map-snapshot">
				<LeafletMap
					mapStyle={"streets-v11"}
					cssClasses="genie-map"
					id="market-update-map">
					<GeoArea
						areaId={areaDataStore.areaId}
						style="color:#feff00;fill-Opacity: 0;"
					/>
					<Show when={areaDataStore.propertyStats}>
						<CircleMarker
							color={getCssVar(`--sold`, document.body).trim()}
							caption={areaDataStore.propertyTypeID === 0 ? `HH` : `HC`}
							position={[
								areaDataStore.propertyStats.maxSale.latitude,
								areaDataStore.propertyStats.maxSale.longitude,
							]}
						/>
					</Show>
				</LeafletMap>
			</div>
		</div>
	);
};
