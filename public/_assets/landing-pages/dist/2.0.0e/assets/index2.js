import { $ as $PROXY, p as $TRACK, q as getListener, v as batch, c as createSignal, w as createRoot, j as createResource, a as createEffect, x as useContext, y as createContext } from './index.js';

const GENIE = "genie-embed/v2/";

const getAgentData = async agent_id => {
	const r = await apiCall("get-agent-data", { agent_id });

	//console.log("agent", r.result.agent);
	return r.result.agent;
};

const getAreaData = async params => {
	const r = await apiCall(`get-area-data`, params);

	const p = {
		stats: r.result.statistics,
		areaName: r.result.areaName,
	};

	return p;
};

const getAreaProperties = async (areaId, areaPeriod, agentId) => {
	const r = await apiCall(`get-area-properties`, {
		areaId,
		areaPeriod,
		agentId,
	});

	return r.result;
};

const getAreaMonthly = async area_settings => {
	const r = await apiCall(`get-area-monthly`, area_settings, "POST");

	return {
		stats: r.result.statistics,
		areaName: r.result.areaName,
	};
};

const getAreaPolygon = async area_id => {
	const r = await apiCall("get-area-polygon", { area_id });

	return r.success ? r.result.polygon : {};
};

const createLead = async data => await apiCall(`add-lead`, data);

const updateLead = async data => await apiCall(`update-lead`, data);

const landingPageData = async data => await apiCall(`get-landing-data`, data);

const searchAddress = async place_id => {
	if (place_id) {
		const r = await apiCall(`address-search`, { place_id });

		if (r.success === true && r.result.properties) {
			if (r.result.properties.length > 0) {
				return r.result.properties[0];
			}
		}
	}
};

async function apiCall(endpoint, data = null, method = "GET") {
	let url = `${window.ghub.api_url}${GENIE}${endpoint}`;

	const headers = new Headers();
	headers.append("Content-Type", "application/json");
	headers.append("Accept", "application/json");

	const args = {
		method: method,
		mode: "cors",
		cache: "no-cache",
		headers: headers,
		referrerPolicy: "no-referrer",
	};

	if (method === "POST") {
		args.body = data && JSON.stringify(data);
	} else if (data) {
		url += `?${new URLSearchParams(Object.entries(data)).toString()}`;
	}

	console.log(url, method);

	const response = await fetch(url, args);

	return response.json();
}

const $RAW = Symbol("store-raw"),
  $NODE = Symbol("store-node");
