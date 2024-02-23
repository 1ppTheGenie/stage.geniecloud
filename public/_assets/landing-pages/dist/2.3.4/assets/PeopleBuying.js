import { b as createComponent, i as insert, g as createMemo, A as Switch, M as Match, e as createRenderEffect, f as style, s as setAttribute, I as Index, t as template } from './index.js';
import { k as areaDataStore, q as propertyTypeCaption, c as currency } from './index2.js';
import { H as HomeTypes } from './Pagination.js';
import { E as Editable } from './Editable.js';
import { S as Spinner } from './Spinner.js';

const peopleBuying = '';

const _tmpl$ = /*#__PURE__*/template(`<h1>Look at What People are&#160;Buying`),
  _tmpl$2 = /*#__PURE__*/template(`<p style="margin:0 2rem" class="subtitle-font"><br>`),
  _tmpl$3 = /*#__PURE__*/template(`<div id="colors" class="horizontal-bars">`),
  _tmpl$4 = /*#__PURE__*/template(`<p>Sorry, there is no data for this period.`),
  _tmpl$5 = /*#__PURE__*/template(`<div><span class="graph-number"></span><span>`),
  _tmpl$6 = /*#__PURE__*/template(`<span>None sold`),
  _tmpl$7 = /*#__PURE__*/template(`<span class="color"><span data-wenk-pos="top">`);
var link = document.createElement("link");
link.rel = "stylesheet";
link.type = "text/css";
link.href = "https://cdn.rawgit.com/tiaanduplessis/wenk/master/dist/wenk.css";
document.head.appendChild(link);
const PeopleBuying = (() => {
  return [createComponent(Editable, {
    id: "people-buying-heading",
    get children() {
      return _tmpl$();
    }
  }), (() => {
    const _el$2 = _tmpl$2(),
      _el$3 = _el$2.firstChild;
    insert(_el$2, () => `${areaDataStore.areaName} has seen a lot of movement of \n`, _el$3);
    insert(_el$2, () => `${areaDataStore.topSize.beds > 0 ? areaDataStore.topSize.beds + " bedroom" : "studio"}  ${propertyTypeCaption()} in the past ${areaDataStore.areaPeriod} months.`, null);
    return _el$2;
  })(), createComponent(HomeTypes, {
    get container() {
      return `PeopleBuying-${areaDataStore.areaid}`;
    }
  }), createMemo((() => {
    const _c$ = createMemo(() => !!!areaDataStore.bedroomStats);
    return () => _c$() && _tmpl$4();
  })()), (() => {
    const _el$4 = _tmpl$3();
    insert(_el$4, createComponent(Index, {
      get each() {
        return areaDataStore.bedroomStats;
      },
      children: (size, i) => {
        // Only bedroom counts up to 5?
        if (i > 5) return null;

        // Don't show Studio if none sold
        if (size().beds === 0 && size().sold === 0) return null;
        return (() => {
          const _el$6 = _tmpl$5(),
            _el$7 = _el$6.firstChild,
            _el$8 = _el$7.nextSibling;
          insert(_el$7, createComponent(Switch, {
            get children() {
              return [createComponent(Match, {
                get when() {
                  return size().beds < 1;
                },
                children: "Studio"
              }), createComponent(Match, {
                get when() {
                  return createMemo(() => size().beds > 0)() && size().beds < 5;
                },
                get children() {
                  return `${size().beds} br`;
                }
              }), createComponent(Match, {
                get when() {
                  return size().beds === 5;
                },
                children: "5+ br"
              })];
            }
          }));
          insert(_el$8, (() => {
            const _c$2 = createMemo(() => size().sold === 0);
            return () => _c$2() && _tmpl$6();
          })(), null);
          insert(_el$8, (() => {
            const _c$3 = createMemo(() => size().sold > 0);
            return () => _c$3() && (() => {
              const _el$10 = _tmpl$7(),
                _el$11 = _el$10.firstChild;
              insert(_el$11, (() => {
                const _c$4 = createMemo(() => !!!areaDataStore.loading);
                return () => _c$4() ? `${size().sold} ${propertyTypeCaption(size().sold == 1)} sold` : createComponent(Spinner, {
                  style: "margin: 0; width: 16px; transform: scale(2.5)",
                  fill: "var(--theme-body-color)"
                });
              })());
              createRenderEffect(_p$ => {
                const _v$ = `cursor:pointer; font-weight:bold;--size:${(!areaDataStore.loading ? size().sold : 0) / areaDataStore.topSize.sold * 100}%;textTransform:capitalize;color:#fff;`,
                  _v$2 = `Avg: ${currency(size().avgSalePrice)}`;
                _p$._v$ = style(_el$10, _v$, _p$._v$);
                _v$2 !== _p$._v$2 && setAttribute(_el$11, "data-wenk", _p$._v$2 = _v$2);
                return _p$;
              }, {
                _v$: undefined,
                _v$2: undefined
              });
              return _el$10;
            })();
          })(), null);
          return _el$6;
        })();
      }
    }));
    return _el$4;
  })()];
});

export { PeopleBuying as default };
