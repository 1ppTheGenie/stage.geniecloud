(function () {
	const t = document.createElement("link").relList;
	if (t && t.supports && t.supports("modulepreload")) return;
	for (const o of document.querySelectorAll('link[rel="modulepreload"]')) s(o);
	new MutationObserver(o => {
		for (const i of o)
			if (i.type === "childList")
				for (const r of i.addedNodes)
					r.tagName === "LINK" && r.rel === "modulepreload" && s(r);
	}).observe(document, { childList: !0, subtree: !0 });
	function n(o) {
		const i = {};
		return (
			o.integrity && (i.integrity = o.integrity),
			o.referrerpolicy && (i.referrerPolicy = o.referrerpolicy),
			o.crossorigin === "use-credentials"
				? (i.credentials = "include")
				: o.crossorigin === "anonymous"
				? (i.credentials = "omit")
				: (i.credentials = "same-origin"),
			i
		);
	}
	function s(o) {
		if (o.ep) return;
		o.ep = !0;
		const i = n(o);
		fetch(o.href, i);
	}
})();
const $ = {};
function be(e) {
	$.context = e;
}
const ve = (e, t) => e === t,
	we = Symbol("solid-track"),
	U = { equals: ve };
let fe = ge;
const N = 1,
	G = 2,
	de = { owned: null, cleanups: null, context: null, owner: null };
var v = null;
let B = null,
	b = null,
	w = null,
	_ = null,
	z = 0;
