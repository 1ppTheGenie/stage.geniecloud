document.addEventListener(`genie-landing-loaded`, async () => {
	const lpData = await window.gHub.getLandingPageData( true );

	if (window.gHub.makeMap) {
		const listings = [
			{ caption: "1", color: "#F00", lat: pCompare.lat, lng: pCompare.lng },
			{
				caption: "2",
				color: "#0F0",
				lat: lpData?.latitude,
				lng: lpData?.longitude,
			},
		];
		const options = { fitMarkers: true, mapStyle: window.gHub.mapStyle };

		window.gHub.makeMap("compare-header-map", options, { listings: listings });

		document.querySelector("section.banner-section").style.backgroundImage = "";

		if (lpData?.boundaryJSON) {
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

	window.gHub.displayAVM = () => window.gHub.currency(lpData?.avmLow) + " - " + window.gHub.currency(lpData?.avmHigh);

  if(lpData){
    const addrInput = document.getElementById("notePropertyAddress");

    if(addrInput)
      addrInput.value = `${lpData.address}, ${lpData.zip}`;

    document.querySelectorAll("[data-lead]").forEach(el => {
      const prop = el.getAttribute("data-lead");

      if ( typeof lpData[prop] !== "undefined" ) {
        el.innerHTML = lpData[prop];
      } else if ( typeof window.gHub[prop] === 'function' )  {
        el.innerHTML = window.gHub[prop]();
      }
    } );
  }
});
