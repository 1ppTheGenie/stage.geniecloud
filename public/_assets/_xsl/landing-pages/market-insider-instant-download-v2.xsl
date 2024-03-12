<?xml version="1.0"?>
<!--
	Asset Name:			Home Comparison Search
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
	Default Download:	area-insider-reports/market-insider
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
			<xsl:with-param name="secondaryCSS" select="'market-insider-instant-download-v2'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', $cssThemeClass)" />
			</xsl:attribute>

			<div id="step1" class="steps heading-color-as-bg banner-top-section-info section">
				<form id="form_step1" class="funnel-create-lead" data-callback="template4_step1">
					<section class="step1" style="background-image: url('/_assets/_img/home-value-bg.jpg');">

						<div class="funnel-header-company-logo" style="background-image: url('/_assets/_img/logo.png');">
							<xsl:comment/>
						</div>

						<div class="container">
							<div class="row">
								<div class="col-md-7 col-sm-7 col-xs-7 text-center full-width">
									<div class="selling-info-wraper">
										<xsl:variable name="change" select="genie:area-price-change( //areas/area[1]/statistics, //output/@pricePercent, 0 )" />
										<div class="selling-information background price_rise">
											<h3 class="home-value-area-info heading-font heading-color">
												<xsl:value-of select="concat( //area/name, ' ', $singularPropertyType, '&#160;Values' )" />

												<br/>
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

											<xsl:call-template name="green-red-arrow">
												<xsl:with-param name="up" select="not($change < 0)" />
											</xsl:call-template>

											<div class="graph-image price_rise">
												<img alt="Bar chart">
													<xsl:attribute name="src">
														<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bar-graph.png')" />
													</xsl:attribute>
												</img>
											</div>
											<h4 class="home-value-area-price-info body-font heading-color">
												<xsl:choose>
													<xsl:when test="//output/@pricePercent = 'price'">
														<xsl:value-of select="genie:currency-format( abs($change), 0 )" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="format-number( abs($change), '#.#' )" />
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
										<div class="home-values-bottom-bar heading-color-as-bg">
											<h5 class="background-as-color background-as-color"></h5>
											<div class="angle-group">
												<span class="angle-icon angle-icon">
													<svg viewBox="0 0 384 512" class="background-svg">
														<path d="M169.4 278.6C175.6 284.9 183.8 288 192 288s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25s-32.75-12.5-45.25 0L192 210.8L54.63 73.38c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25L169.4 278.6zM329.4 265.4L192 402.8L54.63 265.4c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25l160 160C175.6 476.9 183.8 480 192 480s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25S341.9 252.9 329.4 265.4z" />

													</svg>
												</span>
												<span class="angle-icon angle-icon">
													<svg viewBox="0 0 384 512" class="background-svg">
														<path d="M169.4 278.6C175.6 284.9 183.8 288 192 288s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25s-32.75-12.5-45.25 0L192 210.8L54.63 73.38c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25L169.4 278.6zM329.4 265.4L192 402.8L54.63 265.4c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25l160 160C175.6 476.9 183.8 480 192 480s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25S341.9 252.9 329.4 265.4z" />

													</svg>
												</span>
												<span class="angle-icon angle-icon">
													<svg viewBox="0 0 384 512" class="background-svg">
														<path d="M169.4 278.6C175.6 284.9 183.8 288 192 288s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25s-32.75-12.5-45.25 0L192 210.8L54.63 73.38c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25L169.4 278.6zM329.4 265.4L192 402.8L54.63 265.4c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25l160 160C175.6 476.9 183.8 480 192 480s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25S341.9 252.9 329.4 265.4z" />

													</svg>
												</span>
												<span class="angle-icon angle-icon">
													<svg viewBox="0 0 384 512" class="background-svg">
														<path d="M169.4 278.6C175.6 284.9 183.8 288 192 288s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25s-32.75-12.5-45.25 0L192 210.8L54.63 73.38c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25L169.4 278.6zM329.4 265.4L192 402.8L54.63 265.4c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25l160 160C175.6 476.9 183.8 480 192 480s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25S341.9 252.9 329.4 265.4z" />

													</svg>
												</span>
												<span class="angle-icon angle-icon">
													<svg viewBox="0 0 384 512" class="background-svg">
														<path d="M169.4 278.6C175.6 284.9 183.8 288 192 288s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25s-32.75-12.5-45.25 0L192 210.8L54.63 73.38c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25L169.4 278.6zM329.4 265.4L192 402.8L54.63 265.4c-12.5-12.5-32.75-12.5-45.25 0s-12.5 32.75 0 45.25l160 160C175.6 476.9 183.8 480 192 480s16.38-3.125 22.62-9.375l160-160c12.5-12.5 12.5-32.75 0-45.25S341.9 252.9 329.4 265.4z" />

													</svg>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-5 col-sm-5 col-xs-5 full-width">
									<xsl:call-template name="title-section" />
								</div>
							</div>
						</div>
						<div class="container-fuild p-0">
							<div class="wave-design price_rise">
								<svg viewBox="0 0 1440 320" class="background-svg">
									<path fill-opacity="1" stroke-width="0" d="M0,224L48,208C96,192,192,160,288,144C384,128,480,128,576,144C672,160,768,192,864,208C960,224,1056,224,1152,202.7C1248,181,1344,139,1392,117.3L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z" />
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
