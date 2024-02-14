<?xml version="1.0"?>
<!--
	Asset Name:			LC-Hollywood
	Version:			1.2
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Listing, Area
	Permission: 		Funnels
	Default Download:	flyers/lc-brochure-01
	Render Key:			landing-page/TheGenie-Hollywood-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl" />
	<xsl:import href="landing-pages-market-insider.xsl" />

	<xsl:template name="landing-page">
		<xsl:variable name="description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<xsl:variable name="primaryImage">
			<xsl:call-template name="listing-image">
				<xsl:with-param name="index" select="number(1)" />
				<xsl:with-param name="preferPrimary" select="'true'" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="seoImage" select="$primaryImage" />
			<xsl:with-param name="secondaryCSS" select="'cush-single-listing'" />

			<xsl:with-param name="defaultUtmSource" select="'Property (Hwood)'" />
			<xsl:with-param name="defaultUtmCampaign" select="concat( $listingAddressLine1, ', ', $listingAddressLine2 )" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'New Lead from ', //single/address/street, ' Property Site!')" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'lc-hollywood ', //output/@theme )" />

			</xsl:attribute>

			<div id="step1" class="steps banner-top-section-info section background">
				<div class="mobile-header-sec">
					<div class="tab-sec">
						<div class="tab-left-sec">
							<a class="" href="#">
								<xsl:attribute name="style">
									<xsl:value-of select="concat( 'background-image: url(', $personalLogoInverse, ')' )" />
								</xsl:attribute>
							</a>
						</div>
						<div class="tab-right-sec">
							<div class="right-content">
								<p class="connect heading-font">let's connect</p>
								<div class="call-text">
									<div class="left-text">
										<div class="phone-btn mobile-icon">
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat('tel:' , translate(//agent[1]/mobile , '.', '') )" />

												</xsl:attribute>

												<svg viewBox="0 0 53.942 53.942" style="enable-background:new 0 0 53.942 53.942;" fill="var(--theme-heading-color)">
													<path d="M53.364,40.908c-2.008-3.796-8.981-7.912-9.288-8.092c-0.896-0.51-1.831-0.78-2.706-0.78c-1.301,0-2.366,0.596-3.011,1.68
                                                    c-1.02,1.22-2.285,2.646-2.592,2.867c-2.376,1.612-4.236,1.429-6.294-0.629L17.987,24.467c-2.045-2.045-2.233-3.928-0.632-6.291
                                                    c0.224-0.309,1.65-1.575,2.87-2.596c0.778-0.463,1.312-1.151,1.546-1.995c0.311-1.123,0.082-2.444-0.652-3.731
                                                    c-0.173-0.296-4.291-7.27-8.085-9.277c-0.708-0.375-1.506-0.573-2.306-0.573c-1.318,0-2.558,0.514-3.49,1.445L4.7,3.986
                                                    c-4.014,4.013-5.467,8.562-4.321,13.52c0.956,4.132,3.742,8.529,8.282,13.068l14.705,14.705c5.746,5.746,11.224,8.66,16.282,8.66
c0,0,0,0,0.001,0c3.72,0,7.188-1.581,10.305-4.698l2.537-2.537C54.033,45.163,54.383,42.833,53.364,40.908z" />
												</svg>
												<span class="heading-font">Call</span>
											</a>
										</div>
									</div>

									<div class="left-text">
										<div class="phone-btn mail-icon">
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="concat( 'mailto:', //agent[1]/marketingEmail )" />
												</xsl:attribute>

												<svg xmlns="http://www.w3.org/2000/svg" width="469.2px" height="469.2px" viewBox="0 0 469.2 469.2" style="enable-background:new 0 0 469.2 469.2;" fill="var(--theme-heading-color)">
													<path d="M22.202,77.023C25.888,75.657,29.832,74.8,34,74.8h401.2c4.168,0,8.112,0.857,11.798,2.224L267.24,246.364
                                                c-18.299,17.251-46.975,17.251-65.28,0L22.202,77.023z M464.188,377.944c3.114-5.135,5.012-11.098,5.012-17.544V108.8
                                                c0-4.569-0.932-8.915-2.57-12.899L298.411,254.367L464.188,377.944z M283.2,268.464c-13.961,11.961-31.253,18.027-48.6,18.027
                                                c-17.347,0-34.64-6.06-48.6-18.027L20.692,391.687c4.094,1.741,8.582,2.714,13.308,2.714h401.2c4.726,0,9.214-0.973,13.308-2.714
L283.2,268.464z M2.571,95.9C0.932,99.885,0,104.23,0,108.8V360.4c0,6.446,1.897,12.409,5.012,17.544l165.777-123.577L2.571,95.9z" />
												</svg>

												<span class="heading-font">Text</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<header class="header">
					<div class="container custom-container">
						<div class="mob-user-deta">
							<div class="mob-user-deta-img">
								<svg width="100%" height="100%">
									<image x="1.6%" y="8%" width="100%" height="80px" preserveAspectRatio="xMidYMid slice">
										<xsl:attribute name="href">
											<xsl:value-of select="//agent[1]/photo" />
										</xsl:attribute>
									</image>
								</svg>
							</div>
							<div class="mob-user-deta-content">
								<h3>Presented By</h3>
								<h4>
									<xsl:value-of select="concat( //agent[1]/firstName, '&#160;', //agent[1]/lastName )" />
								</h4>
							</div>
						</div>

						<div class="nav-hamburger">
							<div class="svg_icon">
								<svg width="33" height="26" viewBox="0 0 33 26" fill="#fff"
									xmlns="http://www.w3.org/2000/svg">
									<path d="M0.895577 2.28888C0.400964 2.28888 0 1.7765 0 1.14444C0 0.512384 0.400964 0 0.895577 0H31.3452C31.8398 0 32.2408 0.512384 32.2408 1.14444C32.2408 1.7765 31.8398 2.28888 31.3452 2.28888H0.895577ZM0.895577 13.7333C0.400964 13.7333 0 13.2209 0 12.5889C0 11.9568 0.400964 11.4444 0.895577 11.4444H31.3452C31.8398 11.4444 32.2408 11.9568 32.2408 12.5889C32.2408 13.2209 31.8398 13.7333 31.3452 13.7333H0.895577ZM0.895577 25.1777C0.400964 25.1777 0 24.6653 0 24.0333C0 23.4012 0.400964 22.8888 0.895577 22.8888H31.3452C31.8398 22.8888 32.2408 23.4012 32.2408 24.0333C32.2408 24.6653 31.8398 25.1777 31.3452 25.1777H0.895577Z" class="
									background-svg"></path>
								</svg>
							</div>
						</div>

						<xsl:if test="$personalLogoInverse!=''">
							<div class="header-logo">
								<a href="#">
									<div class="agent-company-logo">
										<xsl:attribute name="style">
											<xsl:value-of select="concat( 'background-image: url(', $personalLogoInverse, ')' )" />

										</xsl:attribute>&#160;
									</div>
									<xsl:comment/>

								</a>
							</div>
						</xsl:if>

						<div class="navigation-links">
							<nav class="navbar header-navigation">
								<div class="menu-list" id="navbarNav">
									<div class="funnel-menu main-navbar">
										<div class="navbar-header">
											<button type="button" class="navbar-toggle collapsed toggler-btn" data-toggle="collapse" data-target="#sidebarMain">
												<span class="icon-bar">
													<xsl:comment/>
												</span>
												<span class="icon-bar">
													<xsl:comment/>
												</span>
												<span class="icon-bar">
													<xsl:comment/>
												</span>
											</button>
										</div>
										<div class="navbar-collapse" id="#sidebarMain">
											<div class="">
												<ul class="nav">
													<a href="javascript:void(0)" class="closebtn">×</a>

													<li class="nav-item">
														<a class="nav-link heading-color" href="#home-slider">Home</a>
													</li>

													<li class="nav-item open_about_modal">
														<a class="nav-link heading-color" href="#about-section2">Description</a>
													</li>

													<xsl:if test="//single/virtualTourUrl !=''">
														<li class="nav-item">
															<a class="nav-link open_lead_form" href="#virtualTour">Virtual Tour</a>
														</li>
													</xsl:if>

													<li class="nav-item">
														<a class="nav-link open_lead_form" href="#galary-sec">Gallery</a>
													</li>

													<li class="nav-item">
														<a class="nav-link open_lead_form" href="#real_time_market_trends">Market Trends</a>
													</li>

													<li class="nav-item">
														<a class="nav-link open_lead_form" href="#about-section">Contact</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</nav>
						</div>

						<div class="navigation-content-right">
							<div class="user-details">
								<span class=" f-name ">
									<xsl:value-of select="//agent[1]/marketingName" />
								</span>

								<h3 class="agent-phone">
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="concat('tel:' , translate(//agent[1]/mobile , '.', '') )" />
										</xsl:attribute>
										<xsl:value-of select="//agent[1]/mobile" />
									</a>
								</h3>
							</div>
							<div class="agent-photo">
								<img style="max-height: 100px;" title="Agent Photo" alt="Agent Photo">
									<xsl:attribute name="src">
										<xsl:value-of select="//agent[1]/photo" />
									</xsl:attribute>
								</img>
							</div>
						</div>
					</div>
				</header>

				<section class="home-slider" id="home-slider">
					<div class="first-section">
						<img width="100%" height="100%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="src">
								<xsl:value-of select="$primaryImage" />
							</xsl:attribute>
						</img>
						<div class="address-1 container">
							<xsl:call-template name="listing-address-line-one" />

							<span>
								<xsl:call-template name="listing-address-line-two" />

							</span>
							<span>
								<xsl:choose>
									<xsl:when test="number(//single/statusTypeID) = 2">
										<xsl:attribute name="class">
											<xsl:value-of select="'label label-success listing-status listing-status-sold'" />
										</xsl:attribute>
										<xsl:text>Sold</xsl:text>
									</xsl:when>
									<xsl:when test="number(//single/statusTypeID) = 1">
										<xsl:attribute name="class">
											<xsl:value-of select="'label label-success listing-status listing-status-listed'" />
										</xsl:attribute>
										<xsl:text>Active</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">
											<xsl:value-of select="'label label-success listing-status listing-status-pending'" />
										</xsl:attribute>
										<xsl:text>Pending</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<!-- heading -->
					</div>

					<div class="address-1 container">
						<xsl:comment/>
					</div>

					<div class="hero-details custom-container container">
						<div class="heading-color-as-bg hero-details-inner">
							<div class="hero-price">
								<span class="gradient-color">
									<!-- <xsl:value-of select="format-number( //single/price, '$###,###')" /> -->
									<xsl:choose>
										<xsl:when test="//single/soldDate!=''">
											<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />

										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="format-number( //single/price, '$###,###')" />

										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
							<div class="hero-amenities">
								<span>
									<xsl:value-of select="//single/bedrooms/@count" />

									<xsl:text> Beds</xsl:text>
								</span>
								<span>
									<xsl:value-of select="$listingTotalBathrooms" />

									<xsl:text> Baths</xsl:text>
								</span>
								<span>
									<xsl:value-of select="//single/squareFeet" />

									<xsl:text> sq. ft</xsl:text>
								</span>
							</div>

							<!-- Open House -->
							<xsl:if test="count(//openHouse/session) > 0">
								<div class="open-house" style="color: var(--theme-body-background);">
									<div>
										<h3>Open House</h3>

										<div class="open-house-times">
											<xsl:for-each select="//openHouse/session">
												<xsl:sort select="@ms" data-type="number" order="ascending"/>
												<span>
													<xsl:value-of select="concat( @dow, ', ', @month, ' ', @date )" />
												</span>
												<span>
													<xsl:value-of select="concat( @starts, ' - ', @ends )" />
												</span>
											</xsl:for-each>
										</div>
									</div>
								</div>
							</xsl:if>
						</div>
					</div>
				</section>

				<section class="about-section" id="about-section2">
					<div class="container">
						<div class="overview-text">
							<h2 class="heading-title">
								<span class="gradient-color">
									<xsl:text>Overview</xsl:text>
								</span>
							</h2>
							<div class="body-color">
								<!-- TODO port PHP function <xsl:variable name="paras" select="genie:split-to-paras( //single/description )" /> -->
								<xsl:copy-of select="//single/description" />
							</div>
						</div>
						<div class="overview-details">
							<h2 class="heading-title">
								<span class="gradient-color">
									<xsl:text>Property Details</xsl:text>
								</span>
							</h2>
							<div class="overview-details-list">
								<ul>
									<li class="body-color">
										<strong>
											<xsl:text>YEAR BUILT</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/built" />

										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>sq. ft</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="format-number(//single/squareFeet, '###,###')" />

										</span>
									</li>
									<li class="body-color">

										<strong>
											<xsl:text>Beds</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/bedrooms/@count" />

										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>BATHROOM FULL</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/bathrooms/@full" />

										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>BATHROOM HALF</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/bathrooms/@half" />

										</span>
									</li>
									<xsl:if test="//single/lotSize!=''">
										<li class="body-color">
											<strong>
												<xsl:text>LOT SQ. FT.</xsl:text>
											</strong>
											<span>
												<xsl:call-template name="lot-size" />
											</span>
										</li>
									</xsl:if>
									<li class="body-color">
										<strong>
											<xsl:text>Garage Spaces</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="(//single/parking/@garage)" />

										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>PARKING SPACES</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/parking/@spaces" />

										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>PRICE PER SQ. FT.</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="format-number( //single/price div //single/squareFeet, '$###,###')" />

										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>Type</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="$singularPropertyType" />

										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>Status</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/listingStatus" />

										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>MLS #</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/mlsNumber" />

										</span>
									</li>
								</ul>
							</div>
						</div>
						<div class="row overview-cta-list">
							<div class="col-md-4">
								<a class="cta subtitle-font heading-color-as-bg background-as-color" id="request-modal-btn" href="#request-modal" data-toggle="modal">
									<xsl:text>Request Details</xsl:text>
								</a>
							</div>
							<xsl:if test="//single/statusTypeID != 2">
								<div class="col-md-4">
									<a class="cta subtitle-font heading-color-as-bg background-as-color" id="schedule-modal-btn" href="#schedule-modal" data-toggle="modal">
										<xsl:text>Schedule A Showing</xsl:text>
									</a>
								</div>
							</xsl:if>
							<div class="col-md-4">
								<a class="cta subtitle-font heading-color-as-bg background-as-color" href="javascript:void(0);" onclick="scrollToEmbed()">Real-Time Market Stats
								</a>
							</div>
						</div>
					</div>
				</section>
				<xsl:if test="//single/virtualTourUrl !=''">
					<section class="video-section" id="virtualTour">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<h2 class="heading-title px-10">
										<span class="gradient-color">
											<xsl:text>Virtual Tour</xsl:text>
										</span>
									</h2>
									<div class="map-iframe">
										<iframe id="vt-iframe" height="315" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="">
											<xsl:attribute name="src">
												<xsl:value-of select="//single/virtualTourUrl" />

											</xsl:attribute>
											<xsl:comment/>
										</iframe>
									</div>
								</div>
							</div>
						</div>
					</section>
				</xsl:if>
				<section class="gallery" id="galary-sec">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<h2 class="heading-title px-10">
									<span class="gradient-color">
										<xsl:text>Gallery</xsl:text>
									</span>
								</h2>
							</div>
							<div class="col-md-12 masonary">
								<xsl:call-template name="gallery" />
							</div>
						</div>
					</div>
				</section>
				<section class="download-pdf">
					<div class="download-img">
						<img alt="Bar chart" width="100%" height="100%" style="object-fit: cover;">
							<xsl:attribute name="src">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-pdf-bg.jpg')" />
							</xsl:attribute>
						</img>
					</div>
					<a class="pdf-btn" target="_blank" data-genie-tags="DownloadMarketReport">
						<xsl:attribute name="href">
							<xsl:value-of select="//output/@downloadUrl" />
						</xsl:attribute>

						<div class="overlay-bg">
							<xsl:comment/>
						</div>
						<span class="gradient-color">
							<xsl:text>Download Property Brochure</xsl:text>
						</span>
					</a>
				</section>
				<section class="map container">
					<div class="map-form">
						<div class="map-form-inner">
							<h2 class="cld-title heading-title">
								<em>
									<xsl:text>I'm interested in</xsl:text>
								</em>
								<span class="gradient-color">
									<xsl:call-template name="listing-address-line-one" />

								</span>
							</h2>
							<div role="form" class="wpcf7" id="wpcf7-f194-o1" lang="en-US" dir="ltr">
								<form method="post" class="wpcf7-form funnel-create-lead" id="form_step1">
									<div class="form-field">
										<span class="wpcf7-form-control-wrap your-name">
											<input type="text" name="fullName" class="form-control" placeholder="Name" />
										</span>
									</div>
									<div class="form-field">
										<span class="wpcf7-form-control-wrap your-email">
											<input type="email" name="emailAddress" class="form-control" placeholder="Email" />
										</span>
									</div>
									<div class="form-field numberform">
										<span class="wpcf7-form-control-wrap your-message">
											<input type="text" name="contact_phone" class="form-control" placeholder="Phone" />

										</span>
										<input type="hidden" name="lead_id" value="0" class="lead-id" />
										<input type="hidden" name="send_email" value="1" />
										<input type="hidden" name="funnel_id" value="131730" />

									</div>

									<div class="f_check preferred_contact body-font desk">
										<div class="che_box body-font">
											<label class="spn" for="">Preferred contact*:</label>
											<label>
												<input type="checkbox" name="preferred_contact" />

												<xsl:text>Text</xsl:text>
											</label>
											<label>
												<input type="checkbox" name="preferred_contact" required="" checked="" />

												<xsl:text>Phone</xsl:text>
											</label>
										</div>
										<div class="che_box submit-btn">
											<input type="submit" value="Send" class="wpcf7-submit" />

										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<script>
						<xsl:value-of select="concat( &quot;const listings = [{caption: 'H', state:'&quot;, //single/listingStatus, &quot;',lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}]; &quot; )" />
						<xsl:value-of select="concat( &quot;const options = { dragPan: false, mapStyle: `&quot;, 'streets-v11', &quot;`, zoom: 21, center: { lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}}; &quot; )" />
						<xsl:value-of select="concat( &quot;document.addEventListener( `genie-landing-loaded`, function() { window.gHub.makeMap( `genie-map`, options,&quot;, &quot; { listings } ); })&quot; )" />


					</script>
					<div class="map-embed">
						<div class="map-embed-inner mapboxgl-map" id="map">
							<div id="genie-map" />

						</div>
					</div>
				</section>

				<div>
					<section class="dark-bg" id="real_time_market_trends">
						<div class="container">
							<div class="col-md-12 real-time text-center">
								<h2 class="subtitle-font">
									<span>
										<xsl:value-of select="concat('REAL-TIME ' , //area/name )" />
									</span>
									<br/>
									<span>
										<xsl:value-of select="' Neighborhood Snapshot'" />
									</span>
								</h2>
								<p class="subtitle-font">
									<xsl:value-of select="concat( '- as of ', genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001] @ [h]:[m01][PN,*-2]') )" />
								</p>
							</div>
						</div>
					</section>

					<section class="dark-bg market-update">
						<div class="container">
							<xsl:call-template name="add-genie-embed">
								<xsl:with-param name="embed" select="'MarketUpdate'" />
							</xsl:call-template>
						</div>
					</section>

					<div class="container">
						<xsl:call-template name="add-genie-embed">
							<xsl:with-param name="embed" select="'FastFacts'" />
						</xsl:call-template>
					</div>

					<section class="dark-bg">
						<div class="container">
							<xsl:call-template name="add-genie-embed">
								<xsl:with-param name="embed" select="'MarketTrending'" />
							</xsl:call-template>
						</div>
					</section>

					<div class="container">
						<xsl:call-template name="add-genie-embed">
							<xsl:with-param name="embed" select="'MarketHistory'" />
						</xsl:call-template>
					</div>

					<section class="dark-bg">
						<div class="container">
							<xsl:call-template name="add-genie-embed">
								<xsl:with-param name="embed" select="'PeopleBuying'" />
							</xsl:call-template>
						</div>
					</section>

					<div class="container">
						<xsl:call-template name="add-genie-embed">
							<xsl:with-param name="embed" select="'ListToSold'" />
						</xsl:call-template>
					</div>

					<section class="dark-bg">
						<div class="container">
							<xsl:call-template name="add-genie-embed">
								<xsl:with-param name="embed" select="'ListingMapStyleOne'" />
							</xsl:call-template>
						</div>
					</section>
				</div>

				<xsl:call-template name="agent-about" />
			</div>

			<div class="modal fade page-modal" id="request-modal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<button type="button" class="close" id="request-modal-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<div class="modal-body">
						<h5 class="modal-title">
							<xsl:text>Request Info</xsl:text>
						</h5>
						<!-- Lead Form -->
						<form id="form_step1" class="funnel-create-lead">
							<p>
								<xsl:text>Tell us how to reach you and we'll get back in touch.</xsl:text>
							</p>
							<div class="awu-field col-md-6">
								<label for="">First Name*</label>
								<input type="text" name="firstName" class="form-control" />
							</div>
							<div class="awu-field col-md-6">
								<label for="">Last Name*</label>
								<input type="text" name="lastName" class="form-control" />
							</div>
							<div class="awu-field col-md-6">
								<label for="">Email Address*</label>
								<input type="text" name="emailAddress" class="form-control" />
							</div>
							<div class="awu-field col-md-6">
								<label for="">Phone Number*</label>
								<input type="text" name="phoneNumber" class="form-control" />
							</div>
							<div class="awu-field col-md-6">
								<label for="">When are you moving?</label>
								<input type="date" name="meta[movingDate]" class="form-control" placeholder="MM/DD/YYYY" />
							</div>
							<div class="awu-field col-md-6">
								<label for="">Best way to reach you?</label>
								<select class="form-control" name="meta[reachMe]">
									<option value="email and phone">Email and Phone</option>
									<option value="email">Email</option>
									<option value="phone">Phone</option>
								</select>
							</div>
							<div class="awu-field col-md-12">
								<label for="">Your Message</label>
<textarea class="form-control" name="note" cols="40" rows="10">
	<xsl:text>&#160;</xsl:text>
</textarea>
							</div>
							<div class="col-md-12">
								<input type="submit" value="Send" class="submit-btn" />
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="modal fade page-modal" id="schedule-modal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<button type="button" class="close" id="schedule-modal-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<div class="modal-body">
						<h5 class="modal-title">
							<xsl:text>Schedule A Showing</xsl:text>
						</h5>
						<!-- Lead Form -->
						<form id="form_step1" class="funnel-create-lead">
							<p>
								<xsl:text>Tell us how to reach you and we'll get back in touch.</xsl:text>
							</p>
							<div class="awu-field col-md-6">
								<label for="">First Name*</label>
								<input type="text" name="firstName" class="form-control" />

							</div>
							<div class="awu-field col-md-6">
								<label for="">Last Name*</label>
								<input type="text" name="lastName" class="form-control" />

							</div>
							<div class="awu-field col-md-6">
								<label for="">Email Address*</label>
								<input type="text" name="emailAddress" class="form-control" />

							</div>
							<div class="awu-field col-md-6">
								<label for="">Phone Number*</label>
								<input type="text" name="phoneNumber" class="form-control" />

							</div>
							<div class="awu-field col-md-6">
								<label for="">When are you available?</label>
								<input type="date" class="form-control" name="meta[availableDate]" placeholder="MM/DD/YYYY" />

							</div>
							<div class="awu-field col-md-6">
								<label for="">Are you available at another time?</label>
								<input type="date" name="meta[alternativeDate]" class="form-control" placeholder="MM/DD/YYYY" />

							</div>
							<div class="awu-field col-md-12">
								<label for="">Your Message</label>
								<textarea class="form-control" name="note" cols="40" rows="10">
<xsl:text>&#160;</xsl:text>
								</textarea>
							</div>
							<div class="col-md-12">
<input type="submit" value="Send" class="submit-btn step1-button" id="schedule-modal-btn" />

							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="modal-backdrop fade show" id="backdrop" style="display: none;">
				<xsl:comment/>
			</div>

			<xsl:call-template name="default-thank-you-popup" />

			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />
			</div>

			<script>
				<xsl:attribute name="src">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/lc-hollywood.js' )" />
				</xsl:attribute>
				<xsl:comment/>
			</script>

			<link rel="stylesheet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/lc-hollywood.css' )" />
				</xsl:attribute>
				<xsl:comment/>
			</link>
		</body>
	</xsl:template>
</xsl:stylesheet>												
