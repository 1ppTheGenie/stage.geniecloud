import { i as insert, e as createRenderEffect, s as setAttribute, t as template, y as spread, c as createSignal, b as createComponent, g as createMemo, f as style, d as delegateEvents } from './index.js';
import { H as HomeTypes, L as ListingsTable, P as Pagination } from './Pagination.js';
import { o as address, a as useSettings, C as Context4Settings, g as usePagination, i as filterListings, b as areaDataStore, h as listingsStore, n as getCssVar } from './index2.js';
import { G as GeoArea, L as LeafletMap, C as CircleMarker } from './LeafletMap.js';
import { L as ListingsShowing } from './ListingsShowing.js';

const _tmpl$$3 = /*#__PURE__*/template(`<div id="listing-grid-view">`),
  _tmpl$2$1 = /*#__PURE__*/template(`<svg viewBox="0 0 1500 800"><image width="100%" height="100%" preserveAspectRatio="xMinYMid slice"></image><circle cx="5%" cy="5%" r="5%" fillOpacity="0.75"></circle><text font-size="120%"><tspan x="5%" y="4%" textAnchor="middle" fill="var(--theme-body-background)"></tspan></text><polygon points="275,0 424,0 0,425 0,275" fillOpacity="0.75"></polygon><text x="5%" y="5%" transform-origin="4% 4%" transform="rotate(-45)" fill="var(--theme-body-background)" textAnchor="middle">New! || Active || Sold || Pending</text><clipPath id="polyClip1" clipPathUnits="objectBoundingBox"><path d="m 0 0 h 1 v 1 h -0.7 c -0.3 0 -0.3 0 -0.3 -1"></path></clipPath><rect x="50%" width="40%" height="30%" clip-path="url(#polyClip1)" fillOpacity="0.75"></rect><text class="align-right" x="22%" y="1%" fill="var(--theme-body-background)">Asking</text><text class="align-right" x="22%" y="4%" fill="var(--theme-body-background)">format-number(@listPrice, '$###,###')"</text><rect y="85%" height="15%" width="100%" fillOpacity="0.75"></rect><text x="11.25%" y="23.75%" fill="var(--theme-body-background)" textAnchor="middle"></text><text x="11.25%" y="26.75%" fill="var(--theme-body-background)" textAnchor="middle"><tspan></tspan><tspan>BR | </tspan><tspan></tspan><tspan>BA | </tspan><tspan>SQFT`);
const ListingsGrid = ({
  listings,
  mode,
  style
}) => {
  mode = mode.toLowerCase();
  const bgColors = {
    active: "--active-green",
    new: "--new-blue",
    pending: "--pending-yellow",
    sold: "--sold-red"
  };
  return (() => {
    const _el$ = _tmpl$$3();
    insert(_el$, () => listings.map((l, i) => (() => {
      const _el$2 = _tmpl$2$1(),
        _el$3 = _el$2.firstChild,
        _el$4 = _el$3.nextSibling,
        _el$5 = _el$4.nextSibling,
        _el$6 = _el$5.firstChild,
        _el$7 = _el$5.nextSibling,
        _el$8 = _el$7.nextSibling,
        _el$9 = _el$8.nextSibling,
        _el$10 = _el$9.nextSibling,
        _el$11 = _el$10.nextSibling,
        _el$12 = _el$11.nextSibling,
        _el$13 = _el$12.nextSibling,
        _el$14 = _el$13.nextSibling,
        _el$15 = _el$14.nextSibling,
        _el$16 = _el$15.firstChild,
        _el$17 = _el$16.nextSibling,
        _el$18 = _el$17.nextSibling,
        _el$19 = _el$18.nextSibling,
        _el$20 = _el$19.nextSibling;
      insert(_el$6, i + 1);
      insert(_el$14, () => address(l));
      insert(_el$16, () => l.bedrooms);
      insert(_el$18, () => l.bathroomsTotal);
      insert(_el$15, () => Intl.NumberFormat("en-US").format(l.sqft), _el$20);
      createRenderEffect(_p$ => {
        const _v$ = `${l.mlsNumber}:${l.latitude}:${l.longitude}`,
          _v$2 = `/thumbnail?url=${l.photoPrimaryUrl}`,
          _v$3 = `var(${bgColors[mode]})`,
          _v$4 = `var(${bgColors[mode]})`,
          _v$5 = `var(${bgColors[mode]})`,
          _v$6 = `var(${bgColors[mode]})`;
        _v$ !== _p$._v$ && setAttribute(_el$2, "key", _p$._v$ = _v$);
        _v$2 !== _p$._v$2 && setAttribute(_el$3, "href", _p$._v$2 = _v$2);
        _v$3 !== _p$._v$3 && setAttribute(_el$4, "fill", _p$._v$3 = _v$3);
        _v$4 !== _p$._v$4 && setAttribute(_el$7, "fill", _p$._v$4 = _v$4);
        _v$5 !== _p$._v$5 && setAttribute(_el$10, "fill", _p$._v$5 = _v$5);
        _v$6 !== _p$._v$6 && setAttribute(_el$13, "fill", _p$._v$6 = _v$6);
        return _p$;
      }, {
        _v$: undefined,
        _v$2: undefined,
        _v$3: undefined,
        _v$4: undefined,
        _v$5: undefined,
        _v$6: undefined
      });
      return _el$2;
    })()));
    return _el$;
  })();
};

