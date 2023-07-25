gg.getCssVar = (name, el) => getComputedStyle(el ?? document.body).getPropertyValue(name);

gg.hex2rgba = (hex, alpha = 1) => {
	const re = hex.length === 6 || hex.length === 8 ? /\w\w/g : /\w/g;
	const [r, g, b] = hex.match(re).map(x => parseInt(x, 16));
	return `rgba(${r},${g},${b},${alpha})`;
};

gg.circleURI = (color, caption = "", size = 12) => {
	const text =
		caption === ""
			? ""
			: `<text x="14" y="18" fill="#fff" text-anchor="middle" font-family="sans-serif" font-weight="800" font-size="12px">${caption}</text>`;

	const svg = `
	<svg xmlns="http://www.w3.org/2000/svg" width="${size * 2 + 8}" height="${size * 2 + 8}">
		<defs>
			<filter id="shadow" x="-2" y="-2" width="${size + 2}" height="${size + 2}">
				<feGaussianBlur in="SourceAlpha" stdDeviation="3"/> 
				<feOffset dx="1.5" dy="1.5" result="offsetblur"/>
				<feComponentTransfer>
					<feFuncA type="linear" slope="0.5"/>
				</feComponentTransfer>
				<feMerge> 
					<feMergeNode/> 
					<feMergeNode in="SourceGraphic"/> 
				</feMerge>
			</filter>
		</defs>
		<circle fill="${color}" cx="${size + 2}" cy="${size + 2}" r="${size}" filter="url(#shadow)" />
		${text}
	</svg>`;

	return "data:image/svg+xml," + encodeURIComponent(svg);
};

gg.flagURI = (color, price) => {
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

function drawMap(
	map_id,
	map_type,
	accessToken,
	center,
	polygon,
	listings = [],
	iconType = "circle",
	scale = 0.5
) {
	if (typeof L !== "undefined") {
		if (typeof gg.map === "undefined") {
			const mapboxTiles = L.tileLayer(
				`https://api.mapbox.com/styles/v1/mapbox/${map_type}/tiles/{z}/{x}/{y}?access_token=${accessToken}`,
				{
					attribution: '&copy; <a href="https://www.mapbox.com/feedback/">Mapbox</a>',
					tileSize: 512,
					zoomOffset: -1,
				}
			);
			gg.map = L.map(map_id, {
				center: [center.lat, center.lng],
				zoom: 13,
				zoomControl: false,
				scrollWheelZoom: true,
				layers: [mapboxTiles],
				attributionControl: false,
			});
			console.log(gg.map);
		}

		const cleanDirtyMap = () => {
			gg.map.invalidateSize();

			if (window.genieLeafletCallback) {
				window.genieLeafletCallback(L, gg.map);
			} else {
				gg.map.panTo(gg.map.getCenter());
			}
		};
		gg.map.addEventListener("transitionend", cleanDirtyMap);
		const resizeObserver = new ResizeObserver(cleanDirtyMap);
		resizeObserver.observe(document.getElementById(map_id));

		if (window.genieLeafletCallback) {
			window.genieLeafletCallback(L, gg.map);
		}

		if (polygon) {
			const areaOutline = L.geoJSON(
				typeof polygon === "string" ? JSON.parse(polygon) : polygon
			);
			areaOutline.setStyle({
				fillColor: "var(--geo-fill)",
				fillOpacity: 0,
				color: "var(--geo-border)",
				weight: 4,
			});
			areaOutline.addTo(gg.map);
			try {
				gg.map.fitBounds(areaOutline.getBounds());
			} catch {
				if (listings) {
					let lat = 0,
						lng = 0;
					for (var i = 0; i < listings.length; i++) {
						lat += parseFloat(listings[i].lat);
						lng += parseFloat(listings[i].lng);
					}
					gg.map.panTo(new L.LatLng(lat / listings.length, lng / listings.length));
				}
			}
		}

		if (window.genieIsEditing) {
			gg.map.on("moveend", function (ev) {
				const center = gg.map.getCenter();
				const msg = {
					type: "social-post",
					name: "mapBounds",
					value: { zoom: gg.map.getZoom(), lat: center.lat, lon: center.lng },
					default: null,
				};
				window.parent.postMessage(msg, "*");
			});
		}
		if (listings) {
			for (var i = 0; i < listings.length; i++) {
				let datatURI, size, anchor;

				const cssVar =
					listings[i].state.toLowerCase() === "active" &&
					typeof listings[i].dom !== "undefined" &&
					parseInt(listings[i].dom, 10) <= 30
						? "--new"
						: `--${listings[i].state.toLowerCase()}`;

				const color = gg.getCssVar(cssVar, document.getElementById("genie-wrapper")).trim();

				switch (listings[i].iconType || iconType) {
					case "flag":
						size = [55 * scale, 38 * scale];
						anchor = [27 * scale, 38 * scale];
						datatURI = window.gg.flagURI(
							color,
							window.gg.currency(
								parseInt(
									listings[i].state.toLowerCase() == "sold"
										? listings[i].salePrice
										: listings[i].listPrice
								)
							)
						);
						break;

					case "dot":
						size = [15, 15];
						anchor = [9, 9];
						datatURI = gg.circleURI(color, "", 8);
						break;

					default:
						size = [30, 30];
						anchor = [12, 12];
						datatURI = gg.circleURI(color, listings[i].caption || i + 1, 12);
				}

				var icon = L.icon({
					iconUrl: datatURI,
					iconSize: size,
					iconAnchor: anchor,
				});

				L.marker([listings[i].lat, listings[i].lng], {
					icon: icon,
				}).addTo(gg.map);

				cleanDirtyMap();
			}
		}
	}
}

gg.addListingPopup = (lat, lon, imageUrl, pinX, pinY, popupWidth = 200) => {
	const popupHeight = popupWidth * (500 / 600);

	window.genieLeafletCallback = function (L, map) {
		const svgIcon = L.divIcon({
			html: `<svg viewBox="0 0 600 500" xmlns="http://www.w3.org/2000/svg">
						<path d="m250,375l50,125l50,-125z" fill="var(--theme-body-background)" />
						<image x="2.5%" y="2%" width="95%" height="74%" preserveAspectRatio="xMidYMid slice" href="${imageUrl}" />
						<rect stroke="var(--theme-heading-color)" stroke-width="5%" rx="5%" ry="5%" fill-opacity="0" x="3.5%" y="2.5%" width="93%" height="73%"/>
						<rect stroke="var(--theme-body-background)" stroke-width="5%" rx="5%" ry="5%" fill-opacity="0" x="2.5%" y="1.5%" width="95%" height="75%"/>
					</svg>`,
			className: "",
			iconSize: [popupWidth, popupHeight],
			iconAnchor: [popupWidth / 2, popupHeight],
		});

		L.marker([lat, lon], { icon: svgIcon }).addTo(map);

		// arrowPoint is an {x%,y%} object of where we want the tip of the arrow relative to the top-left of the map.
		const arrowPoint = gg.SVGPercentToUnits(pinX, pinY);

		const moveMapToArrow = function () {
			const propertyPixel = gg.map.latLngToContainerPoint([lat, lon]);

			gg.map.panBy([propertyPixel.x - arrowPoint.x, propertyPixel.y - arrowPoint.y]);
		};
		map.addEventListener("zoomend", moveMapToArrow);
		map.addEventListener("dragend", moveMapToArrow);
		moveMapToArrow();
	};
};