function wrap$1(value) {
  let p = value[$PROXY];
  if (!p) {
    Object.defineProperty(value, $PROXY, {
      value: p = new Proxy(value, proxyTraps$1)
    });
    if (!Array.isArray(value)) {
      const keys = Object.keys(value),
        desc = Object.getOwnPropertyDescriptors(value);
      for (let i = 0, l = keys.length; i < l; i++) {
        const prop = keys[i];
        if (desc[prop].get) {
          Object.defineProperty(value, prop, {
            enumerable: desc[prop].enumerable,
            get: desc[prop].get.bind(p)
          });
        }
      }
    }
  }
  return p;
}
function isWrappable(obj) {
  let proto;
  return obj != null && typeof obj === "object" && (obj[$PROXY] || !(proto = Object.getPrototypeOf(obj)) || proto === Object.prototype || Array.isArray(obj));
}
function unwrap(item, set = new Set()) {
  let result, unwrapped, v, prop;
  if (result = item != null && item[$RAW]) return result;
  if (!isWrappable(item) || set.has(item)) return item;
  if (Array.isArray(item)) {
    if (Object.isFrozen(item)) item = item.slice(0);else set.add(item);
    for (let i = 0, l = item.length; i < l; i++) {
      v = item[i];
      if ((unwrapped = unwrap(v, set)) !== v) item[i] = unwrapped;
    }
  } else {
    if (Object.isFrozen(item)) item = Object.assign({}, item);else set.add(item);
    const keys = Object.keys(item),
      desc = Object.getOwnPropertyDescriptors(item);
    for (let i = 0, l = keys.length; i < l; i++) {
      prop = keys[i];
      if (desc[prop].get) continue;
      v = item[prop];
      if ((unwrapped = unwrap(v, set)) !== v) item[prop] = unwrapped;
    }
  }
  return item;
}
function getDataNodes(target) {
  let nodes = target[$NODE];
  if (!nodes) Object.defineProperty(target, $NODE, {
    value: nodes = Object.create(null)
  });
  return nodes;
}
function getDataNode(nodes, property, value) {
  return nodes[property] || (nodes[property] = createDataNode(value));
}
function proxyDescriptor$1(target, property) {
  const desc = Reflect.getOwnPropertyDescriptor(target, property);
  if (!desc || desc.get || !desc.configurable || property === $PROXY || property === $NODE) return desc;
  delete desc.value;
  delete desc.writable;
  desc.get = () => target[$PROXY][property];
  return desc;
}
function trackSelf(target) {
  if (getListener()) {
    const nodes = getDataNodes(target);
    (nodes._ || (nodes._ = createDataNode()))();
  }
}
function ownKeys(target) {
  trackSelf(target);
  return Reflect.ownKeys(target);
}
function createDataNode(value) {
  const [s, set] = createSignal(value, {
    equals: false,
    internal: true
  });
  s.$ = set;
  return s;
}
const proxyTraps$1 = {
  get(target, property, receiver) {
    if (property === $RAW) return target;
    if (property === $PROXY) return receiver;
    if (property === $TRACK) {
      trackSelf(target);
      return receiver;
    }
    const nodes = getDataNodes(target);
    const tracked = nodes[property];
    let value = tracked ? tracked() : target[property];
    if (property === $NODE || property === "__proto__") return value;
    if (!tracked) {
      const desc = Object.getOwnPropertyDescriptor(target, property);
      if (getListener() && (typeof value !== "function" || target.hasOwnProperty(property)) && !(desc && desc.get)) value = getDataNode(nodes, property, value)();
    }
    return isWrappable(value) ? wrap$1(value) : value;
  },
  has(target, property) {
    if (property === $RAW || property === $PROXY || property === $TRACK || property === $NODE || property === "__proto__") return true;
    this.get(target, property, target);
    return property in target;
  },
  set() {
    return true;
  },
  deleteProperty() {
    return true;
  },
  ownKeys: ownKeys,
  getOwnPropertyDescriptor: proxyDescriptor$1
};
function setProperty(state, property, value, deleting = false) {
  if (!deleting && state[property] === value) return;
  const prev = state[property],
    len = state.length;
  if (value === undefined) delete state[property];else state[property] = value;
  let nodes = getDataNodes(state),
    node;
  if (node = getDataNode(nodes, property, prev)) node.$(() => value);
  if (Array.isArray(state) && state.length !== len) {
    for (let i = state.length; i < len; i++) (node = nodes[i]) && node.$();
    (node = getDataNode(nodes, "length", len)) && node.$(state.length);
  }
  (node = nodes._) && node.$();
}
function mergeStoreNode(state, value) {
  const keys = Object.keys(value);
  for (let i = 0; i < keys.length; i += 1) {
    const key = keys[i];
    setProperty(state, key, value[key]);
  }
}
function updateArray(current, next) {
  if (typeof next === "function") next = next(current);
  next = unwrap(next);
  if (Array.isArray(next)) {
    if (current === next) return;
    let i = 0,
      len = next.length;
    for (; i < len; i++) {
      const value = next[i];
      if (current[i] !== value) setProperty(current, i, value);
    }
    setProperty(current, "length", len);
  } else mergeStoreNode(current, next);
}
function updatePath(current, path, traversed = []) {
  let part,
    prev = current;
  if (path.length > 1) {
    part = path.shift();
    const partType = typeof part,
      isArray = Array.isArray(current);
    if (Array.isArray(part)) {
      for (let i = 0; i < part.length; i++) {
        updatePath(current, [part[i]].concat(path), traversed);
      }
      return;
    } else if (isArray && partType === "function") {
      for (let i = 0; i < current.length; i++) {
        if (part(current[i], i)) updatePath(current, [i].concat(path), traversed);
      }
      return;
    } else if (isArray && partType === "object") {
      const {
        from = 0,
        to = current.length - 1,
        by = 1
      } = part;
      for (let i = from; i <= to; i += by) {
        updatePath(current, [i].concat(path), traversed);
      }
      return;
    } else if (path.length > 1) {
      updatePath(current[part], path, [part].concat(traversed));
      return;
    }
    prev = current[part];
    traversed = [part].concat(traversed);
  }
  let value = path[0];
  if (typeof value === "function") {
    value = value(prev, traversed);
    if (value === prev) return;
  }
  if (part === undefined && value == undefined) return;
  value = unwrap(value);
  if (part === undefined || isWrappable(prev) && isWrappable(value) && !Array.isArray(value)) {
    mergeStoreNode(prev, value);
  } else setProperty(current, part, value);
}
function createStore(...[store, options]) {
  const unwrappedStore = unwrap(store || {});
  const isArray = Array.isArray(unwrappedStore);
  const wrappedStore = wrap$1(unwrappedStore);
  function setStore(...args) {
    batch(() => {
      isArray && args.length === 1 ? updateArray(unwrappedStore, args[0]) : updatePath(unwrappedStore, args);
    });
  }
  return [wrappedStore, setStore];
}

