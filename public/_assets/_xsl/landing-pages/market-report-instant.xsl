<?xml version="1.0"?>
<!--
	Asset Name:			Market Report Instant
	Version:			1.2
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
	Render Key:			landing-page/instant-market-report-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl" />

	<xsl:template name="landing-page">
    <xsl:variable name="defaultUtmSource">
        <xsl:value-of select="'Market Report Instant'" />
      </xsl:variable>
      <xsl:variable name="defaultUtmCampaign">
        <xsl:value-of select="//area/name" />
    </xsl:variable>

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

			<xsl:with-param name="defaultUtmSource" select="$defaultUtmSource" />
			<xsl:with-param name="defaultUtmCampaign" select="$defaultUtmCampaign" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'New Lead from ', //area/name, ' Market Report Instant!')" />
		</xsl:call-template>

		<body style="scroll-behavior: smooth;">
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'market-report-instant ', $cssThemeClass)" />
			</xsl:attribute>
			<xsl:call-template name="process-snippet">
				<xsl:with-param name="snippet" select="//agent[1]/snippetOpenBodyTag" />
			</xsl:call-template>
			<style>
				<xsl:value-of select="'
				.genie-alternate { background-color: var(--theme-body-background); padding: 1rem 0; }
				.mystyle{transform: translateX(0px);}
				.close-nav-btn{transform: translateX(100%);}
'" />
			</style>

			<script>
				<xsl:value-of select="concat('const polygon =', //area[1]/geojson,';' )" />
				<xsl:value-of select="concat( &quot;const options = { pitch: 60, bearing: 20, zoom: 11, fitMarkers: true, mapStyle: `&quot;, //output/@mapStyle, &quot;`}; &quot; )" />
				<xsl:value-of select="&quot;document.addEventListener( `genie-landing-loaded`, function() {  document.querySelector('section.banner-section').style.backgroundImage = ''; gHub.makeMap( `market-report-instant-header-map`, options, { geoJson: polygon } ); });&quot;" />
			</script>

			<section class="banner-section market-report-instant-banner" style="position:relative; display:block; background-color: var(--theme-body-background);">
				<xsl:attribute name="style">
					<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />
				</xsl:attribute>

				<div class="banner-section" id="market-report-instant-header-map" style="z-index: 0;">
					<xsl:comment/>
				</div>

				<div class="container banner-content-box-temp-11">
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<div class="report-for">
								<div class="area-info" style="width: 100%">
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

			<section class="genie-alternate">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'MarketUpdate'" />
					</xsl:call-template>
				</div>
			</section>

			<section class="genie-alternate">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'FastFacts'" />
					</xsl:call-template>
				</div>
			</section>

			<section class="genie-alternate">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'MarketTrending'" />
					</xsl:call-template>
				</div>
			</section>

			<!-- DevDsiabled
			<div class="container">
				<xsl:call-template name="add-genie-embed">
					<xsl:with-param name="embed" select="'MarketActivity'" />
				</xsl:call-template>
			</div>
-->

			<section class="genie-alternate">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'PeopleBuying'" />
					</xsl:call-template>
				</div>
			</section>

			<section class="genie-alternate">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'MarketHistory'" />
					</xsl:call-template>
				</div>
			</section>

			<section class="genie-alternate">
				<div class="container">
					<xsl:call-template name="add-genie-embed">
						<xsl:with-param name="embed" select="'ListToSold'" />
					</xsl:call-template>
				</div>
			</section>

			<section id="my-home-valuation" class="inverse">
				<div class="overlay">
					<xsl:comment/>
				</div>

				<h2>
					<xsl:value-of select="concat( 'What&#8217;s My ', //areas/area[1]/name, ' ', $singularPropertyType, ' Value?')" />
				</h2>
				<p>
					<xsl:value-of select="concat( 'See how your home compares to other homes in ', //areas/area[1]/name, ', and find out what you can do to increase its worth. Get your personalized home report, and learn what people are looking for in a home.')" />
				</p>

				<a href="#" class="request-home-value">
					Find what my property is worth!
				</a>
			</section>


			<section class="genie-alternate">
				<!-- ToDo: My Market Value HTML/CSS to be added -->
				<div class="container" id="about">
					<xsl:call-template name="agent-about" />
					<xsl:call-template name="default-thank-you-popup" />
				</div>

				<div class="funnel-footer-background">
					<xsl:call-template name="agent-details" />
					<xsl:call-template name="copyright" />
				</div>
			</section>
      <xsl:call-template name="utm-page-default">            
        <xsl:with-param name="defaultUtmSource" select="$defaultUtmSource" />
        <xsl:with-param name="defaultUtmCampaign" select="$defaultUtmCampaign" />
      </xsl:call-template>
			<xsl:call-template name="process-snippet">
				<xsl:with-param name="snippet" select="//agent[1]/snippetCloseBodyTag" />
			</xsl:call-template>
		</body>
	</xsl:template>
</xsl:stylesheet>