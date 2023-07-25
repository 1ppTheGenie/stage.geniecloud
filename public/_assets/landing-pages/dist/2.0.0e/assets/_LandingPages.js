import { d as delegateEvents, c as createSignal, o as onMount, a as createEffect, b as createComponent, s as setAttribute, F as For, t as template, u as use, i as insert, e as createRenderEffect, f as style, g as createMemo, S as Show, h as className, j as createResource, k as Suspense, r as render } from './index.js';
import { M as Marker, L as LeafletMap, G as GeoArea, a as LeafletPane, i as initMaps, b as buildMap, c as initAutocomplete } from './LeafletMap.js';
import { d as dateFormat, c as currency, u as useAgentData, a as useSettings, s as searchAddress, b as areaDataStore, e as updateLead, l as landingPageData, f as createLead, S as SettingsContext } from './index2.js';
import { C as ClosePopup } from './Pagination.js';
import { E as Editable } from './Editable.js';
import { S as Spinner } from './Spinner.js';

const gallery = '';

const _tmpl$$4 = /*#__PURE__*/template(`<button>`),
  _tmpl$2$3 = /*#__PURE__*/template(`<div class="property-images"><div class="property-image"><div class="property-single-image"><div class="close"><svg width="24px" height="24px" viewBox="0 0 24 24" fill="#fff" xmlns="http://www.w3.org/2000/svg"><g data-name="Layer 2"><g data-name="close"><rect width="24" height="24" transform="rotate(180 12 12)" opacity="0"></rect><path d="M13.41 12l4.3-4.29a1 1 0 1 0-1.42-1.42L12 10.59l-4.29-4.3a1 1 0 0 0-1.42 1.42l4.3 4.29-4.3 4.29a1 1 0 0 0 0 1.42 1 1 0 0 0 1.42 0l4.29-4.3 4.29 4.3a1 1 0 0 0 1.42 0 1 1 0 0 0 0-1.42z"></path></g></g></svg></div><img loading="lazy" alt="Featured image from the property"><div class="image-overlay-content"><div class="zoom-image">`);
const Gallery = (props => {
  const [currentPhoto, setCurrentPhoto] = createSignal(0);
  const [photos, setPhotoCount] = createSignal(0);
  onMount(() => {
    //window.gg.lazyLoader("#property-gallery img.lazy");
    setPhotoCount(document.querySelectorAll(".property-images").length);
  });
  createEffect(() => {
    const left = document.querySelectorAll(".property-images")[currentPhoto()].offsetLeft;
    document.getElementById("property-gallery").style.left = `-${left}px`;
  });
  const moveGallery = direction => {
    setCurrentPhoto(current => Math.min(Math.max(current + direction, 0), photos() - 1));
  };
  return [createComponent(For, {
    get each() {
      return props.images;
    },
    children: (img, index) => (() => {
      const _el$3 = _tmpl$2$3(),
        _el$4 = _el$3.firstChild,
        _el$5 = _el$4.firstChild,
        _el$6 = _el$5.firstChild,
        _el$7 = _el$6.nextSibling,
        _el$8 = _el$7.nextSibling;
      setAttribute(_el$7, "src", img);
      _el$8.$$click = () => {
        document.body.classList.toggle("lightbox");
        setCurrentPhoto(index);
      };
      return _el$3;
    })()
  }), (() => {
    const _el$ = _tmpl$$4();
    _el$.$$click = () => moveGallery(-1);
    return _el$;
  })(), (() => {
    const _el$2 = _tmpl$$4();
    _el$2.$$click = () => moveGallery(1);
    return _el$2;
  })()];
});
delegateEvents(["click"]);

const _tmpl$$3 = /*#__PURE__*/template(`<div><input type="text">`);
const AutoComplete = props => {
  let acInput;
  onMount(() => {
    window.gg.autoComplete(acInput, props.placeChanged);
  });
  return (() => {
    const _el$ = _tmpl$$3(),
      _el$2 = _el$.firstChild;
    const _ref$ = acInput;
    typeof _ref$ === "function" ? use(_ref$, _el$2) : acInput = _el$2;
    insert(_el$, () => props.children, null);
    createRenderEffect(_p$ => {
      const _v$ = props.containerStyle,
        _v$2 = props.inputStyle;
      _p$._v$ = style(_el$, _v$, _p$._v$);
      _p$._v$2 = style(_el$2, _v$2, _p$._v$2);
      return _p$;
    }, {
      _v$: undefined,
      _v$2: undefined
    });
    return _el$;
  })();
};

