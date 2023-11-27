<?xml version="1.0"?>
<!--
	Asset Name:			Market Insider Instant Download - Style 6
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
	Default Download:	area-insider-reports/market-insider
	Render Key:			landing-page/TheGenie-Instant-Download-v6-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl" />
	<xsl:import href="landing-pages-market-insider.xsl" />
	<xsl:import href="genie-functions.xsl" />

	<xsl:template name="landing-page">
		<xsl:variable name="description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/css/market-insider-common.css' )" />
			</xsl:attribute>
		</link>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Market-Insider Report: Instant Download for ', //area/name )" />
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="secondaryCSS" select="'market-insider-instant-download-v6'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', //output/@theme )" />
			</xsl:attribute>

			<div id="step1" class="steps heading-color-as-bg banner-top-section-info section">
				<section class="step1">
					<div class="container">
						<div class="row">
							<div class="col-6 text-center full-width">
								<div class="selling-info-wraper">
									<xsl:variable name="change" select="genie:area-price-change( //areas/area[1]/statistics, //output/@pricePercent, 1 )" />

									<div class="selling-information background price_rise">
										<h3 class="home-value-area-info heading-font heading-color editable">
											<xsl:value-of select="concat( //area/name, ' ', $singularPropertyType, '&#160;Values' )" />

											<br/>
											<xsl:text>have&#160;</xsl:text>
											<xsl:choose>
												<xsl:when test="number($change) < 0">
													<strong>fallen</strong>
												</xsl:when>
												<xsl:otherwise>
													<strong>risen</strong>
												</xsl:otherwise>
											</xsl:choose>

											<xsl:text>&#32;</xsl:text>
											<span style="white-space: nowrap">an average of:</span>
										</h3>

										<xsl:call-template name="green-red-arrow">
											<xsl:with-param name="up" select="not($change < 0)" />
										</xsl:call-template>

										<div class="graph-image price_rise">
											<img alt="Illustrative bar graph">
												<xsl:attribute name="src">
													<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bar-graph.png')" />
												</xsl:attribute>
											</img>
										</div>
										<h4 class="home-value-area-price-info body-font heading-color">
											<xsl:choose>
												<xsl:when test="//output/@pricePercent = 'price'">
													<xsl:value-of select="genie:currency-format( $change, 0 )" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="round-whole-percents">
														<xsl:with-param name="num" select="$change" />
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>

											<span class="past-months">
												<xsl:text>in the last&#160;</xsl:text>
												<xsl:choose>
													<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
														<xsl:text>30 days</xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="concat( //areas/area[1]/statistics/@lookbackMonths, ' months')" />
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</h4>
									</div>
								</div>
							</div>

							<div class="col-6 full-width">
								<xsl:call-template name="title-section" />
							</div>
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
