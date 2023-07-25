import { createSignal, createEffect, Show } from "solid-js";
import { unwrap } from "solid-js/store";
import {
	sharedEmbedStore,
	areaDataStore,
	listingsStore,
	usePagination,
	filterListings,
	useSettings,
	percent,
} from "@/utilities";
import {
	ListingsTable,
	ListingsShowing,
	Pagination,
	Editable,
	HomeTypes,
	Spinner,
} from "@/components";

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
	const settings = useSettings();
	const [availableListings, setAvailableListings] = createSignal(0);
	const [listingType, setListingType] = createSignal(0);
	const [listings, setListings] = createSignal([]);
	const [listingsMode, setListingsMode] = createSignal();
	const [listingsVisible, setListingsVisible] = createSignal(false);
	const { currentPage, setPage, pageOffset, pageSize } = usePagination();

	createEffect(() => {
		if (!listingsStore.loading) {
			const subset = filterListings(
				Object.values(unwrap(listingsStore.listings)),
				listingType(),
				12,
				listingsMode()
			);

			if (subset) {
				const offset = currentPage() * pageSize();
				setAvailableListings(subset.length);
				setListings(subset.slice(offset, offset + pageSize()));
			}
		}
	});

	createEffect(() => {
		setListingType(sharedEmbedStore.propertyType);
	});

	const showProperties = (propertyTypeID, statusType) => {
		setPage(0);
		setListingType(propertyTypeID);
		setListingsMode(statusType.toLowerCase());
		setListingsVisible(true);
	};

	return (
		<>
			<Editable id="fast-facts-title">
				<h1>{areaDataStore.areaName} Fast&#160;Facts</h1>
			</Editable>

			<HomeTypes container={`FastFacts-${areaDataStore.areaID}`} />
			<Show when={typeof areaDataStore.propertyStats === "undefined"}>
				<p>Sorry, but we have no data for that period.</p>
			</Show>
			<div class="fast-facts-property-icons">
				<div>
					<NewIcon />
					<ListingTableLinks
						title="NEW"
						status="new"
						propertyType={settings.propertyTypeID}
						propertyView={sharedEmbedStore.propertyType}
						showProperties={showProperties}
					/>
				</div>
				<div>
					<ActiveIcon />
					<ListingTableLinks
						title="ACTIVE"
						status="active"
						propertyType={settings.propertyTypeID}
						propertyView={sharedEmbedStore.propertyType}
						showProperties={showProperties}
					/>
				</div>
				<div>
					<PendingIcon />
					<ListingTableLinks
						title="PENDING"
						status="pending"
						propertyType={settings.propertyTypeID}
						propertyView={sharedEmbedStore.propertyType}
						showProperties={showProperties}
					/>
				</div>

				<div>
					<SoldIcon />
					<ListingTableLinks
						title={`SOLD IN ${sharedEmbedStore.period} MOs`}
						status="sold"
						propertyType={settings.propertyTypeID}
						propertyView={sharedEmbedStore.propertyType}
						showProperties={showProperties}
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
								offset={currentPage() * pageSize()}
								len={availableListings()}
								mode={listingsMode()}
								period={areaDataStore.areaPeriod}
							/>
						</div>

						<Pagination
							totalItems={availableListings()}
							currentPage={currentPage() + 1}
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

const ListingTableLinks = props => {
	return (
		<div>
			<Show when={props.propertyType !== -1}>
				<span
					onClick={() =>
						props.showProperties(props.propertyView, props.status)
					}>
					{props.title + ": "}
					<Show when={!areaDataStore.loading}>
						{areaDataStore.propertyStats[props.status]}
					</Show>
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
};
