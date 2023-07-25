import { s as setAttribute, i as insert, e as createRenderEffect, f as style, b as createComponent, g as createMemo, t as template } from './index.js';
import { f as format, H as HomeTypes, L as ListingsTable, P as Pagination } from './Pagination.js';
import { g as usePagination, i as filterListings } from './index2.js';
import { G as GeoArea, L as LeafletMap, C as CircleMarker } from './LeafletMap.js';
import { L as ListingsShowing } from './ListingsShowing.js';

const _tmpl$ = /*#__PURE__*/template(`<div><svg viewBox="0 0 200 200"><rect width="100%" height="100%" rx="15" fillOpacity="100%"></rect><path d="M0 0 L0 140 L160 0 Z" fill="var(--theme-body-background)" fillOpacity="0.1"></path><text x="5%" y="10%" font-size="165%" font-weight="bold" dominantBaseline="hanging" style="text-transform:uppercase" fill="var(--theme-body-background)"></text><text x="5%" y="30%" font-weight="900" font-size="400%" dominantBaseline="hanging" fill="var(--theme-body-background)"></text><image x="60%" y="35%" width="35%" preserveAspectRatio="xMidYMid meet"></image><rect id="rounded-rect" width="12%" height="5%" fill="var(--theme-heading-color)" fillOpacity="0.1" y="19%" x="1%" rx="0.5%"></rect><text x="50%" y="90%" fill="var(--theme-body-background)" font-size="180%" font-weight="bold" textAnchor="middle"></text></svg><div><h2 class="upper"></h2><h4 class="upper">Market Report</h4></div><div><h3 style="font-size:175%"></h3><h4 style="font-weight:300;font-size:100%;color:var(--theme-body-color)">`),
  _tmpl$2 = /*#__PURE__*/template(`<div>`),
  _tmpl$3 = /*#__PURE__*/template(`<div><div style="font-size:80%"><br>DOM: Days On Market`);
