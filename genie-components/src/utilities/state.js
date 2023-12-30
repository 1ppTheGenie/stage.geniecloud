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

export const propertyTypeCaption = (type, count = 0, abbr = false) => {
	let caption;
	switch (type) {
		case 1:
			caption = abbr
				? `condo${count !== 1 ? "s" : ""}`
				: count !== 1
				? "condos"
				: "condo/townhouse";
			break;
		default:
			caption = abbr ? "home" : "single detached home";
			if (count !== 1) caption += "s";
			break;
	}

	return caption;
};

const areaId = window.gHub.areaId;
const agentId = window.gHub.agentId;

export const [sharedEmbedStore, setSharedEmbedStore] = createStore({
	period: parseInt(window?.gHub?.areaPeriod ?? 6, 10),
	propertyType: parseInt(window?.gHub?.propertyType ?? 0, 10),
});

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
	propertyTypeCaption: "",
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
	propertyTypeCaption: "",
	propertyTypeID: sharedEmbedStore.propertyType,
	stats: {},
});

const [area, areaMonthly, areaListings, setPeriod] = createRoot(() => {
	const [period, setPeriod] = createSignal(sharedEmbedStore.period);
	const [area] = createResource(period, async p => {
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
		setAreaDataStore({
			propertyTypeCaptionAbbr: propertyTypeCaption(
				sharedEmbedStore.propertyType,
				true
			),
			propertyTypeCaption: propertyTypeCaption(sharedEmbedStore.propertyType),
			propertyTypeID: sharedEmbedStore.propertyType,
		});
	});

	createEffect(() => {
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


