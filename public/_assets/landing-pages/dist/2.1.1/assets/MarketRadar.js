import { i as insert, b as createComponent, t as template } from './index.js';
import { H as HomeTypes } from './Pagination.js';
import './index2.js';
import { M as MRIcon } from './MRIcon.js';

const _tmpl$ = /*#__PURE__*/template(`<h1>Market Radar`),
  _tmpl$2 = /*#__PURE__*/template(`<h2 style="text-align:center">Latest Market Trends in `),
  _tmpl$3 = /*#__PURE__*/template(`<p>Sorry, but we have no stats for that period.`),
  _tmpl$4 = /*#__PURE__*/template(`<div class="flexed-icons">`);
const MarketRadar = (() => {
  return [_tmpl$(), (() => {
    const _el$2 = _tmpl$2();
      _el$2.firstChild;
    insert(_el$2, areaName, null);
    return _el$2;
  })(), createComponent(HomeTypes, {
    get container() {
      return `MarketRadar-${settings.areaid}`;
    }
  }), !stats && _tmpl$3(), stats && (() => {
    const _el$5 = _tmpl$4();
    insert(_el$5, createComponent(MRIcon, {
      icon: "tag",
      get value() {
        return stats.sold + stats.active + stats.pending;
      },
      caption: "homes available for sale",
      color: "#b9be1c"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "house",
      get value() {
        return stats.sold;
      },
      caption: `homes sold in last ${period} months`,
      color: "#e4670e"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "calendar",
      get value() {
        return stats.avgDOM;
      },
      caption: "average days on market",
      color: "#43abaa"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "line-chart",
      get value() {
        return window.gg.currency(stats.avgListPriceForSold);
      },
      caption: "average listing price",
      color: "#37c6e9"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "ruler",
      get value() {
        return window.gg.currency(stats.avgPricePerSqFt);
      },
      caption: "average price/sq ft.",
      color: "#f8495d"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "bar-chart",
      get value() {
        return window.gg.currency(stats.maxSale.salePrice);
      },
      caption: "highest sale price",
      color: "#33c3e8"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "bar-chart",
      get value() {
        return window.gg.currency(stats.avgSalePrice);
      },
      caption: "average sales price",
      color: "#f8495d"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "bar-chart",
      get value() {
        return window.gg.currency(stats.medSalePrice);
      },
      caption: "median sales price",
      color: "#3ea9a7"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "bar-chart",
      get value() {
        return window.gg.currency(stats.minSale.salePrice);
      },
      caption: "lowest sales price",
      color: "#b9be1c"
    }), null);
    insert(_el$5, createComponent(MRIcon, {
      icon: "tag",
      value: (934),
      caption: `total attached homes in ${areaName}`,
      color: "#e4670e"
    }), null);
    return _el$5;
  })()];
});

export { MarketRadar as default };