function K(e, t) {
	const n = b,
		s = v,
		o = e.length === 0,
		i = o ? de : { owned: null, cleanups: null, context: null, owner: t || s },
		r = o ? e : () => e(() => F(() => te(i)));
	(v = i), (b = null);
	try {
		return R(r, !0);
	} finally {
		(b = n), (v = s);
	}
}
function j(e, t) {
	t = t ? Object.assign({}, U, t) : U;
	const n = {
			value: e,
			observers: null,
			observerSlots: null,
			comparator: t.equals || void 0,
		},
		s = o => (typeof o == "function" && (o = o(n.value)), pe(n, o));
	return [he.bind(n), s];
}
function L(e, t, n) {
	const s = ee(e, t, !1, N);
	M(s);
}
function oe(e, t, n) {
	fe = Ee;
	const s = ee(e, t, !1, N);
	(s.user = !0), _ ? _.push(s) : M(s);
}
function V(e, t, n) {
	n = n ? Object.assign({}, U, n) : U;
	const s = ee(e, t, !0, 0);
	return (
		(s.observers = null),
		(s.observerSlots = null),
		(s.comparator = n.equals || void 0),
		M(s),
		he.bind(s)
	);
}
function F(e) {
	let t,
		n = b;
	return (b = null), (t = e()), (b = n), t;
}
function Ce(e) {
	return (
		v === null ||
			(v.cleanups === null ? (v.cleanups = [e]) : v.cleanups.push(e)),
		e
	);
}
function he() {
	const e = B;
	if (this.sources && (this.state || e))
		if (this.state === N || e) M(this);
		else {
			const t = w;
			(w = null), R(() => J(this), !1), (w = t);
		}
	if (b) {
		const t = this.observers ? this.observers.length : 0;
		b.sources
			? (b.sources.push(this), b.sourceSlots.push(t))
			: ((b.sources = [this]), (b.sourceSlots = [t])),
			this.observers
				? (this.observers.push(b),
				  this.observerSlots.push(b.sources.length - 1))
				: ((this.observers = [b]),
				  (this.observerSlots = [b.sources.length - 1]));
	}
	return this.value;
}
function pe(e, t, n) {
	let s = e.value;
	return (
		(!e.comparator || !e.comparator(s, t)) &&
			((e.value = t),
			e.observers &&
				e.observers.length &&
				R(() => {
					for (let o = 0; o < e.observers.length; o += 1) {
						const i = e.observers[o],
							r = B && B.running;
						r && B.disposed.has(i),
							((r && !i.tState) || (!r && !i.state)) &&
								(i.pure ? w.push(i) : _.push(i), i.observers && ye(i)),
							r || (i.state = N);
					}
					if (w.length > 1e6) throw ((w = []), new Error());
				}, !1)),
		t
	);
}
function M(e) {
	if (!e.fn) return;
	te(e);
	const t = v,
		n = b,
		s = z;
	(b = v = e), xe(e, e.value, s), (b = n), (v = t);
}
function xe(e, t, n) {
	let s;
	try {
		s = e.fn(t);
	} catch (o) {
		e.pure && (e.state = N), me(o);
	}
	(!e.updatedAt || e.updatedAt <= n) &&
		(e.updatedAt != null && "observers" in e ? pe(e, s) : (e.value = s),
		(e.updatedAt = n));
}
function ee(e, t, n, s = N, o) {
	const i = {
		fn: e,
		state: s,
		updatedAt: null,
		owned: null,
		sources: null,
		sourceSlots: null,
		cleanups: null,
		value: t,
		owner: v,
		context: null,
		pure: n,
	};
	return (
		v === null || (v !== de && (v.owned ? v.owned.push(i) : (v.owned = [i]))), i
	);
}
function Q(e) {
	const t = B;
	if (e.state === 0 || t) return;
	if (e.state === G || t) return J(e);
	if (e.suspense && F(e.suspense.inFallback)) return e.suspense.effects.push(e);
	const n = [e];
	for (; (e = e.owner) && (!e.updatedAt || e.updatedAt < z); )
		(e.state || t) && n.push(e);
	for (let s = n.length - 1; s >= 0; s--)
		if (((e = n[s]), e.state === N || t)) M(e);
		else if (e.state === G || t) {
			const o = w;
			(w = null), R(() => J(e, n[0]), !1), (w = o);
		}
}
function R(e, t) {
	if (w) return e();
	let n = !1;
	t || (w = []), _ ? (n = !0) : (_ = []), z++;
	try {
		const s = e();
		return Se(n), s;
	} catch (s) {
		w || (_ = null), me(s);
	}
}
function Se(e) {
	if ((w && (ge(w), (w = null)), e)) return;
	const t = _;
	(_ = null), t.length && R(() => fe(t), !1);
}
function ge(e) {
	for (let t = 0; t < e.length; t++) Q(e[t]);
}
function Ee(e) {
	let t,
		n = 0;
	for (t = 0; t < e.length; t++) {
		const s = e[t];
		s.user ? (e[n++] = s) : Q(s);
	}
	for ($.context && be(), t = 0; t < n; t++) Q(e[t]);
}
function J(e, t) {
	const n = B;
	e.state = 0;
	for (let s = 0; s < e.sources.length; s += 1) {
		const o = e.sources[s];
		o.sources &&
			(o.state === N || n ? o !== t && Q(o) : (o.state === G || n) && J(o, t));
	}
}
function ye(e) {
	const t = B;
	for (let n = 0; n < e.observers.length; n += 1) {
		const s = e.observers[n];
		(!s.state || t) &&
			((s.state = G), s.pure ? w.push(s) : _.push(s), s.observers && ye(s));
	}
}
function te(e) {
	let t;
	if (e.sources)
		for (; e.sources.length; ) {
			const n = e.sources.pop(),
				s = e.sourceSlots.pop(),
				o = n.observers;
			if (o && o.length) {
				const i = o.pop(),
					r = n.observerSlots.pop();
				s < o.length &&
					((i.sourceSlots[r] = s), (o[s] = i), (n.observerSlots[s] = r));
			}
		}
	if (e.owned) {
		for (t = 0; t < e.owned.length; t++) te(e.owned[t]);
		e.owned = null;
	}
	if (e.cleanups) {
		for (t = 0; t < e.cleanups.length; t++) e.cleanups[t]();
		e.cleanups = null;
	}
	(e.state = 0), (e.context = null);
}
function Te(e) {
	return e instanceof Error || typeof e == "string"
		? e
		: new Error("Unknown error");
}
function me(e) {
	throw ((e = Te(e)), e);
}
const $e = Symbol("fallback");
function ie(e) {
	for (let t = 0; t < e.length; t++) e[t]();
}
function Ae(e, t, n = {}) {
	let s = [],
		o = [],
		i = [],
		r = 0,
		l = t.length > 1 ? [] : null;
	return (
		Ce(() => ie(i)),
		() => {
			let p = e() || [],
				u,
				a;
			return (
				p[we],
				F(() => {
					let c = p.length,
						g,
						f,
						h,
						S,
						C,
						m,
						x,
						E,
						T;
					if (c === 0)
						r !== 0 &&
							(ie(i), (i = []), (s = []), (o = []), (r = 0), l && (l = [])),
							n.fallback &&
								((s = [$e]),
								(o[0] = K(y => ((i[0] = y), n.fallback()))),
								(r = 1));
					else if (r === 0) {
						for (o = new Array(c), a = 0; a < c; a++)
							(s[a] = p[a]), (o[a] = K(d));
						r = c;
					} else {
						for (
							h = new Array(c),
								S = new Array(c),
								l && (C = new Array(c)),
								m = 0,
								x = Math.min(r, c);
							m < x && s[m] === p[m];
							m++
						);
						for (
							x = r - 1, E = c - 1;
							x >= m && E >= m && s[x] === p[E];
							x--, E--
						)
							(h[E] = o[x]), (S[E] = i[x]), l && (C[E] = l[x]);
						for (g = new Map(), f = new Array(E + 1), a = E; a >= m; a--)
							(T = p[a]),
								(u = g.get(T)),
								(f[a] = u === void 0 ? -1 : u),
								g.set(T, a);
						for (u = m; u <= x; u++)
							(T = s[u]),
								(a = g.get(T)),
								a !== void 0 && a !== -1
									? ((h[a] = o[u]),
									  (S[a] = i[u]),
									  l && (C[a] = l[u]),
									  (a = f[a]),
									  g.set(T, a))
									: i[u]();
						for (a = m; a < c; a++)
							a in h
								? ((o[a] = h[a]), (i[a] = S[a]), l && ((l[a] = C[a]), l[a](a)))
								: (o[a] = K(d));
						(o = o.slice(0, (r = c))), (s = p.slice(0));
					}
					return o;
				})
			);
			function d(c) {
				if (((i[a] = c), l)) {
					const [g, f] = j(a);
					return (l[a] = f), t(p[a], g);
				}
				return t(p[a]);
			}
		}
	);
}
function D(e, t) {
	return F(() => e(t || {}));
}
function _e(e) {
	const t = "fallback" in e && { fallback: () => e.fallback };
	return V(Ae(() => e.each, e.children, t || void 0));
}
function le(e) {
	let t = !1;
	const n = e.keyed,
		s = V(() => e.when, void 0, { equals: (o, i) => (t ? o === i : !o == !i) });
	return V(() => {
		const o = s();
		if (o) {
			const i = e.children,
				r = typeof i == "function" && i.length > 0;
			return (t = n || r), r ? F(() => i(o)) : i;
		}
		return e.fallback;
	});
}
function Ne(e, t) {
	return V(e, void 0, t ? void 0 : { equals: t });
}
function ke(e, t, n) {
	let s = n.length,
		o = t.length,
		i = s,
		r = 0,
		l = 0,
		p = t[o - 1].nextSibling,
		u = null;
	for (; r < o || l < i; ) {
		if (t[r] === n[l]) {
			r++, l++;
			continue;
		}
		for (; t[o - 1] === n[i - 1]; ) o--, i--;
		if (o === r) {
			const a = i < s ? (l ? n[l - 1].nextSibling : n[i - l]) : p;
			for (; l < i; ) e.insertBefore(n[l++], a);
		} else if (i === l)
			for (; r < o; ) (!u || !u.has(t[r])) && t[r].remove(), r++;
		else if (t[r] === n[i - 1] && n[l] === t[o - 1]) {
			const a = t[--o].nextSibling;
			e.insertBefore(n[l++], t[r++].nextSibling),
				e.insertBefore(n[--i], a),
				(t[o] = n[i]);
		} else {
			if (!u) {
				u = new Map();
				let d = l;
				for (; d < i; ) u.set(n[d], d++);
			}
			const a = u.get(t[r]);
			if (a != null)
				if (l < a && a < i) {
					let d = r,
						c = 1,
						g;
					for (
						;
						++d < o && d < i && !((g = u.get(t[d])) == null || g !== a + c);

					)
						c++;
					if (c > a - l) {
						const f = t[r];
						for (; l < a; ) e.insertBefore(n[l++], f);
					} else e.replaceChild(n[l++], t[r++]);
				} else r++;
			else t[r++].remove();
		}
	}
}
const re = "_$DX_DELEGATE";
function Be(e, t, n) {
	let s;
	return (
		K(o => {
			(s = o),
				t === document ? e() : A(t, e(), t.firstChild ? null : void 0, n);
		}),
		() => {
			s(), (t.textContent = "");
		}
	);
}
function I(e, t, n) {
	const s = document.createElement("template");
	s.innerHTML = e;
	let o = s.content.firstChild;
	return n && (o = o.firstChild), o;
}
function ne(e, t = window.document) {
	const n = t[re] || (t[re] = new Set());
	for (let s = 0, o = e.length; s < o; s++) {
		const i = e[s];
		n.has(i) || (n.add(i), t.addEventListener(i, Le));
	}
}
function A(e, t, n, s) {
	if ((n !== void 0 && !s && (s = []), typeof t != "function"))
		return W(e, t, s, n);
	L(o => W(e, t(), o, n), s);
}
function Le(e) {
	const t = `$$${e.type}`;
	let n = (e.composedPath && e.composedPath()[0]) || e.target;
	for (
		e.target !== n &&
			Object.defineProperty(e, "target", { configurable: !0, value: n }),
			Object.defineProperty(e, "currentTarget", {
				configurable: !0,
				get() {
					return n || document;
				},
			}),
			$.registry &&
				!$.done &&
				(($.done = !0),
				document.querySelectorAll("[id^=pl-]").forEach(s => s.remove()));
		n !== null;

	) {
		const s = n[t];
		if (s && !n.disabled) {
			const o = n[`${t}Data`];
			if ((o !== void 0 ? s.call(n, o, e) : s.call(n, e), e.cancelBubble))
				return;
		}
		n =
			n.host && n.host !== n && n.host instanceof Node ? n.host : n.parentNode;
	}
}
function W(e, t, n, s, o) {
	for ($.context && !n && (n = [...e.childNodes]); typeof n == "function"; )
		n = n();
	if (t === n) return n;
	const i = typeof t,
		r = s !== void 0;
	if (
		((e = (r && n[0] && n[0].parentNode) || e),
		i === "string" || i === "number")
	) {
		if ($.context) return n;
		if ((i === "number" && (t = t.toString()), r)) {
			let l = n[0];
			l && l.nodeType === 3 ? (l.data = t) : (l = document.createTextNode(t)),
				(n = q(e, n, s, l));
		} else
			n !== "" && typeof n == "string"
				? (n = e.firstChild.data = t)
				: (n = e.textContent = t);
	} else if (t == null || i === "boolean") {
		if ($.context) return n;
		n = q(e, n, s);
	} else {
		if (i === "function")
			return (
				L(() => {
					let l = t();
					for (; typeof l == "function"; ) l = l();
					n = W(e, l, n, s);
				}),
				() => n
			);
		if (Array.isArray(t)) {
			const l = [],
				p = n && Array.isArray(n);
			if (Y(l, t, n, o)) return L(() => (n = W(e, l, n, s, !0))), () => n;
			if ($.context) {
				if (!l.length) return n;
				for (let u = 0; u < l.length; u++) if (l[u].parentNode) return (n = l);
			}
			if (l.length === 0) {
				if (((n = q(e, n, s)), r)) return n;
			} else
				p
					? n.length === 0
						? ae(e, l, s)
						: ke(e, n, l)
					: (n && q(e), ae(e, l));
			n = l;
		} else if (t instanceof Node) {
			if ($.context && t.parentNode) return (n = r ? [t] : t);
			if (Array.isArray(n)) {
				if (r) return (n = q(e, n, s, t));
				q(e, n, null, t);
			} else
				n == null || n === "" || !e.firstChild
					? e.appendChild(t)
					: e.replaceChild(t, e.firstChild);
			n = t;
		}
	}
	return n;
}
function Y(e, t, n, s) {
	let o = !1;
	for (let i = 0, r = t.length; i < r; i++) {
		let l = t[i],
			p = n && n[i];
		if (l instanceof Node) e.push(l);
		else if (!(l == null || l === !0 || l === !1))
			if (Array.isArray(l)) o = Y(e, l, p) || o;
			else if (typeof l == "function")
				if (s) {
					for (; typeof l == "function"; ) l = l();
					o = Y(e, Array.isArray(l) ? l : [l], Array.isArray(p) ? p : [p]) || o;
				} else e.push(l), (o = !0);
			else {
				const u = String(l);
				p && p.nodeType === 3 && p.data === u
					? e.push(p)
					: e.push(document.createTextNode(u));
			}
	}
	return o;
}
function ae(e, t, n) {
	for (let s = 0, o = t.length; s < o; s++) e.insertBefore(t[s], n);
}
function q(e, t, n, s) {
	if (n === void 0) return (e.textContent = "");
	const o = s || document.createTextNode("");
	if (t.length) {
		let i = !1;
		for (let r = t.length - 1; r >= 0; r--) {
			const l = t[r];
			if (o !== l) {
				const p = l.parentNode === e;
				!i && !r
					? p
						? e.replaceChild(o, l)
						: e.insertBefore(o, n)
					: p && l.remove();
			} else i = !0;
		}
	} else e.insertBefore(o, n);
	return [o];
}
var Oe =
		typeof globalThis < "u"
			? globalThis
			: typeof window < "u"
			? window
			: typeof global < "u"
			? global
			: typeof self < "u"
			? self
			: {},
	Z = { exports: {} };
