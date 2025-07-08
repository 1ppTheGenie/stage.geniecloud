import { createStore } from "solid-js/store";
/* prettier-ignore */
import {
	createSignal,
	createEffect,
	createResource,
	createRoot,
} from "solid-js";
/* prettier-ignore */
import { getAreaData, getAreaMonthly, getAreaProperties } from "@/utilities/";

export const propertyTypeCaption = (singular= false) => {
	const propertyCaptions = (window.gHub.propertyCaptions ?? 'homes,home').split(',');

	return propertyCaptions[singular ? 1 : 0];

	if ( !abbr ) {
		return propertyCaptions[1];
	} else if ( count == 1 ) {
		return propertyCaptions[2]
	}

	return propertyCaptions[0]
};

const areaId = window.gHub.areaId;
const agentId = window.gHub.agentId;

export const [sharedEmbedStore, setSharedEmbedStore] = createStore({
	period: parseInt(window?.gHub?.areaPeriod ?? (document.getElementsByClassName('genie-embed').length ? parseInt(document.getElementsByClassName('genie-embed')[0].getAttribute('data-genie-areaperiod')) :12), 10),
	propertyType: parseInt(window?.gHub?.propertyType ?? 0, 10),
} );


export const [listingsStore, setListingsStore] = createStore({
	loading: true,
	listings: [],
	get active() {
		return [
			this.listings.reduce(countReducer([1], 0), 0),
			this.listings.reduce(countReducer([1], 1), 0),
		];
	},
	get sold() {
		return [
			this.listings.reduce(countReducer([2], 0), 0),
			this.listings.reduce(countReducer([2], 1), 0),
		];
	},
	get pending() {
		return [
			this.listings.reduce(countReducer([3, 4], 0), 0),
			this.listings.reduce(countReducer([3, 4], 1), 0),
		];
	},
});

export const [areaDataStore, setAreaDataStore] = createStore({
	loading: true,
	propertyTypeID: sharedEmbedStore.propertyType,
	stats: {},
	get propertyStats() {
		return (
			this.stats.propertyTypeData &&
			this.stats.propertyTypeData[sharedEmbedStore.propertyType].statistics
		);
	},
	get bedroomStats() {
		return this.propertyStats && this.propertyStats.bedroomStats;
	},
	get topSize() {
		return typeof this.bedroomStats !== "undefined"
			? this.bedroomStats.reduce((prev, current) =>
					prev.sold > current.sold ? prev : current
			  )
			: {};
	},
	get percentChange() {
		return (
			this.propertyStats &&
			this.propertyStats.avgSalePrice /
				this.propertyStats.previousPeriod.avgSalePrice -
				1
		);
	},
	get totalSold() {
		if (this.stats.propertyTypeData) {
			if (this.propertyTypeID === -1) {
				return (
					this.stats.propertyTypeData[0].statistics.sold +
					this.stats.propertyTypeData[1].statistics.sold
				);
			} else {
				return this.stats.propertyTypeData[this.propertyTypeID].statistics.sold;
			}
		}
	},
	get totalSoldLastPeriod() {
		if (this.stats.propertyTypeData) {
			if (this.propertyTypeID === -1) {
				return (
					this.stats.propertyTypeData[0].statistics.previousPeriod.sold +
					this.stats.propertyTypeData[1].statistics.previousPeriod.sold
				);
			} else {
				return this.stats.propertyTypeData[this.propertyTypeID].statistics
					.previousPeriod.sold;
			}
		}
	},
	get soldDelta() {
		return this.totalSold / this.totalSoldLastPeriod - 1;
	},
	areaPeriod: sharedEmbedStore.period,
	areaId,
});

export const [areaMonthlyStore, setAreaMonthlyStore] = createStore({
	loading: true,
	propertyTypeID: sharedEmbedStore.propertyType,
	stats: {},
});

const [area, areaMonthly, areaListings, setPeriod] = createRoot( () => {
	const [period, setPeriod] = createSignal(sharedEmbedStore.period);
	const [area] = createResource( period, async p => {
		if (!isNaN(p)) {
			return await getAreaData({ areaId, agentId, areaPeriod: p });
		}
	});
	const [areaMonthly] = createResource(
		areaId,
		async aID => await getAreaMonthly({ areaId: aID, agentId })
	);
	const [areaListings] = createResource(period, async p => {
		if (!isNaN(p)) {
			return await getAreaProperties(areaId, p, agentId);
		}
	});

	createEffect(() => {
		setPeriod(sharedEmbedStore.period);
		setAreaDataStore({ loading: true, areaPeriod: sharedEmbedStore.period });
	});

	createEffect(() => {
		setAreaDataStore({ propertyTypeID: sharedEmbedStore.propertyType });
	});

	createEffect( () => {
		if (!area.loading && typeof area() !== "undefined") {
			setAreaDataStore({
				loading: false,
				areaName: area().areaName,
				overall: area().stats.overall,
				stats: area().stats,
			});
		}
	});

	createEffect(() => {
		if (!areaMonthly.loading && typeof areaMonthly() !== "undefined") {
			setAreaMonthlyStore({
				loading: false,
				areaName: areaMonthly().areaName,
				stats: [...areaMonthly().stats],
			});
		}
	});

	createEffect(() => {
		if (!areaListings.loading && typeof areaListings() !== "undefined") {
			setListingsStore({
				listings: areaListings(),
			});
		}
	});

	createEffect(() => {
		setListingsStore({
			loading: areaListings.loading,
		});
	});

	return [area, areaMonthly, areaListings, val => setPeriod(val)];
});

const countReducer =
	(matchedStatus, matchedProperty) =>
	(counter, { statusTypeID, propertyTypeID }) =>
		matchedStatus.indexOf(statusTypeID) > -1 &&
		propertyTypeID === matchedProperty
			? (counter += 1)
			: counter;


