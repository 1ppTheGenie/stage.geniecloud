import { createSignal, createEffect, Show } from "solid-js";
import { unwrap } from "solid-js/store";
/* prettier-ignore */
import { sharedEmbedStore, areaDataStore, listingsStore, usePagination, filterListings, useSettings, Context4Settings, percent } from "@/utilities";
/* prettier-ignore */
import { ListingsTable, ListingsShowing, Pagination, Editable, HomeTypes, Spinner } from "@/components";

import CloseIcon from "@/assets/icon-close.svg";
import SoldIcon from "@/assets/icon-sold.svg";
import ActiveIcon from "@/assets/icon-active.svg";
import PendingIcon from "@/assets/icon-pending.svg";
import NewIcon from "@/assets/icon-new.svg";
import AvgDom from "@/assets/avg-dom.svg";
import AvgYIH from "@/assets/avg-yih.svg";
import Homes from "@/assets/individual-homes.svg";
import TurnOverHomes from "@/assets/homes-being-sold.svg";

import "@/assets/css/fast-facts.css";

export default () => {
	const settings = useSettings(Context4Settings);
	const [availableListings, setAvailableListings] = createSignal(0);
	const [listingType, setListingType] = createSignal(0);
	const [listings, setListings] = createSignal([]);
	const [listingsMode, setListingsMode] = createSignal();
	const [listingsVisible, setListingsVisible] = createSignal(false);
	const { currentPage, setPage, pageSize } = usePagination();

	const listingsSubset = (lType, lMode) => {
		if (!listingsStore.loading && listingsStore.listings) {
			const listings = unwrap(listingsStore?.listings);

			return filterListings(Object.values(listings), lType, 12, lMode);
		}
	};

	createEffect(() => {
		const subset = listingsSubset(listingType(), listingsMode());

		if (subset) {
			const offset = Math.max((currentPage() - 1) * pageSize(),0);
			setAvailableListings(subset.length);
			setListings(subset.slice(offset, offset + pageSize()));
		}
	});

	createEffect(() => {
		setListingType(sharedEmbedStore.propertyType);
	});

	const showProperties = (propertyTypeId, statusType) => {
		setPage(0);
		setListingType(propertyTypeId);
		setListingsMode(statusType.toLowerCase());
		setListingsVisible(true);
	};

	return (
		<>
			<div id="fast-facts-title">
				<h1>{areaDataStore.areaName} Fast&#160;Facts</h1>
			</div>

			<HomeTypes container={`FastFacts-${areaDataStore.areaId}`} />
			<Show when={typeof areaDataStore.propertyStats === "undefined"}>
				<p>Sorry, but we have no data for that period.</p>
			</Show>

			<div class="fast-facts-property-icons">
				<div>
					<NewIcon />
					<ListingTableLinks
						title="NEW"
						status="new"
						count={listingsSubset(listingType(), "new")?.length}
						propertyType={settings.propertytype}
						propertyView={sharedEmbedStore.propertyType}
						showProperties={(propertyTypeId, statusType) =>
							showProperties(propertyTypeId, statusType)
						}
					/>
				</div>
				<div>
					<ActiveIcon />
					<ListingTableLinks
						title="ACTIVE"
						status="active"
						count={listingsSubset(listingType(), "active")?.length}
						propertyType={settings.propertytype}
						propertyView={sharedEmbedStore.propertyType}
						showProperties={(propertyTypeId, statusType) =>
							showProperties(propertyTypeId, statusType)
						}
					/>
				</div>
				<div>
					<PendingIcon />
					<ListingTableLinks
						title="PENDING"
						status="pending"
						count={listingsSubset(listingType(), "pending")?.length}
						propertyType={settings.propertytype}
						propertyView={sharedEmbedStore.propertyType}
						showProperties={(propertyTypeId, statusType) =>
							showProperties(propertyTypeId, statusType)
						}
					/>
				</div>

				<div>
					<SoldIcon />
					<ListingTableLinks
						title={`SOLD IN ${sharedEmbedStore.period} MOs`}
						status="sold"
						count={listingsSubset(listingType(), "sold")?.length}
						propertyType={settings.propertytype}
						propertyView={sharedEmbedStore.propertyType}
						showProperties={(propertyTypeId, statusType) =>
							showProperties(propertyTypeId, statusType)
						}
					/>
				</div>
			</div>
			<div
				class="toggle"
				id="ff-listing-table"
				style={`height: ${listingsVisible() ? "auto" : "0"}; `}>
				<div style="box-sizing: border-box;">
					<CloseIcon
						style="height: 35px; width: auto; cursor: pointer; float: right;"
						onClick={() => setListingsVisible(false)}
					/>
					<ListingsTable
						mode={listingsMode()}
						listings={listings()}
						style="width: 100%; color: var(--theme-body-color)"
						withIcon={true}
					/>
					<div style="display: flex; justify-content: space-between">
						<div style="margin-top: 1em">
							<ListingsShowing
								pageSize={pageSize()}
								offset={Math.max((currentPage() - 1) * pageSize(),0)}
								len={availableListings()}
								mode={listingsMode()}
								period={areaDataStore.areaPeriod}
							/>
						</div>

						<Pagination
							totalItems={availableListings()}
							currentPage={currentPage()}
							pageChange={page => setPage(page)}
							style="align-self: center"
						/>
					</div>
				</div>
			</div>

			<div class="fast-facts-stats-icons">
				<div>
					<Homes style="width: 85px; height: auto;" />
					<h3>Total Homes</h3>
					<div>
						<Show when={areaDataStore.propertyStats}>
							<span>{areaDataStore.propertyStats.taxroll}</span>
						</Show>
					</div>
				</div>
				<div>
					<TurnOverHomes style="width: 85px; height: auto;" />
					<h3>Turnover Rate</h3>
					<div>
						<Show when={areaDataStore.propertyStats}>
							<span>{percent(areaDataStore.propertyStats.turnOver)}</span>
						</Show>
					</div>
				</div>
				<div>
					<AvgDom style="width: 85px; height: auto;" />
					<h3>Average Days on Market</h3>
					<div>
						<Show when={areaDataStore.propertyStats}>
							<span>{areaDataStore.propertyStats.avgDOM}</span>
						</Show>
					</div>
				</div>
				<div>
					<AvgYIH style="width: 85px; height: auto;" />
					<h3>Average Years in Home</h3>
					<div>
						<Show when={areaDataStore.propertyStats}>
							<span>{areaDataStore.propertyStats.avgYearsInHome}</span>
						</Show>
					</div>
				</div>
			</div>
		</>
	);
};