const _tmpl$$2 = /*#__PURE__*/template(`<h2 class="home-value-title no-background">Get your personalized home report`),
  _tmpl$2$2 = /*#__PURE__*/template(`<h3>Fill out the fields below and we'll send you your personalized report`),
  _tmpl$3$2 = /*#__PURE__*/template(`<div class="home-value-result"><div style="margin:-5vh 5vw;padding-bottom:4vh;z-index:999999;position:relative;"><div class="invert center" style="padding:1vw;border-radius:10px;box-shadow:0px 2px 10px #0003;"><h4 style="font-size:100%">`),
  _tmpl$4$2 = /*#__PURE__*/template(`<h3>Home Value Range Report for`),
  _tmpl$5$2 = /*#__PURE__*/template(`<p class="invert" style="text-align:left;padding:2vw">Sorry, we were not able to locate a home valuation for your property above. Not a problem, we will look into this and get back to you shortly. I look forward to discussing the information with you very soon and to help you get top dollar for your home.`),
  _tmpl$6$2 = /*#__PURE__*/template(`<div class="invert" style="text-align:left;padding:1vw;margin:2vh 0"><p>Here is the initial valuation we found for your address. This automated valuation is one way to get a general idea, but it is important to realize an algorithm can't provide the accuracy you'll want if you are thinking about selling. Many factors that can't be squeezed into a data field impact your market value, from updates and improvements you have (or have not yet) made, to what's located next door or a block away, to recent, sometimes rapidly changing, market trends. Our role as realtors is to take all of this into consideration. If you are thinking about selling, please call for a real-time, real-world value for your most important investment! Looking forward to helping you get top dollar for your home.`),
  _tmpl$7$2 = /*#__PURE__*/template(`<h3 style="margin-bottom:1vh;color:var(--theme-heading-color);">Confirm Home Details`),
  _tmpl$8$1 = /*#__PURE__*/template(`<div class="invert home-value-details">`),
  _tmpl$9$1 = /*#__PURE__*/template(`<div class="home-value-estimate" style="color:var(--theme-heading-color)"><h4>Estimated Value Range:</h4><h5>`),
  _tmpl$10 = /*#__PURE__*/template(`<p style="text-transform:capitalize">Hi `),
  _tmpl$11 = /*#__PURE__*/template(`<div><img><h4></h4><h5>`),
  _tmpl$12 = /*#__PURE__*/template(`<br>`);
