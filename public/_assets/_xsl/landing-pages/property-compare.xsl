<?xml version="1.0"?>
<!--
	Asset Name:			Property Comparison
	Version:			1.2
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
	Default Download:	area-insider-reports/market-insider
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:output method="html" encoding="utf-8" indent="no" omit-xml-declaration="yes" doctype-public="html" />

	<xsl:import href="landing-pages.xsl" />
	<xsl:import href="genie-functions.xsl" />

	<xsl:template name="landing-page">
		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Compare your ', //area/name, ' property' )" />
			<xsl:with-param name="description" select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
			<xsl:with-param name="secondaryCSS" select="'property-compare'" />

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

		<script>
			<xsl:value-of select="concat( 'const pCompare = { lat: ', number(//single/latitude), ', lng: ', number(//single/longitude), ', wkt: `, //single/boundary/geoJSON, `};' )" />
		</script>

		<script type="module" crossorigin="crossorigin">
			<xsl:attribute name="src">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/property-compare.js' )" />
			</xsl:attribute>
			<xsl:comment />
		</script>

		<body style="scroll-behavior: smooth;">
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'property-compare ', $cssThemeClass)" />
			</xsl:attribute>

			<header class="background header-section">
				<div class="container">
					<div class="row">
						<div class="col-6">
							<div class="logo-part">
								<div class="logo">
									<xsl:attribute name="style">
										<xsl:value-of select="concat( 'background: url(', $companyLogoInverse, ');background-size:contain;background-repeat:no-repeat;background-position:center;' )" />
									</xsl:attribute>
									<xsl:comment/>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="call-part text-right">
								<div class="contact-number body-font">
									<a class="heading-color" href="tel:">
										<xsl:attribute name="href">
											<xsl:value-of select="concat( 'tel:',//agent[1]/mobile )" />
										</xsl:attribute>
										<xsl:value-of select="//agent[1]/mobile" />
									</a>
								</div>
								<div class="contact-info body-font heading-color">Call Us</div>
							</div>
						</div>
					</div>
				</div>
			</header>

			<section class="banner-section" style="position:relative; display:block; background-color: var(--theme-body-background);">
				<xsl:attribute name="style">
					<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />
				</xsl:attribute>

				<div class="banner-section" id="compare-header-map" style="z-index: 0;">
					<xsl:comment />
				</div>

				<div class="container banner-content-box-temp-11">
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<div class="banner-content-part text-center">
								<p class="mb-0 body-font" data-lead="ownerDisplayName">
									<span class="spinner">
										<xsl:comment/>
									</span>
								</p>
								<h1 class="mb-0 heading-font">
									<xsl:value-of select="concat( 'Your Neighbor’s Home ', $status-caption, '!' )" />
								</h1>
								<p class="mb-0 body-font">See how yours compares!</p>
								<div class="banner-btn">
									<a href="#lead-form" data-scroll-to="#lead-form" class="btn-style body-font heading-color-as-bg background-as-color">
										<xsl:text>Get My Value</xsl:text>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="background image-section">
				<div class="container">
					<div class="row property-section">
						<div class="col-6 col-md-6 img-box-2">
							<div class="property-img-box">
								<img alt="Shot of the property">
									<xsl:attribute name="src">
										<xsl:value-of select="$primaryImage" />
									</xsl:attribute>
								</img>

								<div class="listing_property" style="display:none;"> 1 </div>

								<div class="property-img-contact-part text-center text-uppercase">
									<p class="property-house-text body-color subtitle-color mb-0 heading-font">
										<xsl:choose>
											<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
												<xsl:value-of select="'Escrow Property'" />
											</xsl:when>
											<xsl:when test="number(//single/statusTypeID)=2">
												<xsl:value-of select="'Sold House'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="'Listed House'" />
											</xsl:otherwise>
										</xsl:choose>
									</p>
									<p class="property-address-temp-11 heading-color heading-font mb-0">
										<xsl:copy-of select="$listingAddressHTML" />
									</p>
								</div>
							</div>
						</div>
						<div class="col-6 col-md-6 img-box-1">
							<div class="property-img-box">
								<div id="lead-property-map" style="width: 100%; height: 250px; filter: blur(5px) grayscale(0.75);">
									<xsl:attribute name="data-src">
										<xsl:value-of select="$primaryImage" />
									</xsl:attribute>
									<xsl:comment/>
								</div>

								<div class="your_property" style="display:none;"> 2 </div>

								<div class="property-img-contact-part text-center text-uppercase">
									<p class="property-house-text body-color subtitle-color mb-0 heading-font">YOUR HOME</p>

									<p class="property-address-temp-11 heading-color heading-font mb-0">
										<span data-lead="address">
											<span class="spinner">
												<xsl:comment/>
											</span>
										</span>
										<xsl:element name="br" />
										<span data-lead="city">
											<xsl:comment/>
										</span>
										<xsl:text>, </xsl:text>
										<span data-lead="state">
											<xsl:comment/>
										</span>
										<xsl:text>&#160;</xsl:text>
										<span data-lead="zip">
											<xsl:comment/>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-center detail-border">
							<div class="property-detail">
								<div class="property-detail-part text-center">
									<p class="heading-color body-font mb-0">
										<xsl:value-of select="//single/bedrooms/@count" />
									</p>
								</div>
								<div class="property-detail-icon-width-part text-center">
									<div class="property-detail-icon-part">
										<span class="icon">
											<svg aria-hidden="true" focusable="false"
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" style="width: 36px; height: 36px; fill: var(--vivid-color-5);">
												<path d="M176 256c44.11 0 80-35.89 80-80s-35.89-80-80-80-80 35.89-80 80 35.89 80 80 80zm352-128H304c-8.84 0-16 7.16-16 16v144H64V80c0-8.84-7.16-16-16-16H16C7.16 64 0 71.16 0 80v352c0 8.84 7.16 16 16 16h32c8.84 0 16-7.16 16-16v-48h512v48c0 8.84 7.16 16 16 16h32c8.84 0 16-7.16 16-16V240c0-61.86-50.14-112-112-112z"></path>
											</svg>
										</span>
										<p class="text-uppercase body-color body-font mb-0">
											<xsl:text>BEDROOMS</xsl:text>
										</p>
									</div>
								</div>
								<div class="property-detail-part text-center">
									<p class="heading-color body-font mb-0" data-lead="bedrooms">
										<span class="spinner">
											<xsl:comment/>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-12 text-center detail-border">
							<div class="property-detail">
								<div class="property-detail-part text-center">
									<p class="heading-color body-font mb-0">
										<xsl:value-of select="$listingTotalBathrooms" />
									</p>
								</div>
								<div class="property-detail-icon-width-part text-center">
									<div class="property-detail-icon-part">
										<span class="icon">
											<svg aria-hidden="true" role="img"
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="width: 36px; height: 36px; fill: var(--vivid-color-4);">
												<path d="M32,384a95.4,95.4,0,0,0,32,71.09V496a16,16,0,0,0,16,16h32a16,16,0,0,0,16-16V480H384v16a16,16,0,0,0,16,16h32a16,16,0,0,0,16-16V455.09A95.4,95.4,0,0,0,480,384V336H32ZM496,256H80V69.25a21.26,21.26,0,0,1,36.28-15l19.27,19.26c-13.13,29.88-7.61,59.11,8.62,79.73l-.17.17A16,16,0,0,0,144,176l11.31,11.31a16,16,0,0,0,22.63,0L283.31,81.94a16,16,0,0,0,0-22.63L272,48a16,16,0,0,0-22.62,0l-.17.17c-20.62-16.23-49.83-21.75-79.73-8.62L150.22,20.28A69.25,69.25,0,0,0,32,69.25V256H16A16,16,0,0,0,0,272v16a16,16,0,0,0,16,16H496a16,16,0,0,0,16-16V272A16,16,0,0,0,496,256Z"></path>
											</svg>
										</span>
										<p class="text-uppercase body-color body-font mb-0">
											<xsl:text>BATHROOMS</xsl:text>
										</p>
									</div>
								</div>
								<div class="property-detail-part text-center">
									<p class="heading-color body-font mb-0" data-lead="bathrooms">
										<span class="spinner">
											<xsl:comment/>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-12 text-center detail-border">
							<div class="property-detail">
								<div class="property-detail-part text-center">
									<p class="heading-color body-font mb-0">
										<xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />
									</p>
								</div>
								<div class="property-detail-icon-width-part text-center">
									<div class="property-detail-icon-part">
										<span class="icon">
											<svg aria-hidden="true" role="img"
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="width: 36px; height: 36px; fill: var(--vivid-color-3);">
												<path d="M501.65 452.08l-51.16-51.16-38.57 38.57c-3.12 3.12-8.19 3.12-11.31 0l-11.31-11.31c-3.12-3.12-3.12-8.19 0-11.31l38.57-38.57-56.57-56.57-38.57 38.57c-3.12 3.12-8.19 3.12-11.31 0l-11.31-11.31c-3.12-3.12-3.12-8.19 0-11.31l38.57-38.57-56.57-56.57-38.57 38.57c-3.12 3.12-8.19 3.12-11.31 0l-11.31-11.31c-3.12-3.12-3.12-8.19 0-11.31l38.57-38.57-56.57-56.57-38.57 38.57c-3.12 3.12-8.19 3.12-11.31 0l-11.31-11.31c-3.12-3.12-3.12-8.19 0-11.31l38.57-38.57-56.6-56.59-38.57 38.57c-3.12 3.12-8.19 3.12-11.31 0L72.51 111.4c-3.12-3.12-3.12-8.19 0-11.31l38.57-38.57-51.17-51.17C52.76 3.2 43.97 0 35.35 0 17.31 0 0 14.01 0 35.17V476.9C0 496.29 15.71 512 35.1 512h441.73c31.27 0 46.93-37.8 24.82-59.92zM128 384V259.46L252.54 384H128z"></path>
											</svg>
										</span>
										<p class="text-uppercase body-color body-font mb-0">
											<xsl:text>HOUSE SIZE (SQ. FT.)</xsl:text>
										</p>
									</div>
								</div>
								<div class="property-detail-part text-center">
									<p class="heading-color body-font mb-0" data-lead="sqFt">
										<span class="spinner">
											<xsl:comment/>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-12 text-center detail-border">
							<div class="property-detail">
								<div class="property-detail-part text-center">
									<p class="heading-color body-font mb-0">
										<xsl:value-of select="//single/built" />
									</p>
								</div>
								<div class="property-detail-icon-width-part text-center">
									<div class="property-detail-icon-part">
										<span class="icon">
											<svg aria-hidden="true" role="img"
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" style="width: 36px; height: 36px; fill: var(--vivid-color-2);">
												<path d="M400 64h-48V8c0-4.4-3.6-8-8-8h-16c-4.4 0-8 3.6-8 8v56H128V8c0-4.4-3.6-8-8-8h-16c-4.4 0-8 3.6-8 8v56H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V112c0-26.5-21.5-48-48-48zm16 400c0 8.8-7.2 16-16 16H48c-8.8 0-16-7.2-16-16V192h384v272zm0-304H32v-48c0-8.8 7.2-16 16-16h352c8.8 0 16 7.2 16 16v48zM112 384h96c8.8 0 16-7.2 16-16v-96c0-8.8-7.2-16-16-16h-96c-8.8 0-16 7.2-16 16v96c0 8.8 7.2 16 16 16zm16-96h64v64h-64v-64z"></path>
											</svg>
										</span>
										<p class="text-uppercase body-color body-font mb-0">
											<xsl:text>BUILT IN</xsl:text>
										</p>
									</div>
								</div>
								<div class="property-detail-part text-center">
									<p class="heading-color body-font mb-0" data-lead="yearBuilt">
										<span class="spinner">
											<xsl:comment/>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-12 text-center" style="position:relative;">
							<div class="form-section-overlay opacity-02 heading-color-as-bg">
								<xsl:comment/>
							</div>
							<div class="property-detail">
								<div class="property-detail-part text-center">
									<p class="font-weight-bold subtitle-color body-font mb-0">
										<xsl:value-of select="$listingPrice" />
									</p>
								</div>
								<div class="property-detail-icon-width-part text-center">
									<div class="property-detail-icon-part">
										<span class="icon">
											<svg aria-hidden="true" focusable="false" role="img"
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 288 512" style="width: 36px; height: 36px; fill: var(--vivid-color-1);">
												<path d="M211.9 242.1L95.6 208.9c-15.8-4.5-28.6-17.2-31.1-33.5C60.6 150 80.3 128 105 128h73.8c15.9 0 31.5 5 44.4 14.1 6.4 4.5 15 3.8 20.5-1.7l22.9-22.9c6.8-6.8 6.1-18.2-1.5-24.1C240.4 74.3 210.4 64 178.8 64H176V16c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v48h-2.5C60.3 64 14.9 95.8 3.1 143.6c-13.9 56.2 20.2 111.2 73 126.3l116.3 33.2c15.8 4.5 28.6 17.2 31.1 33.5C227.4 362 207.7 384 183 384h-73.8c-15.9 0-31.5-5-44.4-14.1-6.4-4.5-15-3.8-20.5 1.7l-22.9 22.9c-6.8 6.8-6.1 18.2 1.5 24.1 24.6 19.1 54.6 29.4 86.3 29.4h2.8v48c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16v-48h2.5c49.2 0 94.6-31.8 106.4-79.6 13.9-56.2-20.2-111.2-73-126.3z"></path>
											</svg>
										</span>
										<p class="text-uppercase body-color body-font mb-0">
											<xsl:text>PRICE COMPARISON</xsl:text>
										</p>
									</div>
								</div>
								<div class="property-detail-part text-center">
									<p class="font-weight-bold subtitle-color body-font mb-0">
										<xsl:choose>
											<xsl:when test="number(//output/@hideAVM)=1 or string(//output/@hideAVM)='true'">
												<div class="get-my-report-info-btn">
													<a href="#lead-form" data-scroll-to="#lead-form" class="btn-style heading-color-as-bg background-as-color body-font n">Get My Value</a>
												</div>
											</xsl:when>
											<xsl:otherwise>
												<h2 class="font-weight-bold subtitle-color body-font mb-2" data-lead="displayAVM">
													<span class="spinner">
														<xsl:comment/>
													</span>
												</h2>
											</xsl:otherwise>
										</xsl:choose>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-8 mx-auto mt-5">
							<div class="average-detail-header-part text-center">
								<div class="body-font body-color">
									<xsl:text>REALTORS&#174; only use automated valuation models to get a feel for where to start when it comes to pricing homes. The true value we land on comes from seeing your property in person, taking the surroundings and calculating the value of the intangibles. Schedule your complimentary home valuation TODAY.</xsl:text>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 mt-5 text-center form-section-btn">
							<div class="area_report_download">
								<div class="get-my-report-info-btn">
									<a href="#lead-form" data-scroll-to="#lead-form" class="btn-style heading-color-as-bg background-as-color body-font n">
										<xsl:text>Get My Value</xsl:text>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="average-detail-section background position-relative">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="average-detail-header-part text-center">
								<h2 class="heading-font heading-color">
									<xsl:value-of select="concat( 'How&#8217;s the ', //area/name, ' Market Doing?' )" />
								</h2>
							</div>
						</div>
						<div class="col-lg-8 mx-auto">
							<div class="average-detail-header-part text-center">
								<div class="body-font body-color">
									<xsl:call-template name="market-comment" />
								</div>
							</div>
						</div>
					</div>
					<div class="row average-count-box">
						<div class="col-6 col-md-6 col-lg-3 text-center">
							<div class="average-count-part">
								<p class="avg-count-number heading-font heading-color">
									<xsl:value-of select="//statistics/@averageDaysOnMarket" />
								</p>
								<p class="avg-count-text text-uppercast body-font body-color">
									<xsl:text>AVERAGE DAYS ON MARKET</xsl:text>
								</p>
							</div>
						</div>
						<div class="col-6 col-md-6 col-lg-3 text-center">
							<div class="average-count-part">
								<p class="avg-count-number heading-font heading-color">
									<xsl:value-of select="format-number(//statistics/@avgPricePerSqFtList, '$###,###')" />
								</p>
								<p class="avg-count-text text-uppercast body-font body-color">
									<xsl:text>AVERAGE LIST PRICE PER SQUARE FOOT</xsl:text>
								</p>
							</div>
						</div>
						<div class="col-6 col-md-6 col-lg-3 text-center">
							<div class="average-count-part">
								<p class="avg-count-number heading-font heading-color">
									<xsl:value-of select="format-number(//statistics/@avgPricePerSqFtSold,  '$###,###')" />
								</p>
								<p class="avg-count-text text-uppercast body-font body-color">
									<xsl:text>AVERAGE SOLD PRICE PER SQUARE FOOT</xsl:text>
								</p>
							</div>
						</div>
						<div class="col-6 col-md-6 col-lg-3 text-center">
							<div class="average-count-part">
								<p class="avg-count-number heading-font heading-color">
									<xsl:value-of select="format-number( //statistics/@averageSalePrice div //statistics/@averageListPriceForSold, '#.0%')" />
								</p>
								<p class="avg-count-text text-uppercast body-font body-color">
									<xsl:text>AVERAGE SALE PRICE TO LIST PRICE</xsl:text>
								</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 mt-5 text-center form-section-btn">
							<div class="area_report_download">
								<div class="get-my-report-info-btn">
									<a href="#" class="btn-style heading-color-as-bg background-as-color body-font" data-genie-tags="DownloadMarketReport">
										<xsl:attribute name="data-download-url">
											<xsl:value-of select="//output/@downloadUrl" />
										</xsl:attribute>
										<xsl:text>Get Full Report&#160;</xsl:text>
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="14" height="14" fill="var(--theme-body-background)">
											<path d="M313.941 216H12c-6.627 0-12 5.373-12 12v56c0 6.627 5.373 12 12 12h301.941v46.059c0 21.382 25.851 32.09 40.971 16.971l86.059-86.059c9.373-9.373 9.373-24.569 0-33.941l-86.059-86.059c-15.119-15.119-40.971-4.411-40.971 16.971V216z" />
										</svg>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section id="lead-form" class="form-section form-section-box">
				<xsl:attribute name="style">
					<xsl:value-of select="concat( 'background-image: url(', //output/@siteUrl, '_assets/_img/form-bg-img.webp)')" />
				</xsl:attribute>

				<div class="form-section-overlay heading-color-as-bg">
					<xsl:comment/>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="form-section-head-part text-center">
								<h2 class="heading-color heading-font background-as-color">
									<xsl:text>Interested in a Custom Valuation For Your Home?</xsl:text>
								</h2>
							</div>
						</div>
						<div class="col-lg-8 mx-auto">
							<div class="form-section-head-part text-center">
								<div class="body-font background-as-color">
									<xsl:text>Chat with me today about how I can get top dollar for your home in this market.</xsl:text>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 mx-auto form-section-form-part">
							<form class="funnel-create-lead">
								<input type="hidden" name="genieTags" value="RequestMoreInfo" />

								<input type="hidden" name="agent">
									<xsl:attribute name="value">
										<xsl:value-of select="//output/@userId" />
									</xsl:attribute>
								</input>

								<div class="row">
									<div class="col-lg-4">
										<div class="form-group">
											<label for="" class="background-as-color subtitle-font">Your Name</label>
											<input type="text" class="form-control" name="fullName" placeholder="Enter your name" required="required" />
										</div>
									</div>
									<div class="col-lg-4">
										<div class="form-group">
											<label for="" class="background-as-color subtitle-font">Your Phone</label>
											<input type="tel" name="phoneNumber" class="form-control phone_number" placeholder="Enter phone number" required="required" />
										</div>
									</div>
									<div class="col-lg-4">
										<div class="form-group">
											<label for="" class="background-as-color subtitle-font">Your Email</label>
											<input type="email" class="form-control" name="emailAddress" placeholder="Enter your email" required="required" />
										</div>
									</div>
									<div class="col-md-12 mt-2">
										<div class="form-group">
											<label for="exampleFormControlTextarea1" class="background-as-color subtitle-font">Tell us more about your property:</label>
											<textarea class="form-control" id="exampleFormControlTextarea1" name="note" rows="4" placeholder="Is there anything we should know before estimation?" required="required"></textarea>
										</div>
									</div>
									<div class="col-md-12 ml-auto text-right">
										<div class="mb-3 form-section-btn">
											<button type="submit" class="btn-style body-font background heading-color step1-button">SEND REQUEST</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<xsl:call-template name="default-thank-you-popup" />
			</section>

			<xsl:call-template name="agent-about" />

			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />
			</div>

			<xsl:if test="$requireDataAccess">
				<xsl:call-template name="data-access" />
			</xsl:if>
		</body>
	</xsl:template>
</xsl:stylesheet>