(function (e, t) {
	(function () {
		var n = (function () {
				function i() {
					(this.queue = new o()),
						(this.cancellationTokens = []),
						(this.element = null);
				}
				var r = {
					default: {
						className: "default",
						fadeDuration: 400,
						fadeInterval: 16,
						duration: 2e3,
						closeButton: !1,
						immediately: !1,
					},
					success: { className: "success" },
					info: { className: "info" },
					warning: { className: "warning" },
					error: { className: "error", duration: 3e3, closeButton: !0 },
				};
				(i.prototype.initElement = function (d) {
					var c = document.createElement("div"),
						g = document.createElement("div"),
						f = document.createElement("div"),
						h = document.createElement("span");
					c.setAttribute("id", "vanilla-toast-container"),
						g.setAttribute("id", "vanilla-toast"),
						f.setAttribute("id", "vanilla-toast-text"),
						h.setAttribute("id", "vanilla-toast-close-button"),
						(h.innerHTML = "&#10006;"),
						g.appendChild(f),
						g.appendChild(h),
						c.appendChild(g),
						d
							? document.getElementById(seletor).appendChild(containter)
							: document.body.appendChild(c),
						(this.element = {
							container: c,
							toastBox: g,
							text: f,
							closeButton: h,
						}),
						p(this, r.default);
				}),
					(i.prototype.cancel = function () {
						this.cancellationTokens.length &&
							this.cancellationTokens[0].cancel();
					}),
					(i.prototype.cancelAll = function () {
						for (var d = this.cancellationTokens.length, c = 0; c < d; ++c)
							(function (g) {
								g.cancel();
							})(this.cancellationTokens[d - c - 1]);
					}),
					(i.prototype.show = function (d, c, g) {
						var f = this;
						f.element || f.initElement(),
							c || (c = {}),
							c.immediately && f.cancelAll();
						var h = new s();
						return (
							f.queue.enqueue(function (S) {
								var C = c.fadeDuration || r.default.fadeDuration,
									m = c.fadeInterval || r.default.fadeInterval,
									x = Math.min(m / C, 1),
									E = c.duration || r.default.duration;
								(f.element.closeButton.style.display = c.closeButton
									? "inline"
									: "none"),
									(f.element.text.innerHTML = d);
								var T = f.element.toastBox.style;
								(T.opacity = 0), (T.display = "inline-block"), p(f, c);
								var y = null,
									k = function () {
										(y = null),
											f.element.toastBox.removeEventListener("click", O),
											u(f, c, h, function () {
												g && g(), f.cancellationTokens.shift().dispose(), S();
											});
									},
									O = function () {
										!y || (clearTimeout(y), k());
									};
								a(T, x, m, h, function () {
									f.element.toastBox.addEventListener("click", O),
										h.isCancellationRequested
											? k()
											: ((y = setTimeout(k, E)),
											  h.register(function () {
													O();
											  }));
								});
							}),
							f.cancellationTokens.push(h),
							f
						);
					});
				for (var l in r)
					(function (d) {
						i.prototype[d] = function (c, g, f) {
							g || (g = {});
							for (var h in r[d]) g[h] === void 0 && (g[h] = r[d][h]);
							return this.show(c, g, f);
						};
					})(l);
				function p(d, c) {
					d.element.toastBox.className = c.className || r.default.className;
				}
				function u(d, c, g, f) {
					c || (c = {});
					var h = c.fadeDuration || r.default.fadeDuration,
						S = c.fadeInterval || r.default.fadeInterval,
						C = Math.min(S / h, 1),
						m = d.element.toastBox.style;
					return (
						(m.opacity = 1),
						a(m, -C, S, g, function () {
							(m.display = "none"), f && f();
						}),
						d
					);
				}
				function a(d, c, g, f, h) {
					(function S() {
						if (f.isCancellationRequested) {
							(d.opacity = c < 0 ? 0 : 1), h && h();
							return;
						}
						if (((d.opacity = Number(d.opacity) + c), c < 0 && d.opacity < 0))
							h && h();
						else if (c > 0 && d.opacity >= 1) h && h();
						else {
							var C = setTimeout(function () {
								(C = null), S();
							}, g);
							f.register(function () {
								!C || (clearTimeout(C), (C = null), h && h());
							});
						}
					})();
				}
				return i;
			})(),
			s = (function () {
				function i() {
					(this.isCancellationRequested = !1), (this.cancelCallbacks = []);
				}
				return (
					(i.prototype.cancel = function () {
						this.isCancellationRequested = !0;
						for (var r = this.cancelCallbacks.slice(); r.length; ) r.shift()();
					}),
					(i.prototype.register = function (r) {
						this.cancelCallbacks.push(r);
					}),
					(i.prototype.dispose = function () {
						for (; this.cancelCallbacks.length; ) this.cancelCallbacks.shift();
					}),
					i
				);
			})(),
			o = (function () {
				function i() {
					(this.queue = []), (this.isExecuting = !1);
				}
				i.prototype.enqueue = function (l) {
					this.queue.push(l), r(this);
				};
				function r(l) {
					if (!l.isExecuting) {
						var p = l.queue.shift();
						!p ||
							((l.isExecuting = !0),
							p(function () {
								(l.isExecuting = !1), r(l);
							}));
					}
				}
				return i;
			})();
		e.exports && (t = e.exports = new n()), (t.vanillaToast = new n());
	}).call(Oe);
})(Z, Z.exports);
const qe = I('<input type="color">'),
	Pe = e =>
		(() => {
			const t = qe.cloneNode(!0);
			return (
				(t.$$input = n => e.setColor(n.target.value)),
				L(() => (t.value = e.color)),
				t
			);
		})();
