import { y as spread, t as template, i as insert, b as createComponent, S as Show } from './index.js';
import { r as requiredArgs, t as toDate, _ as _typeof, a as useSettings, C as Context4Settings, k as areaDataStore, q as propertyTypeCaption, p as percent, c as currency, n as getCssVar } from './index2.js';
import { t as toInteger, f as format, H as HomeTypes } from './Pagination.js';
import { G as GeoArea, C as CircleMarker, L as LeafletMap } from './LeafletMap.js';

/**
 * @name addDays
 * @category Day Helpers
 * @summary Add the specified number of days to the given date.
 *
 * @description
 * Add the specified number of days to the given date.
 *
 * @param {Date|Number} date - the date to be changed
 * @param {Number} amount - the amount of days to be added. Positive decimals will be rounded using `Math.floor`, decimals less than zero will be rounded using `Math.ceil`.
 * @returns {Date} - the new date with the days added
 * @throws {TypeError} - 2 arguments required
 *
 * @example
 * // Add 10 days to 1 September 2014:
 * const result = addDays(new Date(2014, 8, 1), 10)
 * //=> Thu Sep 11 2014 00:00:00
 */
function addDays(dirtyDate, dirtyAmount) {
  requiredArgs(2, arguments);
  var date = toDate(dirtyDate);
  var amount = toInteger(dirtyAmount);
  if (isNaN(amount)) {
    return new Date(NaN);
  }
  if (!amount) {
    // If 0 days, no-op to avoid changing times in the hour before end of DST
    return date;
  }
  date.setDate(date.getDate() + amount);
  return date;
}

/**
 * @name addMonths
 * @category Month Helpers
 * @summary Add the specified number of months to the given date.
 *
 * @description
 * Add the specified number of months to the given date.
 *
 * @param {Date|Number} date - the date to be changed
 * @param {Number} amount - the amount of months to be added. Positive decimals will be rounded using `Math.floor`, decimals less than zero will be rounded using `Math.ceil`.
 * @returns {Date} the new date with the months added
 * @throws {TypeError} 2 arguments required
 *
 * @example
 * // Add 5 months to 1 September 2014:
 * const result = addMonths(new Date(2014, 8, 1), 5)
 * //=> Sun Feb 01 2015 00:00:00
 */
function addMonths(dirtyDate, dirtyAmount) {
  requiredArgs(2, arguments);
  var date = toDate(dirtyDate);
  var amount = toInteger(dirtyAmount);
  if (isNaN(amount)) {
    return new Date(NaN);
  }
  if (!amount) {
    // If 0 months, no-op to avoid changing times in the hour before end of DST
    return date;
  }
  var dayOfMonth = date.getDate();

  // The JS Date object supports date math by accepting out-of-bounds values for
  // month, day, etc. For example, new Date(2020, 0, 0) returns 31 Dec 2019 and
  // new Date(2020, 13, 1) returns 1 Feb 2021.  This is *almost* the behavior we
  // want except that dates will wrap around the end of a month, meaning that
  // new Date(2020, 13, 31) will return 3 Mar 2021 not 28 Feb 2021 as desired. So
  // we'll default to the end of the desired month by adding 1 to the desired
  // month and using a date of 0 to back up one day to the end of the desired
  // month.
  var endOfDesiredMonth = new Date(date.getTime());
  endOfDesiredMonth.setMonth(date.getMonth() + amount + 1, 0);
  var daysInMonth = endOfDesiredMonth.getDate();
  if (dayOfMonth >= daysInMonth) {
    // If we're already at the end of the month, then this is the correct date
    // and we're done.
    return endOfDesiredMonth;
  } else {
    // Otherwise, we now know that setting the original day-of-month value won't
    // cause an overflow, so set the desired day-of-month. Note that we can't
    // just set the date of `endOfDesiredMonth` because that object may have had
    // its time changed in the unusual case where where a DST transition was on
    // the last day of the month and its local time was in the hour skipped or
    // repeated next to a DST transition.  So we use `date` instead which is
    // guaranteed to still have the original time.
    date.setFullYear(endOfDesiredMonth.getFullYear(), endOfDesiredMonth.getMonth(), dayOfMonth);
    return date;
  }
}

/**
 * @name subDays
 * @category Day Helpers
 * @summary Subtract the specified number of days from the given date.
 *
 * @description
 * Subtract the specified number of days from the given date.
 *
 * @param {Date|Number} date - the date to be changed
 * @param {Number} amount - the amount of days to be subtracted. Positive decimals will be rounded using `Math.floor`, decimals less than zero will be rounded using `Math.ceil`.
 * @returns {Date} the new date with the days subtracted
 * @throws {TypeError} 2 arguments required
 *
 * @example
 * // Subtract 10 days from 1 September 2014:
 * const result = subDays(new Date(2014, 8, 1), 10)
 * //=> Fri Aug 22 2014 00:00:00
 */
function subDays(dirtyDate, dirtyAmount) {
  requiredArgs(2, arguments);
  var amount = toInteger(dirtyAmount);
  return addDays(dirtyDate, -amount);
}

