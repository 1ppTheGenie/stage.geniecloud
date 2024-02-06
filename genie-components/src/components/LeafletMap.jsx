import {
	onMount,
	createContext,
	useContext,
	createEffect,
	createResource,
	createSignal,
	Show,
} from "solid-js";

import { initMaps, buildMap, getAreaPolygon } from "@/utilities";

const MapContext = createContext();

export const LeafletMap = props => {
	const [map, setMap] = createSignal();
	const { id = "genie-map", center, cssClasses, style, mapStyle, zoom } = props;
	let refMap;

	onMount(() => {
		(async () => {
			await initMaps();

			const leafletMap = buildMap(refMap, {
				mapStyle,
				center: center ? new window.L.LatLng(center[0], center[1]) : null,
				zoom,
				dragPan: false,
			});

			if (leafletMap) setMap(leafletMap);

			const cleanDirtyMap = () => {
				map() && map().invalidateSize();
			};
			refMap.addEventListener("transitionend", cleanDirtyMap);
			const resizeObserver = new ResizeObserver(cleanDirtyMap);
			resizeObserver.observe(document.getElementById(id));
		})();
	});

	createEffect(() => {
		map() &&
			center &&
			window.L &&
			map().panTo(new window.L.LatLng(center[0], center[1]));
	});

	return (
		<>
			<div ref={refMap} id={id} class={cssClasses} style={style} />
			<Show when={map()}>
				<MapContext.Provider value={map}>{props.children}</MapContext.Provider>
			</Show>
		</>
	);
};

export const GeoArea = props => {
	const [polygon] = createResource(props.areaId, getAreaPolygon);

	return <Geo polygon={polygon()} color={props.color} />;
};

export const Geo = props => {
	const [geoJSON, setGeoJSON] = createSignal();
	const map = useContext(MapContext);
	const { fitBounds = true, fillColor = "#E9B760" } = props;

	createEffect(() => {
		if (map && props.polygon && typeof props.polygon.geoJSON != "undefined") {
			setGeoJSON(JSON.parse(props.polygon.geoJSON));
		}
	});

	createEffect(() => {
		if (geoJSON()) {
			window.L.geoJSON(geoJSON(), {
				style: () => ({ color: fillColor }),
				onEachFeature: (feature, layer) => {
					if (fitBounds) {
						map().fitBounds(layer.getBounds(), { zoom: 22 });
						map().invalidateSize();
					}
				},
			}).addTo(map());
		}
	});

	return null;
};

export const LeafletPane = props => {
	return (
		<div
			class="leaflet-pane"
			style="position: absolute; width: 100%; height: 100%; display: flex; align-Items: center; justify-Content:center; z-index: 9999;">
			{props.children}
		</div>
	);
};

export const CircleMarker = ({ color, caption, position }) => {
	const url = circleURI(color, caption);
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

	return <Marker position={position} />;
};

export const Marker = props => {
	const map = useContext(MapContext);
	const { position } = props;

	createEffect(() => {
		if (map() && position && window.L) {
			window.L.marker(position, { ...props }).addTo(map());
		}
	});

	return null;
};

export const circleURI = (color, caption = "", size = 12) => {
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