ne(["input"]);
ne(["keydown"]);
const De = I("<select></select>"),
	Ie = I("<option></option>"),
	ce = {
		Arial: "../_css/arial.css",
		Barlow: "../_css/barlow.css",
		"Code-Pro": "../_css/code-pro.css",
		"Compass Sans": "../_css/compass-sans.css",
		"Compass Serif": "../_css/compass-serif.css",
		"Futura Condensed": "../_css/futura-condensed.css",
		Gotham: "../_css/gotham.css",
		"Helvetica Neue Condensed": "../_css/helvetica-neue-condensed.css",
		"Helvetica Neue": "../_css/helvetica-neue.css",
		Lato: "../_css/lato.css",
		Montserrat: "../_css/montserrat.css",
		"Myriad Pro Condensed": "../_css/myriad-pro-condensed.css",
		"Open Sans": "../_css/open-sans.css",
		Oscor: "../_css/oscor-font.css",
		Roboto: "../_css/roboto.css",
	},
	je = e =>
		(() => {
			const t = De.cloneNode(!0);
			return (
				t.addEventListener("change", n =>
					e.setFont({ [n.target.value]: ce[n.target.value] })
				),
				A(
					t,
					D(_e, {
						get each() {
							return Object.keys(ce);
						},
						children: n =>
							(() => {
								const s = Ie.cloneNode(!0);
								return (s.value = n), A(s, n), s;
							})(),
					})
				),
				t
			);
		})(),
	Fe = "genie/v1/",
	Me = async e => await Re("update-theme", e, "POST");
