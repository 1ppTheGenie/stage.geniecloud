document.addEventListener(`genie-landing-loaded`, async () => {
	const lpData = await gg.getLandingPageData();

	if (gg.makeMap) {
		const listings = [
			{ caption: "1", color: "#F00", lat: pCompare.lat, lng: pCompare.lng },
			{
				caption: "2",
				color: "#0F0",
				lat: lpData.latitude,
				lng: lpData.longitude,
			},
		];
		const options = { fitMarkers: true, mapStyle: window.ghub.mapStyle };

		gg.makeMap("compare-header-map", options, { listings: listings });

		document.querySelector("section.banner-section").style.backgroundImage = "";

		if (lpData.boundaryJSON !== "") {
			const leadMap = await gg.makeMap("lead-property-map", {});

			document.getElementById("lead-property-map").style.filter = "";

			window.L.geoJson(JSON.parse(lpData.boundaryJSON), {
				onEachFeature: (feature, layer) => {
					leadMap.fitBounds(layer.getBounds(), { maxZoom: 27 });
					leadMap.invalidateSize();
				},
			}).addTo(leadMap);
		}
	}

	document.querySelectorAll("[data-lead]").forEach(el => {
		const prop = el.getAttribute("data-lead");

		if (typeof lpData[prop] !== "undefined") el.innerHTML = lpData[prop];
	});
});
