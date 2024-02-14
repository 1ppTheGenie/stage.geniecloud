import { i as insert, t as template, d as delegateEvents } from './index.js';
import { a as useSettings, C as Context4Settings } from './index2.js';

const _tmpl$ = /*#__PURE__*/template(`<div id="shadow-layer"><div id="market-is-shifting"><div>`),
  _tmpl$2 = /*#__PURE__*/template(`<p>All set! Your report will be in your inbox shortly.`),
  _tmpl$3 = /*#__PURE__*/template(`<button class="upper rounded">Close`),
  _tmpl$4 = /*#__PURE__*/template(`<div style="text-align:center"><h1 class="upper center"></h1><h2 class="center">See the latest <span class="upper">trends</span></h2><h3 class="upper center" style="margin-bottom:3rem"></h3><input type="email" class="rounded" placeholder="Your email address" style="margin-right:1rem"><button class="upper rounded">Send`),
  _tmpl$5 = /*#__PURE__*/template(`<img src="/_assets/_img/genie-market-report-book.png" alt="Laptop">`),
  _tmpl$6 = /*#__PURE__*/template(`<div class="close">X`);
const LeadMarketIsShifting = (() => {
  const settings = useSettings(Context4Settings);
  const [isOpen, setIsOpen] = useState(false);
  const [hasOpened, setHasOpened] = useState(false);
  const [hasSent, setHasSent] = useState(false);
  const [emailAddress, setEmailAddress] = useState("");
  useEffect(() => {
    if (!isOpen) {
      let timer1 = setTimeout(() => {
        setIsOpen(true);
      }, settings.popuptimeout ?? 15000);
      return () => {
        clearTimeout(timer1);
      };
    }
  }, [isOpen, setIsOpen, settings.popuptimeout]);
  useEffect(() => {
    if (isOpen && !hasOpened) {
      setHasOpened(true);
    }
  }, [isOpen, hasOpened, setHasOpened]);
  if (!isOpen) {
    return null;
  }
  return (() => {
    const _el$ = _tmpl$(),
      _el$2 = _el$.firstChild,
      _el$3 = _el$2.firstChild;
    insert(_el$3, hasSent && [_tmpl$2(), (() => {
      const _el$5 = _tmpl$3();
      _el$5.$$click = () => {
        setIsOpen(false);
      };
      return _el$5;
    })()], null);
    insert(_el$3, !hasSent && [(() => {
      const _el$6 = _tmpl$4(),
        _el$7 = _el$6.firstChild,
        _el$8 = _el$7.nextSibling,
        _el$9 = _el$8.nextSibling,
        _el$10 = _el$9.nextSibling,
        _el$11 = _el$10.nextSibling;
      insert(_el$7, () => settings.mstitle || `The market is shifting`);
      insert(_el$9, () => settings.mscta || `Get your market insider report`);
      _el$10.addEventListener("change", e => setEmailAddress(e.target.value));
      _el$11.$$click = () => {
        window.gHub.addLead("Market Shifting", {
          email: emailAddress,
          funnel_id: settings.collection_id
        });
        setHasSent(true);
      };
      return _el$6;
    })(), _tmpl$5(), (() => {
      const _el$13 = _tmpl$6();
      _el$13.$$click = e => setIsOpen(false);
      return _el$13;
    })()], null);
    return _el$;
  })();
});
delegateEvents(["click"]);

export { LeadMarketIsShifting as default };