async function Re(e, t = null, n = "POST") {
	const s = `${window.gHub.site_url}/wp-json/${Fe}${e}`,
		o = new Headers();
	o.append("Content-Type", "application/json"),
		o.append("Accept", "application/json");
	const i = {
		method: n,
		mode: "cors",
		cache: "no-cache",
		headers: o,
		referrerPolicy: "no-referrer",
	};
	return (
		n === "POST" && (i.body = t && JSON.stringify(t)),
		console.log(s, i),
		(await fetch(s, i)).json()
	);
}
const He = I("<strong></strong>"),
	Ke = I(
		`<main><h1>Genie Theme Editor</h1><div class="sample"><div class="genie-asset-background"><div class="genie-asset-outline"><h4 class="genie-asset-heading">Lorem ipsum dolor</h4><h5 class="genie-asset-subtitle">Fusce sapien lorem dolor cursus</h5><p class="genie-asset-body">Pellentesque euismod neque in malesuada eleifend. Donec blandit turpis nec purus consequat egestas.</p></div></div></div><p><label>Theme Name: <input type="text"></label><br><small>Visible to users, so choose appropriately</small></p><p><label>Theme Style: <input type="text"></label><br><small>Typically 'Light' or 'Dark', but other terms can be used.*</small></p><p></p><button>Save</button></main>`
	),
	Ue = I('<div class="css-setting"><span></span><div></div></div>'),
	P = {
		"Body Color": { key: "body-color", fontKey: "body-font" },
		"Body Background Color": { key: "body-background", hasFont: !1 },
		"Heading Color": { key: "heading-color", fontKey: "heading-font" },
		"Sub Heading Color": {
			key: "sub-heading-color",
			fontKey: "sub-heading-font",
		},
		"Outline/Emphasis": { key: "emphasis-color", hasFont: !1 },
	},
	ue = document.querySelector(":root"),
	H = e => e.toLowerCase().replaceAll(" ", "-");
