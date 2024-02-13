<?xml version="1.0"?>
<!--
	Asset Name:			Home Compare Search
	Version:			1.3
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
		Default Download:	area-insider-reports/market-insider
	RederKey:			landing-page/TheGenie-Instant-Download-v6-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="landing-pages.xsl" />
<xsl:import href="landing-pages-market-insider.xsl" />


	<xsl:template name="landing-page">
		<xsl:variable name="description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Compare your ', //area/name, ' property' )" />
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="secondaryCSS" select="'home-compare-search'" />
			<xsl:with-param name="defaultUtmSource" select="'Home Compare'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>
			<header>
				<xsl:attribute name="style">
					<xsl:choose>
						<xsl:when test="//single/photoPrimary!=''">
							<xsl:value-of select="concat( 'background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.1)), url(', //single/photoPrimary, ')' )" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat( 'background-image: url(', //output/@siteUrl, '_assets/_img/comparison-search-hero.webp)' )" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<div class="banner-content">
					<div class="contents">
						<h2 class="heading-font">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'cta-line-1'" />
								<xsl:with-param name="default" select="'Want to know how'" />
							</xsl:call-template>
							<br/>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'cta-line-2'" />
								<xsl:with-param name="default" select="'your home compares?'" />
							</xsl:call-template>
						</h2>
						<p class="body-font">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'cta-line-3'" />
								<xsl:with-param name="default" select="'Interested in knowing your home&#8216;s real value'" />
							</xsl:call-template>
							<br/>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'cta-line-4'" />
								<xsl:with-param name="default" select="'and how it compares to your neighbors?'" />
							</xsl:call-template>
						</p>
						<form id="search-address-form" class="search" method="post">
<input type="text" id="search-address" size="30" placeholder="Enter your address to see your comparison" required="required" />

							<input type="image" name="submit" id="search-address-button" width="70" height="70" alt="submit">
								<xsl:attribute name="src">
									<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/home-compare-button.svg' )" />
								</xsl:attribute>
							</input>
						</form>
					</div>
				</div>
			</header>
		</body>
		<script>
			<xsl:value-of select="'
                document.addEventListener( `genie-landing-loaded`, function() {
                    let selectedPlace;
                    const ac = document.getElementById(`search-address`);
                    if (ac) {
                        gHub.autoComplete(ac, function(place) { selectedPlace = place; });

                        document.getElementById(`search-address-form`).addEventListener(`submit`, function(e) {
							const searchButton = document.getElementById(`search-address-button`);
							const previous = searchButton.src;
							const spinner = gHub.spinner(`red`);
                            searchButton.src = `data:image/svg+xml;utf8,${spinner}`;

                            gHub.searchAddress(selectedPlace.place_id ).then( function(r) {
								searchButton.src = previous;

                                if (r?.propertyID) {
									gHub.redirectToParentAsset({propertyId: r.propertyID, crLead: 1});
                                } else {
									alert(`Sorry, we can&#8217;t find that property`);
								}
                            });

                            e.preventDefault();
                        });
                    }
                });'" />
		</script>
	</xsl:template>
</xsl:stylesheet>												
