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
	<xsl:import href="landing-pages.xsl"/>
	<xsl:import href="landing-pages-market-insider.xsl"/>
	<xsl:import href="genie-functions.xsl"/>

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
					<!-- <div class="funnel-menu main-navbar">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed toggler-btn">
								<span class="icon-bar"><xsl:comment/></span>
								<span class="icon-bar"><xsl:comment/></span>
								<span class="icon-bar"><xsl:comment/></span>
							</button>
						</div>
						<div class="collapse navbar-collapse sidebar-collapse-menu" id="#sidebarMain">
							<div class="nav">
								<ul class="nav background">
									<a href="javascript:void(0)" class="closebtn">×</a>

									<li class="nav-item">
										<a class="nav-link active heading-color body-font" target="_blank">
											<xsl:attribute name="href">
<xsl:value-of select="concat( 'https://', //agent[1]/website )" />
											</xsl:attribute>
											<xsl:text>Home</xsl:text>
										</a>
									</li>

									<li class="nav-item open_about_modal">
										<a class="nav-link active heading-color body-font" href="#about-section">About</a>
									</li>

									<li class="nav-item">
										<a class="nav-link active open_lead_form heading-color body-font" href="#agent-contact">Contact</a>
									</li>
								</ul>
							</div>
						</div>
					</div> -->

					<div class="container">
						<div class="row">
							<div class="col-6 text-center full-width">
								<div class="selling-info-wraper">
									<xsl:variable name="change" select="genie:area-price-change( //areas/area[1]/statistics, //output/@pricePercent, 0 )" />

									<div class="selling-information background price_rise">
										<h3 class="home-value-area-info heading-font heading-color editable">
											<xsl:value-of select="concat( //area/name, ' ', $singularPropertyType, '&#160;Values' )"/>
											<br/>
											<xsl:text>Have&#160;</xsl:text>
											<xsl:choose>
												<xsl:when test="$change > 0">
													<strong>Fallen</strong>
												</xsl:when>
												<xsl:otherwise>
													<strong>Risen</strong>
												</xsl:otherwise>
											</xsl:choose>

											<xsl:text> an average&#160;of:</xsl:text>
										</h3>
										<xsl:choose>
											<xsl:when test="$change > 0">

												<svg fill="var(--active-green)" version="3.0" id="Capa_1"
													xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 490.667 490.667" style="enable-background:new 0 0 490.667 490.667;" xml:space="preserve">

													<g>
														<path d="M245.333,0C110.059,0,0,110.059,0,245.333s110.059,245.333,245.333,245.333s245.333-110.059,245.333-245.333
                                                        S380.608,0,245.333,0z M245.333,469.333c-123.52,0-224-100.48-224-224s100.48-224,224-224s224,100.48,224,224
                                                        S368.853,469.333,245.333,469.333z"></path>
													</g>
													<g>
														<path d="M245.333,106.667c-5.888,0-10.667,4.779-10.667,10.667v256c0,5.888,4.779,10.667,10.667,10.667S256,379.221,256,373.333
                                                     v-256C256,111.445,251.221,106.667,245.333,106.667z"></path>
													</g>
													<g>
														<path d="M338.219,195.115l-85.333-85.333c-4.16-4.16-10.923-4.16-15.083,0l-85.333,85.333c-4.16,4.16-4.16,10.923,0,15.083
                                                    c4.16,4.16,10.923,4.16,15.083,0l77.781-77.781l77.781,77.803c2.091,2.069,4.821,3.115,7.552,3.115c2.731,0,5.461-1.045,7.552-3.136C342.379,206.037,342.379,199.275,338.219,195.115z"></path>
													</g>
												</svg>
											</xsl:when>
											<xsl:otherwise>
												<svg fill="var(--sold-red)" version="3.0" id="Layer_1"
													xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 500 500" style="enable-background:new 0 0 500 500;" xml:space="preserve">
													<path d="M382.2,255.5c-7-7-18.3-7-25.3,0l-84.8,84.6V110.9c0-9.8-8-17.8-17.9-17.8c-9.9,0-17.9,8-17.9,17.8v229.3
                                                    l-84.8-84.7c-7-7-18.3-7-25.3,0c-7,7-7,18.2,0,25.2l128,127.7l128-127.7C389.1,273.7,389.1,262.4,382.2,255.5L382.2,255.5z"/>
													<path d="M250,478.7c-126.6,0-229.5-102.7-229.5-229s103-229,229.5-229c126.6,0,229.5,102.7,229.5,229
                                                    C479.5,375.9,376.5,478.7,250,478.7L250,478.7z M250,49.2c-110.7,0-200.8,89.9-200.8,200.4S139.3,450,250,450
                                                    s200.8-89.9,200.8-200.4S360.7,49.2,250,49.2L250,49.2z"/>
												</svg>
											</xsl:otherwise>
										</xsl:choose>

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
													<xsl:value-of select="format-number( $change, '#.#' )" />
												</xsl:otherwise>
											</xsl:choose>

											<span class="past-months">
												<xsl:text>in the last&#160;</xsl:text>
												<xsl:choose>
													<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
														<xsl:text>30 days</xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="concat( //areas/area[1]/statistics/@lookbackMonths, ' months')"/>
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
