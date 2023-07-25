export const initAutocomplete = callback => {
	if (!document.getElementById("google-maps-script")) {
		var js = document.createElement("script");
		js.src = `https://maps.googleapis.com/maps/api/js?key=${window.ghub.google_key}&libraries=places`;
		js.id = "google-maps-script";
		js.onload = () => callback();

		var ref = document.getElementsByTagName("script")[0];
		ref.parentNode.insertBefore(js, ref);
	} else {
		callback();
	}
};

export const initMaps = async () => {
	await new Promise(resolve => {
		if (!document.getElementById("leaflet-script")) {
			var link = document.createElement("link");
			link.rel = "stylesheet";
			link.type = "text/css";
			link.href = "https://unpkg.com/leaflet@1.8.0/dist/leaflet.css";
			document.head.appendChild(link);

			var script = document.createElement("script");
			script.src = "https://unpkg.com/leaflet@1.8.0/dist/leaflet.js";
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

export const buildMap = (container, options = {}) => {
	if (window.L) {
		const center = options.center || { lat: 32.715, lng: -117.1611 };
		const mapStyle = options.mapStyle || window.ghub.mapStyle;

		const mapboxTiles = window.L.tileLayer(
			`https://api.mapbox.com/styles/v1/mapbox/${mapStyle}/tiles/{z}/{x}/{y}?access_token=${window.ghub.mapbox_key}`,
			{
				attribution: '&copy; <a href="https://www.mapbox.com/feedback/">Mapbox</a>',
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
