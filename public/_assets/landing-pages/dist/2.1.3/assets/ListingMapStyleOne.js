import { i as insert, b as createComponent, F as For, s as setAttribute, e as createRenderEffect, f as style, g as createMemo, S as Show, t as template } from './index.js';
import { a as useSettings, n as getCssVar, o as address, c as currency, g as usePagination, h as listingsStore, b as areaDataStore } from './index2.js';
import { f as format, H as HomeTypes, P as Pagination } from './Pagination.js';
import { L as ListingsShowing } from './ListingsShowing.js';
import { G as GeoArea, C as CircleMarker, L as LeafletMap } from './LeafletMap.js';

const _tmpl$$1 = /*#__PURE__*/template(`<div class="flex-row"><div class="w-33"></div><div class="w-66"><div class="listDetail"><table id="listing-table" class="active-table" style=" font-size:80%;"><thead><tr></tr></thead><tbody>`),
  _tmpl$2$1 = /*#__PURE__*/template(`<th>`),
  _tmpl$3 = /*#__PURE__*/template(`<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>`),
  _tmpl$4 = /*#__PURE__*/template(`<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>`);
const MapListings = props => {
  const settings = useSettings();
  let headings;
  switch (settings.marketstatus) {
    case "sold":
      headings = ["Address", "BR", "BA", "Sq.Ft.", "List Price", "Sold Price", "Sold Date", "$/Sq.Ft.", "DOM"];
      break;
    case "active":
    default:
      headings = ["Address", "List Price", "BR", "BA", "List Date", "Sq.Ft.", "$/Sq.Ft.", "DOM"];
      break;
  }
  return (() => {
    const _el$ = _tmpl$$1(),
      _el$2 = _el$.firstChild,
      _el$3 = _el$2.nextSibling,
      _el$4 = _el$3.firstChild,
      _el$5 = _el$4.firstChild,
      _el$6 = _el$5.firstChild,
      _el$7 = _el$6.firstChild,
      _el$8 = _el$6.nextSibling;
    insert(_el$2, createComponent(LeafletMap, {
      get id() {
        return props.id || "genie-embed-map";
      },
      get mapStyle() {
        return settings.mapstyle || "streets-v11";
      },
      style: "width: 100%; min-height: 370px",
      get children() {
        return [createComponent(GeoArea, {
          get areaId() {
            return settings.areaid;
          },
          style: " color: #feff00; fill-opacity: 0"
        }), createComponent(For, {
          get each() {
            return props.listings;
          },
          children: (l, i) => createComponent(CircleMarker, {
            get key() {
              return `${l.mlsNumber}:${l.latitude}:${l.longitude}`;
            },
            get color() {
              return getCssVar(`--${settings.marketstatus}`, document.body).trim();
            },
            caption: i + 1,
            get position() {
              return [l.latitude, l.longitude];
            }
          })
        })];
      }
    }));
    insert(_el$7, () => headings.map((caption, i) => (() => {
      const _el$9 = _tmpl$2$1();
      setAttribute(_el$9, "key", i);
      setAttribute(_el$9, "title", caption === "BR" ? "Bedrooms" : caption === "BA" ? "Bathrooms" : "");
      insert(_el$9, caption);
      createRenderEffect(_$p => style(_el$9, i === 0 ? {
        textAlign: "left"
      } : null, _$p));
      return _el$9;
    })()));
    insert(_el$8, createComponent(Show, {
      get when() {
        return settings.marketstatus === "sold";
      },
      get children() {
        return createComponent(For, {
          get each() {
            return props.listings;
          },
          children: l => (() => {
            const _el$10 = _tmpl$3(),
              _el$11 = _el$10.firstChild,
              _el$12 = _el$11.nextSibling,
              _el$13 = _el$12.nextSibling,
              _el$14 = _el$13.nextSibling,
              _el$15 = _el$14.nextSibling,
              _el$16 = _el$15.nextSibling,
              _el$17 = _el$16.nextSibling,
              _el$18 = _el$17.nextSibling,
              _el$19 = _el$18.nextSibling;
            insert(_el$11, () => address(l));
            insert(_el$12, () => l.bedrooms);
            insert(_el$13, () => l.bathroomsTotal);
            insert(_el$14, () => Intl.NumberFormat("en-US").format(l.sqft));
            insert(_el$15, () => currency(l.priceHigh));
            insert(_el$16, () => currency(l.salePrice));
            insert(_el$17, (() => {
              const _c$ = createMemo(() => !!l.soldDate);
              return () => _c$() && format(Date.parse(l.soldDate), "M-d-y");
            })());
            insert(_el$18, () => currency(l.salePrice / l.sqft));
            insert(_el$19, () => l.daysOnMarket == 1 ? "Day" : "Days");
            createRenderEffect(() => setAttribute(_el$10, "key", `tr${l.streetNumber}:${l.latitude}:${l.longitude}`));
            return _el$10;
          })()
        });
      }
    }), null);
    insert(_el$8, createComponent(Show, {
      get when() {
        return settings.marketstatus !== "sold";
      },
      get children() {
        return createComponent(For, {
          get each() {
            return props.listings;
          },
          children: l => (() => {
            const _el$20 = _tmpl$4(),
              _el$21 = _el$20.firstChild,
              _el$22 = _el$21.nextSibling,
              _el$23 = _el$22.nextSibling,
              _el$24 = _el$23.nextSibling,
              _el$25 = _el$24.nextSibling,
              _el$26 = _el$25.nextSibling,
              _el$27 = _el$26.nextSibling,
              _el$28 = _el$27.nextSibling;
            insert(_el$21, () => address(l));
            insert(_el$22, () => currency(l.priceHigh));
            insert(_el$23, () => l.bedrooms);
            insert(_el$24, () => l.bathroomsTotal);
            insert(_el$25, () => format(Date.parse(l.listDate), "M-d-y"));
            insert(_el$26, (() => {
              const _c$2 = createMemo(() => l.sqft > 0);
              return () => _c$2() ? Intl.NumberFormat("en-US").format(l.sqft) : "-";
            })());
            insert(_el$27, (() => {
              const _c$3 = createMemo(() => l.sqft > 0);
              return () => _c$3() ? currency(l.priceHigh / l.sqft) : "-";
            })());
            insert(_el$28, () => l.daysOnMarket > 0 ? l.daysOnMarket + " Days" : "Today!");
            createRenderEffect(() => setAttribute(_el$20, "key", `tr${l.streetNumber}:${l.latitude}:${l.longitude}`));
            return _el$20;
          })()
        });
      }
    }), null);
    createRenderEffect(_$p => style(_el$, props.style, _$p));
    return _el$;
  })();
};

