import { i as insert, e as createRenderEffect, f as style, t as template } from './index.js';

const _tmpl$ = /*#__PURE__*/template(`<div class="mr-icon"><div></div><div class="avg-text"></div><div class="avg-value">`);
//import { lazy } from "solid-js";
//import BarsIcon from "@/assets/bar-chart.svg";

const MRIcon = props => {
  //const SVG = lazy(() => import(/* @vite-ignore */ `../assets/${icon}.svg`));

  return (() => {
    const _el$ = _tmpl$(),
      _el$2 = _el$.firstChild,
      _el$3 = _el$2.nextSibling,
      _el$4 = _el$3.nextSibling;
    insert(_el$2, () => props.icon);
    insert(_el$3, () => props.caption);
    insert(_el$4, () => props.value);
    createRenderEffect(_$p => style(_el$, props.style, _$p));
    return _el$;
  })();
};

export { MRIcon as M };
