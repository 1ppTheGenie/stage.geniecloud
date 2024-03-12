<?xml version="1.0"?>
<!--
	Asset Name:			Market Insider Instant Download v5
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
			<xsl:with-param name="secondaryCSS" select="'market-insider-instant-download-v5'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', $cssThemeClass)" />
			</xsl:attribute>

			<div id="step1" class="steps heading-color-as-bg banner-top-section-info section">
				<form id="form_step1" class="funnel-create-lead" data-callback="template4_step1">
					<section class="step1">
						<img alt="Bar chart">
							<xsl:attribute name="src">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/market-insider-v5.jpg')" />
							</xsl:attribute>
						</img>
						<div class="step1-overlay background">
							<xsl:comment/>
						</div>

						<xsl:if test="string($personalLogo)!=''">
							<a href="#">
								<div class="funnel-header-company-logo editable">
									<xsl:attribute name="style">
										<xsl:value-of select="concat( 'background-image: url(', $personalLogo, ')' )" />
									</xsl:attribute>
									<xsl:comment/>
								</div>
							</a>
						</xsl:if>

						<div class="container">
							<div class="row">
								<div class="col-lg-8 p-0 text-center">
									<div class="selling-information price_rise">
										<xsl:variable name="change" select="genie:area-price-change( //areas/area[1]/statistics, //output/@pricePercent, 0 )" />

										<xsl:call-template name="green-red-arrow">
											<xsl:with-param name="up" select="not($change < 0)" />
										</xsl:call-template>
									
										<h3 class="home-value-area-info heading-font heading-color">
											<xsl:value-of select="concat( //area/name, ' ', $singularPropertyType, '&#160;Values' )" />
											<br />
											<xsl:text>have&#160;</xsl:text>
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
										</h3>
										<div class="price_info_with_icon price_rise">
											<h4 class="home-value-area-price-info body-font heading-color">
												<xsl:choose>
													<xsl:when test="//output/@pricePercent = 'price'">
														<xsl:value-of select="genie:currency-format( abs($change), 0 )" />
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

								<div class="col-lg-4 pr-0">
									<div class="fl-listing-wrapper">

										<h1 class="main-title-info heading-font heading-color" data-key="funnel_title_area_info" data-type="text" data-default="Anaheim Hills Market Report Instant&#160;Download">
											<xsl:value-of select="concat( 'Get Customized Market Report for ', //area/name, ' ',$propertyType)" />
										</h1>
										<p class="heading-color opening-text">
											<xsl:value-of select="concat('The ', //area/name, ' ', lower-case($singularPropertyType), ' market is shifting! View the latest market trends and grab your customized report now.')" />
										</p>
										<h4 class="body-font heading-color">INCLUDES:</h4>
										<ul class="fl-listing body-font heading-color">
											<li>Average Sales Price</li>
											<li>Average List Price to Sales Price %</li>
											<li>Average Price Per Square Foot</li>
											<li>Number of Sales by Bedrooms</li>
											<li>Active and New Listings</li>
										</ul>
										<xsl:call-template name="download-button" />
									</div>
								</div>
							</div>
						</div>
						<div class="container-fuild p-0">
							<div class="wave-design price_rise">

								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" class="background-svg">
									<path fill-opacity="1" stroke-width="0" d="M0,224L48,208C96,192,192,160,288,144C384,128,480,128,576,144C672,160,768,192,864,208C960,224,1056,224,1152,202.7C1248,181,1344,139,1392,117.3L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z">
									</path>
								</svg>
							</div>
						</div>
					</section>
				</form>
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