const propertyTypeCaption = (type, count = 0, abbr = false) => {
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

const areaId = ggSettings.areaID;
const agentId = ggSettings.agentID;

const defaultPropertyType = Math.max(
	parseInt(
		(typeof ggSettings !== "undefined" && ggSettings.propertyType) || 0,
		10
	),
	0
);

const defaultPeriod = parseInt(
	typeof ggSettings !== "undefined" ? ggSettings.areaPeriod ?? 6 : 6,
	10
);

const [sharedEmbedStore, setSharedEmbedStore] = createStore({
	period: defaultPeriod,
	propertyType: defaultPropertyType,
});

const [area, areaMonthly, areaListings, setPeriod] = createRoot(() => {
	const [period, setPeriod] = createSignal(sharedEmbedStore.period);
	const [area] = createResource(period, p =>
		getAreaData({ areaId, agentId, areaPeriod: p })
	);
	const [areaMonthly] = createResource(areaId, aID =>
		getAreaMonthly({ areaId: aID, agentId })
	);
	const [areaListings] = createResource(period, p =>
		getAreaProperties(areaId, p, agentId)
	);

	return [area, areaMonthly, areaListings, setPeriod];
});

const [areaDataStore, setAreaDataStore] = createStore({
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

const [areaMonthlyStore, setAreaMonthlyStore] = createStore({
	loading: true,
	propertyTypeCaption: "",
	propertyTypeID: sharedEmbedStore.propertyType,
	stats: {},
});

const countReducer =
	(matchedStatus, matchedProperty) =>
	(counter, { statusTypeID, propertyTypeID }) =>
		matchedStatus.indexOf(statusTypeID) > -1 &&
		propertyTypeID === matchedProperty
			? (counter += 1)
			: counter;

const [listingsStore, setListingsStore] = createStore({
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

createRoot(() => {
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
		if (!area.loading) {
			setAreaDataStore({
				loading: false,
				areaName: area().areaName,
				overall: area().stats.overall,
				stats: area().stats,
			});
		}
	});

	createEffect(() => {
		if (!areaMonthly.loading) {
			setAreaMonthlyStore({
				loading: false,
				areaName: areaMonthly().areaName,
				stats: [...areaMonthly().stats],
			});
		}
	});

	createEffect(() => {
		if (!areaListings.loading) {
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
});

function _typeof(obj) {
  "@babel/helpers - typeof";

  return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) {
    return typeof obj;
  } : function (obj) {
    return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
  }, _typeof(obj);
}

function requiredArgs(required, args) {
  if (args.length < required) {
    throw new TypeError(required + ' argument' + (required > 1 ? 's' : '') + ' required, but only ' + args.length + ' present');
  }
}

/**
 * @name toDate
 * @category Common Helpers
 * @summary Convert the given argument to an instance of Date.
 *
 * @description
 * Convert the given argument to an instance of Date.
 *
 * If the argument is an instance of Date, the function returns its clone.
 *
 * If the argument is a number, it is treated as a timestamp.
 *
 * If the argument is none of the above, the function returns Invalid Date.
 *
 * **Note**: *all* Date arguments passed to any *date-fns* function is processed by `toDate`.
 *
 * @param {Date|Number} argument - the value to convert
 * @returns {Date} the parsed date in the local time zone
 * @throws {TypeError} 1 argument required
 *
 * @example
 * // Clone the date:
 * const result = toDate(new Date(2014, 1, 11, 11, 30, 30))
 * //=> Tue Feb 11 2014 11:30:30
 *
 * @example
 * // Convert the timestamp to date:
 * const result = toDate(1392098430000)
 * //=> Tue Feb 11 2014 11:30:30
 */
function toDate(argument) {
  requiredArgs(1, arguments);
  var argStr = Object.prototype.toString.call(argument);

  // Clone the date
  if (argument instanceof Date || _typeof(argument) === 'object' && argStr === '[object Date]') {
    // Prevent the date to lose the milliseconds when passed to new Date() in IE10
    return new Date(argument.getTime());
  } else if (typeof argument === 'number' || argStr === '[object Number]') {
    return new Date(argument);
  } else {
    if ((typeof argument === 'string' || argStr === '[object String]') && typeof console !== 'undefined') {
      // eslint-disable-next-line no-console
      console.warn("Starting with v2.0.0-beta.1 date-fns doesn't accept strings as date arguments. Please use `parseISO` to parse strings. See: https://github.com/date-fns/date-fns/blob/master/docs/upgradeGuide.md#string-arguments");
      // eslint-disable-next-line no-console
      console.warn(new Error().stack);
    }
    return new Date(NaN);
  }
}

/**
 * Days in 1 week.
 *
 * @name daysInWeek
 * @constant
 * @type {number}
 * @default
 */

/**
 * Milliseconds in 1 hour
 *
 * @name millisecondsInHour
 * @constant
 * @type {number}
 * @default
 */
var millisecondsInHour = 3600000;

/**
 * @name differenceInMilliseconds
 * @category Millisecond Helpers
 * @summary Get the number of milliseconds between the given dates.
 *
 * @description
 * Get the number of milliseconds between the given dates.
 *
 * @param {Date|Number} dateLeft - the later date
 * @param {Date|Number} dateRight - the earlier date
 * @returns {Number} the number of milliseconds
 * @throws {TypeError} 2 arguments required
 *
 * @example
 * // How many milliseconds are between
 * // 2 July 2014 12:30:20.600 and 2 July 2014 12:30:21.700?
 * const result = differenceInMilliseconds(
 *   new Date(2014, 6, 2, 12, 30, 21, 700),
 *   new Date(2014, 6, 2, 12, 30, 20, 600)
 * )
 * //=> 1100
 */
function differenceInMilliseconds(dateLeft, dateRight) {
  requiredArgs(2, arguments);
  return toDate(dateLeft).getTime() - toDate(dateRight).getTime();
}

var roundingMap = {
  ceil: Math.ceil,
  round: Math.round,
  floor: Math.floor,
  trunc: function trunc(value) {
    return value < 0 ? Math.ceil(value) : Math.floor(value);
  } // Math.trunc is not supported by IE
};

var defaultRoundingMethod = 'trunc';
function getRoundingMethod(method) {
  return method ? roundingMap[method] : roundingMap[defaultRoundingMethod];
}

/**
 * @name differenceInHours
 * @category Hour Helpers
 * @summary Get the number of hours between the given dates.
 *
 * @description
 * Get the number of hours between the given dates.
 *
 * @param {Date|Number} dateLeft - the later date
 * @param {Date|Number} dateRight - the earlier date
 * @param {Object} [options] - an object with options.
 * @param {String} [options.roundingMethod='trunc'] - a rounding method (`ceil`, `floor`, `round` or `trunc`)
 * @returns {Number} the number of hours
 * @throws {TypeError} 2 arguments required
 *
 * @example
 * // How many hours are between 2 July 2014 06:50:00 and 2 July 2014 19:00:00?
 * const result = differenceInHours(
 *   new Date(2014, 6, 2, 19, 0),
 *   new Date(2014, 6, 2, 6, 50)
 * )
 * //=> 12
 */
function differenceInHours(dateLeft, dateRight, options) {
  requiredArgs(2, arguments);
  var diff = differenceInMilliseconds(dateLeft, dateRight) / millisecondsInHour;
  return getRoundingMethod(options === null || options === void 0 ? void 0 : options.roundingMethod)(diff);
}

const SettingsContext = createContext();

const dateFormat = (
	d,
	format = { month: "2-digit", day: "2-digit", year: "numeric" }
) => new Intl.DateTimeFormat("en-US", format).format(d);

const currency = n =>
	new Intl.NumberFormat("en-US", {
		style: "currency",
		currency: "USD",
		maximumFractionDigits: 0,
		minimumFractionDigits: 0,
	}).format(n);

const percent = n =>
	new Intl.NumberFormat("en-US", {
		style: "percent",
		maximumFractionDigits: 2,
		minimumFractionDigits: 2,
	}).format(n);

const getCssVar = (name, el) =>
	getComputedStyle(el ?? document.body).getPropertyValue(name);

const address = listing =>
	`${listing.streetNumber} ${listing.streetName}`;

const signedInAtom = () => {};

const usePagination = (size = 10, page = 1) => {
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
/*
export const [sharedEmbedStore, setSharedEmbedStore] = createStore({
	period: parseInt((ggSettings && ggSettings.areaPeriod) ?? 6),
	propertyType: 0 /*parseInt(
		(ggSettings && ggSettings.propertyType && ggSettings.propertyType > -1) ?? 1
	),* /,
});
*/

const useSettings = () => {
	const settingsContext = useContext(SettingsContext);
	const globalSettings = typeof ggSettings !== "undefined" ? ggSettings : {};

	let settings = { ...globalSettings, ...settingsContext };

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

const filterListings = (
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

	if (!typeof mode == "function") {
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
	}

	return subset;
};

const useAgentData = () => {
	const { agentID } = useSettings();
	const [agent] = createResource(agentID, getAgentData);

	return agent;
};

/**
	 * 	const [store, setStore] = createStore({
		loading: true,
		stats: null,
		get bedrooms() {
			console.log("bedrooms", this);
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
		areaID,
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

const index = '';

export { SettingsContext as S, _typeof as _, useSettings as a, areaDataStore as b, currency as c, dateFormat as d, updateLead as e, createLead as f, usePagination as g, listingsStore as h, filterListings as i, unwrap as j, sharedEmbedStore as k, landingPageData as l, areaMonthlyStore as m, getCssVar as n, address as o, percent as p, getAreaPolygon as q, requiredArgs as r, searchAddress as s, toDate as t, useAgentData as u, propertyTypeCaption as v, setSharedEmbedStore as w, signedInAtom as x };
