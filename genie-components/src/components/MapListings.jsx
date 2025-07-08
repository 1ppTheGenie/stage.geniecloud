import { LeafletMap, GeoArea, CircleMarker } from "@/components";
import { format } from "date-fns";
import {
	currency,
	getCssVar,
	address,
	useSettings,
	Context4Settings,
} from "@/utilities";

export const MapListings = ({ marketStatus, ...props }) => {
	const settings = useSettings(Context4Settings);

	let headings;

	switch (marketStatus) {
		case "sold":
			headings = [
				"Address",
				"BR",
				"BA",
				"Sq.Ft.",
				"List Price",
				"Sold Price",
				"Sold Date",
				"$/Sq.Ft.",
				"DOM",
			];
			break;

		case "active":
		default:
			headings = [
				"Address",
				"List Price",
				"BR",
				"BA",
				"List Date",
				"Sq.Ft.",
				"$/Sq.Ft.",
				"DOM",
			];
			break;
	}

	return (
		<div className="flex-row" style={props.style}>
			<div class="w-33">
				<LeafletMap
					id={props.id || "genie-embed-map"}
					mapStyle={settings.mapstyle || "streets-v11"}
					style="width: 100%; min-height: 370px">
					<GeoArea
						areaId={settings.areaid}
						style=" color: #feff00; fill-opacity: 0"
					/>
					<Show when={props.listings().length}>
						<For each={props.listings()}>
							{(l, i) => (
								<CircleMarker
									color={getCssVar(
										`--${marketStatus}`,
										document.getElementsByClassName(
											`genie-wrap ${props.container}`
										)[0]
									).trim()}
									caption={i() + 1}
									key={i}
									position={[l.latitude, l.longitude]}
								/>
							)}
						</For>
					</Show>
				</LeafletMap>
			</div>
			<div class="w-66">
				<div class="listDetail">
					<table
						id="listing-table"
						class="active-table"
						style=" font-size: 80%;">
						<thead>
							<tr>
								{headings.map((caption, i) => (
									<th
										key={i}
										style={i === 0 ? { textAlign: "left" } : null}
										title={
											caption === "BR"
												? "Bedrooms"
												: caption === "BA"
												? "Bathrooms"
												: ""
										}>
										{caption}
									</th>
								))}
							</tr>
						</thead>
						<tbody>
							<Show when={marketStatus === "sold"}>
								<For each={props.listings()}>
									{l => (
										<tr>
											<td>{address(l)}</td>
											<td>{l.bedrooms}</td>
											<td>{l.bathroomsTotal}</td>
											<td>{Intl.NumberFormat("en-US").format(l.sqft)}</td>
											<td>{currency(l.priceHigh)}</td>
											<td>{currency(l.salePrice)}</td>
											<td>
												{l.soldDate && format(Date.parse(l.soldDate), "M-d-y")}
											</td>
											<td>{currency(l.salePrice / l.sqft)}</td>
											<td>{l.daysOnMarket == 1 ? "Day" : "Days"}</td>
										</tr>
									)}
								</For>
							</Show>
							<Show when={marketStatus !== "sold"}>
								<For each={props.listings()}>
									{l => (
										<tr>
											<td>{address(l)}</td>
											<td>{currency(l.priceHigh)}</td>
											<td>{l.bedrooms}</td>
											<td>{l.bathroomsTotal}</td>
											<td>{format(Date.parse(l.listDate), "M-d-y")}</td>
											<td>
												{l.sqft > 0
													? Intl.NumberFormat("en-US").format(l.sqft)
													: "-"}
											</td>
											<td>
												{l.sqft > 0 ? currency(l.priceHigh / l.sqft) : "-"}
											</td>
											<td>
												{l.daysOnMarket > 0
													? l.daysOnMarket + " Days"
													: "Today!"}
											</td>
										</tr>
									)}
								</For>
							</Show>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	);
};
