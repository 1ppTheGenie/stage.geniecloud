import { c as createSignal, b as createComponent, m as mergeProps, P as Portal, o as onMount, l as onCleanup, n as lazy, _ as __vitePreload, f as style, i as insert, k as Suspense, S as Show, e as createRenderEffect, h as className, t as template } from './index.js';
import { C as Context4Settings } from './index2.js';

const __variableDynamicImportRuntimeHelper = (glob, path) => {
    const v = glob[path];
    if (v) {
        return typeof v === 'function' ? v() : Promise.resolve(v);
    }
    return new Promise((_, reject) => {
        (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(reject.bind(null, new Error('Unknown variable dynamic import: ' + path)));
    });
};

const _tmpl$ = /*#__PURE__*/template(`<footer style="padding-bottom:1rem;"><span>Source:<a style="margin:auto 0.25rem;color:var(--theme-sub-heading-color);" href="https://thegenie.ai">TheGenie.ai</a></span><span>Recipients to verify all information.</span><span>&nbsp;`),
  _tmpl$2 = /*#__PURE__*/template(`<div>`),
  _tmpl$3 = /*#__PURE__*/template(`<div>Analyzing latest market data...`);
const cssRootOverrides = {
  "--pending": "var(--pending-yellow)",
  "--sold": "var(--sold-red)",
  "--active": "var(--active-green)",
  "--new": "var(--new-blue)"
};
const DATASTUB = "data-genie-";
const CAMELCASE = {
  agentid: "agentId",
  renderid: "renderId",
  layout: "layout",
  theme: "theme",
  areaid: "areaId",
  areaid: "areaID",
  areaperiod: "areaPeriod",
  period: "areaPeriod",
  leadareaid: "leadAreaId",
  mode: "mode",
  mapstyle: "mapStyle",
  mapicon: "mapIcon",
  mapkey: "mapKey",
  mlsnumber: "mlsNumber",
  mlsid: "mlsId",
  blurprice: "blurPrice",
  signin: "signIn",
  pricepercent: "pricePercent",
  propertytype: "propertyTypeId",
  nocopyright: "noCopyright",
  openhouse: "openHouseTimes",
  hideavm: "hideAVM",
  downloadurl: "downloadUrl",
  leadcapture: "isLeadCapture",
  nomargin: "noMargin"
};
const defaultSettings = {
  mode: "sold",
  propertyTypeID: 0,
  areaPeriod: 6,
  mapStyle: "street-v11",
  mapKey: false,
  mapIcon: "dot",
  blurPrice: false,
  hideAVM: false,
  pricePercent: "percent",
  signIn: false,
  noCopyright: true,
  noMargin: true
};
const _Genies = (() => {
  const genies = [];
  const linkedThemes = [];
  document.querySelectorAll(`.genie-embed`).forEach((genieNode, index, embeds) => {
    const source = Object.fromEntries(new URLSearchParams(window.location.search).entries());
    const [queryParams] = createSignal(Object.keys(source).reduce((destination, key) => {
      destination[key.toLowerCase()] = source[key];
      return destination;
    }, {}));
    const settings = {
      ...defaultSettings,
      ...window.gHub,
      ...queryParams
    };
    const attrs = genieNode.getAttributeNames();
    attrs.forEach(name => {
      if (name.startsWith(DATASTUB)) {
        settings[CAMELCASE[name.replace(DATASTUB, "")]] = genieNode.getAttribute(name);
      }
    });
    if (queryParams.shorturldataid) {
      (async () => {
        const agentId = document.querySelector(`div[${DATASTUB}agentid]`)?.getAttribute(`${DATASTUB}agentid`);
        if (agentId) {
          const r = await getShortData({
            shortID: queryParams.shorturldataid,
            token: queryParams.token,
            agentId
          });
          let ov = Object.fromEntries(Object.entries(r.result.property).map(([k, v]) => [k.toLowerCase(), v]));

          // Fudge to prevent identically named param overriding the built in one
          if (ov.areaid && !ov.leadareaid) {
            ov.leadareaid = ov.areaid;
            delete ov.areaid;
          }
          setOverrideSettings(ov);
        }
      })();
    }
    settings.layout && genieNode.classList.add(settings.layout);
    settings.theme && genieNode.classList.add(settings.theme);
    if (!linkedThemes.includes(settings.theme)) {
      linkedThemes.push(settings.theme);
      var link = document.createElement("link");
      link.rel = "stylesheet";
      link.type = "text/css";
      link.href = `${window.gHub.siteUrl}_assets/themes/${settings.theme}.css`;
      document.head.appendChild(link);
    }
    genies.push(createComponent(Portal, {
      mount: genieNode,
      get children() {
        return createComponent(Genie, mergeProps(settings, {
          get isLast() {
            return index === embeds.length;
          }
        }));
      }
    }));
  });
  return genies;
});
const Genie = ({
  layout,
  nocopyright,
  nomargin,
  isLast,
  ...props
}) => {
  const [customs, setCustomizations] = createSignal();
  const msgListener = msg => {
    if (msg.data.type === "Customizations" && msg.data.values) {
      setCustomizations(msg.data.values);
    }
  };
  onMount(() => {
    // Two ways of getting the custom overrides in: from embed HTML or via the IFRAME messaging, the latter being for the Wizard editor
    let customs = {};
    document.querySelectorAll(`[data-genie-custom]`).forEach(node => {
      customs[node.getAttribute("data-custom-id")] = node.innerHTML;
    });
    if (Object.keys(customs).length > 0) {
      setCustomizations(customs);
    } else {
      window.addEventListener("message", msgListener);
    }
  });
  onCleanup(() => window.removeEventListener("message", msgListener));
  const Layout = lazy(() => __variableDynamicImportRuntimeHelper((/* #__PURE__ */ Object.assign({"./FastFacts.jsx": () => __vitePreload(() => import('./FastFacts.js'),true?[window.gHub.buildUrl("assets/FastFacts.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/Editable.js"),window.gHub.buildUrl("assets/ListingsShowing.js"),window.gHub.buildUrl("assets/Spinner.js"),window.gHub.buildUrl("assets/FastFacts.css")]:void 0,import.meta.url),"./LeadMarketIsShifting.jsx": () => __vitePreload(() => import('./LeadMarketIsShifting.js'),true?[window.gHub.buildUrl("assets/LeadMarketIsShifting.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css")]:void 0,import.meta.url),"./ListToSold.jsx": () => __vitePreload(() => import('./ListToSold.js'),true?[window.gHub.buildUrl("assets/ListToSold.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/Editable.js"),window.gHub.buildUrl("assets/ListToSold.css")]:void 0,import.meta.url),"./ListingMapStyleOne.jsx": () => __vitePreload(() => import('./ListingMapStyleOne.js'),true?[window.gHub.buildUrl("assets/ListingMapStyleOne.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/ListingsShowing.js"),window.gHub.buildUrl("assets/LeafletMap.js"),window.gHub.buildUrl("assets/ListingMapStyleOne.css")]:void 0,import.meta.url),"./ListingMapStyleTwo.jsx": () => __vitePreload(() => import('./ListingMapStyleTwo.js'),true?[window.gHub.buildUrl("assets/ListingMapStyleTwo.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/LeafletMap.js"),window.gHub.buildUrl("assets/ListingsShowing.js")]:void 0,import.meta.url),"./MarketActivity.jsx": () => __vitePreload(() => import('./MarketActivity.js'),true?[window.gHub.buildUrl("assets/MarketActivity.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/LeafletMap.js"),window.gHub.buildUrl("assets/ListingsShowing.js")]:void 0,import.meta.url),"./MarketHistory.jsx": () => __vitePreload(() => import('./MarketHistory.js'),true?[window.gHub.buildUrl("assets/MarketHistory.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/Editable.js"),window.gHub.buildUrl("assets/MarketHistory.css")]:void 0,import.meta.url),"./MarketRadar.jsx": () => __vitePreload(() => import('./MarketRadar.js'),true?[window.gHub.buildUrl("assets/MarketRadar.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/MRIcon.js")]:void 0,import.meta.url),"./MarketReportTiles.jsx": () => __vitePreload(() => import('./MarketReportTiles.js'),true?[window.gHub.buildUrl("assets/MarketReportTiles.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.css")]:void 0,import.meta.url),"./MarketTrending.jsx": () => __vitePreload(() => import('./MarketTrending.js'),true?[window.gHub.buildUrl("assets/MarketTrending.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/MRIcon.js"),window.gHub.buildUrl("assets/Spinner.js"),window.gHub.buildUrl("assets/MarketTrending.css")]:void 0,import.meta.url),"./MarketUpdate.jsx": () => __vitePreload(() => import('./MarketUpdate.js'),true?[window.gHub.buildUrl("assets/MarketUpdate.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/LeafletMap.js"),window.gHub.buildUrl("assets/MarketUpdate.css")]:void 0,import.meta.url),"./PeopleBuying.jsx": () => __vitePreload(() => import('./PeopleBuying.js'),true?[window.gHub.buildUrl("assets/PeopleBuying.js"),window.gHub.buildUrl("assets/index.js"),window.gHub.buildUrl("assets/index2.js"),window.gHub.buildUrl("assets/index.css"),window.gHub.buildUrl("assets/Pagination.js"),window.gHub.buildUrl("assets/Pagination.css"),window.gHub.buildUrl("assets/Editable.js"),window.gHub.buildUrl("assets/Spinner.js"),window.gHub.buildUrl("assets/PeopleBuying.css")]:void 0,import.meta.url)})), `./${layout}.jsx`));
  return (() => {
    const _el$ = _tmpl$2();
    style(_el$, cssRootOverrides);
    insert(_el$, createComponent(Context4Settings.Provider, {
      value: props,
      get children() {
        return createComponent(Suspense, {
          get fallback() {
            return _tmpl$3();
          },
          get children() {
            return createComponent(Layout, {});
          }
        });
      }
    }), null);
    insert(_el$, createComponent(Show, {
      when: !nocopyright,
      get children() {
        const _el$2 = _tmpl$(),
          _el$3 = _el$2.firstChild,
          _el$4 = _el$3.nextSibling,
          _el$5 = _el$4.nextSibling;
          _el$5.firstChild;
        insert(_el$5, () => `\u00a9 ${new Date().getFullYear()} 1parkplace, Inc.`, null);
        return _el$2;
      }
    }), null);
    createRenderEffect(() => className(_el$, `genie-wrap ${layout.toLowerCase()}${nomargin ? " no-margin" : ""}`));
    return _el$;
  })();
};

export { _Genies as default };