/*

{mode !== "Sold" && <td>{window. window.gHub.currency(l.priceHigh)}</td>}

<td></td>
<td></td>

{mode !== "Sold" && <td>{format(Date.parse(l.listDate), "m-d-Y")} </td>}

<td></td>

{mode === "Sold" && (
	<>
		<td>{window. window.gHub.currency(parseInt(l.priceHigh))}</td>
		<td>{window. window.gHub.currency(parseInt(l.salePrice))}</td>
		<td>{format(Date.parse(l.soldDate), "m-d-Y")}</td>
		<td>
			{window. window.gHub.currency(parseInt(l.salePrice) / parseInt(l.sqft))}
		</td>
	</>
)}

{mode !== "Sold" && (
	<td>{window. window.gHub.currency(parseInt(l.priceHigh) / parseInt(l.sqft))}</td>
)}
*/

const _tmpl$$2 = /*#__PURE__*/template(`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="var(--theme-heading-color)" d="M96 288H32c-17.67 0-32 14.33-32 32v64c0 17.67 14.33 32 32 32h64c17.67 0 32-14.33 32-32v-64c0-17.67-14.33-32-32-32zm160 0h-64c-17.67 0-32 14.33-32 32v64c0 17.67 14.33 32 32 32h64c17.67 0 32-14.33 32-32v-64c0-17.67-14.33-32-32-32zm160 0h-64c-17.67 0-32 14.33-32 32v64c0 17.67 14.33 32 32 32h64c17.67 0 32-14.33 32-32v-64c0-17.67-14.33-32-32-32zM96 96H32c-17.67 0-32 14.33-32 32v64c0 17.67 14.33 32 32 32h64c17.67 0 32-14.33 32-32v-64c0-17.67-14.33-32-32-32zm160 0h-64c-17.67 0-32 14.33-32 32v64c0 17.67 14.33 32 32 32h64c17.67 0 32-14.33 32-32v-64c0-17.67-14.33-32-32-32zm160 0h-64c-17.67 0-32 14.33-32 32v64c0 17.67 14.33 32 32 32h64c17.67 0 32-14.33 32-32v-64c0-17.67-14.33-32-32-32z">`);
const GridView = ((props = {}) => (() => {
  const _el$ = _tmpl$$2();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$1 = /*#__PURE__*/template(`<svg viewBox="0 0 512 512"><path fill="var(--theme-heading-color)" d="M48 48a48 48 0 1 0 48 48 48 48 0 0 0-48-48zm0 160a48 48 0 1 0 48 48 48 48 0 0 0-48-48zm0 160a48 48 0 1 0 48 48 48 48 0 0 0-48-48zm448 16H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-320H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16V80a16 16 0 0 0-16-16zm0 160H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16z">`);
const ListView = ((props = {}) => (() => {
  const _el$ = _tmpl$$1();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$ = /*#__PURE__*/template(`<h4 class="center upper" style="margin-bottom:0.5rem"> `),
  _tmpl$2 = /*#__PURE__*/template(`<h1 class="center upper" style="margin:0.5rem 0">Market Activity`),
  _tmpl$3 = /*#__PURE__*/template(`<div>`),
  _tmpl$4 = /*#__PURE__*/template(`<div style="display:flex;flex-direction:row;justify-content:space-between;margin:0;font-size:85%;align-items:center;width:100%"><span>View Option</span><span>Status</span><select style="padding:0.25rem 0.5rem"></select><span>Sort By</span><select style="padding:0.25rem 0.5rem"></select><span>`),
  _tmpl$5 = /*#__PURE__*/template(`<option style="text-transform:capitalize">`),
  _tmpl$6 = /*#__PURE__*/template(`<div class="map-key" style="position:absolute;z-index:700;top:65px"><svg style="width:250px;height:270px"><rect width="100%" height="15%" fill="var(--theme-body-background)"></rect><rect width="100%" height="80%" fill="#000" fillOpacity="0.4" y="15%"></rect><text x="20" y="10" style="font-size:150%" fill="var(--theme-body-color)" dominantBaseline="hanging"></text><g style="transform:translate(20px, 70px)">`),
  _tmpl$7 = /*#__PURE__*/template(`<svg><g><circle cx="20" cy="5" r="20"></circle><text x="20" y="7" fill="var(--theme-body-background)" textAnchor="middle" dominantBaseline="middle" style="font-size:120%;textShadow:4px 4px 5px rgba(44, 44, 44, 0.5)"></text><text x="50" y="7" fill="var(--theme-body-background)" dominantBaseline="middle" style="font-size:120%;textShadow:4px 4px 5px rgba(44, 44, 44, 0.5)"></svg>`, false, true);
const MarketActivity = (() => {
  const settings = useSettings(Context4Settings);
  const [sortBy, setSortBy] = createSignal("Most Recent");
  const [view, setView] = createSignal("List");
  const {
    currentPage,
    setPage,
    pageOffset,
    pageSize,
    setPageSize
  } = usePagination({});
  const [status, setStatus] = createSignal(settings.mode ? settings.mode.charAt(0).toUpperCase() + settings.mode.slice(1) : "");
  const [expanded] = createSignal(false);
  const currentListings = filterListings(listingsStore.listings, areaDataStore.propertyTypeID, areaDataStore.areaPeriod, status);
  const visibleListings = currentListings && currentListings.slice(pageOffset, pageOffset + pageSize);
  const color = getCssVar(`--${status().toLowerCase()}`, document.body).trim();
  return [(() => {
    const _el$ = _tmpl$(),
      _el$2 = _el$.firstChild;
    insert(_el$, () => areaDataStore.areaName, _el$2);
    insert(_el$, () => areaDataStore.propertyTypeID === 0 ? "Homes" : "Condos", null);
    return _el$;
  })(), _tmpl$2(), createComponent(HomeTypes, {
    get container() {
      return `MarketActivity-${settings.areaid}`;
    },
    style: "margin:0.5rem"
  }), (() => {
    const _el$4 = _tmpl$3();
    insert(_el$4, createComponent(StatusKey, {
      setStatus: setStatus
    }), null);
    insert(_el$4, createComponent(LeafletMap, {
      get mapStyle() {
        return settings.mapstyle || "satellite-streets-v11";
      },
      zoomControl: true,
      style: "width:100%;height:100%;",
      get children() {
        return [createComponent(GeoArea, {
          get areaId() {
            return settings.areaid;
          },
          style: "color:#feff00;fill-opacity:0"
        }), createMemo(() => visibleListings && visibleListings.map((l, i) => createComponent(CircleMarker, {
          color: color,
          caption: pageOffset * pageSize + i + 1,
          key: i + pageOffset * pageSize,
          get position() {
            return [l.latitude, l.longitude];
          }
        })))];
      }
    }), null);
    createRenderEffect(_$p => style(_el$4, `position:relative;width:100%;height:${expanded ? "650px" : `400px`}`, _$p));
    return _el$4;
  })(), createMemo((() => {
    const _c$ = createMemo(() => !!(visibleListings && visibleListings.length > 0));
    return () => _c$() && (() => {
      const _el$5 = _tmpl$4(),
        _el$6 = _el$5.firstChild,
        _el$7 = _el$6.nextSibling,
        _el$8 = _el$7.nextSibling,
        _el$9 = _el$8.nextSibling,
        _el$10 = _el$9.nextSibling,
        _el$11 = _el$10.nextSibling;
      insert(_el$5, createComponent(ListView, {
        style: "width:20px;height:auto",
        onClick: () => {
          setPageSize(10);
          setView("List");
        }
      }), _el$7);
      insert(_el$5, createComponent(GridView, {
        style: "width:20px;height:auto",
        onClick: () => {
          setPageSize(8);
          setView("Grid");
        }
      }), _el$7);
      _el$8.addEventListener("change", e => {
        setPage(1);
        setStatus(e.target.value);
      });
      _el$8.value = status;
      insert(_el$8, () => ["Pending", "New", "Active", "Sold"].map(key => (() => {
        const _el$12 = _tmpl$5();
        setAttribute(_el$12, "key", key);
        insert(_el$12, key);
        return _el$12;
      })()));
      _el$10.addEventListener("change", e => {
        setPage(1);
        setSortBy(e.target.value);
      });
      _el$10.value = sortBy;
      insert(_el$10, () => ["Most Recent", "Price High", "Price Low", "Days on Market"].map(key => (() => {
        const _el$13 = _tmpl$5();
        setAttribute(_el$13, "key", key);
        insert(_el$13, key);
        return _el$13;
      })()));
      insert(_el$11, createComponent(ListingsShowing, {
        pageSize: pageSize,
        offset: pageOffset,
        get len() {
          return currentListings.length;
        },
        get mode() {
          return settings.mode;
        },
        period: period
      }));
      return _el$5;
    })();
  })()), view === "List" && createComponent(ListingsTable, {
    mode: status,
    listings: visibleListings,
    style: "width: 100%; color: var(--theme-body-color)"
  }), view === "Grid" && createComponent(ListingsGrid, {
    mode: status,
    listings: visibleListings,
    style: "width: 100%; color: var(--theme-body-color)"
  }), createComponent(Pagination, {
    get totalItems() {
      return currentListings?.length;
    },
    currentPage: currentPage,
    pageChange: page => setPage(page),
    style: "align-self: flex-end"
  })];
});
const StatusKey = ({
  setStatus
}) => {
  console.log("areaDataStore", {
    ...areaDataStore
  });
  const labels = [{
    total: areaDataStore?.overall?.new,
    label: "New (active)",
    status: "new"
  }, {
    total: areaDataStore?.overall?.active,
    label: "Active",
    status: "active"
  }, {
    total: areaDataStore?.overall?.pending,
    label: "Pending",
    status: "pending"
  }, {
    total: areaDataStore.overall?.sold,
    label: "Sold",
    status: "sold"
  }];
  return (() => {
    const _el$14 = _tmpl$6(),
      _el$15 = _el$14.firstChild,
      _el$16 = _el$15.firstChild,
      _el$17 = _el$16.nextSibling,
      _el$18 = _el$17.nextSibling,
      _el$19 = _el$18.nextSibling;
    insert(_el$18, () => areaDataStore.areaName);
    insert(_el$19, () => labels.map((l, i) => (() => {
      const _el$20 = _tmpl$7(),
        _el$21 = _el$20.firstChild,
        _el$22 = _el$21.nextSibling,
        _el$23 = _el$22.nextSibling;
      _el$20.$$click = e => setStatus(l.status);
      setAttribute(_el$20, "key", i);
      insert(_el$22, () => l.total);
      insert(_el$23, () => l.label);
      createRenderEffect(_p$ => {
        const _v$ = `transform: translateY(${i * 50}px)`,
          _v$2 = `var(--${l.status})`;
        _p$._v$ = style(_el$20, _v$, _p$._v$);
        _v$2 !== _p$._v$2 && setAttribute(_el$21, "fill", _p$._v$2 = _v$2);
        return _p$;
      }, {
        _v$: undefined,
        _v$2: undefined
      });
      return _el$20;
    })()));
    return _el$14;
  })();
};
delegateEvents(["click"]);

export { MarketActivity as default };
