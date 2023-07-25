import { z as spread, t as template, c as createSignal, a as createEffect, b as createComponent, i as insert, S as Show, e as createRenderEffect, f as style, g as createMemo, d as delegateEvents } from './index.js';
import { a as useSettings, g as usePagination, h as listingsStore, i as filterListings, j as unwrap, k as sharedEmbedStore, b as areaDataStore, p as percent } from './index2.js';
import { H as HomeTypes, L as ListingsTable, P as Pagination } from './Pagination.js';
import { E as Editable } from './Editable.js';
import { L as ListingsShowing } from './ListingsShowing.js';
import { S as Spinner } from './Spinner.js';

const _tmpl$$9 = /*#__PURE__*/template(`<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 490 490"><path d="M11.387 490 245 255.832 478.613 490l10.826-10.826-233.63-234.178 233.63-234.185L478.613 0 245 234.161 11.387 0 .561 10.811l233.63 234.185L.561 479.174z">`);
const CloseIcon = ((props = {}) => (() => {
  const _el$ = _tmpl$$9();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$8 = /*#__PURE__*/template(`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500"><path d="m346.05 152.13-65.4-68.43c-1.64-1.57-9.38-8.66-21.5-8.78-12.5-.12-20.53 7.27-22.1 8.78-34.72 37.55-69.44 75.09-104.16 112.64l213.16-44.21zM119.57 365.36l280.38-53.9v53.9c-.16 2.12-1.12 11.47-9.08 18.77-7.08 6.5-15.2 7.26-17.56 7.4h-228.3c-2.54-.38-10.31-1.88-16.96-8.61-6.88-6.95-8.18-15.05-8.48-17.56z" fill="#ccc"></path><path fill="var(--sold-red)" d="M34.63 229.25 64.1 366.51l406.96-83.97-25.84-134.84z"></path><text x="250" y="290" class="center bold upper" transform="rotate(-12 250 260)" font-family="sans-serif" font-size="95" fill="var(--theme-body-background)">Sold`);
const SoldIcon = ((props = {}) => (() => {
  const _el$ = _tmpl$$8();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$7 = /*#__PURE__*/template(`<svg viewBox="0 0 500 500"><path d="m346.05 152.13-65.4-68.43c-1.64-1.57-9.38-8.66-21.5-8.78-12.5-.12-20.53 7.27-22.1 8.78-34.72 37.55-69.44 75.09-104.16 112.64l213.16-44.21zM119.57 365.36l280.38-53.9v53.9c-.16 2.12-1.12 11.47-9.08 18.77-7.08 6.5-15.2 7.26-17.56 7.4h-228.3c-2.54-.38-10.31-1.88-16.96-8.61-6.88-6.95-8.18-15.05-8.48-17.56z" fill="#ccc"></path><path fill="var(--active-green)" d="M34.63 229.25 64.1 366.51l406.96-83.97-25.84-134.84z"></path><text x="250" y="290" class="center bold upper" transform="rotate(-12 250 260)" font-size="95" fill="var(--theme-body-background)">Active`);
const ActiveIcon = ((props = {}) => (() => {
  const _el$ = _tmpl$$7();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$6 = /*#__PURE__*/template(`<svg viewBox="0 0 500 500"><path d="m346.05 152.13-65.4-68.43c-1.64-1.57-9.38-8.66-21.5-8.78-12.5-.12-20.53 7.27-22.1 8.78-34.72 37.55-69.44 75.09-104.16 112.64l213.16-44.21zM119.57 365.36l280.38-53.9v53.9c-.16 2.12-1.12 11.47-9.08 18.77-7.08 6.5-15.2 7.26-17.56 7.4h-228.3c-2.54-.38-10.31-1.88-16.96-8.61-6.88-6.95-8.18-15.05-8.48-17.56z" fill="#ccc"></path><path fill="var(--pending-yellow)" d="M34.63 229.25 64.1 366.51l406.96-83.97-25.84-134.84z"></path><text x="250" y="290" class="center bold upper" transform="rotate(-12 250 260)" font-size="85" fill="var(--theme-body-background)">Pending`);
const PendingIcon = ((props = {}) => (() => {
  const _el$ = _tmpl$$6();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$5 = /*#__PURE__*/template(`<svg viewBox="0 0 500 500"><path d="m346.05 152.13-65.4-68.43c-1.64-1.57-9.38-8.66-21.5-8.78-12.5-.12-20.53 7.27-22.1 8.78-34.72 37.55-69.44 75.09-104.16 112.64l213.16-44.21zM119.57 365.36l280.38-53.9v53.9c-.16 2.12-1.12 11.47-9.08 18.77-7.08 6.5-15.2 7.26-17.56 7.4h-228.3c-2.54-.38-10.31-1.88-16.96-8.61-6.88-6.95-8.18-15.05-8.48-17.56z" fill="#ccc"></path><path fill="var(--new-blue)" d="M34.63 229.25 64.1 366.51l406.96-83.97-25.84-134.84z"></path><text x="250" y="290" class="center bold upper" transform="rotate(-12 250 260)" font-size="95" fill="var(--theme-body-background)">New`);
const NewIcon = ((props = {}) => (() => {
  const _el$ = _tmpl$$5();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$4 = /*#__PURE__*/template(`<svg viewBox="0 0 500 500"><path fill="var(--vivid-color-1)" d="M250 8.36C116.55 8.36 8.36 116.55 8.36 250S116.55 491.64 250 491.64 491.64 383.45 491.64 250 383.45 8.36 250 8.36zm104.85 347.53c-5.5 5.5-14.43 5.5-19.93 0l-72-72a36.152 36.152 0 0 1-12.92 2.38c-20.03 0-36.27-16.24-36.27-36.27 0-15.13 9.26-28.08 22.42-33.52V95.52c0-7.78 6.31-14.09 14.09-14.09s14.09 6.31 14.09 14.09v121.16c12.89 5.56 21.92 18.38 21.92 33.31 0 5.12-1.07 9.99-2.98 14.4l71.56 71.56c5.52 5.51 5.52 14.44.02 19.94z">`);
const AvgDom = ((props = {}) => (() => {
  const _el$ = _tmpl$$4();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$3 = /*#__PURE__*/template(`<svg viewBox="0 0 500 500"><path fill="var(--vivid-color-1)" d="M123.57 92.19h-5.03c-7.16 0-12.96-5.8-12.96-12.96V38.6c0-7.16 5.8-12.96 12.96-12.96h5.03c7.16 0 12.96 5.8 12.96 12.96v40.63c0 7.16-5.8 12.96-12.96 12.96zM381.45 92.19h-5.03c-7.16 0-12.96-5.8-12.96-12.96V38.6c0-7.16 5.8-12.96 12.96-12.96h5.03c7.16 0 12.96 5.8 12.96 12.96v40.63c0 7.16-5.8 12.96-12.96 12.96z"></path><path fill="var(--vivid-color-1)" d="M445.2 71.95h-41.17v8.75c0 13.86-11.23 25.09-25.09 25.09s-25.09-11.23-25.09-25.09v-8.75h-207.7v8.72c0 13.86-11.23 25.09-25.09 25.09s-25.09-11.24-25.09-25.1v-8.72H54.8c-12.93 0-23.42 10.49-23.42 23.42v355.57c0 12.93 10.49 23.42 23.42 23.42h390.4c12.93 0 23.42-10.49 23.42-23.42V95.37c0-12.94-10.49-23.42-23.42-23.42zM158.74 360.87a8.62 8.62 0 0 1-8.62 8.62H94.57a8.62 8.62 0 0 1-8.62-8.62v-61.68a8.62 8.62 0 0 1 8.62-8.62h55.56a8.62 8.62 0 0 1 8.62 8.62v61.68zm0-138.4a8.62 8.62 0 0 1-8.62 8.62H94.57a8.62 8.62 0 0 1-8.62-8.62v-61.68a8.62 8.62 0 0 1 8.62-8.62h55.56a8.62 8.62 0 0 1 8.62 8.62v61.68zm127.66 138.4a8.62 8.62 0 0 1-8.62 8.62h-55.56a8.62 8.62 0 0 1-8.62-8.62v-61.68a8.62 8.62 0 0 1 8.62-8.62h55.56a8.62 8.62 0 0 1 8.62 8.62v61.68zm0-138.4a8.62 8.62 0 0 1-8.62 8.62h-55.56a8.62 8.62 0 0 1-8.62-8.62v-61.68a8.62 8.62 0 0 1 8.62-8.62h55.56a8.62 8.62 0 0 1 8.62 8.62v61.68zm127.65 138.4a8.62 8.62 0 0 1-8.62 8.62h-55.56a8.62 8.62 0 0 1-8.62-8.62v-61.68a8.62 8.62 0 0 1 8.62-8.62h55.56a8.62 8.62 0 0 1 8.62 8.62v61.68zm0-138.4a8.62 8.62 0 0 1-8.62 8.62h-55.56a8.62 8.62 0 0 1-8.62-8.62v-61.68a8.62 8.62 0 0 1 8.62-8.62h55.56a8.62 8.62 0 0 1 8.62 8.62v61.68z">`);
const AvgYIH = ((props = {}) => (() => {
  const _el$ = _tmpl$$3();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$2 = /*#__PURE__*/template(`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500"><path fill="var(--vivid-color-1)" d="M137.91 262.52c0-6.88-5.58-12.46-12.46-12.46-6.88 0-12.46 5.58-12.46 12.46 0 6.88 5.58 12.46 12.46 12.46 6.88 0 12.46-5.58 12.46-12.46z"></path><circle transform="rotate(-67.5 251.217 218.731)" fill="var(--vivid-color-1)" cx="251.22" cy="218.74" r="21.29"></circle><path fill="var(--vivid-color-1)" d="M120.92 304.04c.75 2.26 4.53 27.93 4.53 27.93l31.71-6.04-3.78-27.93-32.46 6.04zM225.85 317.63l55.11-2.64v-40.01h-55.11zM348.15 328.2l28.69 3.77 6.79-28.68-35.48-5.29z"></path><path fill="var(--vivid-color-1)" d="M248.88 11.78C116.24 11.78 8.71 119.31 8.71 251.95s107.53 240.17 240.17 240.17 240.17-107.53 240.17-240.17S381.52 11.78 248.88 11.78zm185.71 265.84-28.31 65.68c7.93 6.79 15.85 13.59 23.78 20.38-45.12-13.8-109.21-28.1-186.84-28.69A655.471 655.471 0 0 0 75.63 355.5l21.52-17.87-27.18-62.28-11.32 8.67-14.72-12.07 63.41-71.34 37.37 41.33 12.46-6.23 21.52 83.8-7.93-101.91-24.91 7.93-14.72-18.12 120.11-87.19 119.96 87.19-16.99 21.52-18.12-14.72-9.06 107.58 18.12-86.06 15.85 9.06 31.71-44.16 61.15 72.47-10.19 10.94-9.08-6.42z"></path><circle transform="rotate(-87.146 376.818 262.511)" fill="var(--vivid-color-1)" cx="376.84" cy="262.52" r="12.46">`);
const Homes = ((props = {}) => (() => {
  const _el$ = _tmpl$$2();
  spread(_el$, props, true, true);
  return _el$;
})());

const _tmpl$$1 = /*#__PURE__*/template(`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500"><path fill="var(--vivid-color-1)" d="M250 10.12C117.52 10.12 10.12 117.52 10.12 250S117.52 489.88 250 489.88 489.88 382.48 489.88 250 382.48 10.12 250 10.12zm111.22 155.6-79.37 68.9c2.25 4.65 3.51 9.86 3.51 15.37 0 19.53-15.83 35.36-35.36 35.36s-35.36-15.83-35.36-35.36 15.83-35.36 35.36-35.36c3.68 0 7.22.56 10.56 1.6l57.63-50.03c-1.86-1.71-3.51-3.15-4.51-3.97 0 0-3.94-3.23-10.14-6.37-5.67-2.87-90.94-32.66-136.62 26.89-36.28 47.3-12.75 107.4-4.07 121.67 3.33 5.47 6.7 9.71 9.29 12.67 4.05 5.54 3.27 13.19-1.53 17.58-3.83 3.49-10.35 3.85-16.29.99-2.51-2.64-5.12-5.61-7.74-8.91-2.31-2.91-4.37-5.75-6.2-8.45-1.52-2.25-43.94-82.95 5.66-146.83 56.33-72.55 161.7-33.67 168.66-29.49 4.82 2.9 9.54 6.21 9.54 6.21 2.98 2.09 5.61 4.09 7.89 5.91l10.84-9.41c5.81-5.04 14.6-4.42 19.64 1.39 5.04 5.81 4.42 14.6-1.39 19.64z">`);
const TurnOverHomes = ((props = {}) => (() => {
  const _el$ = _tmpl$$1();
  spread(_el$, props, true, true);
  return _el$;
})());

const fastFacts = '';

const _tmpl$ = /*#__PURE__*/template(`<h1> Fast&#160;Facts`),
  _tmpl$2 = /*#__PURE__*/template(`<p>Sorry, but we have no data for that period.`),
  _tmpl$3 = /*#__PURE__*/template(`<div class="fast-facts-property-icons"><div></div><div></div><div></div><div>`),
  _tmpl$4 = /*#__PURE__*/template(`<div class="toggle" id="ff-listing-table"><div style="box-sizing:border-box;"><div style="display:flex;justify-content:space-between"><div style="margin-top:1em">`),
  _tmpl$5 = /*#__PURE__*/template(`<span>`),
  _tmpl$6 = /*#__PURE__*/template(`<div class="fast-facts-stats-icons"><div><h3>Total Homes</h3><div></div></div><div><h3>Turnover Rate</h3><div></div></div><div><h3>Average Days on Market</h3><div></div></div><div><h3>Average Years in Home</h3><div>`),
  _tmpl$7 = /*#__PURE__*/template(`<span>: `),
  _tmpl$8 = /*#__PURE__*/template(`<div>`),
  _tmpl$9 = /*#__PURE__*/template(`<small style="white-space:nowrap;display:block;">Active in last 30 days`);
const FastFacts = (() => {
  const settings = useSettings();
  const [availableListings, setAvailableListings] = createSignal(0);
  const [listingType, setListingType] = createSignal(0);
  const [listings, setListings] = createSignal([]);
  const [listingsMode, setListingsMode] = createSignal();
  const [listingsVisible, setListingsVisible] = createSignal(false);
  const {
    currentPage,
    setPage,
    pageOffset,
    pageSize
  } = usePagination();
  createEffect(() => {
    if (!listingsStore.loading) {
      const subset = filterListings(Object.values(unwrap(listingsStore.listings)), listingType(), 12, listingsMode());
      if (subset) {
        const offset = currentPage() * pageSize();
        setAvailableListings(subset.length);
        setListings(subset.slice(offset, offset + pageSize()));
      }
    }
  });
  createEffect(() => {
    setListingType(sharedEmbedStore.propertyType);
  });
  const showProperties = (propertyTypeID, statusType) => {
    setPage(0);
    setListingType(propertyTypeID);
    setListingsMode(statusType.toLowerCase());
    setListingsVisible(true);
  };
  return [createComponent(Editable, {
    id: "fast-facts-title",
    get children() {
      const _el$ = _tmpl$(),
        _el$2 = _el$.firstChild;
      insert(_el$, () => areaDataStore.areaName, _el$2);
      return _el$;
    }
  }), createComponent(HomeTypes, {
    get container() {
      return `FastFacts-${areaDataStore.areaID}`;
    }
  }), createComponent(Show, {
    get when() {
      return typeof areaDataStore.propertyStats === "undefined";
    },
    get children() {
      return _tmpl$2();
    }
  }), (() => {
    const _el$4 = _tmpl$3(),
      _el$5 = _el$4.firstChild,
      _el$6 = _el$5.nextSibling,
      _el$7 = _el$6.nextSibling,
      _el$8 = _el$7.nextSibling;
    insert(_el$5, createComponent(NewIcon, {}), null);
    insert(_el$5, createComponent(ListingTableLinks, {
      title: "NEW",
      status: "new",
      get propertyType() {
        return settings.propertyTypeID;
      },
      get propertyView() {
        return sharedEmbedStore.propertyType;
      },
      showProperties: showProperties
    }), null);
    insert(_el$6, createComponent(ActiveIcon, {}), null);
    insert(_el$6, createComponent(ListingTableLinks, {
      title: "ACTIVE",
      status: "active",
      get propertyType() {
        return settings.propertyTypeID;
      },
      get propertyView() {
        return sharedEmbedStore.propertyType;
      },
      showProperties: showProperties
    }), null);
    insert(_el$7, createComponent(PendingIcon, {}), null);
    insert(_el$7, createComponent(ListingTableLinks, {
      title: "PENDING",
      status: "pending",
      get propertyType() {
        return settings.propertyTypeID;
      },
      get propertyView() {
        return sharedEmbedStore.propertyType;
      },
      showProperties: showProperties
    }), null);
    insert(_el$8, createComponent(SoldIcon, {}), null);
    insert(_el$8, createComponent(ListingTableLinks, {
      get title() {
        return `SOLD IN ${sharedEmbedStore.period} MOs`;
      },
      status: "sold",
      get propertyType() {
        return settings.propertyTypeID;
      },
      get propertyView() {
        return sharedEmbedStore.propertyType;
      },
      showProperties: showProperties
    }), null);
    return _el$4;
  })(), (() => {
    const _el$9 = _tmpl$4(),
      _el$10 = _el$9.firstChild,
      _el$11 = _el$10.firstChild,
      _el$12 = _el$11.firstChild;
    insert(_el$10, createComponent(CloseIcon, {
      style: "height: 35px; width: auto; cursor: pointer; float: right;",
      onClick: () => setListingsVisible(false)
    }), _el$11);
    insert(_el$10, createComponent(ListingsTable, {
      get mode() {
        return listingsMode();
      },
      get listings() {
        return listings();
      },
      style: "width: 100%; color: var(--theme-body-color)",
      withIcon: true
    }), _el$11);
    insert(_el$12, createComponent(ListingsShowing, {
      get pageSize() {
        return pageSize();
      },
      get offset() {
        return currentPage() * pageSize();
      },
      get len() {
        return availableListings();
      },
      get mode() {
        return listingsMode();
      },
      get period() {
        return areaDataStore.areaPeriod;
      }
    }));
    insert(_el$11, createComponent(Pagination, {
      get totalItems() {
        return availableListings();
      },
      get currentPage() {
        return currentPage() + 1;
      },
      pageChange: page => setPage(page),
      style: "align-self: center"
    }), null);
    createRenderEffect(_$p => style(_el$9, `height: ${listingsVisible() ? "auto" : "0"}; `, _$p));
    return _el$9;
  })(), (() => {
    const _el$13 = _tmpl$6(),
      _el$14 = _el$13.firstChild,
      _el$15 = _el$14.firstChild,
      _el$16 = _el$15.nextSibling,
      _el$18 = _el$14.nextSibling,
      _el$19 = _el$18.firstChild,
      _el$20 = _el$19.nextSibling,
      _el$22 = _el$18.nextSibling,
      _el$23 = _el$22.firstChild,
      _el$24 = _el$23.nextSibling,
      _el$26 = _el$22.nextSibling,
      _el$27 = _el$26.firstChild,
      _el$28 = _el$27.nextSibling;
    insert(_el$14, createComponent(Homes, {
      style: "width: 85px; height: auto;"
    }), _el$15);
    insert(_el$16, createComponent(Show, {
      get when() {
        return areaDataStore.propertyStats;
      },
      get children() {
        const _el$17 = _tmpl$5();
        insert(_el$17, () => areaDataStore.propertyStats.taxroll);
        return _el$17;
      }
    }));
    insert(_el$18, createComponent(TurnOverHomes, {
      style: "width: 85px; height: auto;"
    }), _el$19);
    insert(_el$20, createComponent(Show, {
      get when() {
        return areaDataStore.propertyStats;
      },
      get children() {
        const _el$21 = _tmpl$5();
        insert(_el$21, () => percent(areaDataStore.propertyStats.turnOver));
        return _el$21;
      }
    }));
    insert(_el$22, createComponent(AvgDom, {
      style: "width: 85px; height: auto;"
    }), _el$23);
    insert(_el$24, createComponent(Show, {
      get when() {
        return areaDataStore.propertyStats;
      },
      get children() {
        const _el$25 = _tmpl$5();
        insert(_el$25, () => areaDataStore.propertyStats.avgDOM);
        return _el$25;
      }
    }));
    insert(_el$26, createComponent(AvgYIH, {
      style: "width: 85px; height: auto;"
    }), _el$27);
    insert(_el$28, createComponent(Show, {
      get when() {
        return areaDataStore.propertyStats;
      },
      get children() {
        const _el$29 = _tmpl$5();
        insert(_el$29, () => areaDataStore.propertyStats.avgYearsInHome);
        return _el$29;
      }
    }));
    return _el$13;
  })()];
});
const captions = ["Single Family", "Condos"];
const ListingTableLinks = props => {
  return (() => {
    const _el$30 = _tmpl$8();
    insert(_el$30, createComponent(Show, {
      get when() {
        return props.propertyType !== -1;
      },
      get children() {
        return [(() => {
          const _el$31 = _tmpl$5();
          _el$31.$$click = () => props.showProperties(props.propertyView, props.status);
          insert(_el$31, () => props.title + ": ", null);
          insert(_el$31, createComponent(Show, {
            get when() {
              return !areaDataStore.loading;
            },
            get children() {
              return areaDataStore.propertyStats[props.status];
            }
          }), null);
          insert(_el$31, createComponent(Show, {
            get when() {
              return areaDataStore.loading;
            },
            get children() {
              return createComponent(Spinner, {
                style: {
                  margin: "0",
                  "vertical-align": "middle",
                  height: "25px",
                  width: "auto"
                }
              });
            }
          }), null);
          return _el$31;
        })(), createMemo(() => createMemo(() => props.status == "new")() ? _tmpl$9() : "")];
      }
    }), null);
    insert(_el$30, createComponent(Show, {
      get when() {
        return props.propertyType === -1;
      },
      get children() {
        return [(() => {
          const _el$32 = _tmpl$5();
          _el$32.$$click = () => props.showProperties(0, props.status);
          insert(_el$32, () => props.title + ": ", null);
          insert(_el$32, createComponent(Show, {
            get when() {
              return listingsStore.loading;
            },
            get children() {
              return createComponent(Spinner, {
                style: "margin: 0; vertical-align: middle; height: 25px"
              });
            }
          }), null);
          return _el$32;
        })(), (() => {
          const _el$33 = _tmpl$7(),
            _el$34 = _el$33.firstChild;
          _el$33.$$click = () => props.showProperties(1, props.status);
          insert(_el$33, () => captions[1], _el$34);
          insert(_el$33, () => !listingsStore.loading && listingsStore[props.status][1], null);
          insert(_el$33, createComponent(Show, {
            get when() {
              return listingsStore.loading;
            },
            get children() {
              return createComponent(Spinner, {
                style: "margin: 0; vertical-align: middle; height: 25px"
              });
            }
          }), null);
          return _el$33;
        })()];
      }
    }), null);
    return _el$30;
  })();
};
delegateEvents(["click"]);

export { FastFacts as default };
