import { s as setAttribute, e as createRenderEffect, f as style, t as template } from './index.js';

const _tmpl$ = /*#__PURE__*/template(`<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid"><g transform="rotate(0 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.9166666666666666s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(30 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.8333333333333334s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(60 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.75s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(90 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.6666666666666666s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(120 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.5833333333333334s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(150 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.5s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(180 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.4166666666666667s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(210 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.3333333333333333s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(240 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.25s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(270 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.16666666666666666s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(300 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="-0.08333333333333333s" repeatCount="indefinite"></animate></rect></g><g transform="rotate(330 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="0s" repeatCount="indefinite">`);
const Spinner = props => {
  let {
    style: style$1,
    fill
  } = {
    ...props
  };
  fill = fill ?? "var(--theme-heading-color)";
  const finalStyle = {
    width: "40px",
    display: "inline-block",
    margin: "0.25rem",
    ...(style$1 ?? {})
  };
  return (() => {
    const _el$ = _tmpl$(),
      _el$2 = _el$.firstChild,
      _el$3 = _el$2.firstChild,
      _el$4 = _el$2.nextSibling,
      _el$5 = _el$4.firstChild,
      _el$6 = _el$4.nextSibling,
      _el$7 = _el$6.firstChild,
      _el$8 = _el$6.nextSibling,
      _el$9 = _el$8.firstChild,
      _el$10 = _el$8.nextSibling,
      _el$11 = _el$10.firstChild,
      _el$12 = _el$10.nextSibling,
      _el$13 = _el$12.firstChild,
      _el$14 = _el$12.nextSibling,
      _el$15 = _el$14.firstChild,
      _el$16 = _el$14.nextSibling,
      _el$17 = _el$16.firstChild,
      _el$18 = _el$16.nextSibling,
      _el$19 = _el$18.firstChild,
      _el$20 = _el$18.nextSibling,
      _el$21 = _el$20.firstChild,
      _el$22 = _el$20.nextSibling,
      _el$23 = _el$22.firstChild,
      _el$24 = _el$22.nextSibling,
      _el$25 = _el$24.firstChild;
    setAttribute(_el$3, "fill", fill);
    setAttribute(_el$5, "fill", fill);
    setAttribute(_el$7, "fill", fill);
    setAttribute(_el$9, "fill", fill);
    setAttribute(_el$11, "fill", fill);
    setAttribute(_el$13, "fill", fill);
    setAttribute(_el$15, "fill", fill);
    setAttribute(_el$17, "fill", fill);
    setAttribute(_el$19, "fill", fill);
    setAttribute(_el$21, "fill", fill);
    setAttribute(_el$23, "fill", fill);
    setAttribute(_el$25, "fill", fill);
    createRenderEffect(_$p => style(_el$, finalStyle, _$p));
    return _el$;
  })();
};

export { Spinner as S };
