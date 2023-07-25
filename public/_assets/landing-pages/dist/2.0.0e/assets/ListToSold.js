import { b as createComponent, i as insert, F as For, t as template } from './index.js';
import { H as HomeTypes, f as format } from './Pagination.js';
import { c as currency, p as percent, m as areaMonthlyStore, b as areaDataStore } from './index2.js';
import { E as Editable } from './Editable.js';

const listToSold = '';

const _tmpl$ = /*#__PURE__*/template(`<h1>List to Sold Price`),
  _tmpl$2 = /*#__PURE__*/template(`<div class="no-more-tables"><table class="data-table"><thead><tr><th class="year-filter">Year</th><th>Quantity Sold</th><th>Avg List Price $</th><th>Avg Sale Price $</th><th>Avg DOM*</th><th>Sale to List %</th></tr></thead><tbody id="list-to-sold">`),
  _tmpl$3 = /*#__PURE__*/template(`<p style="font-size:80%;text-align:center">*Avg DOM: Days On Market<span class="SM-hidden"> - </span><span class="SM-visible"><br></span>Average number of days properties take to sell`),
  _tmpl$4 = /*#__PURE__*/template(`<tr><td></td><td></td><td></td><td></td><td></td><td>`);
const ListToSold = (() => {
  const series = () => {
    if (!areaMonthlyStore.loading) {
      const stats = [...areaMonthlyStore.stats.filter(stats => stats.propertyTypeId === areaDataStore.propertyTypeID)];
      return stats.slice(Math.max(stats.length - areaDataStore.areaPeriod, 1)).reverse();
    }
  };
  return [createComponent(Editable, {
    id: "list-to-sold-title",
    get children() {
      return _tmpl$();
    }
  }), createComponent(HomeTypes, {
    optionTabs: true
  }), (() => {
    const _el$2 = _tmpl$2(),
      _el$3 = _el$2.firstChild,
      _el$4 = _el$3.firstChild,
      _el$5 = _el$4.nextSibling;
    insert(_el$5, createComponent(For, {
      get each() {
        return series();
      },
      children: m => (() => {
        const _el$7 = _tmpl$4(),
          _el$8 = _el$7.firstChild,
          _el$9 = _el$8.nextSibling,
          _el$10 = _el$9.nextSibling,
          _el$11 = _el$10.nextSibling,
          _el$12 = _el$11.nextSibling,
          _el$13 = _el$12.nextSibling;
        insert(_el$8, () => format(new Date(m.yearPart, m.monthPart - 1, 1), "MMM yy"));
        insert(_el$9, () => m.soldCount);
        insert(_el$10, () => currency(m.averageListPrice));
        insert(_el$11, () => currency(m.averageSalePrice));
        insert(_el$12, () => Math.round(m.averageDaysOnMarket));
        insert(_el$13, () => percent(m.averageSalePrice / m.averageListPrice));
        return _el$7;
      })()
    }));
    return _el$2;
  })(), _tmpl$3()];
});

export { ListToSold as default };