/**
 * @name subMonths
 * @category Month Helpers
 * @summary Subtract the specified number of months from the given date.
 *
 * @description
 * Subtract the specified number of months from the given date.
 *
 * @param {Date|Number} date - the date to be changed
 * @param {Number} amount - the amount of months to be subtracted. Positive decimals will be rounded using `Math.floor`, decimals less than zero will be rounded using `Math.ceil`.
 * @returns {Date} the new date with the months subtracted
 * @throws {TypeError} 2 arguments required
 *
 * @example
 * // Subtract 5 months from 1 February 2015:
 * const result = subMonths(new Date(2015, 1, 1), 5)
 * //=> Mon Sep 01 2014 00:00:00
 */
function subMonths(dirtyDate, dirtyAmount) {
  requiredArgs(2, arguments);
  var amount = toInteger(dirtyAmount);
  return addMonths(dirtyDate, -amount);
}

/**
 * @name sub
 * @category Common Helpers
 * @summary Subtract the specified years, months, weeks, days, hours, minutes and seconds from the given date.
 *
 * @description
 * Subtract the specified years, months, weeks, days, hours, minutes and seconds from the given date.
 *
 * @param {Date|Number} date - the date to be changed
 * @param {Duration} duration - the object with years, months, weeks, days, hours, minutes and seconds to be subtracted
 *
 * | Key     | Description                        |
 * |---------|------------------------------------|
 * | years   | Amount of years to be subtracted   |
 * | months  | Amount of months to be subtracted  |
 * | weeks   | Amount of weeks to be subtracted   |
 * | days    | Amount of days to be subtracted    |
 * | hours   | Amount of hours to be subtracted   |
 * | minutes | Amount of minutes to be subtracted |
 * | seconds | Amount of seconds to be subtracted |
 *
 * All values default to 0
 *
 * @returns {Date} the new date with the seconds subtracted
 * @throws {TypeError} 2 arguments required
 *
 * @example
 * // Subtract the following duration from 15 June 2017 15:29:20
 * const result = sub(new Date(2017, 5, 15, 15, 29, 20), {
 *   years: 2,
 *   months: 9,
 *   weeks: 1,
 *   days: 7,
 *   hours: 5,
 *   minutes: 9,
 *   seconds: 30
 * })
 * //=> Mon Sep 1 2014 10:19:50
 */
function sub(date, duration) {
  requiredArgs(2, arguments);
  if (!duration || _typeof(duration) !== 'object') return new Date(NaN);
  var years = duration.years ? toInteger(duration.years) : 0;
  var months = duration.months ? toInteger(duration.months) : 0;
  var weeks = duration.weeks ? toInteger(duration.weeks) : 0;
  var days = duration.days ? toInteger(duration.days) : 0;
  var hours = duration.hours ? toInteger(duration.hours) : 0;
  var minutes = duration.minutes ? toInteger(duration.minutes) : 0;
  var seconds = duration.seconds ? toInteger(duration.seconds) : 0;

  // Subtract years and months
  var dateWithoutMonths = subMonths(date, months + years * 12);

  // Subtract weeks and days
  var dateWithoutDays = subDays(dateWithoutMonths, days + weeks * 7);

  // Subtract hours, minutes and seconds
  var minutestoSub = minutes + hours * 60;
  var secondstoSub = seconds + minutestoSub * 60;
  var mstoSub = secondstoSub * 1000;
  var finalDate = new Date(dateWithoutDays.getTime() - mstoSub);
  return finalDate;
}

const _tmpl$$1 = /*#__PURE__*/template(`<svg fill="green" style="enable-background:new 0 0 512 512" viewBox="0 0 512 512" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M128.4 189.3 233.4 89c5.8-6 13.7-9 22.4-9s16.5 3 22.4 9l105.4 100.3c12.5 11.9 12.5 31.3 0 43.2-12.5 11.9-32.7 11.9-45.2 0L288 184.4v217c0 16.9-14.3 30.6-32 30.6s-32-13.7-32-30.6v-217l-50.4 48.2c-12.5 11.9-32.7 11.9-45.2 0-12.5-12-12.5-31.3 0-43.3z">`);
const Arrow = ((props = {}) => (() => {
  const _el$ = _tmpl$$1();
  spread(_el$, props, true, true);
  return _el$;
})());

const marketUpdate = '';

const _tmpl$ = /*#__PURE__*/template(`<p><span>`),
  _tmpl$2 = /*#__PURE__*/template(`<div class="snapshot-area"><h3>Average home price of <span></span></h3><p class="large-number"></p><p id="snapshot-delta"><br>`),
  _tmpl$3 = /*#__PURE__*/template(`<h3>Median home price of <span>`),
  _tmpl$4 = /*#__PURE__*/template(`<p class="large-number">`),
  _tmpl$5 = /*#__PURE__*/template(`<div class="flex-row" style="width:100%;padding:30px 15px 15px;align-items:stretch;"><div class="snapshot-details"><h1 class="upper" style="color:var(--theme-heading-color)"></h1><h2 class="mt-2"><span class="upper">Market Update</span><span class="today-date"></span></h2><p>Take a look at the details below!</p><h3>Highest home price of <span></span></h3></div><div class="snapshot-details map-snapshot">`);
