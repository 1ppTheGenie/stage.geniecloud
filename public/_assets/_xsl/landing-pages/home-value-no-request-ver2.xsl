<?xml version="1.0"?>
<!--
	Asset Name:		Home Value No Request Ver2
	Version:		1.2
	Tags:			Landing Page
	Sizes:			Landing Page
	Supports:		Area Funnel
	Permission: 	Funnels
	Render Key:      'landing-page/TheGenie-Property-Comparison-MLSNUMBER   
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="landing-pages.xsl" />


    <xsl:template name="landing-page">
        <xsl:call-template name="standard-header">
            <xsl:with-param name="title" select="concat( 'Compare your ', //area/name, ' property' )" />
            <xsl:with-param name="description" select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />

            <xsl:with-param name="secondaryCSS" select="'home-value-no-request-ver2'" />

            <xsl:with-param name="seoImage">
                <xsl:call-template name="listing-image">
                    <xsl:with-param name="index" select="number(1)" />
                    <xsl:with-param name="preferPrimary" select="'true'" />
                </xsl:call-template>
            </xsl:with-param>

            <xsl:with-param name="defaultUtmSource" select="'Property Compare'" />
            <xsl:with-param name="defaultUtmCampaign" select="concat( $listingAddressLine1, ', ' , $listingAddressLine2 )" />
            <xsl:with-param name="leadNotePrompt" select="concat( 'New Lead from ', //single/address/street, ' Property Comparison Site!')" />
        </xsl:call-template>

        <body style="scroll-behavior: smooth;">

            <xsl:attribute name="class">
                <xsl:value-of select="concat( 'home-value-no-request-v2 ', $cssThemeClass)" />
            </xsl:attribute>

            <script>
                <xsl:value-of select="concat( 'const listings = [{caption: `1`, color: `#d0a538`, lat: ', number(//single/latitude), ', lng: ', number(//single/longitude), '}, {caption: `2`, color: `#0F0`, lat: ', number(//lead/property/latitude), ', lng: ', number(//lead/property/longitude), '}];' )" />
                <xsl:value-of select="concat( &quot;const options = { fitMarkers: true, mapStyle: `&quot;, //output/@mapStyle, &quot;`}; &quot; )" />
                <xsl:value-of select="&quot;document.addEventListener( `genie-landing-loaded`, function() { document.querySelector('section.banner-section').style.backgroundImage = ''; gHub.makeMap( `compare-header-map`, options, { listings: listings } ); });&quot;" />
            </script>

            <section class="banner-section market-report-instant-banner" style="position:relative; display:block; background-color: var(--theme-body-background);">
                <xsl:attribute name="style">
<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />

                </xsl:attribute>

<div class="banner-section" id="compare-header-map" style="z-index: 0;" />


            </section>

            <!-- Start -->
            <div class="container banner-content-box-temp-11">
                <div class="row">
                    <div class="col-md-12 col-lg-12 text-center">

                        <div class="report-for">
                            <div class="client-pic">
                                <img width="100%" height="100%">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="//agent[1]/photo" />
                                    </xsl:attribute>
                                </img>
                            </div>
                            <div class="heading">
                                <h1>What’s My 34102 Home Value?</h1>
                            </div>
                            <div class="quote-text">
                                <p>GET A <strong>FREE QUOTE</strong> - NO STRINGS ATTACHED</p>
                            </div>
                            <div class="description-text">
                                <p>
                                    <strong>
                                            Thinking of selling? Let us assess your home’s value to help you decide if now’s the time to move.
                                    </strong>
                                </p>
                            </div>
                            <div class="get-value">
                                <input type="text" placeholder="Enter a PROPERTY ADDRESS" />
                                <button type="submit">Get your Value!</button>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <!-- Start -->

            <div class="funnel-footer-background top-space">
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
                window.addEventListener(`DOMContentLoaded`, async function() = {
                    if(gHub.makeMap){
                        const headerMap = await gHub.makeMap(`compare-header-map`);

                        const url = gHub.circleURI(`red`, 1);
                        const svgIcon = new L.Icon({
                            iconUrl: url,
                            iconSize: [34, 34],
                            iconAnchor: [12, 12],
                        });
                        const m1 = L.marker([homeLat, homeLng], {icon: svgIcon}).addTo(headerMap);

                        const url2 = gHub.circleURI(`blue`, 2);
                        const svgIcon2 = new L.Icon({
                            iconUrl: url2,
                            iconSize: [34, 34],
                            iconAnchor: [12, 12],
                        });
                        const m2 = L.marker([leadLat, leadLng], {icon: svgIcon2}).addTo(headerMap);

                        var featureGroup = L.featureGroup([m1, m2]);
                        headerMap.fitBounds(featureGroup.getBounds());

                        if( leadWkt !== `` ) {
                            const leadMap = await gHub.makeMap(`lead-property-map`);

                            window.L.geoJson( JSON.parse(leadWkt), {
                                onEachFeature: function (feature, layer){
                                    leadMap.fitBounds(layer.getBounds(), { maxZoom: 27 });
                                    leadMap.invalidateSize();
                                }} 
                            ).addTo(leadMap);
                        }
                    }
});'" />
        </script>
    </xsl:template>
</xsl:stylesheet>