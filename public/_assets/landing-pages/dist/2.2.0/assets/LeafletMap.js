import { c as createSignal, o as onMount, a as createEffect, u as use, s as setAttribute, h as className, e as createRenderEffect, f as style, b as createComponent, S as Show, j as createResource, z as useContext, i as insert, t as template, x as createContext } from './index.js';
import { q as getAreaPolygon } from './index2.js';

const initAutocomplete = callback => {
	if (!document.getElementById("google-maps-script")) {
		var js = document.createElement("script");
		js.src = `https://maps.googleapis.com/maps/api/js?key=${window.ghub.googleKey}&libraries=places`;
		js.id = "google-maps-script";
		js.onload = () => callback();

		var ref = document.getElementsByTagName("script")[0];
		ref.parentNode.insertBefore(js, ref);
	} else {
		callback();
	}
};

const initMaps = async () => {
	await new Promise(resolve => {
		if (!document.getElementById("leaflet-script")) {
			var link = document.createElement("link");
			link.rel = "stylesheet";
			link.type = "text/css";
			link.href =
				"https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.min.css";
			document.head.appendChild(link);

			var script = document.createElement("script");
			script.src =
				"https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.js";
			script.id = "leaflet-script";
			script.onload = () => resolve(true);
			document.head.appendChild(script);
		} else {
			(async () => {
				while (!window.L) {
					await new Promise(r => setTimeout(r, 250));
				}
				resolve(true);
			})();
		}
	});
};

const buildMap = (container, options = {}) => {
	if (window.L) {
		const center = options.center || { lat: 32.715, lng: -117.1611 };
		const mapStyle = options.mapStyle || window.ghub.mapStyle;

		const mapboxTiles = window.L.tileLayer(
			`https://api.mapbox.com/styles/v1/mapbox/${mapStyle}/tiles/{z}/{x}/{y}?access_token=${window.ghub.mapboxKey}`,
			{
				attribution:
					'&copy; <a href="https://www.mapbox.com/feedback/">Mapbox</a>',
				tileSize: 512,
				zoomOffset: -1,
			}
		);

		return window.L.map(container, {
			center: [center.lat, center.lng],
			zoomControl: options.zoomCtl ?? false,
			scrollWheelZoom: options.scrollCtl ?? false,
			layers: [mapboxTiles],
			attributionControl: false,
			zoom: options.zoom || 13,
			dragging: false,
		});
	}
};

const _tmpl$ = /*#__PURE__*/template(`<div>`),
  _tmpl$2 = /*#__PURE__*/template(`<div class="leaflet-pane" style="position:absolute;width:100%;height:100%;display:flex;align-Items:center;justify-Content:center;z-index:9999;">`);
const MapContext = createContext();
const LeafletMap = props => {
  const [map, setMap] = createSignal();
  const {
    id = "genie-map",
    center,
    cssClasses,
    style: style$1,
    mapStyle,
    zoom
  } = props;
  let refMap;
  onMount(() => {
    (async () => {
      await initMaps();
      setMap(buildMap(refMap, {
        mapStyle,
        center: center ? new window.L.LatLng(center[0], center[1]) : null,
        zoom,
        dragPan: false
      }));
      const cleanDirtyMap = () => {
        map() && map().invalidateSize();
      };
      refMap.addEventListener("transitionend", cleanDirtyMap);
      const resizeObserver = new ResizeObserver(cleanDirtyMap);
      resizeObserver.observe(document.getElementById(id));
    })();
  });
  createEffect(() => {
    map() && center && window.L && map().panTo(new window.L.LatLng(center[0], center[1]));
  });
  return [(() => {
    const _el$ = _tmpl$();
    const _ref$ = refMap;
    typeof _ref$ === "function" ? use(_ref$, _el$) : refMap = _el$;
    setAttribute(_el$, "id", id);
    className(_el$, cssClasses);
    createRenderEffect(_$p => style(_el$, style$1, _$p));
    return _el$;
  })(), createComponent(Show, {
    get when() {
      return map();
    },
    get children() {
      return createComponent(MapContext.Provider, {
        value: map,
        get children() {
          return props.children;
        }
      });
    }
  })];
};
const GeoArea = props => {
  const [polygon] = createResource(props.areaId, getAreaPolygon);
  return createComponent(Geo, {
    get polygon() {
      return polygon();
    },
    get color() {
      return props.color;
    }
  });
};
const Geo = props => {
  const [geoJSON, setGeoJSON] = createSignal();
  const map = useContext(MapContext);
  const {
    fitBounds = true,
    fillColor = "#E9B760"
  } = props;
  createEffect(() => {
    if (map && props.polygon && typeof props.polygon.geoJSON != "undefined") {
      setGeoJSON(JSON.parse(props.polygon.geoJSON));
    }
  });
  createEffect(() => {
    if (geoJSON()) {
      window.L.geoJSON(geoJSON(), {
        style: () => ({
          color: fillColor
        }),
        onEachFeature: (feature, layer) => {
          if (fitBounds) {
            map().fitBounds(layer.getBounds(), {
              zoom: 22
            });
            map().invalidateSize();
          }
        }
      }).addTo(map());
    }
  });
  return null;
};
const LeafletPane = props => {
  return (() => {
    const _el$2 = _tmpl$2();
    insert(_el$2, () => props.children);
    return _el$2;
  })();
};
const CircleMarker = ({
  color,
  caption,
  position
}) => {
  /*
  const svgIcon =
  	window.L &&
  	new window.L.icon({
  		iconUrl: url,
  		iconSize: [34, 34],
  		iconAnchor: [12, 12],
  	});
  	
  	icon={svgIcon} 
  	*/

  return createComponent(Marker, {
    position: position
  });
};
const Marker = props => {
  const map = useContext(MapContext);
  const {
    position
  } = props;
  createEffect(() => {
    if (map() && position && window.L) {
      window.L.marker(position, {
        ...props
      }).addTo(map());
    }
  });
  return null;
};

export { CircleMarker as C, GeoArea as G, LeafletMap as L, Marker as M, LeafletPane as a, buildMap as b, initAutocomplete as c, initMaps as i };