const MarketUpdate = (() => {
  useSettings(Context4Settings);
  return (() => {
    const _el$ = _tmpl$5(),
      _el$2 = _el$.firstChild,
      _el$3 = _el$2.firstChild,
      _el$4 = _el$3.nextSibling,
      _el$5 = _el$4.firstChild,
      _el$6 = _el$5.nextSibling,
      _el$7 = _el$4.nextSibling,
      _el$8 = _el$7.firstChild,
      _el$9 = _el$7.nextSibling,
      _el$10 = _el$9.firstChild,
      _el$11 = _el$10.nextSibling,
      _el$27 = _el$2.nextSibling;
    insert(_el$3, () => (areaDataStore.areaName || "").trim() + " " + propertyTypeCaption());
    insert(_el$6, () => ` as of ${format(new Date(), "MMMM d, Y")}`);
    insert(_el$7, createComponent(Show, {
      get when() {
        return !isNaN(areaDataStore.percentChange);
      },
      get children() {
        return `The ${areaDataStore.areaName} area has seen the average sale price of ${propertyTypeCaption()} ${areaDataStore.percentChange > 0 ? "increase" : "decrease"} by ${percent(Math.abs(areaDataStore.percentChange))} over the last ${areaDataStore.areaPeriod > 1 ? `${areaDataStore.areaPeriod} months` : "30 days"} . `;
      }
    }), _el$8);
    insert(_el$2, createComponent(HomeTypes
    /*showPeriod={parseInt(settings.period) === -1}*/, {
      get container() {
        return `MarketSnapshot-${areaDataStore.areaId}`;
      },
      style: "width:100%"
    }), _el$9);
    insert(_el$11, propertyTypeCaption);
    insert(_el$2, createComponent(Show, {
      get when() {
        return areaDataStore.propertyStats;
      },
      get children() {
        return [(() => {
          const _el$12 = _tmpl$(),
            _el$13 = _el$12.firstChild;
          insert(_el$12, () => currency(areaDataStore.propertyStats.maxSale.salePrice), _el$13);
          insert(_el$13, () => `Sold on ${format(new Date(areaDataStore.propertyStats.maxSale.soldOn), "MMMM d, Y")}`);
          return _el$12;
        })(), createComponent(Show, {
          get when() {
            return areaDataStore.propertyStats.avgSalePrice > 0;
          },
          get children() {
            const _el$14 = _tmpl$2(),
              _el$15 = _el$14.firstChild,
              _el$16 = _el$15.firstChild,
              _el$18 = _el$16.nextSibling,
              _el$19 = _el$15.nextSibling,
              _el$20 = _el$19.nextSibling,
              _el$21 = _el$20.firstChild;
            insert(_el$18, propertyTypeCaption);
            insert(_el$19, () => currency(areaDataStore.propertyStats.avgSalePrice));
            insert(_el$20, createComponent(Arrow, {
              get style() {
                return `width:20px;margin-right:0.25rem;vertical-align:middle;${areaDataStore.percentChange > 0 ? "color:green;" : "color:red;transform:rotate(180deg);"}`;
              }
            }), _el$21);
            insert(_el$20, () => `${areaDataStore.percentChange > 0 ? "Up" : "down"} ${percent(Math.abs(areaDataStore.percentChange))} since `, _el$21);
            insert(_el$20, () => `${format(sub(new Date(), {
              months: areaDataStore.areaPeriod
            }), "MMMM, Y")}`, null);
            return _el$14;
          }
        }), createComponent(Show, {
          get when() {
            return areaDataStore.propertyStats.medSalePrice > 0;
          },
          get children() {
            return [(() => {
              const _el$22 = _tmpl$3(),
                _el$23 = _el$22.firstChild,
                _el$25 = _el$23.nextSibling;
              insert(_el$25, propertyTypeCaption);
              return _el$22;
            })(), (() => {
              const _el$26 = _tmpl$4();
              insert(_el$26, () => currency(areaDataStore.propertyStats.medSalePrice));
              return _el$26;
            })()];
          }
        })];
      }
    }), null);
    insert(_el$27, createComponent(LeafletMap, {
      mapStyle: "streets-v11",
      cssClasses: "genie-map",
      id: "market-update-map",
      get children() {
        return [createComponent(GeoArea, {
          get areaId() {
            return areaDataStore.areaId;
          },
          style: "color:#feff00;fill-Opacity: 0;"
        }), createComponent(Show, {
          get when() {
            return areaDataStore.propertyStats;
          },
          get children() {
            return createComponent(CircleMarker, {
              get color() {
                return getCssVar(`--sold`, document.body).trim();
              },
              get caption() {
                return areaDataStore.propertyTypeID === 0 ? `HH` : `HC`;
              },
              get position() {
                return [areaDataStore.propertyStats.maxSale.latitude, areaDataStore.propertyStats.maxSale.longitude];
              }
            });
          }
        })];
      }
    }));
    return _el$;
  })();
});

export { MarketUpdate as default };
