import { j as createResource, g as createMemo, c as createSignal, a as createEffect, b as createComponent, i as insert, e as createRenderEffect, h as className, S as Show, t as template, d as delegateEvents } from './index.js';
import { m as areaMonthlyStore, b as areaDataStore } from './index2.js';
import { f as format, H as HomeTypes } from './Pagination.js';
import { E as Editable } from './Editable.js';

let genieCharts;
const LineChart = props => {
  const [charts] = createResource(loadCharts);
  return createMemo((() => {
    const _c$ = createMemo(() => !!!charts.loading);
    return () => _c$() && genieCharts.draw("90%", "70%", props.data, props.element);
  })());
};
const loadCharts = () => new Promise(resolve => {
  if (!document.getElementById("genie-charts")) {
    var link = document.createElement("link");
    link.rel = "stylesheet";
    link.type = "text/css";
    link.href = "https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css";
    document.head.appendChild(link);
    var script = document.createElement("script");
    script.src = "https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js";
    script.id = "chartist-script";
    script.onload = () => {
      var gScript = document.createElement("script");
      gScript.src = `https://cloud.thegenie.ai/_assets/_js/charts.js?v=3`;
      gScript.id = "genie-charts";
      gScript.onload = () => {
        genieCharts = initCharts();
        resolve(true);
      };
      document.head.appendChild(gScript);
    };
    document.head.appendChild(script);
  } else {
    resolve(true);
  }
});

const marketHistory = '';

const _tmpl$ = /*#__PURE__*/template(`<h1>A History of the<br>&#160;Market`),
  _tmpl$2 = /*#__PURE__*/template(`<div class="curved-tabs"><span>Price per sq/ft</span><span>Price history</span><span>Sales history`),
  _tmpl$3 = /*#__PURE__*/template(`<div class="market-history-chart">`);
var link = document.createElement("link");
link.rel = "stylesheet";
link.type = "text/css";
link.href = "https://cdn.rawgit.com/tiaanduplessis/wenk/master/dist/wenk.css";
document.head.appendChild(link);
const MarketHistory = (() => {
  const [graphView, setGraphView] = createSignal("averagePricePerSqFt");
  const [series, setSeries] = createSignal();
  const [labels, setLabels] = createSignal();
  const [high, setHigh] = createSignal();
  const [low, setLow] = createSignal();
  createEffect(() => {
    if (areaMonthlyStore.loading == false) {
      const stats = [...areaMonthlyStore.stats.filter(stats => stats.propertyTypeId === areaDataStore.propertyTypeID)];
      setLabels(stats.slice(Math.max(stats.length - areaDataStore.areaPeriod, 1)).map(m => format(new Date(m.yearPart, m.monthPart - 1, 1), "MMM yy")));
      const series = stats.slice(Math.max(stats.length - areaDataStore.areaPeriod, 1)).map(m => ({
        name: format(new Date(m.yearPart, m.monthPart - 1, 1), "MMM yy"),
        value: m[graphView()]
      }));
      setSeries(series);
      const min = Math.min.apply(9999999999999, series.map(i => i.value));
      const max = Math.max.apply(0, series.map(i => i.value));
      switch (graphView) {
        case "averagePricePerSqFt":
          setLow(Math.round(min / 1.4 / 250000) * 250000);
          setHigh(Math.ceil(max * 1.3 / 250000) * 250000);
          break;
        case "averageSalePrice":
          setLow(Math.round(min / 1.4 / 250) * 250);
          setHigh(Math.ceil(max * 1.3 / 250) * 250);
          break;
        default:
          setLow(min / 1.4);
          setHigh(max * 1.3);
          break;
      }
    }
  });
  return [createComponent(Editable, {
    style: "text-align:center",
    id: "market-history-title",
    get children() {
      const _el$ = _tmpl$(),
        _el$2 = _el$.firstChild,
        _el$3 = _el$2.nextSibling,
        _el$4 = _el$3.nextSibling;
      insert(_el$, () => areaDataStore.areaName, _el$4);
      return _el$;
    }
  }), createComponent(HomeTypes, {
    container: `MarketHistory-`
  }), (() => {
    const _el$5 = _tmpl$2(),
      _el$6 = _el$5.firstChild,
      _el$7 = _el$6.nextSibling,
      _el$8 = _el$7.nextSibling;
    _el$6.$$click = () => setGraphView("averagePricePerSqFt");
    _el$7.$$click = () => setGraphView("averageSalePrice");
    _el$8.$$click = () => setGraphView("soldCount");
    createRenderEffect(_p$ => {
      const _v$ = graphView() === "averagePricePerSqFt" ? "active" : "",
        _v$2 = graphView() === "averageSalePrice" ? "active" : "",
        _v$3 = graphView() === "soldCount" ? "active" : "";
      _v$ !== _p$._v$ && className(_el$6, _p$._v$ = _v$);
      _v$2 !== _p$._v$2 && className(_el$7, _p$._v$2 = _v$2);
      _v$3 !== _p$._v$3 && className(_el$8, _p$._v$3 = _v$3);
      return _p$;
    }, {
      _v$: undefined,
      _v$2: undefined,
      _v$3: undefined
    });
    return _el$5;
  })(), (() => {
    const _el$9 = _tmpl$3();
    insert(_el$9, createComponent(Show, {
      get when() {
        return series();
      },
      get children() {
        return createComponent(LineChart, {
          element: ".market-history-chart",
          margin: {
            top: 15,
            right: 15,
            bottom: 15,
            left: 15
          },
          width: 900,
          height: 300,
          get data() {
            return {
              data: {
                labels: labels(),
                series: [series()]
              },
              options: {
                width: "100%",
                height: "100%",
                axisX: {
                  scaleLabel: "Month",
                  onlyInteger: false
                },
                axisY: {
                  high: high(),
                  low: low(),
                  offset: 60,
                  onlyInteger: true,
                  labelInterpolationFnc: graphView() === "soldCount" ? window.gg.charts.number : window.gg.charts.dollarRound,
                  scaleLabel: graphView() === "soldCount" ? "Total Sold" : "Price"
                }
              }
            };
          }
        });
      }
    }));
    return _el$9;
  })()];
});
delegateEvents(["click"]);

export { MarketHistory as default };
