import { i as insert, g as createMemo, t as template } from './index.js';

const _tmpl$ = /*#__PURE__*/template(`<span style="font-weight:bold">`);
const ListingsShowing = props => {
  return ["Showing", (() => {
    const _el$ = _tmpl$();
    insert(_el$, () => ` ${props.offset + 1}-${props.offset + Math.min(Math.min(props.pageSize, props.len), props.len - props.offset)} `);
    return _el$;
  })(), "of", (() => {
    const _el$2 = _tmpl$();
    insert(_el$2, () => ` ${props.len} `);
    return _el$2;
  })(), createMemo(() => props.mode === "sold" ? `sold listings in the last ${props.period} months` : `${props.mode} listings`), ". DOM: Days On Market"];
};

export { ListingsShowing as L };
