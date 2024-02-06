import { i as insert, b as createComponent, t as template } from './index.js';
import { H as HomeTypes } from './Pagination.js';
import './index2.js';

const _tmpl$ = /*#__PURE__*/template(`<h1>Market Report for `),
  _tmpl$2 = /*#__PURE__*/template(`<p>Sorry, there is no data for this period.`),
  _tmpl$3 = /*#__PURE__*/template(`<div class="market-report-tiles"><div style="grid-row:1/3"><h1>Units available for sale</h1><h2 class="big-round"></h2></div><div><h1>Units sold</h1><h2></h2></div><div><h1>Average Days on Market</h1><h2></h2></div><div><h1>Average Listing Price</h1><h2></h2></div><div><h1>Average price/Sq Ft.</h1><h2></h2></div><div><h1>Median sales price</h1><h2></h2></div><div><h1> Month Turn Over Rate</h1><h2></h2></div><div><h1>Average Sales Price</h1><h2></h2></div><div><h1>Percentage of asking price</h1><h2></h2></div><div><h1>Total Number of Units</h1><h2></h2></div><div><h1>% of owners who live here full time</h1><h2>`);
const MarketReportTiles = (() => {
  return [(() => {
    const _el$ = _tmpl$();
      _el$.firstChild;
    insert(_el$, areaName, null);
    return _el$;
  })(), createComponent(HomeTypes, {}), !stats && _tmpl$2(), stats && (() => {
    const _el$4 = _tmpl$3(),
      _el$5 = _el$4.firstChild,
      _el$6 = _el$5.firstChild,
      _el$7 = _el$6.nextSibling,
      _el$8 = _el$5.nextSibling,
      _el$9 = _el$8.firstChild,
      _el$10 = _el$9.nextSibling,
      _el$11 = _el$8.nextSibling,
      _el$12 = _el$11.firstChild,
      _el$13 = _el$12.nextSibling,
      _el$14 = _el$11.nextSibling,
      _el$15 = _el$14.firstChild,
      _el$16 = _el$15.nextSibling,
      _el$17 = _el$14.nextSibling,
      _el$18 = _el$17.firstChild,
      _el$19 = _el$18.nextSibling,
      _el$20 = _el$17.nextSibling,
      _el$21 = _el$20.firstChild,
      _el$22 = _el$21.nextSibling,
      _el$23 = _el$20.nextSibling,
      _el$24 = _el$23.firstChild,
      _el$25 = _el$24.firstChild,
      _el$26 = _el$24.nextSibling,
      _el$27 = _el$23.nextSibling,
      _el$28 = _el$27.firstChild,
      _el$29 = _el$28.nextSibling,
      _el$30 = _el$27.nextSibling,
      _el$31 = _el$30.firstChild,
      _el$32 = _el$31.nextSibling,
      _el$33 = _el$30.nextSibling,
      _el$34 = _el$33.firstChild,
      _el$35 = _el$34.nextSibling,
      _el$36 = _el$33.nextSibling,
      _el$37 = _el$36.firstChild,
      _el$38 = _el$37.nextSibling;
    insert(_el$7, () => stats.active);
    insert(_el$10, () => stats.sold);
    insert(_el$13, () => stats.avgDOM);
    insert(_el$16, () => window.gHub.currency(stats.avgListPriceForSold));
    insert(_el$19, () => window.gHub.currency(stats.avgPricePerSqFt));
    insert(_el$22, () => window.gHub.currency(stats.medSalePrice));
    insert(_el$24, period, _el$25);
    insert(_el$26, () => window.gHub.percent(stats.turnOver));
    insert(_el$29, () => window.gHub.currency(stats.avgSalePrice));
    insert(_el$32, () => window.gHub.percent(stats.avgSalePrice / stats.avgListPriceForSold));
    insert(_el$35, () => stats.taxroll);
    insert(_el$38, () => window.gHub.percent(stats.ownerOccupancy));
    return _el$4;
  })()];
});

export { MarketReportTiles as default };