const listingMapStyleOne = '';

const _tmpl$ = /*#__PURE__*/template(`<p class="filterTxt" style="font-size:13px;color:#fff;">`),
  _tmpl$2 = /*#__PURE__*/template(`<div id="padded" style="padding:1rem 0;width:100%"><h1>LIVE HOT LIST OF HOMES FOR SALE</h1><p class="current-date">- as of <span>`);
const ListingMapStyleOne = (() => {
  const {
    currentPage,
    setPage,
    pageOffset,
    pageSize
  } = usePagination();
  const settings = useSettings();
  const currentListings = () => listingsStore.listings.slice(pageOffset(), pageOffset() + pageSize());
  const date = new Date();
  const tz = "America/Los_Angeles";
  var day = date.toLocaleString("default", {
    day: "numeric",
    timeZone: tz
  });
  var month = date.toLocaleString("default", {
    month: "long",
    timeZone: tz
  });
  var year = date.toLocaleString("default", {
    year: "numeric",
    timeZone: tz
  });
  var hour = date.toLocaleString("default", {
    hour: "numeric",
    hour12: false,
    timeZone: tz
  });
  var minute = date.toLocaleString("default", {
    minute: "2-digit",
    timeZone: tz
  });
  if (minute.length < 2) {
    minute = "0" + minute;
  }
  var ap = hour > 11 ? "pm" : "am";
  var date_time_text = month + " " + day + ", " + year + " @ " + hour + ":" + minute + ap;
  return (() => {
    const _el$ = _tmpl$2(),
      _el$2 = _el$.firstChild,
      _el$3 = _el$2.nextSibling,
      _el$4 = _el$3.firstChild,
      _el$5 = _el$4.nextSibling;
    insert(_el$5, date_time_text);
    insert(_el$, createComponent(HomeTypes, {
      get container() {
        return `ListingMapStyleOne-${settings.marketstatus}-${settings.areaid}`;
      },
      get showPeriod() {
        return settings.marketstatus === "sold";
      }
    }), null);
    insert(_el$, createComponent(Show, {
      get when() {
        return listingsStore.listings.length > 0;
      },
      get children() {
        return [createComponent(MapListings, {
          id: "listing-map-style-one",
          get listings() {
            return currentListings();
          },
          style: "margin-top: 30px"
        }), (() => {
          const _el$6 = _tmpl$();
          insert(_el$6, createComponent(ListingsShowing, {
            get pageSize() {
              return pageSize();
            },
            get offset() {
              return pageSize() * currentPage();
            },
            get len() {
              return listingsStore.listings.length;
            },
            get mode() {
              return settings.marketstatus ?? "active";
            },
            get period() {
              return areaDataStore.areaPeriod;
            }
          }));
          return _el$6;
        })(), createComponent(Pagination, {
          get totalItems() {
            return listingsStore.listings.length;
          },
          get currentPage() {
            return currentPage();
          },
          pageChange: page => setPage(page)
        })];
      }
    }), null);
    return _el$;
  })();
});

export { ListingMapStyleOne as default };
