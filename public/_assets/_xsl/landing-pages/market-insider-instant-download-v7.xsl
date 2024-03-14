<?xml version="1.0"?>

<!--
	Asset Name:			Market Insider Instant Download - Style 7
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
	Default Download:	area-insider-reports/market-insider
	Render Key:			landing-page/TheGenie-Instant-Download-v7-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl" />
	<xsl:import href="landing-pages-market-insider.xsl" />

	<xsl:template name="landing-page">
		<xsl:variable name="description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Market-Insider Report: Instant Download for ', //area/name )" />
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="secondaryCSS" select="'market-insider-instant-download-v7'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', $cssThemeClass)" />
			</xsl:attribute>

			<div class="heading-color-as-bg banner-top-section-info section">
				<section class="step1">
					<div class="container">
						<div class="row m-0">
							<div class="col-md-7 col-sm-6 col-xs-12 text-center full-width">
								<div class="agent-information">
									<img>
										<xsl:attribute name="alt">
											<xsl:value-of select="concat( //agent[1]/first-name, '&#160;', //agent[1]/lastName )" />
										</xsl:attribute>

										<xsl:attribute name="src">
											<xsl:value-of select="//agent[1]/photo" />
										</xsl:attribute>
									</img>
								</div>
								<h1 class="agent-info-title heading-font background-as-color">
									<xsl:value-of select="concat( //area/name, ' Market&#160;Report Instant&#160;Download ' )" />
									<xsl:copy-of select="concat( 'courtesy of ', //agent[1]/marketingName )" />

								</h1>
							</div>
							<div class="col-md-5 col-sm-6 col-xs-12 full-width">
								<xsl:call-template name="title-section" />
							</div>
						</div>
					</div>
					<div class="container-fuild p-0">
						<div class="wave-design">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" class="background-svg">
								<path fill-opacity="1" stroke-width="0" d="M0,224L48,208C96,192,192,160,288,144C384,128,480,128,576,144C672,160,768,192,864,208C960,224,1056,224,1152,202.7C1248,181,1344,139,1392,117.3L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
							</svg>
						</div>
					</div>
				</section>
			</div>

			<xsl:call-template name="interested-button" />

			<xsl:call-template name="agent-about" />

			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />

				<xsl:call-template name="copyright" />
			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>												
