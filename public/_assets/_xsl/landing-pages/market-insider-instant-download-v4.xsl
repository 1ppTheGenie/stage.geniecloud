<?xml version="1.0"?>
<!--
	Asset Name:			Market Insider Instant Download - Style 4
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
		Default Download:	area-insider-reports/market-insider
	Render Key:			landing-page/TheGenie-Instant-Download-v4-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl" />
	<xsl:import href="landing-pages-market-insider.xsl" />
	<xsl:import href="genie-functions.xsl" />


	<xsl:template name="landing-page">
		<xsl:variable name="change" select="genie:area-price-change( //areas/area[1]/statistics, //output/@pricePercent, 0 )" />

		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Get Customized Market Report for ', //area/name )" />
			<xsl:with-param name="description" select="$head-description" />
			<xsl:with-param name="secondaryCSS" select="'market-insider-instant-download-v4'" />
		</xsl:call-template>
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/css/market-insider-common.css' )" />
			</xsl:attribute>
		</link>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', $cssThemeClass)" />
			</xsl:attribute>

			<div class="heading-color-as-bg banner-top-section-info">
				<section class="step1">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 text-center">
								<div class="selling-information price_rise">
									<xsl:call-template name="green-red-arrow">
										<xsl:with-param name="up" select="not($change < 0)" />
									</xsl:call-template>

									<div class="selling-information">
										<h3 class="home-value-area-info heading-font background-as-color">
											<p>
												<xsl:value-of select="concat( //area/name, ' ', $singularPropertyType, ' values have ' )" />

												<xsl:choose>
													<xsl:when test="number($change) < 0">
														<xsl:text>fallen</xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>risen</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:text>&#32;</xsl:text>
												<span style="white-space: nowrap">an average of:</span>
											</p>
										</h3>

										<div class="home-price-details">
											<h4 class="home-value-area-price-info body-font background-as-color" data-max-width="30%">
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

												<span class="past-months body-font background-as-color">
													<xsl:text>in the last </xsl:text>
													<xsl:choose>
														<xsl:when test="//output/@areaPeriod &gt; 1">
															<xsl:value-of select="concat(//output/@areaPeriod, ' months' )" />
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="' 30 days'" />
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</h4>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 pl-80">
								<xsl:call-template name="title-section" />
							</div>
						</div>
					</div>
				</section>
			</div>

			<div class="background">
				<section class="home-value-request-for-report">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 text-center pr-50">
								<div class="image-information">
									<div>
										<img width="100%" height="100%">
											<xsl:attribute name="src">
												<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/default-area-image.jpg' )" />
											</xsl:attribute>
										</img>
									</div>
								</div>
							</div>
							<div class="col-lg-6 text-center">
								<div class="home-value-other-text-info">
									<div class="home-value-knowning-info heading-font heading-color">
										<p>Interested in knowing your home's TRUE&#160;value?</p>
									</div>
									<a href="javascript:gHub.homeValuePopup();" class="request-home-value subtitle-color-as-bg background-as-color">
										<div class=" heading-font btn-content-info editable">yes, I'm interested!</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>

			<xsl:call-template name="agent-about" />

			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />

				<xsl:call-template name="copyright" />
			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>
