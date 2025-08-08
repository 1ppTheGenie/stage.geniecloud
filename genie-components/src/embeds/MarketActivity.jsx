import { createSignal, createEffect, createMemo } from "solid-js";
/* prettier-ignore */
import { HomeTypes, LeafletMap, GeoArea, ListingsTable, ListingsGrid, ListingsShowing, Pagination, CircleMarker } from "@/components";
/* prettier-ignore */
import { areaDataStore, listingsStore, usePagination, filterListings, getCssVar, useSettings, Context4Settings } from "@/utilities";

import GridView from "@/assets/view-grid.svg";
import ListView from "@/assets/view-list.svg";

import "@/assets/css/market-activity.css";

export default () => {
	const settings = useSettings(Context4Settings);

	const [sortBy, setSortBy] = createSignal("Most Recent");
	const [view, setView] = createSignal("List");
	const [currentListings, setCurrentListings] = createSignal([]);
	const [visibleListings, setVisibleListings] = createSignal([]);
	const [expanded] = createSignal(false);

	const { currentPage, setPage, pageOffset, pageSize, setPageSize } =
		usePagination(8);

	const [status, setStatus] = createSignal(
		settings.mode
			? settings.mode.charAt(0).toUpperCase() + settings.mode.slice(1)
			: "New"
	);

	createEffect(() => status() && setPage(1));

	createEffect(() =>
		setCurrentListings(
			filterListings(
				listingsStore.listings,
				areaDataStore.propertyTypeID,
				areaDataStore.areaPeriod,
				status(),
				sortBy()
			)
		)
	);

	createEffect(() =>
		setVisibleListings(
			currentListings().slice(pageOffset(), pageOffset() + pageSize())
		)
	);

	return (
		<>
			<h4
				class="center upper subheading-market-activity"
				style="margin-bottom:5px">
				{areaDataStore.areaName}{" "}
				{areaDataStore.propertyTypeID === 0 ? "Homes" : "Condos"}
			</h4>

			<h1 class="center upper heading-market-activity" style="margin:0">
				Market Activity
			</h1>

			<HomeTypes container={`MarketActivity-${settings.areaid}`} style="" />

			<div
				style={`position:relative;width:100%;height:${
					expanded ? "650px" : `400px`
				}`}>
				<StatusKey setStatus={setStatus} />

				<LeafletMap
					mapStyle={settings.mapstyle || "satellite-streets-v11"}
					zoomControl={true}
					style="width:100%;height:100%;">
					<GeoArea
						areaId={settings.areaid}
						style="color:#feff00;fill-opacity:0"
					/>
					<Show when={visibleListings().length}>
						{visibleListings().map((l, i) => (
							<CircleMarker
								color={getCssVar(
									`--${status().toLowerCase()}`,
									document.getElementsByClassName(
										"genie-wrap marketactivity"
									)[0]
								).trim()}
								caption={i + 1}
								key={i + pageOffset * pageSize}
								position={[l.latitude, l.longitude]}
							/>
						))}
					</Show>
				</LeafletMap>
			</div>

			{visibleListings().length > 0 && (
				<div style="display: flex; flex-direction: row; justify-content: space-between; margin: 1vh 0; font-size: 85%; align-items: center; width: 100%">
					<span>View Option</span>

					<ListView
						style="width:20px;height:auto"
						onClick={() => {
							setPageSize(10);
							setView("List");
						}}
					/>

					<GridView
						style="width:20px;height:auto"
						onClick={() => {
							setPageSize(8);
							setView("Grid");
						}}
					/>

					<span>Status</span>
					<select
						onChange={e => {
							setPage(1);
							setStatus(e.target.value);
						}}
						value={status()}
						style="padding:0.25rem 0.5rem">
						{["Pending", "New", "Active", "Sold"].map(key => (
							<option value={key} style="text-transform:capitalize">
								{key}
							</option>
						))}
					</select>

					<span>Sort By</span>
					<select
						value={sortBy()}
						onChange={e => {
							setPage(1);
							setSortBy(e.target.value);
						}}
						style="padding:0.25rem 0.5rem">
						{["Most Recent", "Price High", "Price Low", "Days on Market"].map(
							key => (
								<option value={key} style="text-transform:capitalize">
									{key}
								</option>
							)
						)}
					</select>

					<span>
						<ListingsShowing
							pageSize={pageSize}
							currentPage={currentPage}
							pageOffset={pageOffset}
							data={currentListings}
							mode={status}
							period={areaDataStore.areaPeriod}
						/>
					</span>
				</div>
			)}

			<Show when={view() === "List"}>
				<ListingsTable
					mode={status}
					listings={visibleListings}
					style="width: 100%; color: var(--theme-body-color)"
				/>
			</Show>

			<Show when={view() === "Grid"}>
				<ListingsGrid
					mode={status}
					listings={visibleListings}
					style="width: 100%; color: var(--theme-body-color)"
				/>
			</Show>

			<Pagination
				data={currentListings}
				currentPage={currentPage}
				pageSize={pageSize}
				pageChange={page => setPage(page)}
				style="align-self: flex-end"
			/>
		</>
	);
};

const StatusKey = ({ setStatus }) => {
	const labels = createMemo( () => [
		{
			total: areaDataStore?.overall?.new,
			label: "New (active)",
			status: "new",
		},
		{
			total: areaDataStore?.overall?.active,
			label: "Active",
			status: "active",
		},
		{
			total: areaDataStore?.overall?.pending,
			label: "Pending",
			status: "pending",
		},
		{ total: areaDataStore.overall?.sold, label: "Sold", status: "sold" },
	]);

	return (
		<div class="map-key" style="position: absolute; z-index: 700; top: 65px">
			<svg style="width: 380px; height: 270px">
				<rect width="100%" height="15%" fill="var(--theme-body-background)" />
				<rect
					width="100%"
					height="80%"
					fill="#000"
					fill-opacity="0.57"
					y="15%"
				/>
				<text
					x="20"
					y="27"
					style="font-size: 150%"
					fill="var(--theme-body-color)">
					{areaDataStore.areaName}
				</text>
				<g style="transform: translate(20px, 70px)">
					{labels().map((l, i) => {
						return (
							<g
								style={`transform: translateY(${i * 50}px)`}
								onClick={e => setStatus(l.status)}>
								<circle fill={`var(--${l.status})`} cx="20" cy="5" r="17" />
								<text
									x="20"
									y="5"
									fill="var(--white)"
									text-Anchor="middle"
									dominant-Baseline="middle"
									style="font-size: 100%; text-Shadow: 4px 4px 5px rgba(44, 44, 44, 0.5)">
									{l.total}
								</text>

								<text
									x="50"
									y="7"
									fill="var(--white)"
									dominant-Baseline="middle"
									style="font-size: 100%; font-weight: 700; text-Shadow: 4px 4px 5px rgba(44, 44, 44, 0.5)">
									{l.label}
								</text>
							</g>
						);
					})}
				</g>
			</svg>
		</div>
	);
};