const captions = ["Single Family", "Condos"];

const ListingTableLinks = props => (
	<div>
		<Show when={props.propertyType !== -1}>
			<span
				onClick={() =>
					areaDataStore.propertyStats[props.status] > 0 &&
					props.showProperties(props.propertyView, props.status)
				}>
				{`${props.title}: ${props.count}`}
				<Show when={areaDataStore.loading}>
					<Spinner
						style={{
							margin: "0",
							"vertical-align": "middle",
							height: "25px",
							width: "auto",
						}}
					/>
				</Show>
			</span>
			{props.status == "new" ? (
				<small style="white-space:nowrap;display:block;">
					Active in last 30 days
				</small>
			) : (
				""
			)}
		</Show>

		<Show when={props.propertyType === -1}>
			<span onClick={() => props.showProperties(0, props.status)}>
				{props.title + ": "}
				<Show when={listingsStore.loading}>
					<Spinner style="margin: 0; vertical-align: middle; height: 25px" />
				</Show>
			</span>
			<span onClick={() => props.showProperties(1, props.status)}>
				{captions[1]}:{" "}
				{!listingsStore.loading && listingsStore[props.status][1]}
				<Show when={listingsStore.loading}>
					<Spinner style="margin: 0; vertical-align: middle; height: 25px" />
				</Show>
			</span>
		</Show>
	</div>
);
