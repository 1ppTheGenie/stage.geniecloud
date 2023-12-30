document.addEventListener(`genie-landing-loaded`, async () => {
	const lpData = await window.gHub.getLandingPageData();

	if (window.gHub.makeMap) {
		const listings = [
			{ caption: "1", color: "#F00", lat: pCompare.lat, lng: pCompare.lng },
			{
				caption: "2",
				color: "#0F0",
				lat: lpData.latitude,
				lng: lpData.longitude,
			},
		];
		const options = { fitMarkers: true, mapStyle: window.gHub.mapStyle };

		window.gHub.makeMap("compare-header-map", options, { listings: listings });

		document.querySelector("section.banner-section").style.backgroundImage = "";

		if (
			typeof lpData.boundaryJSON !== "undefined" &&
			lpData.boundaryJSON !== ""
		) {
			const leadMap = await window.gHub.makeMap("lead-property-map", {});

			document.getElementById("lead-property-map").style.filter = "";

			window.L.geoJson(JSON.parse(lpData.boundaryJSON), {
				onEachFeature: (feature, layer) => {
					leadMap.fitBounds(layer.getBounds(), { maxZoom: 27 });
					leadMap.invalidateSize();
				},
			}).addTo(leadMap);
		}
	}

	if (window.gHub) {
		window.gHub.leadId = lpData?.lead?.leadId;
	}

	document.querySelectorAll("[data-lead]").forEach(el => {
		const prop = el.getAttribute("data-lead");

		if (typeof lpData[prop] !== "undefined") el.innerHTML = lpData[prop];
	});
});
