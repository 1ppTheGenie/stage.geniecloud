<?xml version="1.0"?>
<!--
	Asset Name:			LC-AUSTIN
	Version:			1.1
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Listing, Area
	Permission: 		Funnels
		Render Key:			landing-page/TheGenie-Austin-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:output method="html" encoding="utf-8" indent="no" omit-xml-declaration="yes" doctype-public="html" />

	<xsl:import href="landing-pages.xsl" />

	<xsl:template name="landing-page">
		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>
		<xsl:variable name="status-name">
			<xsl:choose>
				<xsl:when test="number(//single/statusTypeID)=2">
					<xsl:value-of select="'Sold'" />
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=1">
					<xsl:value-of select="'Listed'" />
				</xsl:when>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<xsl:value-of select="'Pending'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'Coming Soon'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="pageTitle">
			<xsl:call-template name="listing-address-line-one" />
			<xsl:text>,&#160;</xsl:text>
			<xsl:call-template name="listing-address-line-two" />
		</xsl:variable>
		<xsl:variable name="listing-caption">
			<xsl:choose>
				<xsl:when test="number(//single/statusTypeID) = 2">
					<xsl:text>Sold</xsl:text>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID) = 1">
					<xsl:text> Listed </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> Pending </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="standard-header">
			<xsl:with-param name="seoImage" select="//single/photoPrimary" />
			<xsl:with-param name="secondaryCSS" select="'single-property-1'" />
			<xsl:with-param name="defaultUtmSource" select="'Property (Austin)'" />
			<xsl:with-param name="defaultUtmCampaign" select="concat( $listingAddressLine1, ', ', $listingAddressLine2 )" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'New Lead from ', //single/address/street, ' Property Site!')" />
		</xsl:call-template>
		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>
			<script>
				<xsl:value-of select="concat( &quot;const listing = [{caption: 'H', state:'&quot;, //single/listingStatus, &quot;',lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}]; &quot; )" />
				<xsl:value-of select="concat( &quot;const options = { dragPan: false, mapStyle: `&quot;, 'streets-v11', &quot;`, zoom: 21, center: { lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}}; &quot; )" />
				<xsl:value-of select="'document.addEventListener( `genie-landing-loaded`, function() { window.gHub.makeMap( `genie-map`, options, { listings:listing } ); })'" />
			</script>
			<div class="funnel-template-8 background">
				<div class="mobile-header-sec">
					<div class="tab-sec">
						<div class="tab-left-sec">
							<a class="" href="#">
								<xsl:attribute name="style">
									<xsl:value-of select="concat( 'background-image: url(', $personalLogo, ')' )" />
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
												<svg version="3.0" id="Capa_1"
													xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 53.942 53.942" style="enable-background:new 0 0 53.942 53.942;" xml:space="preserve" fill="var(--theme-heading-color)">
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
								<img width="100%" height="100%">
									<xsl:attribute name="src">
										<xsl:value-of select="//agent[1]/photo" />
									</xsl:attribute>
								</img>
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
														<a class="nav-link active heading-color" href="#home-slider">Home</a>
													</li>
													<li class="nav-item open_about_modal">
														<a class="nav-link active heading-color" href="#description-sec">Description</a>
													</li>
													<li class="nav-item">
														<a class="nav-link active open_lead_form heading-color" href="#galary-sec">Gallery</a>
													</li>
													<li class="nav-item">
														<a class="nav-link active open_lead_form heading-color" href="#real_time_market_trends">Market Trends</a>
													</li>
													<li class="nav-item">
														<a class="nav-link active open_lead_form heading-color" href="#about-section">Contact</a>
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
								<img width="100%" height="100%" title="Agent Photo" alt="Agent Photo">
									<xsl:attribute name="src">
										<xsl:value-of select="//agent[1]/photo" />
									</xsl:attribute>
								</img>
							</div>
						</div>
					</div>
				</header>
				<div class="banner-content-box" id="home-slider">
					<div class="banner">
						<xsl:choose>
							<xsl:when test="$primaryImageNoDefault!=''">
								<xsl:attribute name="style">
									<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<div style="width:100%; height:100%; position: absolute; top:0; left:0; zindex:1;">
									<div id="closeup-satellite-map" data-width="100%" data-height="100%" style="height:580px;">
										<xsl:comment/>
									</div>
								</div>
								<script>
									<xsl:value-of select="'options.mapStyle = `satellite-v9`;options.zoom = 25;'" />
									<xsl:value-of select="'document.addEventListener(`genie-landing-loaded`, function() { gHub.makeMap( `closeup-satellite-map`, options ); })'" />
								</script>
							</xsl:otherwise>
						</xsl:choose>
						<div class="banner-content">
							<div class="container">
								<h1 class="heading-font">
									<xsl:call-template name="listing-address-line-one" />
									<br/>
									<span class="heading-font">
										<xsl:call-template name="listing-address-line-two" />
									</span>
									<span>
										<xsl:choose>
											<xsl:when test="number(//single/statusTypeID)=2">
												<xsl:attribute name="class">
													<xsl:value-of select="'label label-success listing-status listing-status-sold'" />
												</xsl:attribute>
												<xsl:text>Sold</xsl:text>
											</xsl:when>
											<xsl:when test="number(//single/statusTypeID)=1">
												<xsl:attribute name="class">
													<xsl:value-of select="'label label-success listing-status listing-status-listed'" />
												</xsl:attribute>
												<xsl:text>Listed</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="class">
													<xsl:value-of select="'label label-success listing-status listing-status-pending'" />
												</xsl:attribute>
												<xsl:text>Pending</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</h1>
								<xsl:if test="//single/virtualTourUrl!=''">
									<div class="virtual-tour body-font">
										<a class="btn btn-small btn-info" target="_blank">
											<xsl:attribute name="href">
												<xsl:value-of select="//single/virtualTourUrl" />
											</xsl:attribute>
											<svg width="22" fill="#ffffff" viewBox="0 0 512 512"
												xmlns="http://www.w3.org/2000/svg">
												<path d="M448,256c0-106-86-192-192-192S64,150,64,256s86,192,192,192S448,362,448,256Z" style="fill:none;stroke:#ffffff;stroke-miterlimit:10;stroke-width:60px" />
												<path d="M216.32,334.44,330.77,265.3a10.89,10.89,0,0,0,0-18.6L216.32,177.56A10.78,10.78,0,0,0,200,186.87V325.13A10.78,10.78,0,0,0,216.32,334.44Z" />
											</svg>
											<xsl:text>&#160;Click here to view Virtual Tour</xsl:text>
										</a>
									</div>
								</xsl:if>
							</div>
						</div>
					</div>
				</div>
				<div class="details-section">
					<div class="container" style="margin-bottom:50px">
						<div class="row" id="description-sec">
							<div class="col-md-9">
								<div class="panel-adjustment">
									<h2 class="main-title heading-font heading-color">
										<strong class="heading-font">
											<xsl:value-of select="$status-name" />
										</strong>
									</h2>
								</div>
								<!-- Open House Example -->
								<xsl:if test="count(//openHouse/session) > 0">
									<div class="open-house" style="grid-template-columns: 1fr 1fr; padding: 1rem; font-family: var(--theme-body-font)">
										<div>
											<h3>Upcoming Open Houses</h3>
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
										<a target="_blank" rel="noopener noreferrer" id="open-house-directions" title="Directions">
											<xsl:attribute name="href">
												<xsl:value-of select="concat('https://www.google.com/maps/dir/', //single/latitude, ',', //single/longitude)" />
											</xsl:attribute>
											<xsl:text>Directions</xsl:text>
										</a>
									</div>
								</xsl:if>
								<ul class="property-details heading-font heading-color">
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg xmlns="http://www.w3.org/2000/svg" width="22" class="background-svg" viewBox="0 0 576 512">
													<path d="M511.8 287.6L512.5 447.7C512.5 450.5 512.3 453.1 512 455.8V472C512 494.1 494.1 512 472 512H456C454.9 512 453.8 511.1 452.7 511.9C451.3 511.1 449.9 512 448.5 512H392C369.9 512 352 494.1 352 472V384C352 366.3 337.7 352 320 352H256C238.3 352 224 366.3 224 384V472C224 494.1 206.1 512 184 512H128.1C126.6 512 125.1 511.9 123.6 511.8C122.4 511.9 121.2 512 120 512H104C81.91 512 64 494.1 64 472V360C64 359.1 64.03 358.1 64.09 357.2V287.6H32.05C14.02 287.6 0 273.5 0 255.5C0 246.5 3.004 238.5 10.01 231.5L266.4 8.016C273.4 1.002 281.4 0 288.4 0C295.4 0 303.4 2.004 309.5 7.014L416 100.7V64C416 46.33 430.3 32 448 32H480C497.7 32 512 46.33 512 64V185L564.8 231.5C572.8 238.5 576.9 246.5 575.8 255.5C575.8 273.5 560.8 287.6 543.8 287.6L511.8 287.6z" />
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:text>Type:&#160;</xsl:text>
													<span>
														<xsl:value-of select="$singularPropertyType" />
													</span>
												</h6>
											</div>
										</div>
									</li>
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="25" class="background-svg">
													<path d="M32 32C49.67 32 64 46.33 64 64V320H288V160C288 142.3 302.3 128 320 128H544C597 128 640 170.1 640 224V448C640 465.7 625.7 480 608 480C590.3 480 576 465.7 576 448V416H64V448C64 465.7 49.67 480 32 480C14.33 480 0 465.7 0 448V64C0 46.33 14.33 32 32 32zM96 208C96 163.8 131.8 128 176 128C220.2 128 256 163.8 256 208C256 252.2 220.2 288 176 288C131.8 288 96 252.2 96 208z" />
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:text>Beds:&#160;</xsl:text>
													<span>
														<xsl:value-of select="//single/bedrooms/@count" />
													</span>
												</h6>
											</div>
										</div>
									</li>
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="21" class="background-svg">
													<path d="M32 384c0 28.32 12.49 53.52 32 71.09V496C64 504.8 71.16 512 80 512h32C120.8 512 128 504.8 128 496v-15.1h256V496c0 8.836 7.164 16 16 16h32c8.836 0 16-7.164 16-16v-40.9c19.51-17.57 32-42.77 32-71.09V352H32V384zM496 256H96V77.25C95.97 66.45 111 60.23 118.6 67.88L132.4 81.66C123.6 108.6 129.4 134.5 144.2 153.2C137.9 159.5 137.8 169.8 144 176l11.31 11.31c6.248 6.248 16.38 6.248 22.63 0l105.4-105.4c6.248-6.248 6.248-16.38 0-22.63l-11.31-11.31c-6.248-6.248-16.38-6.248-22.63 0C230.7 33.26 204.7 27.55 177.7 36.41L163.9 22.64C149.5 8.25 129.6 0 109.3 0C66.66 0 32 34.66 32 77.25v178.8L16 256C7.164 256 0 263.2 0 272v32C0 312.8 7.164 320 16 320h480c8.836 0 16-7.164 16-16v-32C512 263.2 504.8 256 496 256z" />
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:text>Baths:&#160;</xsl:text>
													<span>
														<xsl:value-of select="$listingTotalBathrooms" />
													</span>
												</h6>
											</div>
										</div>
									</li>
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg width="27" class="background-svg" viewBox="0 -32 576 576"
													xmlns="http://www.w3.org/2000/svg">
													<path d="M564 224c6.627 0 12-5.373 12-12v-72c0-6.627-5.373-12-12-12h-72c-6.627 0-12 5.373-12 12v12h-88v-24h12c6.627 0 12-5.373 12-12V44c0-6.627-5.373-12-12-12h-72c-6.627 0-12 5.373-12 12v12H96V44c0-6.627-5.373-12-12-12H12C5.373 32 0 37.373 0 44v72c0 6.627 5.373 12 12 12h12v160H12c-6.627 0-12 5.373-12 12v72c0 6.627 5.373 12 12 12h72c6.627 0 12-5.373 12-12v-12h88v24h-12c-6.627 0-12 5.373-12 12v72c0 6.627 5.373 12 12 12h72c6.627 0 12-5.373 12-12v-12h224v12c0 6.627 5.373 12 12 12h72c6.627 0 12-5.373 12-12v-72c0-6.627-5.373-12-12-12h-12V224h12zM352 64h32v32h-32V64zm0 256h32v32h-32v-32zM64 352H32v-32h32v32zm0-256H32V64h32v32zm32 216v-12c0-6.627-5.373-12-12-12H72V128h12c6.627 0 12-5.373 12-12v-12h224v12c0 6.627 5.373 12 12 12h12v160h-12c-6.627 0-12 5.373-12 12v12H96zm128 136h-32v-32h32v32zm280-64h-12c-6.627 0-12 5.373-12 12v12H256v-12c0-6.627-5.373-12-12-12h-12v-24h88v12c0 6.627 5.373 12 12 12h72c6.627 0 12-5.373 12-12v-72c0-6.627-5.373-12-12-12h-12v-88h88v12c0 6.627 5.373 12 12 12h12v160zm40 64h-32v-32h32v32zm0-256h-32v-32h32v32z" />
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:text>Sq. Ft.:&#160;</xsl:text>
													<span>
														<xsl:value-of select="format-number(//single/squareFeet, '###,###')" />
													</span>
												</h6>
											</div>
										</div>
									</li>
									<xsl:if test="//single/lotSize">
										<li>
											<div class="content-box">
												<div class="icon-box heading-color-as-bg">
													<svg width="27" class="background-svg" viewBox="0 -32 576 576"
														xmlns="http://www.w3.org/2000/svg">
														<path d="M564 224c6.627 0 12-5.373 12-12v-72c0-6.627-5.373-12-12-12h-72c-6.627 0-12 5.373-12 12v12h-88v-24h12c6.627 0 12-5.373 12-12V44c0-6.627-5.373-12-12-12h-72c-6.627 0-12 5.373-12 12v12H96V44c0-6.627-5.373-12-12-12H12C5.373 32 0 37.373 0 44v72c0 6.627 5.373 12 12 12h12v160H12c-6.627 0-12 5.373-12 12v72c0 6.627 5.373 12 12 12h72c6.627 0 12-5.373 12-12v-12h88v24h-12c-6.627 0-12 5.373-12 12v72c0 6.627 5.373 12 12 12h72c6.627 0 12-5.373 12-12v-12h224v12c0 6.627 5.373 12 12 12h72c6.627 0 12-5.373 12-12v-72c0-6.627-5.373-12-12-12h-12V224h12zM352 64h32v32h-32V64zm0 256h32v32h-32v-32zM64 352H32v-32h32v32zm0-256H32V64h32v32zm32 216v-12c0-6.627-5.373-12-12-12H72V128h12c6.627 0 12-5.373 12-12v-12h224v12c0 6.627 5.373 12 12 12h12v160h-12c-6.627 0-12 5.373-12 12v12H96zm128 136h-32v-32h32v32zm280-64h-12c-6.627 0-12 5.373-12 12v12H256v-12c0-6.627-5.373-12-12-12h-12v-24h88v12c0 6.627 5.373 12 12 12h72c6.627 0 12-5.373 12-12v-72c0-6.627-5.373-12-12-12h-12v-88h88v12c0 6.627 5.373 12 12 12h12v160zm40 64h-32v-32h32v32zm0-256h-32v-32h32v32z" />
													</svg>
												</div>
												<div class="title-box">
													<h6>
														<xsl:text>Lot Size:&#160;</xsl:text>
														<span>
															<xsl:call-template name="lot-size" />
														</span>
													</h6>
												</div>
											</div>
										</li>
									</xsl:if>
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg width="27"
													xmlns="http://www.w3.org/2000/svg" class="background-svg" viewBox="0 0 512 512">
													<path d="M39.61 196.8L74.8 96.29C88.27 57.78 124.6 32 165.4 32H346.6C387.4 32 423.7 57.78 437.2 96.29L472.4 196.8C495.6 206.4 512 229.3 512 256V448C512 465.7 497.7 480 480 480H448C430.3 480 416 465.7 416 448V400H96V448C96 465.7 81.67 480 64 480H32C14.33 480 0 465.7 0 448V256C0 229.3 16.36 206.4 39.61 196.8V196.8zM109.1 192H402.9L376.8 117.4C372.3 104.6 360.2 96 346.6 96H165.4C151.8 96 139.7 104.6 135.2 117.4L109.1 192zM96 256C78.33 256 64 270.3 64 288C64 305.7 78.33 320 96 320C113.7 320 128 305.7 128 288C128 270.3 113.7 256 96 256zM416 320C433.7 320 448 305.7 448 288C448 270.3 433.7 256 416 256C398.3 256 384 270.3 384 288C384 305.7 398.3 320 416 320z" />
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:text>Parking:&#160;</xsl:text>
													<span>
														<xsl:value-of select="//single/parking/@spaces" />
													</span>
												</h6>
											</div>
										</div>
									</li>
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="19" class="background-svg">
													<path d="M160 32V64H288V32C288 14.33 302.3 0 320 0C337.7 0 352 14.33 352 32V64H400C426.5 64 448 85.49 448 112V160H0V112C0 85.49 21.49 64 48 64H96V32C96 14.33 110.3 0 128 0C145.7 0 160 14.33 160 32zM0 192H448V464C448 490.5 426.5 512 400 512H48C21.49 512 0 490.5 0 464V192zM64 304C64 312.8 71.16 320 80 320H112C120.8 320 128 312.8 128 304V272C128 263.2 120.8 256 112 256H80C71.16 256 64 263.2 64 272V304zM192 304C192 312.8 199.2 320 208 320H240C248.8 320 256 312.8 256 304V272C256 263.2 248.8 256 240 256H208C199.2 256 192 263.2 192 272V304zM336 256C327.2 256 320 263.2 320 272V304C320 312.8 327.2 320 336 320H368C376.8 320 384 312.8 384 304V272C384 263.2 376.8 256 368 256H336zM64 432C64 440.8 71.16 448 80 448H112C120.8 448 128 440.8 128 432V400C128 391.2 120.8 384 112 384H80C71.16 384 64 391.2 64 400V432zM208 384C199.2 384 192 391.2 192 400V432C192 440.8 199.2 448 208 448H240C248.8 448 256 440.8 256 432V400C256 391.2 248.8 384 240 384H208zM320 432C320 440.8 327.2 448 336 448H368C376.8 448 384 440.8 384 432V400C384 391.2 376.8 384 368 384H336C327.2 384 320 391.2 320 400V432z" />
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:choose>
														<xsl:when test="//single/soldDate!=''">
															<xsl:text>Sale Date:&#160;</xsl:text>
															<span>
																<xsl:value-of select="//single/soldDate" />
															</span>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>Listed on:&#160;</xsl:text>
															<span>
																<xsl:value-of select="//single/listed" />
															</span>
														</xsl:otherwise>
													</xsl:choose>
												</h6>
											</div>
										</div>
									</li>
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg xmlns="http:////single/parking/@spaceswww.w3.org/2000/svg" viewBox="0 0 320 512" width="13" class="background-svg">
													<path d="M160 0C177.7 0 192 14.33 192 32V67.68C193.6 67.89 195.1 68.12 196.7 68.35C207.3 69.93 238.9 75.02 251.9 78.31C268.1 82.65 279.4 100.1 275 117.2C270.7 134.3 253.3 144.7 236.1 140.4C226.8 137.1 198.5 133.3 187.3 131.7C155.2 126.9 127.7 129.3 108.8 136.5C90.52 143.5 82.93 153.4 80.92 164.5C78.98 175.2 80.45 181.3 82.21 185.1C84.1 189.1 87.79 193.6 95.14 198.5C111.4 209.2 136.2 216.4 168.4 225.1L171.2 225.9C199.6 233.6 234.4 243.1 260.2 260.2C274.3 269.6 287.6 282.3 295.8 299.9C304.1 317.7 305.9 337.7 302.1 358.1C295.1 397 268.1 422.4 236.4 435.6C222.8 441.2 207.8 444.8 192 446.6V480C192 497.7 177.7 512 160 512C142.3 512 128 497.7 128 480V445.1C127.6 445.1 127.1 444.1 126.7 444.9L126.5 444.9C102.2 441.1 62.07 430.6 35 418.6C18.85 411.4 11.58 392.5 18.76 376.3C25.94 360.2 44.85 352.9 60.1 360.1C81.9 369.4 116.3 378.5 136.2 381.6C168.2 386.4 194.5 383.6 212.3 376.4C229.2 369.5 236.9 359.5 239.1 347.5C241 336.8 239.6 330.7 237.8 326.9C235.9 322.9 232.2 318.4 224.9 313.5C208.6 302.8 183.8 295.6 151.6 286.9L148.8 286.1C120.4 278.4 85.58 268.9 59.76 251.8C45.65 242.4 32.43 229.7 24.22 212.1C15.89 194.3 14.08 174.3 17.95 153C25.03 114.1 53.05 89.29 85.96 76.73C98.98 71.76 113.1 68.49 128 66.73V32C128 14.33 142.3 0 160 0V0z" />
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:text>List Price:&#160;</xsl:text>
													<span>
														<xsl:value-of select="format-number( //single/price, '$###,###')" />
													</span>
												</h6>
											</div>
										</div>
									</li>
									<xsl:if test="number(//single/statusTypeID)=2">
										<li>
											<div class="content-box">
												<div class="icon-box heading-color-as-bg">
													<svg xmlns="http:////single/parking/@spaceswww.w3.org/2000/svg" viewBox="0 0 320 512" width="13" class="background-svg">
														<path d="M160 0C177.7 0 192 14.33 192 32V67.68C193.6 67.89 195.1 68.12 196.7 68.35C207.3 69.93 238.9 75.02 251.9 78.31C268.1 82.65 279.4 100.1 275 117.2C270.7 134.3 253.3 144.7 236.1 140.4C226.8 137.1 198.5 133.3 187.3 131.7C155.2 126.9 127.7 129.3 108.8 136.5C90.52 143.5 82.93 153.4 80.92 164.5C78.98 175.2 80.45 181.3 82.21 185.1C84.1 189.1 87.79 193.6 95.14 198.5C111.4 209.2 136.2 216.4 168.4 225.1L171.2 225.9C199.6 233.6 234.4 243.1 260.2 260.2C274.3 269.6 287.6 282.3 295.8 299.9C304.1 317.7 305.9 337.7 302.1 358.1C295.1 397 268.1 422.4 236.4 435.6C222.8 441.2 207.8 444.8 192 446.6V480C192 497.7 177.7 512 160 512C142.3 512 128 497.7 128 480V445.1C127.6 445.1 127.1 444.1 126.7 444.9L126.5 444.9C102.2 441.1 62.07 430.6 35 418.6C18.85 411.4 11.58 392.5 18.76 376.3C25.94 360.2 44.85 352.9 60.1 360.1C81.9 369.4 116.3 378.5 136.2 381.6C168.2 386.4 194.5 383.6 212.3 376.4C229.2 369.5 236.9 359.5 239.1 347.5C241 336.8 239.6 330.7 237.8 326.9C235.9 322.9 232.2 318.4 224.9 313.5C208.6 302.8 183.8 295.6 151.6 286.9L148.8 286.1C120.4 278.4 85.58 268.9 59.76 251.8C45.65 242.4 32.43 229.7 24.22 212.1C15.89 194.3 14.08 174.3 17.95 153C25.03 114.1 53.05 89.29 85.96 76.73C98.98 71.76 113.1 68.49 128 66.73V32C128 14.33 142.3 0 160 0V0z" />
													</svg>
												</div>
												<div class="title-box">
													<h6>
														<xsl:text>Sale Price:&#160;</xsl:text>
														<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />
													</h6>
												</div>
											</div>
										</li>
										<li>
											<div class="content-box">
												<div class="icon-box heading-color-as-bg">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="22" class="background-svg">
														<path d="M0 252.118V48C0 21.49 21.49 0 48 0h204.118a48 48 0 0 1 33.941 14.059l211.882 211.882c18.745 18.745 18.745 49.137 0 67.882L293.823 497.941c-18.745 18.745-49.137 18.745-67.882 0L14.059 286.059A48 48 0 0 1 0 252.118zM112 64c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48z"></path>
													</svg>
												</div>
												<div class="title-box">
													<h6>
														<xsl:text>% lp/sp:&#160;</xsl:text>
														<span>
															<xsl:value-of select="concat(format-number( (//single/price div //single/salePrice ) * 100 , '#.#'),'%')" />
														</span>
													</h6>
												</div>
											</div>
										</li>
									</xsl:if>
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="22" class="background-svg">
													<path d="M0 252.118V48C0 21.49 21.49 0 48 0h204.118a48 48 0 0 1 33.941 14.059l211.882 211.882c18.745 18.745 18.745 49.137 0 67.882L293.823 497.941c-18.745 18.745-49.137 18.745-67.882 0L14.059 286.059A48 48 0 0 1 0 252.118zM112 64c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48z"></path>
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:text>Price Per Sq.Ft.:&#160;</xsl:text>
													<span>
														<xsl:value-of select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
													</span>
												</h6>
											</div>
										</div>
									</li>
									<li>
										<div class="content-box">
											<div class="icon-box heading-color-as-bg">
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" width="13" class="background-svg">
													<path d="M168.3 499.2C116.1 435 0 279.4 0 192C0 85.96 85.96 0 192 0C298 0 384 85.96 384 192C384 279.4 267 435 215.7 499.2C203.4 514.5 180.6 514.5 168.3 499.2H168.3zM192 256C227.3 256 256 227.3 256 192C256 156.7 227.3 128 192 128C156.7 128 128 156.7 128 192C128 227.3 156.7 256 192 256z" />
												</svg>
											</div>
											<div class="title-box">
												<h6>
													<xsl:text>MLS #:&#160;</xsl:text>
													<span>
														<xsl:choose>
															<xsl:when test="//single/mlsNumber=''">
																<xsl:value-of select="//single/mls" />
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="//single/mlsNumber" />
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</h6>
											</div>
										</div>
									</li>
								</ul>
								<div class="content-para body-font body-color">
									<xsl:copy-of select="//single/description" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-section">
									<div class="form-title heading-color-as-bg">
										<h4 class="heading-font background-as-color">Get in Touch</h4>
									</div>
									<form id="form_step1" class="wpcf7-form funnel-create-lead">
										<div class="form-fields">
											<input type="hidden" name="genieTags" value="RequestMoreInfo,ClickCta" />
											<input type="text" name="fullName" placeholder="Name*" class="heading-font" required="required" />
											<input type="text" name="phoneNumber" placeholder="Phone*" class="heading-font phone" id="phonenumber" required="required" />
											<input type="email" name="emailAddress" placeholder="Email*" class="heading-font" required="required" />
											<textarea name="note" placeholder="Message" class="heading-font" required="required" data-x="10"></textarea>
											<div class="form-group">
												<div class="fl-btn-value">
													<button class="btn btn-value-info heading-font heading-color-as-bg background-as-color btn-submit step1-button">
														Submit
													</button>
												</div>
												<span class="funnel-loader">
													<xsl:comment/>
												</span>
											</div>
										</div>
									</form>
									<xsl:call-template name="default-thank-you-popup" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-9">
								<div id="genie-map" style="height:370px;">&#160;</div>
							</div>
							<div class="col-md-3">
								<div class="owner-details-section banner-img position-relative">
									<img width="100%" height="100%" preserveAspectRatio="xMidYMid meet" alt="Photo of property">
										<xsl:attribute name="src">
											<xsl:value-of select="$primaryImage" />
										</xsl:attribute>
									</img>
									<div class="owner-details-overlay heading-color-as-bg">
										<xsl:comment/>
									</div>
									<div class="owner-details">
										<h4 class="heading-font background-as-color">Presented By</h4>
										<div class="owner-photo">
											<xsl:attribute name="style">
												<xsl:value-of select="concat( 'background-image: url(', //agent[1]/photo, ')' )" />
											</xsl:attribute>
											<xsl:comment/>
										</div>
										<div class="name-n-other-details">
											<h3 class="heading-font background-as-color">
												<xsl:value-of select="concat( //agent[1]/first-name, '&#160;', //agent[1]/marketingName )" />
											</h3>
											<h3 class="heading-font background-as-color">
												<a href="tel:">
													<xsl:attribute name="href">
														<xsl:value-of select="concat( 'tel:',//agent[1]/mobile )" />
													</xsl:attribute>
													<xsl:value-of select="//agent[1]/mobile" />
												</a>
											</h3>
											<button class="btn subtitle-font background-as-color contact-me-btn" style="margin:0.5rem auto" type="submit">
												<span class="contact-svg">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 469.2 469.2" style="enable-background:new 0 0 469.2 469.2;" fill="var(--theme-body-color)">
														<path d="M22.202,77.023C25.888,75.657,29.832,74.8,34,74.8h401.2c4.168,0,8.112,0.857,11.798,2.224L267.24,246.364c-18.299,17.251-46.975,17.251-65.28,0L22.202,77.023z M464.188,377.944c3.114-5.135,5.012-11.098,5.012-17.544V108.8c0-4.569-0.932-8.915-2.57-12.899L298.411,254.367L464.188,377.944z M283.2,268.464c-13.961,11.961-31.253,18.027-48.6,18.027c-17.347,0-34.64-6.06-48.6-18.027L20.692,391.687c4.094,1.741,8.582,2.714,13.308,2.714h401.2c4.726,0,9.214-0.973,13.308-2.714L283.2,268.464z M2.571,95.9C0.932,99.885,0,104.23,0,108.8V360.4c0,6.446,1.897,12.409,5.012,17.544l165.777-123.577L2.571,95.9z"></path>
													</svg>
												</span>
											      Contact Me
											</button>
											<div class="agent-company-logo">
												<xsl:attribute name="style">
													<xsl:value-of select="concat( 'background: url(', $companyLogoInverse, ')' )" />
												</xsl:attribute>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="galary-sec">
						<xsl:call-template name="gallery" />
					</div>
				</div>
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
				<div class="embed">
					<div class="container">
						<xsl:call-template name="add-genie-embed">
							<xsl:with-param name="embed" select="'MarketUpdate'" />
						</xsl:call-template>
						<xsl:call-template name="add-genie-embed">
							<xsl:with-param name="embed" select="'FastFacts'" />
						</xsl:call-template>
						<xsl:call-template name="add-genie-embed">
							<xsl:with-param name="embed" select="'MarketTrending'" />
						</xsl:call-template>
						<xsl:call-template name="add-genie-embed">
							<xsl:with-param name="embed" select="'MarketHistory'" />
						</xsl:call-template>
						<xsl:call-template name="add-genie-embed">
							<xsl:with-param name="embed" select="'PeopleBuying'" />
						</xsl:call-template>
					</div>
				</div>
			</div>
			<div class="modal fade fl-thankyou-modal" id="fl-thankyou-message" tabindex="-1" role="dialog" aria-labelledby="fl-thankyou-message" aria-hidden="false">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 490 490" data-dismiss="modal">
						<polygon fill="var(--theme-emphasis-color)" stroke-width="30px" stroke="var(--theme-emphasis-color)" points="11.387,490 245,255.832 478.613,490 489.439,479.174 255.809,244.996 489.439,10.811 478.613,0 245,234.161 11.387,0 0.561,10.811 234.191,244.996 0.561,479.174 " />
					</svg>
					<div class="modal-content">
						<div class="modal-body">
							<div class="modal-background-img background">
								<div class="fl-thumb-icon text-center subtitle-color-as-bg">
									<div class="circle-icon background">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="var(--theme-sub-heading-color)">
											<path d="M128 447.1V223.1c0-17.67-14.33-31.1-32-31.1H32c-17.67 0-32 14.33-32 31.1v223.1c0 17.67 14.33 31.1 32 31.1h64C113.7 479.1 128 465.6 128 447.1zM512 224.1c0-26.5-21.48-47.98-48-47.98h-146.5c22.77-37.91 34.52-80.88 34.52-96.02C352 56.52 333.5 32 302.5 32c-63.13 0-26.36 76.15-108.2 141.6L178 186.6C166.2 196.1 160.2 210 160.1 224c-.0234 .0234 0 0 0 0L160 384c0 15.1 7.113 29.33 19.2 38.39l34.14 25.59C241 468.8 274.7 480 309.3 480H368c26.52 0 48-21.47 48-47.98c0-3.635-.4805-7.143-1.246-10.55C434 415.2 448 397.4 448 376c0-9.148-2.697-17.61-7.139-24.88C463.1 347 480 327.5 480 304.1c0-12.5-4.893-23.78-12.72-32.32C492.2 270.1 512 249.5 512 224.1z" fill="var(--theme-sub-heading-color)" />
										</svg>
									</div>
								</div>
								<div class="widget text-center heading-font subtitle-color">
									<p>Thank you for your request!</p>
									<p>We will be contacting you soon.</p>
								</div>
								<div class="fl-btn-close widget text-center">
									<a class="btn btn-value-info widget heading-font subtitle-color-as-bg background-as-color editable">
										<xsl:text>CLOSE</xsl:text>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade fl-thankyou-modal in timed-popup" id="fl-submit-message" tabindex="-1" role="dialog" aria-hidden="false">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 490 490" data-dismiss="modal">
						<polygon fill="var(--theme-emphasis-color)" stroke-width="30px" stroke="var(--theme-emphasis-color)" points="11.387,490 245,255.832 478.613,490 489.439,479.174 255.809,244.996 489.439,10.811 478.613,0 245,234.161 11.387,0 0.561,10.811 234.191,244.996 0.561,479.174 " />
					</svg>
					<div class="modal-content">
						<div class="modal-body">
							<div class="funnel-mail-submit">
								<div class="col-md-6 col-sm-6">
									<div class="property-bg">
										<xsl:attribute name="style">
											<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />
										</xsl:attribute>
										<xsl:comment/>
									</div>
									<xsl:comment/>
								</div>
								<div class="col-md-6 col-sm-6 background">
									<div class="modal-side-content">
										<h1 class="modal_title heading-color">Interested in this Home?</h1>
										<p class="modal_subtitle body-font body-color">Fill in your details below and our team will get in touch with you within 24 hours.</p>
										<form class="wpcf7-form funnel-create-lead">
											<div class="form-group">
												<input type="text" placeholder="Enter Name*" autocomplete="on" name="fullName" class="form-control heading-font heading-color" />
											</div>
											<div class="form-group">
												<input type="text" placeholder="Enter Phone*" autocomplete="tel" name="phoneNumber" class="form-control heading-font heading-color phone" id="phonenumber" />
											</div>
											<div class="form-group">
												<input type="email" placeholder="Enter Email*" autocomplete="email" name="emailAddress" class="form-control heading-font heading-color step1-input" id="email" />
											</div>
											<div class="form-group">
												<ul class="theme-option-form heading-font heading-color">
													<li>
														<label for="lead_meta_get_info" class="selected heading-font heading-color" style="position:relative;">
															<input type="checkbox" id="lead_meta_get_info" class="outline" checked="checked" name="meta[moreInfo]" value="Yes" />
															<xsl:text>Get more info</xsl:text>
														</label>
													</li>
													<li>
														<label for="lead_meta_request_showing" class="heading-font heading-color">
															<input type="checkbox" id="lead_meta_request_showing" class="outline" checked="checked" name="meta[requestShowing]" value="Yes" />
															<xsl:text>Request a showing</xsl:text>
														</label>
													</li>
												</ul>
												<div class="fl-btn-value">
													<button class="btn btn-value-info widget heading-font heading-color-as-bg background-as-color">Submit</button>
												</div>
												<div class="thanks-n-close">
													<a class="close_modal subtitle-color" id="close_modal" data-dismiss="modal">No thanks, I am not interested.</a>
													<p class="privacy-policy-content body-font body-color">We hate SPAM and promise to keep your email address safe.</p>
												</div>
											</div>
										</form>
									</div>
									<xsl:comment/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- two image modal start -->
			<div class="modal fade in timed-popup f1-home-compare" id="fl-home-compare" tabindex="-1" role="dialog" aria-hidden="false">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 490 490" data-dismiss="modal">
						<polygon fill="var(--theme-emphasis-color)" stroke-width="30px" stroke="var(--theme-emphasis-color)" points="11.387,490 245,255.832 478.613,490 489.439,479.174 255.809,244.996 489.439,10.811 478.613,0 245,234.161 11.387,0 0.561,10.811 234.191,244.996 0.561,479.174 " />
					</svg>
					<div class="modal-content">
						<div class="modal-body">
							<div class="funnel-mail-submit">
								<div class="col-md-6 col-sm-6 modal-left-img">
									<div class="test1">
										<p class="compare-now">Compare NOW!</p>
										<div class="test1_left">
											<xsl:attribute name="style">
												<xsl:value-of select="concat( 'background-image: url(',  //output/@siteUrl, '_assets/_img/compare-listing-thumbnail.png' , ')' )" />
											</xsl:attribute>
										</div>
										<div class="test1_right">
											<xsl:attribute name="style">
												<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />
											</xsl:attribute>
										</div>
										<div class="test1_left_mobile">
											<xsl:comment/>
										</div>
										<div class="test1_right_mobile">
											<xsl:comment/>
										</div>
									</div>

								</div>
								<div class="col-md-6 col-sm-6 background">
									<div class="modal-side-content">
										<h1 class="modal_title heading-color">Interested in seeing how your home compares?</h1>
										<p class="modal_subtitle body-font body-color">Type in your address below to view a direct comparison of your property with my listing!</p>
										<form class="funnel-create-lead">
											<div class="form-group">
												<input type="text" placeholder="Enter Address*" name="compareAddress" class="form-control heading-font heading-color compare-address" id="compareaddress" />
											</div>

											<div class="form-group">

												<div class="fl-btn-value">
													<button class="btn btn-value-info widget heading-font heading-color-as-bg background-as-color">Submit</button>
												</div>
												<div class="thanks-n-close">
													<a class="close_modal subtitle-color" id="close-compare-modal" data-dismiss="modal">No thanks, I am not interested.</a>
													<p class="privacy-policy-content body-font body-color">We hate SPAM and promise to keep your email address safe.</p>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- two image modal ends -->
			<div class="modal-backdrop fade show" id="backdrop" style="display: none;">
				<xsl:comment/>
			</div>
			<xsl:call-template name="agent-about" />
			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />
			</div>
			<script src="{concat( //output/@siteUrl, '_assets/landing-pages/lc-austin.js' )}">
				<xsl:comment/>
			</script>
		</body>
	</xsl:template>
</xsl:stylesheet>