const HomeValuationResult = props => {
  const {
    place,
    property,
    withLeadCapture = true
  } = props;
  const [leadCaptured, setLeadCaptured] = createSignal(!withLeadCapture);
  return [_tmpl$$2(), (() => {
    const _el$2 = _tmpl$3$2(),
      _el$3 = _el$2.firstChild,
      _el$4 = _el$3.firstChild,
      _el$5 = _el$4.firstChild;
    insert(_el$2, createComponent(ClosePopup, {}), _el$3);
    insert(_el$2, createComponent(LeafletMap, {
      id: "genie-result-map",
      style: "width:100%; height:380px",
      mapStyle: "satellite-streets-v11",
      get center() {
        return [place().geometry.location.lat(), place().geometry.location.lng()];
      },
      zoom: 22,
      get children() {
        return createComponent(Marker, {
          get position() {
            return [place().geometry.location.lat(), place().geometry.location.lng()];
          }
        });
      }
    }), _el$3);
    insert(_el$4, leadCaptured && _tmpl$4$2(), _el$5);
    insert(_el$5, () => place().formatted_address);
    insert(_el$3, createComponent(Show, {
      get when() {
        return withLeadCapture && !leadCaptured();
      },
      get children() {
        return [_tmpl$2$2(), createComponent(LeadCaptureForm, {
          setLeadCaptured: setLeadCaptured,
          leadNote: "A new home valuation lead from TheGenie!",
          get existingData() {
            return createMemo(() => !!property())() && {
              propertyId: property().propertyID
            };
          }
        })];
      }
    }), null);
    insert(_el$3, createComponent(Show, {
      get when() {
        return leadCaptured();
      },
      get children() {
        return createComponent(PropertyResponse, {
          get property() {
            return property();
          }
        });
      }
    }), null);
    return _el$2;
  })()];
};
const PropertyResponse = props => {
  const {
    property
  } = props;
  return [typeof property === "undefined" && (() => {
    const _el$8 = _tmpl$5$2();
      _el$8.firstChild;
    insert(_el$8, createComponent(Signature, {}), null);
    return _el$8;
  })(), typeof property !== "undefined" && [(() => {
    const _el$10 = _tmpl$6$2(),
      _el$11 = _el$10.firstChild;
      _el$11.firstChild;
    insert(_el$10, (() => {
      const _c$ = createMemo(() => !!(property.firstOwnerFirstName && property.firstOwnerFirstName !== ""));
      return () => _c$() && (() => {
        const _el$18 = _tmpl$10();
          _el$18.firstChild;
        insert(_el$18, () => property.firstOwnerFirstName.toLowerCase(), null);
        return _el$18;
      })();
    })(), _el$11);
    insert(_el$11, createComponent(Signature, {}), null);
    return _el$10;
  })(), _tmpl$7$2(), (() => {
    const _el$14 = _tmpl$8$1();
    insert(_el$14, () => [{
      value: Intl.NumberFormat("en-US").format(property.sumBuildingSqFt),
      title: "SQUARE FT"
    }, {
      value: property.bedrooms,
      title: "BEDS"
    }, {
      value: property.bathrooms,
      title: "FULL BATHS"
    }, {
      value: property.yearBuilt,
      title: "BUILT IN"
    }, {
      value: property.saleDate ? dateFormat(Date.parse(property.saleDate)) : "n/a",
      title: "PURCHASED"
    }, {
      value: "Unknown",
      title: "LAST RENO"
    }].map((s, i) => (() => {
      const _el$20 = _tmpl$11(),
        _el$21 = _el$20.firstChild,
        _el$22 = _el$21.nextSibling,
        _el$23 = _el$22.nextSibling;
      setAttribute(_el$21, "src", `/_assets/_img/valuation-icon-${i + 1}.png`);
      insert(_el$22, () => s.title);
      insert(_el$23, () => s.value);
      createRenderEffect(_p$ => {
        const _v$ = s.title,
          _v$2 = `${s.title} icon`;
        _v$ !== _p$._v$ && setAttribute(_el$20, "key", _p$._v$ = _v$);
        _v$2 !== _p$._v$2 && setAttribute(_el$21, "alt", _p$._v$2 = _v$2);
        return _p$;
      }, {
        _v$: undefined,
        _v$2: undefined
      });
      return _el$20;
    })()));
    return _el$14;
  })(), (() => {
    const _el$15 = _tmpl$9$1(),
      _el$16 = _el$15.firstChild,
      _el$17 = _el$16.nextSibling;
    insert(_el$17, () => `${currency(property.avmLow)} - ${currency(property.avmHigh)}`);
    return _el$15;
  })()]];
};
const Signature = () => {
  const agent = useAgentData();
  return createComponent(Show, {
    get when() {
      return createMemo(() => !!!agent.loading)() && agent();
    },
    get children() {
      return [_tmpl$12(), _tmpl$12(), "Sincerely,", _tmpl$12(), _tmpl$12(), createMemo(() => agent()?.marketing.name), _tmpl$12(), createMemo(() => agent()?.marketing.mobile), _tmpl$12(), createMemo(() => agent()?.marketing.email)];
    }
  });
};

const _tmpl$$1 = /*#__PURE__*/template(`<input type="text" name="firstName" placeholder="Enter your first name">`),
  _tmpl$2$1 = /*#__PURE__*/template(`<input type="text" name="lastName" placeholder="Enter your last name">`),
  _tmpl$3$1 = /*#__PURE__*/template(`<input type="text" name="phoneNumber" placeholder="Phone Number">`),
  _tmpl$4$1 = /*#__PURE__*/template(`<input type="email" name="emailAddress" placeholder="Email Address">`),
  _tmpl$5$1 = /*#__PURE__*/template(`<textarea placeholder="Is there anything we should know before estimation?" name="message">`),
  _tmpl$6$1 = /*#__PURE__*/template(`<input type="text" name="firstName" placeholder="First Name">`),
  _tmpl$7$1 = /*#__PURE__*/template(`<input type="text" name="lastName" placeholder="Last Name">`),
  _tmpl$8 = /*#__PURE__*/template(`<div class="lead-capture-notify"><p><em>* we keep your email private, no one else gets to see it</em></p><input type="checkbox" id="text-email-updates" value="yes"><label for="text-email-updates">Please notify me of updates - via text or email`),
  _tmpl$9 = /*#__PURE__*/template(`<form style="max-width:800px;margin:1vw"><button type="submit"> `);
