import { render } from "solid-js/web";
//import { lazy } from "solid-js";

import {
	initAutocomplete,
	searchAddress,
	initMaps,
	buildMap,
	createLead,
	updateLead,
	useSettings,
	Context4Settings,
	landingPageData,
	currency,
  addDynamicPopup,
  mockCtaData,
  formatFormNote,
  InsensitiveURLSearchParams
} from "@/utilities";

import "@/index.css";

import Gallery from "@/components/_Gallery";
import HomeValuation from "@/components/_HomeValuation";
import LeadCtaTag from "@/components/_LeadCtaTag";

const VIEWED = "Viewed Landing Page";

export default () => {
	window.gHub.searchAddress = searchAddress;

	window.gHub.lazyLoader = selector => {
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

	window.gHub.currency = c => currency(c);

	window.gHub.makeMap = async (id, options = null, layers = null) => {
		await initMaps();

		const map = buildMap(
			typeof id === "string" ? document.getElementById(id) : id,
			options
		);

		if (layers && layers.listings) {
			const group = new window.L.featureGroup();

			layers.listings.forEach(l => {
				if (!isNaN(l.lat) && !isNaN(l.lng)) {
					let datatURI, size, anchor;

					const color =
						l.color ||
						window.gHub.getCssVar(`--${l.state}`, document.body).trim();

					switch (l.iconType ?? "circle") {
						case "flag":
							size = [55 * scale, 38 * scale];
							anchor = [27 * scale, 38 * scale];
							datatURI = window.gHub.flagURI(
								color,
								window.gHub.currency(
									parseInt(l.state == "sold" ? l.salePrice : l.listPrice)
								)
							);
							break;

						case "dot":
							size = [15, 15];
							anchor = [9, 9];
							datatURI = window.gHub.circleURI(color, "", 8);
							break;

						default:
							size = [34, 34];
							anchor = [12, 12];
							datatURI = window.gHub.circleURI(color, l.caption || i + 1, 12);
					}

					var icon = window.L.icon({
						iconUrl: datatURI,
						iconSize: size,
						iconAnchor: anchor,
					});

					window.L.marker([l.lat, l.lng], { icon: icon }).addTo(group);
				}
			});

			group.addTo(map);

			if (options.fitMarkers && Object.keys(group.getBounds()).length > 0) {
				map.fitBounds(group.getBounds(), { padding: [60, 60] });
			}
		}

		if (layers && layers.geoJson && options.fitMarkers) {
			window.L.geoJSON(layers.geoJson, {
				onEachFeature: (feature, layer) => {
					map.fitBounds(layer.getBounds(), { zoom: 22 });
					map.invalidateSize();
				},
			}).addTo(map);
		}

		return map;
	};

	window.gHub.autoComplete = (input, setPlace, bounds = null) => {
		initAutocomplete(() => {
			/*var defaultBounds = new google.maps.LatLngBounds(
				new google.maps.LatLng(40.518, 29.215),
				new google.maps.LatLng(41.242, 30.37)
			);*/

			const places = new google.maps.places.Autocomplete(input, {
				componentRestrictions: { country: "us" },
				types: ["address"],
			});
			google.maps.event.addListener(
				places,
				"place_changed",
				() => setPlace && setPlace(places.getPlace())
			);
		});
	};

	window.gHub.spinner = (fill, style = "") => {
		let petals = "";

		for (let i = 0; i < 12; i++) {
			petals += `<g transform="rotate(${
				i * 30
			} 50 50)"><rect x="47" y="24" rx="3" ry="6" width="6" height="12" fill="white"><animate attributeName="opacity" values="1;0" keyTimes="0;1" dur="1s" begin="${
				-0.9166 - i * -0.08333
			}s" repeatCount="indefinite"></animate></rect></g>`;
		}

		return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid" style="${style}"><circle cx="50" cy="50" r="47" fill="${fill}"/>${petals}</svg>`;
	};

	window.gHub.getCssVar = (name, el) =>
		getComputedStyle(el ?? document.body).getPropertyValue(name);

	window.gHub.hex2rgba = (hex, alpha = 1) => {
		const re = hex.length === 6 || hex.length === 8 ? /\w\w/g : /\w/g;
		const [r, g, b] = hex.match(re).map(x => parseInt(x, 16));
		return `rgba(${r},${g},${b},${alpha})`;
	};

	window.gHub.circleURI = (color, caption = "", size = 12) => {
		const text =
			caption === ""
				? ""
				: `<text x="12" y="16" fill="#fff" text-anchor="middle" style="font-family:sans-serif;font-weight:800;font-size:12px">${caption}</text>`;

		const svg = `
	<svg xmlns="http://www.w3.org/2000/svg" width="${size * 2 + 4}" height="${
			size * 2 + 4
		}">
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

	window.gHub.flagURI = (color, price) => {
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

	window.gHub.redirectToParentAsset = (additionalParams = {}) => {
		const url = `${window.location.origin}${window.location.pathname
			.replace("/index.html", "")
			.split("/")
			.slice(0, -1)
			.join("/")}/index.html`;
		const urlParams = new URLSearchParams(window.location.search);

		// Remove the override
		urlParams.delete("lpo");

		// Add any additional params
		Object.keys(additionalParams).forEach(key =>
			urlParams.append(key, additionalParams[key])
		);

		window.location.href = `${url}?${urlParams.toString()}`;
	};

	window.gHub.randomPriceString = (max = 2000001, min = 200000 ) => {
		// Format a random number
		const formattedNumber = Math.floor(Math.random() * (max - min) + min).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	
		// Replace numbers with letters
		return formattedNumber.replace(/1/g, 'I').replace(/2/g, 'A').replace(/3/g, 'E').replace(/4/g, 'H').replace(/5/g, 'S').replace(/7/g, 'I').replace(/8/g, 'B').replace(/9/g, 'G');
	}

  //this was the one giving casing issues so just want to centralize it.
  window.gHub.getPropertyIdFromUrl = () => {
    return new InsensitiveURLSearchParams(window.location.search).get("propertyId")
  }

  window.gHub.getLeadId = (settings = useSettings(Context4Settings)) => {
    return settings.leadId || settings.genieLeadId || window.gHub.leadId;
  };

	document.addEventListener("trigger-update-lead", async e => {
    const leadId = window.gHub.getLeadId();
		if (leadId) {
			await updateLead({
				genieLeadId:leadId,
				...e.detail,
			});
		}
	});

	window.gHub.getLandingPageData = async (skipLeadCreate = false) => {
		const urlParams = Object.fromEntries(
			new URLSearchParams(window.location.search)
		);

		urlParams.agentId = window.gHub.agentId;
		urlParams.hideAVM = window.gHub.hideAVM ?? false;
		urlParams.skipLeadCreate = skipLeadCreate;

    //since we are converting to an object here we want in format of propertyId but from url it could be either Id or id
    const propertyId = window.gHub.getPropertyIdFromUrl();

    if(propertyId) {
      //just in case it was lower in the URL remove it to avoid confusion
      delete urlParams.propertyid; 
      urlParams.propertyId = propertyId;
    }

		return await landingPageData(urlParams);
	};

  window.gHub.mergeTrackingData = (postTracking = {}, settings = useSettings(Context4Settings)) =>{
    const defaultTrackingData = window.gHub.defaults.trackingData || {};

    //I think this was legacy since it is going to utm_ while our create lead expects utmX, however this should handle all utmSource, utmsource, utm_source
    let trackingDataFromSettings = settings.trackingdata ? 
        Object.keys(settings.trackingdata).reduce((destination, key) => {
            destination[key.toLowerCase().replace("_", "").replace("utm", "utm_")] = settings.trackingdata[key];
            return destination;
        }, {}) : {};

    // if we have tracking data then source will be populated
    if (trackingDataFromSettings.utm_source) {
      trackingDataFromSettings = {
        utmSource: capture.utm_source ?? null,
        utmMedium: capture.utm_medium ?? null,
        utmCampaign: capture.utm_campaign ?? null,
        utmTerm: capture.utm_term ?? null,
        utmContent: capture.utm_content ?? null
      };
    }

    postTracking = {
    ...defaultTrackingData,
    ...trackingDataFromSettings,
    ...postTracking,
    };

    if (!postTracking.utmSource || postTracking.utmSource === "url") {
      
      //in the event someone lands on the page that was not driven by a short URL with tracking data
      const pageUtmSource = document.getElementById("pageUtmSource");
      const pageUtmCampaign = document.getElementById("pageUtmCampaign");
      postTracking.utmSource = pageUtmSource?.value || window.location.href;
      postTracking.utmCampaign = pageUtmCampaign?.value;
    }

    return postTracking;
  };

  window.gHub.formatNewLeadReferringUrl = (postedData, settings) => {
      let referringUrl = `${window.location.origin}${window.location.pathname}?referral=true`;

      if (postedData.propertyId) {
          referringUrl += `&propertyId=${postedData.propertyId}`;
      }

      if (settings.mlsNumber) {
          referringUrl += `&mlsNumber=${settings.mlsNumber}`;
      }

      if (settings.mlsId) {
          referringUrl += `&mlsId=${settings.mlsId}`;
      }

      return referringUrl;
  }

	window.gHub.addLead = async (note, data = null) => {
		const settings = useSettings(Context4Settings);

		window.gHub.defaults = window.gHub.defaults || {};

		let postedData = {
			agentId: settings.agentId,
			areaId: settings.leadareaId || settings.areaId,
			propertyId:
				settings.propertyId ??
				window.gHub.defaults.leadPropertyId ??
        window.gHub.getPropertyIdFromUrl(),
			firstName: settings.firstname ?? null,
			lastName: settings.lastname ?? null,
			fullName: window.gHub.defaults.fullName ?? null,
			emailAddress: settings.emailaddress ?? null,
			note: note,
			...data,
		};

    const leadId = window.gHub.getLeadId(settings);
		
    if (leadId) {
			if (note !== VIEWED) {
				postedData.genieLeadId = leadId;
				postedData.email = postedData.emailAddress;
        
				await updateLead(postedData);
			}
		} else {
      postedData.referringUrl = window.gHub.formatNewLeadReferringUrl(postedData, settings);				
      postedData.trackingData = window.gHub.mergeTrackingData(postedData.trackingData, settings);

			// Merge in any additional default settings
			if (window.gHub.defaults.notePrompt) {
				postedData.note = `${window.gHub.defaults.notePrompt}: ${postedData.note}`;
			}     			
      
			const r = await createLead(postedData);

			if (r.result?.key) {
				window.gHub.leadId = r.result.key;
			}

			return r.result;
		}
	};  

	/***********************
	 *
	 * Home Valuation component in popup
	 *
	 ***********************/
	document.querySelectorAll(".request-home-value").forEach(el => {
		el.addEventListener("click", event => {
			event.preventDefault();    
      window.gHub.popHomeValue();
		});
	});

  window.gHub.popHomeValue = () => {
    const dynamicPopupId = "genie-homeValuePopup";
      
      if(addDynamicPopup(dynamicPopupId)) {        
        const settings = useSettings(Context4Settings);			
				const App = () => {
					return (
						<Context4Settings.Provider value={settings}>
							<HomeValuation />
						</Context4Settings.Provider>
					);
				};

				render(App, document.getElementById(dynamicPopupId));
			}
  };

  /***********************
	 *
	 * Opt-in timed popup
	 *
	 ***********************/
  window.gHub.showOptIn = () => { 
    const ctaId = new InsensitiveURLSearchParams(window.location.search).get("ctaId"); 

    //0 is special handling for home value that is hooked on page param hooks
    if(ctaId == null || ctaId == 0)
      return;    
    
    const data = mockCtaData(parseInt(ctaId));

    if(data?.enabled) {
      //the delay for the popup, I am making the assumption that this would also allow the lead to be created first so that we have
      //a leadId when it actually fires.
      setTimeout(() => { 
        const settings = useSettings(Context4Settings);           
        //to test you can explicitly set the user and leadId     
        if (window.gHub.getLeadId(settings)) {
          const dynamicPopupId = "genie-leadCtaTagPopup";
          if(addDynamicPopup(dynamicPopupId)) {        
            const App = () => {
              return (
                <Context4Settings.Provider value={settings}>
                  <LeadCtaTag ctaData={data} />
                </Context4Settings.Provider>
              );
            };
      
            render(App, document.getElementById(dynamicPopupId));
          }
        }
      }, data.delay); 
    } 
  };  
  
  document.addEventListener("genie-landing-data-loaded", function(){
    window.gHub.showOptIn();
  }); 

  /***********************
	 *
	 * Url Param hooks
	 *
	 ***********************/
	const urlParams = new InsensitiveURLSearchParams(window.location.search).getObjectLower();

  //special handling for the home value cta
  const ctaHomeValueKey = 0;
  const ctaHomeValue = parseInt(urlParams.ctaid) === ctaHomeValueKey;    

	if ( parseInt( urlParams.crlead ) === 1 ) {
		const pid = urlParams.propertyid;

		if ( pid ) {
      //only found the crLead in one spot so adding an applicable note
			window.gHub.addLead('Manually entered address property comparison', { propertyId: pid } );
		}
	} else if ( urlParams.token ) {
    (async () => {
      const lpData = await window.gHub.getLandingPageData();  
            
      if(lpData.lead && lpData.lead.genieLeadId) {         
        const settings = useSettings(Context4Settings);
        settings.trackingdata = lpData.lead.trackingData; //unsure on the casing descrepancy here but add lead maps it;
        window.gHub.leadId = lpData.lead.genieLeadId;
      }

      //when we are dealing with existing data wait till loaded to pop
      if(ctaHomeValue) {

        const data = mockCtaData(ctaHomeValueKey);

        if(data?.enabled)
          setTimeout(() => { window.gHub.popHomeValue() }, data.delay);
      }
      //might be worth a custom event supplying the lpData
      document.dispatchEvent(new Event("genie-landing-data-loaded"), true);      
    })();
  } else {
    if(ctaHomeValue) {
      const data = mockCtaData(ctaHomeValueKey);

        if(data?.enabled)
          setTimeout(() => { window.gHub.popHomeValue() }, data.delay);
    }
  }

  /***********************	 
	 * End Url Param hooks	 
	 ***********************/
  
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

					setTimeout(() => (container.style.height = height), 0);
				} else {
					container.style.height = "0px";

					container.addEventListener(
						"transitionend",
						() => container.classList.remove("active"),
						{ once: true }
					);
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
	document.querySelectorAll("[data-scroll-to]").forEach(el =>
		el.addEventListener("click", e => {
			e.preventDefault();
			const target = document.querySelector(el.getAttribute("data-scroll-to"));

			if (target) {
				const y = target.getBoundingClientRect().top;

				window.scrollTo({
					top: y + window.pageYOffset - 80,
					behavior: "smooth",
				});
			}
		})
	);

	document.querySelectorAll(".funnel-create-lead").forEach(el =>
		el.addEventListener("submit", e => {
			e.preventDefault();

			(async () => {
				const popup = document.getElementById(
					el.dataset["thank-you"] || "form-thank-you"
				);

				if (popup) {
					const hidePopup = () => {
						popup.classList.remove("visible");
						document
							.getElementById("fl-thankyou-modal")
							.classList.remove("hide");
						popup
							.querySelector(".close-popup")
							.removeEventListener("click", hidePopup);

						// These really need removing and some generic event code running instead
						const modal = document.querySelector( ".modal.in" )
						
            if(modal) {
              modal.classList.remove( "in" );
              modal.style.display = "none";
            }

						const backdrop = document.getElementById("backdrop");

            if(backdrop)
              backdrop.style.display = "none";
					};

					popup.classList.add("visible");

          const thankModal = document.getElementById("fl-thankyou-modal");

          if(thankModal)
					  thankModal.classList.add("hide");
          
					popup
						.querySelector(".close-popup")
						.addEventListener("click", hidePopup);
				}

				let data = {};

				new FormData(e.target).forEach((value, key) => (data[key] = value));
        
        //some forms are more complex so we want to format a more applicable message, if a formatter is not provided it will take what is given
        formatFormNote(data);        
        
				const lead = await window.gHub.addLead(data.note, data);

				document.dispatchEvent(
					new CustomEvent("genie-lead-created", { detail: lead })
				);
			})();
		})
	);

	const tagsAttr = "data-genie-tags";
	const downloadAttr = "data-download-url";
	document.querySelectorAll(`[${downloadAttr}]`).forEach(el => {
		el.addEventListener("click", event => {
			event.preventDefault();

      let downloadedNote;
      
			const downloadFile = () => {
				const anchor = document.createElement("a");         
				anchor.href = el.getAttribute(downloadAttr);
				anchor.target = "_blank";
				anchor.download = el.getAttribute(downloadAttr);
				anchor.click();

        let downloadUrl = anchor.href;

        if(downloadUrl && downloadUrl.startsWith("/"))
          downloadUrl = `${window.location.origin}${downloadUrl}`;

        downloadedNote =  `File Downloaded - ${downloadUrl}`;
			};

			const popup = document.getElementById("download-report");
			if (popup && window.gHub.isLeadCapture) {
				const hidePopup = () => {
					popup.classList.remove("visible");

					popup
						.querySelector(".close-popup")
						.removeEventListener("click", hidePopup);

					popup
						.querySelector("#download-report-submit")
						.removeEventListener("click", submitForm);
				};

				const submitForm = event => {
					event.preventDefault();

					const address = document.getElementById("popup-email").value;

					if (address) {
            downloadFile();
						hidePopup();
            
						window.gHub.addLead(downloadedNote, {
							emailAddress: address,
							genieTags: el.getAttribute(tagsAttr), // Support tags on the element
						});
						
					} else {
						document.getElementById("popup-valid-email").style.display =
							"block";
					}
				};

				popup.classList.add("visible");

				popup
					.querySelector(".close-popup")
					.addEventListener("click", hidePopup);

				popup
					.querySelector("#download-report-submit")
					.addEventListener("click", submitForm);
			} else {
				downloadFile();

        if(window.gHub.getLeadId()) {
          //no lead capture here but we want to record the activty by passing the tags along
          window.gHub.addLead(downloadedNote, {          
            genieTags: el.getAttribute(tagsAttr), // Support tags on the element
          });
        }
			}
		});
	});

	document.querySelectorAll(`[${tagsAttr}]`).forEach(el => {
		// Skip if managed by the downloadUrl handler
		if (!el.hasAttribute(downloadAttr)) {
			el.addEventListener("click", () => {
        
        //the downloadUrl handler captures the email so this one is a bit different in that we MUST have lead in context
        //to fire of the update here.
        if(window.gHub.getLeadId()) {

          //TODO: consolidate duplicate code          
          let downloadedNote = 'File Downloaded';
          let downloadUrl = el.getAttribute("href");

          if(downloadUrl) {
            if(downloadUrl.startsWith("/"))
              downloadUrl = `${window.location.origin}${downloadUrl}`;          

            downloadedNote = `${downloadedNote} - ${downloadUrl}`;
          } 

          window.gHub.addLead(downloadedNote, {
            genieTags: el.getAttribute(tagsAttr),
          });
        }
			});
		}
	} );
	
	document.querySelectorAll( `.genie-alternate:nth-child(odd)` ).forEach( el =>
		el.classList.add( window.gHub.alternateShade && window.gHub.alternateShade !== '' ? window.gHub.alternateShade : 'dark' ) );  

	window.requestAnimationFrame(() => window.gHub.lazyLoader("img.lazy"));

	window.gHub.galleryButton = (button, gallery) => {
		let v = 1;
		const captions = ["Show Fewer", "Show More"];
		button.addEventListener(
			"click",
			e => (e.target.innerText = captions[(v ^= 1)])
		);

		/*
		 ToDo: hide button when the container doesn't overflow
		const resizeObserver = new ResizeObserver(() => {
			button.style.display = gallery.clientHeight === gallery.scrollHeight ? "none" : "block";
		});
		resizeObserver.observe(gallery);
		*/
	};

	if (typeof window.gHub.galleryImages !== "undefined") {
		const gallery = document.getElementById("property-gallery");

		if (gallery) {
			//const Gallery = lazy(() => import("@/components/_Gallery"));
			const GalleryComponent = () => (
				<Gallery images={window.gHub.galleryImages} />
			);

			render(GalleryComponent, gallery);
		}
	}

	const timedPopup = document.querySelector(".timed-popup");
	if (timedPopup) {
		setTimeout(() => {
			timedPopup.style.display = "block";
		}, 30000);

		timedPopup
			.querySelectorAll("[data-dismiss='modal']")
			.forEach(
				el =>
					el.addEventListener(
						"click",
						() => (timedPopup.style.display = "none")
					),
				true
			);
	}

	document.dispatchEvent(new Event("genie-landing-loaded"), true);    
	return null;
};
