<?xml version="1.0"?>
<!--
	Asset Name:			Market Report Instant
	Version:			1.2
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
	Render Key:			landing-page/TheGenie-Property-Comparison-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="landing-pages.xsl" />


	<xsl:template name="landing-page">
		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat(//area/name, ' Housing Market Report' )" />
			<xsl:with-param name="description" select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
			<xsl:with-param name="secondaryCSS" select="'market-report-instant'" />

			<xsl:with-param name="seoImage">
				<xsl:call-template name="listing-image">
					<xsl:with-param name="index" select="number(1)" />
					<xsl:with-param name="preferPrimary" select="'true'" />
				</xsl:call-template>
			</xsl:with-param>

			<xsl:with-param name="defaultUtmSource" select="'Property Compare'" />
			<xsl:with-param name="defaultUtmCampaign" select="concat( $listingAddressLine1, ', ', $listingAddressLine2 )" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'New Lead from ', //single/address/street, ' Property Comparison Site!')" />
		</xsl:call-template>

		<body style="scroll-behavior: smooth;">
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'market-report-instant ', //output/@theme )" />
			</xsl:attribute>

			<script>
				<xsl:value-of select="concat( 'const listings = [{caption: `1`, color: `#F00`, lat: ', number(//single/latitude), ', lng: ', number(//single/longitude), '}, {caption: `2`, color: `#0F0`, lat: ', number(//lead/property/latitude), ', lng: ', number(//lead/property/longitude), '}];' )" />
				<xsl:value-of select="concat( &quot;const options = { fitMarkers: true, mapStyle: `&quot;, //output/@mapStyle, &quot;`}; &quot; )" />
				<xsl:value-of select="&quot;document.addEventListener( `genie-landing-loaded`, function() { document.querySelector('section.banner-section').style.backgroundImage = ''; gg.makeMap( `compare-header-map`, options, { listings: listings } ); });&quot;" />
			</script>

			<section class="banner-section market-report-instant-banner" style="position:relative; display:block; background-color: var(--theme-body-background);">
				<xsl:attribute name="style">
<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />

				</xsl:attribute>

				<div class="banner-section" id="compare-header-map" style="z-index: 0;">
					<xsl:comment/>
				</div>

				<div class="container banner-content-box-temp-11">
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<div class="report-for">
								<div class="area-info">
									<div class="heading">
										<h5>Market Insider Report For</h5>
									</div>
									<div class="area-name">
										<h4>
											<text data-max-width="5%">
												<xsl:value-of select="concat( //area/name,' &#160;', $propertyType )" />
											</text>
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="dark-bg market-update">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'MarketUpdate'" />
					</xsl:call-template>
				</div>
			</section>

			<div class="container" id="embed_fast_facts">
				<xsl:call-template name="add-genie-embed">
					<xsl:with-param name="embed" select="'FastFacts'" />
				</xsl:call-template>
			</div>

			<section class="dark-bg">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'MarketTrending'" />
					</xsl:call-template>
				</div>
			</section>

			<div class="container">
				<xsl:call-template name="add-genie-embed">
					<xsl:with-param name="embed" select="'MarketActivity'" />
				</xsl:call-template>
			</div>

			<section class="dark-bg">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'PeopleBuying'" />
					</xsl:call-template>
				</div>
			</section>

			<div class="container">
				<xsl:call-template name="add-genie-embed">
					<xsl:with-param name="embed" select="'MarketHistory'" />
				</xsl:call-template>
			</div>

			<section class="dark-bg">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'ListToSold'" />
					</xsl:call-template>
				</div>
			</section>

			<!-- ToDo: My Market Value HTML/CSS to be added -->
			<div class="container" id="about">
				<xsl:call-template name="agent-about" />

<xsl:call-template name="default-thank-you-popup" />

			</div>

			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />
			</div>
		</body>

		<script>
			<xsl:value-of select="concat( &quot;const homeWkt='&quot;, //single/boundary/geoJSON, &quot;';&quot;)" />
			<xsl:value-of select="concat( &quot;const homeLat='&quot;, //single/latitude, &quot;';&quot;)" />
			<xsl:value-of select="concat( &quot;const homeLng='&quot;, //single/longitude, &quot;';&quot;)" />

			<xsl:value-of select="concat( &quot;const leadWkt='&quot;, //lead/property/boundary/geoJSON, &quot;';&quot;)" />
			<xsl:value-of select="concat( &quot;const leadLat='&quot;, //lead/property/latitude, &quot;';&quot;)" />
			<xsl:value-of select="concat( &quot;const leadLng='&quot;, //lead/property/longitude, &quot;';&quot;)" />

			<xsl:value-of select="'
				window.addEventListener(`DOMContentLoaded`, async function() {
					if(gg.makeMap){
						const headerMap = await gg.makeMap(`compare-header-map`);

						const url = gg.circleURI(`red`, 1);
						const svgIcon = new L.Icon({
							iconUrl: url,
							iconSize: [34, 34],
							iconAnchor: [12, 12],
						});
						const m1 = L.marker([homeLat, homeLng], {icon: svgIcon}).addTo(headerMap);

						const url2 = gg.circleURI(`blue`, 2);
						const svgIcon2 = new L.Icon({
							iconUrl: url2,
							iconSize: [34, 34],
							iconAnchor: [12, 12],
						});
						const m2 = L.marker([leadLat, leadLng], {icon: svgIcon2}).addTo(headerMap);

						var featureGroup = L.featureGroup([m1, m2]);
						headerMap.fitBounds(featureGroup.getBounds());

						if( leadWkt !== `` ) {
							const leadMap = await gg.makeMap(`lead-property-map`);

							window.L.geoJson( JSON.parse(leadWkt), {
								onEachFeature: function(feature, layer) {
									leadMap.fitBounds(layer.getBounds(), { maxZoom: 27 });
									leadMap.invalidateSize();
								}} 
							).addTo(leadMap);
						}
					}
				});
				function myFunction() {
					document.querySelector(`.navbar-collapse`)?.classList.toggle(`mystyle`);
				}
				function closeNavFunction() {
					document.querySelector(`.navbar-collapse`)?.classList.toggle(`mystyle`);
}'" />
		</script>
		<style>
			<xsl:value-of select="'
				.mystyle{transform: translateX(0px);}
				.close-nav-btn{transform: translateX(100%);}
'" />
		</style>
	</xsl:template>
</xsl:stylesheet>