const LeadCaptureForm = props => {
  const {
    setLeadCaptured,
    formStyle = "default",
    submitCaption = "Send Report",
    className: className$1 = "",
    leadNote = ""
  } = props;
  const [showSpinner, setShowSpinner] = createSignal(false);
  const handleSubmit = async event => {
    event.preventDefault();
    setShowSpinner(true);
    let data = {
      ...props.existingData
    };
    const formData = new FormData(event.target);
    for (var key of formData.keys()) {
      data[key] = formData.get(key);
    }
    await window.gg.addLead(leadNote, data);
    setShowSpinner(false);
    setLeadCaptured(true);
  };
  return (() => {
    const _el$ = _tmpl$9(),
      _el$12 = _el$.firstChild,
      _el$13 = _el$12.firstChild;
    _el$.addEventListener("submit", e => handleSubmit(e));
    className(_el$, `lead-capture-form ${className$1}`);
    insert(_el$, createComponent(Show, {
      when: formStyle === "valuation",
      get children() {
        return [_tmpl$$1(), _tmpl$2$1(), _tmpl$3$1(), _tmpl$4$1(), _tmpl$5$1()];
      }
    }), _el$12);
    insert(_el$, createComponent(Show, {
      when: formStyle === "default",
      get children() {
        return [_tmpl$6$1(), _tmpl$7$1(), _tmpl$4$1(), _tmpl$3$1(), _tmpl$8()];
      }
    }), _el$12);
    insert(_el$12, submitCaption, _el$13);
    insert(_el$12, (() => {
      const _c$ = createMemo(() => !!showSpinner());
      return () => _c$() && createComponent(Spinner, {});
    })(), null);
    return _el$;
  })();
};

const homeValue = '';

const _tmpl$ = /*#__PURE__*/template(`<h2 class="home-value-title no-background">Let's find your home`),
  _tmpl$2 = /*#__PURE__*/template(`<button style="border-radius:20px;border:2px solid black;background-color:black;color:#fff;margin-left:-35px;outline:none;cursor:pointer">`),
  _tmpl$3 = /*#__PURE__*/template(`<div style="min-width:80%">`),
  _tmpl$4 = /*#__PURE__*/template(`<div id="map-place-getter" style="border-radius:20px;width:50vw;min-height:450px;">`),
  _tmpl$5 = /*#__PURE__*/template(`<h1>What’s My <!> Home Value?`),
  _tmpl$6 = /*#__PURE__*/template(`<p>GET A FREE QUOTE - NO STRINGS ATTACHED`),
  _tmpl$7 = /*#__PURE__*/template(`<p>Thinking of selling? Let us assess your home’s value to help you decide if now’s the time to move.`);
const HomeValuation = (props => {
  const {
    withCopy = false,
    buttonCaption = "Get your Value!"
  } = props;
  const {
    areaID,
    mapStyle,
    withLeadCapture
  } = useSettings();
  const [showResult, setShowResult] = createSignal(false);
  const [place, setPlace] = createSignal();
  const [placeID, setPlaceID] = createSignal();
  const [property] = createResource(placeID, searchAddress);
  return [createComponent(Show, {
    get when() {
      return showResult() === true;
    },
    get children() {
      return createComponent(HomeValuationResult, {
        place: place,
        property: property,
        withLeadCapture: true
      });
    }
  }), createComponent(Show, {
    get when() {
      return showResult() === false;
    },
    get children() {
      return [_tmpl$(), (() => {
        const _el$2 = _tmpl$4();
        insert(_el$2, createComponent(ClosePopup, {}), null);
        insert(_el$2, createComponent(LeafletMap, {
          style: "width:100%;height:450px;margin:0;",
          mapStyle: mapStyle || "satellite-streets-v11",
          zoom: 18,
          get children() {
            return [createComponent(Suspense, {
              get children() {
                return createComponent(GeoArea, {
                  areaID: areaID,
                  fillColor: "var (--theme-color)"
                });
              }
            }), createComponent(LeafletPane, {
              get children() {
                return [withCopy && createComponent(EditableCopy, {}), (() => {
                  const _el$3 = _tmpl$3();
                  insert(_el$3, createComponent(AutoComplete, {
                    containerStyle: "display:flex;min-width:80%;",
                    inputStyle: "padding:10px 15px; border-radius:20px;border:2px solid black;outline:none;flex-basis:70%;flex-grow:1",
                    placeChanged: place => {
                      setPlaceID(place.place_id);
                      setPlace(place);
                    },
                    get children() {
                      const _el$4 = _tmpl$2();
                      _el$4.$$click = () => setShowResult(true);
                      insert(_el$4, buttonCaption);
                      return _el$4;
                    }
                  }));
                  return _el$3;
                })()];
              }
            })];
          }
        }), null);
        return _el$2;
      })()];
    }
  })];
});
const EditableCopy = () => {
  return [createComponent(Editable, {
    "class": "upper center",
    id: "home-valuation-heading-1",
    get children() {
      const _el$5 = _tmpl$5(),
        _el$6 = _el$5.firstChild,
        _el$8 = _el$6.nextSibling;
        _el$8.nextSibling;
      insert(_el$5, () => areaDataStore.areaName, _el$8);
      return _el$5;
    }
  }), createComponent(Editable, {
    id: "home-valuation-para-1",
    get children() {
      return _tmpl$6();
    }
  }), createComponent(Editable, {
    id: "home-valuation-para-2",
    get children() {
      return _tmpl$7();
    }
  })];
};
delegateEvents(["click"]);