function Ge() {
	const [e, t] = j(""),
		[n, s] = j(""),
		[o, i] = j({
			"body-color": "#ffffff",
			"body-background": "#000000",
			"heading-color": "#ffffff",
			"sub-heading-color": "#c6c6c6",
			"emphasis-color": "#c6c6c6",
		}),
		[r, l] = j({
			"body-font": "Roboto",
			"heading-font": "Roboto",
			"sub-heading-font": "Roboto",
		}),
		p = () => {
			const u = {
				name: e(),
				style: n(),
				colors: o(),
				fonts: r(),
				slug: `${H(e())}-${H(n())}`,
			};
			Me(u),
				Z.exports.vanillaToast.success("Saved", {
					duration: 3e3,
					fadeDuration: 500,
				});
		};
	return (
		oe(() => {
			Object.keys(o()).forEach(u =>
				ue.style.setProperty(`--theme-${u}`, o()[u])
			);
		}),
		oe(() => {
			console.log("f", r()),
				Object.keys(r()).forEach(u =>
					ue.style.setProperty(`--theme-${u}`, r()[u])
				);
		}),
		(() => {
			const u = Ke.cloneNode(!0),
				a = u.firstChild,
				d = a.nextSibling,
				c = d.nextSibling,
				g = c.firstChild,
				f = g.firstChild,
				h = f.nextSibling,
				S = c.nextSibling,
				C = S.firstChild,
				m = C.firstChild,
				x = m.nextSibling,
				E = S.nextSibling,
				T = E.nextSibling;
			return (
				h.addEventListener("change", y => t(y.target.value)),
				x.addEventListener("change", y => s(y.target.value)),
				A(
					E,
					D(le, {
						get when() {
							return Ne(() => e() !== "", !0)() && n() !== "";
						},
						get children() {
							return [
								"API param: ",
								(() => {
									const y = He.cloneNode(!0);
									return A(y, () => `${H(e())}-${H(n())}`), y;
								})(),
							];
						},
					})
				),
				A(
					u,
					() =>
						Object.keys(P).map(y =>
							(() => {
								const k = Ue.cloneNode(!0),
									O = k.firstChild,
									se = O.nextSibling;
								return (
									A(O, y),
									A(
										k,
										D(Pe, {
											get color() {
												return o()[P[y].key];
											},
											setColor: X => i({ ...o(), [P[y].key]: X }),
										}),
										se
									),
									A(
										se,
										D(le, {
											get when() {
												return P[y].fontKey;
											},
											get children() {
												return D(je, {
													get font() {
														return r()[P[y].fontKey];
													},
													setFont: X => l({ ...r(), [P[y].fontKey]: X }),
												});
											},
										})
									),
									k
								);
							})()
						),
					T
				),
				(T.$$click = () => p()),
				L(() => (T.disabled = e() === "" || n() === "")),
				L(() => (h.value = e())),
				L(() => (x.value = n())),
				u
			);
		})()
	);
}
Be(() => D(Ge, {}), document.getElementById("root"));
ne(["click"]);