const ListingMapStyleTwo = (() => {
  const {
    currentPage,
    setPage,
    pageOffset,
    pageSize
  } = usePagination({});
  useEffect(() => {
    setPage(1);
  }, [period, setPage]);
  const currentListings = filterListings(listings, propertyTypeID, period, settings.mode);
  const visibleListings = currentListings.slice(pageOffset, pageOffset + pageSize);
  const color = window.window.gg.getCssVar(`--${settings.mode.toLowerCase()}`, document.body).trim();
  let icon, subtitle;
  switch (settings.mode.toLowerCase()) {
    case "active":
      icon = "home-speaker";
      subtitle = "Active Listings";
      break;
    case "pending":
      icon = "home-dot";
      subtitle = "Pending Listings";
      break;
    default:
      icon = "home-speaker";
      subtitle = `${period} Month Sales`;
      break;
  }
  return [(() => {
    const _el$ = _tmpl$(),
      _el$2 = _el$.firstChild,
      _el$3 = _el$2.firstChild,
      _el$4 = _el$3.nextSibling,
      _el$5 = _el$4.nextSibling,
      _el$6 = _el$5.nextSibling,
      _el$7 = _el$6.nextSibling,
      _el$8 = _el$7.nextSibling,
      _el$9 = _el$8.nextSibling,
      _el$10 = _el$2.nextSibling,
      _el$11 = _el$10.firstChild,
      _el$12 = _el$11.nextSibling,
      _el$13 = _el$10.nextSibling,
      _el$14 = _el$13.firstChild,
      _el$15 = _el$14.nextSibling;
    _el$.style.setProperty("display", "flex");
    _el$.style.setProperty("width", "100%");
    _el$.style.setProperty("marginBottom", "0");
    _el$2.style.setProperty("width", "8vw");
    _el$2.style.setProperty("height", "8vw");
    _el$2.style.setProperty("marginRight", "2rem");
    setAttribute(_el$3, "fill", color);
    insert(_el$5, () => settings.mode);
    insert(_el$6, () => currentListings.length);
    setAttribute(_el$7, "href", `/_assets/_img/icons/${icon}.svg`);
    insert(_el$9, () => format(new Date(), "MMM yyyy"));
    insert(_el$11, areaName);
    _el$13.style.setProperty("textAlign", "right");
    _el$13.style.setProperty("flexGrow", "1");
    color != null ? _el$13.style.setProperty("color", color) : _el$13.style.removeProperty("color");
    _el$13.style.setProperty("alignSelf", "flex-end");
    _el$13.style.setProperty("textTransform", "uppercase");
    insert(_el$14, subtitle);
    insert(_el$15, () => format(new Date(), "EEEE, MMMM d, yyyy"));
    createRenderEffect(_p$ => {
      const _v$ = `margin-bottom: 0.5rem; font-size: 220%; font-weight: 99; align-self: self-start; color: ${color}`,
        _v$2 = `margin: 0.5rem 0; font-weight: 300; align-self: self-start; color: ${color}`;
      _p$._v$ = style(_el$11, _v$, _p$._v$);
      _p$._v$2 = style(_el$12, _v$2, _p$._v$2);
      return _p$;
    }, {
      _v$: undefined,
      _v$2: undefined
    });
    return _el$;
  })(), createComponent(HomeTypes, {
    get container() {
      return `MarketActivity-${settings.areaid}`;
    },
    style: "margin: 0.5rem",
    get showPeriod() {
      return settings.mode.toLowerCase() === "sold";
    }
  }), (() => {
    const _el$16 = _tmpl$2();
    _el$16.style.setProperty("position", "relative");
    _el$16.style.setProperty("width", "100%");
    _el$16.style.setProperty("display", "grid");
    _el$16.style.setProperty("gridTemplateColumns", "300px 1fr");
    _el$16.style.setProperty("borderRadius", "15px");
    _el$16.style.setProperty("border", "2px solid");
    color != null ? _el$16.style.setProperty("borderColor", color) : _el$16.style.removeProperty("borderColor");
    _el$16.style.setProperty("marginBottom", "0.25rem");
    insert(_el$16, createComponent(LeafletMap, {
      get mapStyle() {
        return settings.mapstyle || "satellite-streets-v11";
      },
      zoomControl: true,
      style: {
        width: `100%`,
        height: `100%`,
        borderRadius: "15px"
      },
      get children() {
        return [createComponent(GeoArea, {
          get areaID() {
            return settings.areaid;
          },
          style: {
            color: "#feff00",
            fillOpacity: 0
          }
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
    insert(_el$16, createComponent(ListingsTable, {
      get mode() {
        return settings.mode;
      },
      listings: visibleListings,
      style: {
        width: "100%",
        color: "var(--theme-body-color)",
        borderRadius: "15px"
      }
    }), null);
    return _el$16;
  })(), (() => {
    const _el$17 = _tmpl$3(),
      _el$18 = _el$17.firstChild,
      _el$19 = _el$18.firstChild;
    _el$17.style.setProperty("display", "flex");
    _el$17.style.setProperty("justifyContent", "space-between");
    _el$17.style.setProperty("flexDirection", "row");
    _el$17.style.setProperty("margin", "0");
    _el$17.style.setProperty("width", "100%");
    insert(_el$18, createComponent(ListingsShowing, {
      pageSize: pageSize,
      offset: pageOffset,
      get len() {
        return currentListings.length;
      },
      get mode() {
        return settings.mode;
      },
      period: period
    }), _el$19);
    insert(_el$17, createComponent(Pagination, {
      get totalItems() {
        return currentListings.length;
      },
      currentPage: currentPage,
      pageChange: page => setPage(page),
      style: "align-self:flex-end; margin: 0.25rem 0"
    }), null);
    return _el$17;
  })()];
});

export { ListingMapStyleTwo as default };