const VIEWED = "Viewed Landing Page";
const _LandingPages = (() => {
  window.gg.searchAddress = searchAddress;
  window.gg.lazyLoader = selector => {
    const lazyImages = [].slice.call(document.querySelectorAll(selector));
    const lazyImageObserver = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const lazyImage = entry.target;
          lazyImage.src = lazyImage.dataset.src;
          lazyImage.classList.remove("lazy");
          lazyImageObserver.unobserve(lazyImage);
        }
      });
    });
    lazyImages.forEach(lazyImage => lazyImageObserver.observe(lazyImage));
  };
  window.gg.makeMap = async (id, options = null, layers = null) => {
    await initMaps();
    const map = buildMap(typeof id === "string" ? document.getElementById(id) : id, options);
    if (layers && layers.listings) {
      const group = new window.L.featureGroup();
      layers.listings.forEach(l => {
        if (!isNaN(l.lat) && !isNaN(l.lng)) {
          let datatURI, size, anchor;
          const color = l.color || window.gg.getCssVar(`--${l.state}`, document.body).trim();
          switch (l.iconType ?? "circle") {
            case "flag":
              size = [55 * scale, 38 * scale];
              anchor = [27 * scale, 38 * scale];
              datatURI = window.gg.flagURI(color, window.gg.currency(parseInt(l.state == "sold" ? l.salePrice : l.listPrice)));
              break;
            case "dot":
              size = [15, 15];
              anchor = [9, 9];
              datatURI = window.gg.circleURI(color, "", 8);
              break;
            default:
              size = [34, 34];
              anchor = [12, 12];
              datatURI = window.gg.circleURI(color, l.caption || i + 1, 12);
          }
          var icon = window.L.icon({
            iconUrl: datatURI,
            iconSize: size,
            iconAnchor: anchor
          });
          window.L.marker([l.lat, l.lng], {
            icon: icon
          }).addTo(group);
        }
      });
      group.addTo(map);
      if (options.fitMarkers) {
        map.fitBounds(group.getBounds(), {
          padding: [60, 60]
        });
      }
    }
    if (layers && layers.geoJson) {
      window.L.geoJSON(layers.geoJson, {
        onEachFeature: (feature, layer) => {
          map.fitBounds(layer.getBounds(), {
            zoom: 22
          });
          map.invalidateSize();
        }
      }).addTo(map);
    }
    return map;
  };
  window.gg.autoComplete = (input, setPlace, bounds = null) => {
    initAutocomplete(() => {
      /*var defaultBounds = new google.maps.LatLngBounds(
      	new google.maps.LatLng(40.518, 29.215),
      	new google.maps.LatLng(41.242, 30.37)
      );*/

      const places = new google.maps.places.Autocomplete(input, {
        componentRestrictions: {
          country: "us"
        },
        types: ["address"]
      });
      google.maps.event.addListener(places, "place_changed", () => setPlace && setPlace(places.getPlace()));
    });
  };
  window.gg.spinner = (fill, style = "") => {
    let petals = "";
    for (let i = 0; i < 12; i++) {
      petals += `<g transform="rotate(${i * 30} 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12" fill="white"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="${-0.9166 - i * -0.08333}s" repeatCount="indefinite"></animate></rect></g>`;
    }
    return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid" style="${style}"><circle cx="50" cy="50" r="47" fill="${fill}"/>${petals}</svg>`;
  };
  window.gg.getCssVar = (name, el) => getComputedStyle(el ?? document.body).getPropertyValue(name);
  window.gg.hex2rgba = (hex, alpha = 1) => {
    const re = hex.length === 6 || hex.length === 8 ? /\w\w/g : /\w/g;
    const [r, g, b] = hex.match(re).map(x => parseInt(x, 16));
    return `rgba(${r},${g},${b},${alpha})`;
  };
  window.gg.circleURI = (color, caption = "", size = 12) => {
    const text = caption === "" ? "" : `<text x="12" y="16" fill="#fff" text-anchor="middle" style="font-family:sans-serif;font-weight:800;font-size:12px">${caption}</text>`;
    const svg = `
	<svg xmlns="http://www.w3.org/2000/svg" width="${size * 2 + 4}" height="${size * 2 + 4}">
		<defs>
			<filter id="shadow" x="0" y="0" width="${size}" height="${size}">
				<feGaussianBlur in="SourceAlpha" stdDeviation="3"/> 
				<feOffset dx="2" dy="2" result="offsetblur"/>
				<feComponentTransfer>
					<feFuncA type="linear" slope="0.5"/>
				</feComponentTransfer>
				<feMerge> 
					<feMergeNode/> 
					<feMergeNode in="SourceGraphic"/> 
				</feMerge>
			</filter>
		</defs>
		<circle fill="${color}" cx="${size}" cy="${size}" r="${size}" filter="url(#shadow)" />
		${text}
	</svg>`;
    return "data:image/svg+xml," + encodeURIComponent(svg);
  };
  window.gg.flagURI = (color, price) => {
    const svg = `
	<svg xmlns="http://www.w3.org/2000/svg" width="11" height="7.5" viewBox="0 0 110 75">
		<defs>
			<filter id="f1" x="0" y="0" width="12" height="12">
			<feGaussianBlur in="SourceAlpha" stdDeviation="5"/> 
			<feOffset dx="2" dy="2" result="offsetblur"/>
			<feComponentTransfer>
			<feFuncA type="linear" slope="0.5"/>
			</feComponentTransfer>
			<feMerge> 
			<feMergeNode/> 
			<feMergeNode in="SourceGraphic"/> 
			</feMerge>
			</filter>
		</defs>
		<path fill="${color}" stroke="#fff" stroke-width="3" filter="url(#f1)" d="M105.333,0.5H5.5c-2.75,0-5,2.25-5,5v38.333c0,2.75,2.25,5,5,5h38.733l10.101,20.834l12.152-20.834h38.848c2.75,0,5-2.25,5-5V5.5C110.333,2.75,108.083,0.5,105.333,0.5z"/>

		<text x="55" y="35" style="font-size:28px;font-weight:bold;font-family:sans-serif" text-anchor="middle" fill="#FFFFFF">${price}</text>
	</svg>`;
    return "data:image/svg+xml," + encodeURIComponent(svg);
  };
  window.gg.redirectToParentAsset = (additionalParams = {}) => {
    const url = `${window.location.origin}${window.location.pathname.replace("/index.html", "").split("/").slice(0, -1).join("/")}/index.html`;
    const urlParams = new URLSearchParams(window.location.search);

    // Remove the override
    urlParams.delete("lpo");

    // Add any additional params
    Object.keys(additionalParams).forEach(key => urlParams.append(key, additionalParams[key]));
    window.location.href = `${url}?${urlParams.toString()}`;
  };
  document.addEventListener("trigger-update-lead", async e => {
    const settings = useSettings();
    if (settings.leadID || settings.genieLeadID || window.gg.leadID) {
      await updateLead({
        genieLeadId: settings.leadID || settings.genieLeadID || window.gg.leadID,
        ...e.detail
      });
    }
  });
  window.gg.getLandingPageData = async () => {
    const urlParams = Object.fromEntries(new URLSearchParams(window.location.search));
    urlParams.agentId = ggSettings.agentID;
    return await landingPageData(urlParams);
  };
  window.gg.addLead = async (note, data = null) => {
    const settings = useSettings();
    window.gg.defaults = window.gg.defaults || {};
    let postedData = {
      agentID: settings.agentID,
      areaID: settings.leadareaID || settings.areaID,
      propertyID: settings.propertyID ?? window.gg.defaults.leadPropertyID ?? null,
      firstName: settings.firstname ?? null,
      lastName: settings.lastname ?? null,
      fullName: window.gg.defaults.fullName ?? null,
      emailAddress: settings.emailaddress ?? null,
      note: note,
      ...data
    };
    if (settings.leadID || settings.genieLeadID || window.gg.leadID) {
      if (note !== VIEWED) {
        postedData.genieLeadId = settings.leadID || settings.genieLeadID || window.gg.leadID;
        postedData.email = postedData.emailAddress;
        await updateLead(postedData);
      }
    } else {
      postedData.referringUrl = `${window.location.origin}${window.location.pathname}?referral=true`;
      postedData.referringUrl += postedData.propertyID ? `&propertyId=${postedData.propertyID}` : "";
      postedData.referringUrl += settings.mlsNumber ? `&mlsNumber=${settings.mlsNumber}` : "";
      postedData.referringUrl += settings.mlsID ? `&mlsId=${settings.mlsID}` : "";
      if (settings.trackingdata) {
        postedData.trackingData = Object.keys(settings.trackingdata).reduce((destination, key) => {
          destination[key.toLowerCase().replace("utm", "utm_")] = settings.trackingdata[key];
          return destination;
        }, {});
      }

      // Merge in any additional default settings
      if (window.gg.defaults.notePrompt && window.gg.defaults.notePrompt !== "") {
        postedData.note = `${window.gg.defaults.notePrompt}: ${postedData.note}`;
      }
      postedData.trackingData = {
        ...window.gg.defaults.trackingData,
        ...(postedData.trackingData ?? {})
      };
      if (typeof postedData.trackingData.utmSource === "undefined" || postedData.trackingData.utmSource === "url") {
        postedData.trackingData.utmSource = window.location.href;
      }
      const r = await createLead(postedData);
      if (r.result?.key) {
        window.gg.leadID = r.result.key;
      }
      return r.result;
    }
  };
  const urlParams = new URLSearchParams(window.location.search);
  if (parseInt(urlParams.get("crLead")) === 1) {
    const pid = urlParams.get("propertyId");
    if (pid) {
      window.gg.addLead(null, {
        propertyId: pid
      });
    }
  }

  /***********************
   *
   * Home Valuation component in popup
   *
   ***********************/
  document.querySelectorAll(".request-home-value").forEach(el => {
    el.addEventListener("click", event => {
      event.preventDefault();
      if (!document.getElementById("genie-homeValuePopup")) {
        const settings = useSettings();
        document.body.classList.add("hasPopup");
        const div = document.createElement("div");
        div.id = "genie-homeValuePopup";
        div.classList.add("popup-dialog", "visible");
        document.body.appendChild(div);
        const App = () => {
          /*const HomeValuation = lazy(() =>
          	import("@/components/_HomeValuation")
          );*/

          return createComponent(SettingsContext.Provider, {
            value: settings,
            get children() {
              return createComponent(HomeValuation, {
                withCopy: false
              });
            }
          });
        };
        render(App, document.getElementById("genie-homeValuePopup"));
      }
    });
  });

  /***********************
   *
   * Vanilla version of the jQuery slide toggle
   *
   * Toggling element needs a data-container attrbute with selector, eg <a data-container="#my-sliding-div">, <a data-container=".a-sliding-ul">
   * Note that with a class-based selector, only the first element matched will toggle.
   *
   * Toggled element can have a a --toggle-height css var to set a minimum height when closed, eg <a style="--toggle-height: 200px;">
   *
   ***********************/
  document.querySelectorAll(".toggle").forEach(el => {
    const container = document.querySelector(el.dataset.container);
    if (container) {
      container.classList.add("toggle-container");
      el.addEventListener("click", event => {
        event.preventDefault();
        if (!container.classList.contains("active")) {
          container.classList.add("active");
          container.style.height = "auto";
          const height = container.clientHeight + "px";
          container.style.height = "0px";
          setTimeout(() => container.style.height = height, 0);
        } else {
          container.style.height = "0px";
          container.addEventListener("transitionend", () => container.classList.remove("active"), {
            once: true
          });
        }
      });
    }
  });

  /***********************
   *
   * Scroll-to wrapper
   *
   * Add data-scroll-to attribute with selector, eg <a data-scroll-to="#my-sliding-div">, <a data-scroll-to=".a-sliding-ul">
   *
   ***********************/
  document.querySelectorAll("[data-scroll-to]").forEach(el => el.addEventListener("click", e => {
    e.preventDefault();
    const target = document.querySelector(el.getAttribute("data-scroll-to"));
    if (target) {
      const y = target.getBoundingClientRect().top;
      window.scrollTo({
        top: y + window.pageYOffset - 80,
        behavior: "smooth"
      });
    }
  }));
  document.querySelectorAll(".funnel-create-lead").forEach(el => el.addEventListener("submit", e => {
    e.preventDefault();
    (async () => {
      const popup = document.getElementById(el.dataset["thank-you"] || "form-thank-you");
      if (popup) {
        const hidePopup = () => {
          popup.classList.remove("visible");
          document.getElementById("fl-thankyou-modal").classList.remove("hide");
          popup.querySelector(".close-popup").removeEventListener("click", hidePopup);

          // These really need removing and some generic event code running instead
          document.querySelector(".modal.in").classList.remove("in");
          document.getElementById("backdrop").style.display = "none";
        };
        popup.classList.add("visible");
        document.getElementById("fl-thankyou-modal").classList.add("hide");
        popup.querySelector(".close-popup").addEventListener("click", hidePopup);
      }
      let data = {};
      new FormData(e.target).forEach((value, key) => data[key] = value);
      const lead = await window.gg.addLead(null, data);
      document.dispatchEvent(new CustomEvent("genie-lead-created", {
        detail: lead
      }));
    })();
  }));
  const tagsAttr = "data-genie-tags";
  const downloadAttr = "data-download-url";
  document.querySelectorAll(`[${downloadAttr}]`).forEach(el => {
    el.addEventListener("click", event => {
      event.preventDefault();
      const downloadFile = () => {
        const anchor = document.createElement("a");
        anchor.href = el.getAttribute(downloadAttr);
        anchor.target = "_blank";
        anchor.download = el.getAttribute(downloadAttr);
        anchor.click();
      };
      const popup = document.getElementById("download-report");
      if (popup && window.gg.isLeadCapture) {
        const hidePopup = () => {
          popup.classList.remove("visible");
          popup.querySelector(".close-popup").removeEventListener("click", hidePopup);
          popup.querySelector("#download-report-submit").removeEventListener("click", submitForm);
        };
        const submitForm = event => {
          event.preventDefault();
          const address = document.getElementById("popup-email").value;
          if (address) {
            window.gg.addLead("Report download", {
              emailAddress: address,
              genieTags: el.getAttribute(tagsAttr) // Support tags on the element
            });

            downloadFile();
            hidePopup();
          } else {
            document.getElementById("popup-valid-email").style.display = "block";
          }
        };
        popup.classList.add("visible");
        popup.querySelector(".close-popup").addEventListener("click", hidePopup);
        popup.querySelector("#download-report-submit").addEventListener("click", submitForm);
      } else {
        downloadFile();
      }
    });
  });
  document.querySelectorAll(`[${tagsAttr}]`).forEach(el => {
    // Skip if managed by the downloadUrl handler
    if (!el.hasAttribute(downloadAttr)) {
      el.addEventListener("click", () => {
        window.gg.addLead("Event Trigger", {
          genieTags: el.getAttribute(tagsAttr)
        });
      });
    }
  });
  window.requestAnimationFrame(() => window.gg.lazyLoader("img.lazy"));
  window.gg.galleryButton = (button, gallery) => {
    let v = 1;
    const captions = ["Show Fewer", "Show More"];
    button.addEventListener("click", e => e.target.innerText = captions[v ^= 1]);

    /*
     ToDo: hide button when the container doesn't overflow
    const resizeObserver = new ResizeObserver(() => {
    	button.style.display = gallery.clientHeight === gallery.scrollHeight ? "none" : "block";
    });
    resizeObserver.observe(gallery);
    */
  };

  if (typeof window.gg.galleryImages !== "undefined") {
    const gallery = document.getElementById("property-gallery");
    if (gallery) {
      //const Gallery = lazy(() => import("@/components/_Gallery"));
      const GalleryComponent = () => createComponent(Gallery, {
        get images() {
          return window.gg.galleryImages;
        }
      });
      render(GalleryComponent, gallery);
    }
  }
  const timedPopup = document.querySelector(".timed-popup");
  if (timedPopup) {
    setTimeout(() => {
      timedPopup.style.display = "block";
    }, 30000);
    timedPopup.querySelectorAll("[data-dismiss='modal']").forEach(el => el.addEventListener("click", () => timedPopup.style.display = "none"), true);
  }
  document.dispatchEvent(new Event("genie-landing-loaded"), true);
  return null;
});

export { _LandingPages as default };
