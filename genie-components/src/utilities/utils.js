import {
	createResource,
	createSignal,
	createEffect,
	createContext,
	useContext,
	onMount,
} from "solid-js";
import { createStore } from "solid-js/store";
import { differenceInHours } from "date-fns";

import { getAreaMonthly, getAgentData } from "./rest";
import { sharedEmbedStore, setSharedEmbedStore } from "./state";

export const Context4Settings = createContext();

export const twoDigitMonth = month => ("0" + (month + 1)).slice(-2);

export const timestampFormat = (timestamp, format = null) =>
	dateFormat(new Date(timestamp * 1000), format);

export const dateFormat = (
	d,
	format = { month: "2-digit", day: "2-digit", year: "numeric" }
) => new Intl.DateTimeFormat("en-US", format).format(d);

export const clientTimeZone = () =>
	Intl.DateTimeFormat().resolvedOptions().timeZone;

export const currency = n =>
	new Intl.NumberFormat("en-US", {
		style: "currency",
		currency: "USD",
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(n);

export const percent = n =>
	new Intl.NumberFormat("en-US", {
		style: "percent",
		maximumFractionDigits: 2,
		minimumFractionDigits: 2,
	}).format(n);

export const number = n =>
	new Intl.NumberFormat("en-US", {
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(n);

export const getCssVar = (name, el) =>
	getComputedStyle(el ?? document.body).getPropertyValue(name);

export const hex2rgba = (hex, alpha = 1) => {
	const re = hex.length === 6 || hex.length === 8 ? /\w\w/g : /\w/g;
	const [r, g, b] = hex.match(re).map(x => parseInt(x, 16));
	return `rgba(${r},${g},${b},${alpha})`;
};

export const address = listing =>
	`${listing.streetNumber} ${listing.streetName}`;

export const signedInAtom = () => {};

export const periodName = period =>
	`${period} ${period > 1 ? "months" : "month"}`;

export const usePagination = (size = 10, page = 1) => {
	const [pageSize, setPageSize] = createSignal(size);
	const [currentPage, setPage] = createSignal(page);
	const pageOffset = () => (currentPage() - 1) * pageSize();

	return {
		pageSize,
		setPageSize,
		currentPage,
		setPage,
		pageOffset,
	};
};

export const useSettings = settingsContext => {
	const globalSettings = typeof window.gHub !== "undefined" ? window.gHub : {};
	const settings = { ...globalSettings, ...settingsContext };

	onMount( () => {
		if ( settings.areaPeriod ) {
			setSharedEmbedStore( { period: parseInt( settings.areaPeriod ) } );
		}
	});

	const keyModify = s => s.toLowerCase().replaceAll("_", "");
	Object.keys(settings).forEach(
		oldKey =>
			delete Object.assign(settings, {
				[keyModify(oldKey)]: settings[oldKey],
			})[oldKey]
	);

	const sessionSettings = new Proxy(settings, {
		get(target, prop) {
			return target[keyModify(prop)];
		},
		set(target, prop, value) {
			return Reflect.set(target, keyModify(prop), value);
		},
	});

	return sessionSettings;
};

export const filterListings = (
	listings,
	propertyTypeID,
	period,
	mode = "active",
	sortBy
) => {
	let subset, descending;
	const timeCutOff = new Date();
	timeCutOff.setMonth(timeCutOff.getMonth() - period);
	const now = new Date();

	switch (mode.toLocaleLowerCase()) {
		case "sold":
			descending = (l1, l2) => {
				const a = Date.parse(l1.soldDate);
				const b = Date.parse(l2.soldDate);

				return a < b ? 1 : a > b ? -1 : 0;
			};
			subset = listings.filter(
				p =>
					p.statusType.toLowerCase() === "sold" &&
					p.propertyTypeID === propertyTypeID &&
					p.soldDate !== null &&
					Date.parse(p.soldDate) >= timeCutOff.getTime()
			);
			break;

		case "new":
			subset = listings.filter(
				p =>
					p.statusType.toLowerCase() === "active" &&
					Math.floor(differenceInHours(Date.parse(p.listDate), now) / 24) >
						-30 &&
					p.propertyTypeID === propertyTypeID
			);

			descending = (l1, l2) => {
				const a = Date.parse(l1.listDate);
				const b = Date.parse(l2.listDate);

				return a > b ? -1 : a < b ? 1 : 0;
			};
			break;

		case "pending":
		case "active":
		default:
			descending = (l1, l2) => {
				const a = Date.parse(l1.listDate);
				const b = Date.parse(l2.listDate);

				return a < b ? 1 : a > b ? -1 : 0;
			};
			subset = listings.filter(
				p =>
					p.statusType.toLowerCase() === mode.toLowerCase() &&
					p.propertyTypeID === propertyTypeID
			);
			break;
	}

	subset.sort(descending);

	return subset;
};

export const useAreaMonthly = () => {
	const settings = useSettings(Context4Settings);
	const [store, setStore] = createStore({
		loading: true,
	});

	const [areaData] = createResource(settings.areaId, async areaId =>
		getAreaMonthly(areaId, settings.agentId)
	);

	createEffect(() => {
		if (!areaData.loading) {
			setStore({
				areaName: areaData().areaName,
				monthly: areaData().stats.filter(
					s => s.propertyTypeId === sharedEmbedStore.propertyType
				),
				propertyTypeID: sharedEmbedStore.propertyType,
				propertyTypeCaption: propertyTypeCaption(sharedEmbedStore.propertyType),
				areaId: settings.areaId,
				areaPeriod: sharedEmbedStore.period,
				loading: false,
			});
		}
	});

	return store;
};

export const useAgentData = () => {
	const { agentId } = useSettings(Context4Settings);
	const [agent] = createResource(agentId, getAgentData);

	return agent;
};

/**
	 * 	const [store, setStore] = createStore({
		loading: true,
		stats: null,
		get bedrooms() {
			return {}; //this.stats && this.stats.bedroomStats;
		},
		get topSize() {
			return (
				this.stats &&
				this.stats.bedroomStats.reduce((prev, current) =>
					prev.sold > current.sold ? prev : current
				)
		},
		get percentChange() {
			return  (
				this.stats && this.stats.avgSalePrice / this.stats.previousPeriod.avgSalePrice - 1
			);
		},
		areaId,
		areaPeriod,
	});

	createEffect(() => {
		if (!area.loading) {
			setStore({
				propertyCaption: propertyTypeCaption(sharedEmbedStore.propertyType, null, true),
				areaName: area().areaName,
				period: area().stats.monthCount,
				overall: area().stats.overall,
				stats: area().stats.propertyTypeData[sharedEmbedStore.propertyType].statistics,
				loading: false,
			});
		}
	});*/
