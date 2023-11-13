<?xml version="1.0"?>
<!--
	Asset Name:			LC-MIAMI
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
		Render Key:			landing-page/TheGenie-Miami-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl" />

	<xsl:template name="landing-page">
		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
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
					<xsl:text>Active</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Pending</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Get Customized Market Report for ', //area/name )" />
			<xsl:with-param name="description" select="$head-description" />
			<xsl:with-param name="seoImage" select="//single/photoPrimary" />
			<xsl:with-param name="secondaryCSS" select="'single-property-3'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>

			<script>
				<xsl:value-of select="concat( &quot;const listing = [{caption: 'HH', state:'&quot;, //single/listingStatus, &quot;',lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}]; &quot; )" />
				<xsl:value-of select="concat( &quot;const options = { mapStyle: `&quot;, //output/@mapStyle, &quot;`, zoom: 21, center: { lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}}; &quot; )" />
				<xsl:value-of select="'document.addEventListener( `genie-landing-loaded`, function() { window.gg.makeMap( `genie-map`, options, { listings:listing } ); })'" />
			</script>

			<div class="lc-miami background">
				<div class="banner-content-box">
					<div class="banner">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />
						</xsl:attribute>

						<div class="banner-content">
							<div class="container">
								<h1 class="heading-font">
									<xsl:call-template name="listing-address-line-one" />
									<br/>
									<span>
										<xsl:call-template name="listing-address-line-two" />
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
								<span>
									<xsl:choose>
										<xsl:when test="number(//single/statusTypeID)=2">
											<xsl:attribute name="class">
												<xsl:value-of select="'label label-success listing-status listing-status-sold'" />
											</xsl:attribute>
											<img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/images/funnel-sold.png" />
										</xsl:when>
										<xsl:when test="number(//single/statusTypeID)=1">
											<xsl:attribute name="class">
												<xsl:value-of select="'label label-success listing-status listing-status-listed'" />
											</xsl:attribute>
											<img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/images/funnel-active.png" />
										</xsl:when>
										<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
											<xsl:attribute name="class">
												<xsl:value-of select="'label label-warning listing-status listing-status-pending'" />
											</xsl:attribute>
											<img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/images/funnel-pending.png" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="class">
												<xsl:value-of select="'label label-warning listing-status listing-status-coming-soon'" />
											</xsl:attribute>
											<img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/images/funnel-coming-soon.png" />
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
					</div>
				</div>

				<div class="container">
					<div class="col-md-12">
						<ul class="property-details background-as-color heading-font">
							<xsl:attribute name="style">
								<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />
							</xsl:attribute>
							<li>
								<div class="content-box">
									<div class="icon-box">
										<svg xmlns="http://www.w3.org/2000/svg" width="27px" viewBox="0 0 640 512" class="background-svg">
											<path d="M176 288C220.1 288 256 252.1 256 208S220.1 128 176 128S96 163.9 96 208S131.9 288 176 288zM544 128H304C295.2 128 288 135.2 288 144V320H64V48C64 39.16 56.84 32 48 32h-32C7.163 32 0 39.16 0 48v416C0 472.8 7.163 480 16 480h32C56.84 480 64 472.8 64 464V416h512v48c0 8.837 7.163 16 16 16h32c8.837 0 16-7.163 16-16V224C640 170.1 597 128 544 128z" />
										</svg>
									</div>
									<div class="title-box">
										<h6 class="background-as-color">
											<xsl:text>Beds</xsl:text>
											<br/>
											<span class="editable">
												<xsl:value-of select="//single/bedrooms/@count" />
											</span>
										</h6>
									</div>
								</div>
							</li>
							<li>
								<div class="content-box">
									<div class="icon-box">
										<svg xmlns="http://www.w3.org/2000/svg" width="24px" viewBox="0 0 512 512" class="background-svg">
											<path d="M32 384c0 28.32 12.49 53.52 32 71.09V496C64 504.8 71.16 512 80 512h32C120.8 512 128 504.8 128 496v-15.1h256V496c0 8.836 7.164 16 16 16h32c8.836 0 16-7.164 16-16v-40.9c19.51-17.57 32-42.77 32-71.09V352H32V384zM496 256H96V77.25C95.97 66.45 111 60.23 118.6 67.88L132.4 81.66C123.6 108.6 129.4 134.5 144.2 153.2C137.9 159.5 137.8 169.8 144 176l11.31 11.31c6.248 6.248 16.38 6.248 22.63 0l105.4-105.4c6.248-6.248 6.248-16.38 0-22.63l-11.31-11.31c-6.248-6.248-16.38-6.248-22.63 0C230.7 33.26 204.7 27.55 177.7 36.41L163.9 22.64C149.5 8.25 129.6 0 109.3 0C66.66 0 32 34.66 32 77.25v178.8L16 256C7.164 256 0 263.2 0 272v32C0 312.8 7.164 320 16 320h480c8.836 0 16-7.164 16-16v-32C512 263.2 504.8 256 496 256z" />
										</svg>
									</div>
									<div class="title-box">
										<h6 class="background-as-color">
											<xsl:text>Baths</xsl:text>
											<br/>
											<span class="editable">
												<xsl:value-of select="$listingTotalBathrooms" />
											</span>
										</h6>
									</div>
								</div>
							</li>
							<li>
								<div class="content-box">
									<div class="icon-box">
										<svg xmlns="http://www.w3.org/2000/svg" width="22px" class="background-svg" viewBox="0 0 512 512">
											<path d="M256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512zM232 256C232 264 236 271.5 242.7 275.1L338.7 339.1C349.7 347.3 364.6 344.3 371.1 333.3C379.3 322.3 376.3 307.4 365.3 300L280 243.2V120C280 106.7 269.3 96 255.1 96C242.7 96 231.1 106.7 231.1 120L232 256z" />
										</svg>
									</div>
									<div class="title-box">
										<h6 class="background-as-color">
											<xsl:text>DOM*</xsl:text>
											<br/>
											<xsl:value-of select="concat( //single/daysOnMarket, ' Days' )" />
										</h6>
									</div>
								</div>
							</li>
							<li>
								<div class="content-box">
									<div class="icon-box">
										<svg xmlns="http://www.w3.org/2000/svg" width="30px" viewBox="0 0 576 512" class="background-svg">
											<path d="M64 320v26a6 6 0 0 1-6 6H6a6 6 0 0 1-6-6v-52a6 6 0 0 1 6-6h26V96H6a6 6 0 0 1-6-6V38a6 6 0 0 1 6-6h52a6 6 0 0 1 6 6v26h288V38a6 6 0 0 1 6-6h52a6 6 0 0 1 6 6v52a6 6 0 0 1-6 6h-26v192h26a6 6 0 0 1 6 6v52a6 6 0 0 1-6 6h-52a6 6 0 0 1-6-6v-26H64zm480-64v-32h26a6 6 0 0 0 6-6v-52a6 6 0 0 0-6-6h-52a6 6 0 0 0-6 6v26H408v72h8c13.255 0 24 10.745 24 24v64c0 13.255-10.745 24-24 24h-64c-13.255 0-24-10.745-24-24v-8H192v72h-26a6 6 0 0 0-6 6v52a6 6 0 0 0 6 6h52a6 6 0 0 0 6-6v-26h288v26a6 6 0 0 0 6 6h52a6 6 0 0 0 6-6v-52a6 6 0 0 0-6-6h-26V256z" />
										</svg>
									</div>
									<div class="title-box">
										<h6 class="background-as-color">
											<xsl:text>Sq. ft.</xsl:text>
											<br/>
											<span class="editable">
												<xsl:value-of select="//single/squareFeet" />
											</span>
										</h6>
									</div>
								</div>
							</li>
							<li>
								<div class="content-box">
									<div class="icon-box">
										<svg xmlns="http://www.w3.org/2000/svg" width="20px" viewBox="0 0 448 512" class="background-svg">
											<path d="M96 32C96 14.33 110.3 0 128 0C145.7 0 160 14.33 160 32V64H288V32C288 14.33 302.3 0 320 0C337.7 0 352 14.33 352 32V64H400C426.5 64 448 85.49 448 112V160H0V112C0 85.49 21.49 64 48 64H96V32zM448 464C448 490.5 426.5 512 400 512H48C21.49 512 0 490.5 0 464V192H448V464z" />
										</svg>
									</div>
									<div class="title-box">
										<h6 class="background-as-color">
											<xsl:choose>
												<xsl:when test="//single/soldDate!=''">
													<xsl:text>Sold on </xsl:text>
													<br/>
													<xsl:value-of select="//single/soldDate" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Listed on </xsl:text>
													<br/>
													<xsl:value-of select="//single/listed" />
												</xsl:otherwise>
											</xsl:choose>
										</h6>
									</div>
								</div>
							</li>
							<li>
								<div class="content-box">
									<div class="icon-box">
										<svg xmlns="http://www.w3.org/2000/svg" width="19px" viewBox="0 0 384 512" class="background-svg">
											<path d="M384 192C384 279.4 267 435 215.7 499.2C203.4 514.5 180.6 514.5 168.3 499.2C116.1 435 0 279.4 0 192C0 85.96 85.96 0 192 0C298 0 384 85.96 384 192H384z" />
										</svg>
									</div>
									<div class="title-box">
										<h6 class="background-as-color">
											<xsl:text>MLS #</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="//single/mlsNumber=''">
													<xsl:value-of select="//single/mls" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="//single/mlsNumber" />
												</xsl:otherwise>
											</xsl:choose>
										</h6>
									</div>
								</div>
							</li>
							<li class="pd-extra">
								<div class="content-box">
									<div class="icon-box">

										<svg xmlns="http://www.w3.org/2000/svg" width="28px" viewBox="0 0 576 512" class="background-svg">
											<path d="M280.37 148.26L96 300.11V464a16 16 0 0 0 16 16l112.06-.29a16 16 0 0 0 15.92-16V368a16 16 0 0 1 16-16h64a16 16 0 0 1 16 16v95.64a16 16 0 0 0 16 16.05L464 480a16 16 0 0 0 16-16V300L295.67 148.26a12.19 12.19 0 0 0-15.3 0zM571.6 251.47L488 182.56V44.05a12 12 0 0 0-12-12h-56a12 12 0 0 0-12 12v72.61L318.47 43a48 48 0 0 0-61 0L4.34 251.47a12 12 0 0 0-1.6 16.9l25.5 31A12 12 0 0 0 45.15 301l235.22-193.74a12.19 12.19 0 0 1 15.3 0L530.9 301a12 12 0 0 0 16.9-1.6l25.5-31a12 12 0 0 0-1.7-16.93z" />
										</svg>
									</div>
									<div class="title-box">
										<h6 class="background-as-color">
											<xsl:value-of select="$propertyType" />
										</h6>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<h3 class="listing_status_price heading-font heading-color text-center">
						<p>
							<xsl:choose>
								<xsl:when test="number(//single/statusTypeID)=2">
									<xsl:text>Sold for </xsl:text>
									<xsl:value-of select="concat('$',//single/salePrice)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>Listed for </xsl:text>
									<xsl:value-of select="concat('$',//single/price)" />
								</xsl:otherwise>
							</xsl:choose>
						</p>
					</h3>
					<div class="content-para body-font module-body-color text-center body-color">
						<xsl:copy-of select="//single/description" />
					</div>
				</div>

				<div class="container">
					<div class="row">
						<div class="form-section">
							<div class="form-title text-center">
								<h4 class="heading-font heading-color">Get in Touch</h4>
							</div>
							<form id="form_step1" class="funnel-create-lead">
								<div class="form-fields">
									<div class="half-width">
										<input type="text" name="fullName" placeholder="Name*" class="col-half heading-font" />
										<input type="text" name="phoneNumber" placeholder="Phone*" class="col-half heading-font phone" id="phonenumber" />
									</div>
									<input type="email" name="emailAddress" placeholder="Email*" class="heading-font" />
									<textarea name="note" placeholder="Message" class="heading-font">
										<xsl:comment />
									</textarea>
									<div class="form-group">
										<div class="fl-btn-value text-center">
											<button class="btn btn-value-info heading-font heading-color-as-bg background-as-color btn-submit step1-button">
												<span class="editable">Submit</span>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<section class="presented-bg">
					<div class="presented-bg-transparent body-color-as-bg">
						<xsl:comment/>
					</div>
					<div class="container">
						<div class="row owner-details-section">
							<div class="col-md-3 pd-right-0">
								<div class="single-agent-info">
									<div class="single-agent-detail">
										<h4 class="heading-font">Presented By</h4>
										<div class="owner-details background">
											<div class="owner-photo" style="background: url('https://myneighborhood.re/wp-content/uploads/2021/04/Steve-Hundley-Profile-Image.png');">
												<xsl:comment/>
											</div>
											<div class="name-n-other-details">
												<h3 class="heading-font heading-color">
													<xsl:value-of select="concat(//agent[1]/firstName,'&#160;',//agent[1]/lastName)" />
												</h3>

												<h3 class="agent-phone heading-font subtitle-color">
													<a class="subtitle-color">
														<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="var(--theme-sub-heading-color)" width="18" height="18">
															<path d="M511.2 387l-23.25 100.8c-3.266 14.25-15.79 24.22-30.46 24.22C205.2 512 0 306.8 0 54.5c0-14.66 9.969-27.2 24.22-30.45l100.8-23.25C139.7-2.602 154.7 5.018 160.8 18.92l46.52 108.5c5.438 12.78 1.77 27.67-8.98 36.45L144.5 207.1c33.98 69.22 90.26 125.5 159.5 159.5l44.08-53.8c8.688-10.78 23.69-14.51 36.47-8.975l108.5 46.51C506.1 357.2 514.6 372.4 511.2 387z" />
														</svg>
														<span>
															<xsl:attribute name="href">
																<xsl:value-of select="concat( 'tel:',//agent[1]/mobile )" />
															</xsl:attribute>
															<xsl:value-of select="//agent[1]/mobile" />
														</span>
													</a>
												</h3>
												<div class="agent-email">
													<a href="#" class="heading-font subtitle-color">
														<svg aria-hidden="true" role="img"
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="var(--theme-sub-heading-color)" width="18" height="18">
															<path d="M502.3 190.8c3.9-3.1 9.7-.2 9.7 4.7V400c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V195.6c0-5 5.7-7.8 9.7-4.7 22.4 17.4 52.1 39.5 154.1 113.6 21.1 15.4 56.7 47.8 92.2 47.6 35.7.3 72-32.8 92.3-47.6 102-74.1 131.6-96.3 154-113.7zM256 320c23.2.4 56.6-29.2 73.4-41.4 132.7-96.3 142.8-104.7 173.4-128.7 5.8-4.5 9.2-11.5 9.2-18.9v-19c0-26.5-21.5-48-48-48H48C21.5 64 0 85.5 0 112v19c0 7.4 3.4 14.3 9.2 18.9 30.6 23.9 40.7 32.4 173.4 128.7 16.8 12.2 50.2 41.8 73.4 41.4z"></path>
														</svg>
														<span>
															<xsl:attribute name="href">
																<xsl:value-of select="concat( 'mailto:', //agent[1]/marketingEmail )" />
															</xsl:attribute>
															<xsl:value-of select="//agent[1]/marketingEmail" />
														</span>
													</a>
												</div>
												<div class="agent-email">
													<a href="#" class="heading-font subtitle-color">
														<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="var(--theme-sub-heading-color)" width="18" height="18">
															<path d="M352 256C352 278.2 350.8 299.6 348.7 320H163.3C161.2 299.6 159.1 278.2 159.1 256C159.1 233.8 161.2 212.4 163.3 192H348.7C350.8 212.4 352 233.8 352 256zM503.9 192C509.2 212.5 512 233.9 512 256C512 278.1 509.2 299.5 503.9 320H380.8C382.9 299.4 384 277.1 384 256C384 234 382.9 212.6 380.8 192H503.9zM493.4 160H376.7C366.7 96.14 346.9 42.62 321.4 8.442C399.8 29.09 463.4 85.94 493.4 160zM344.3 160H167.7C173.8 123.6 183.2 91.38 194.7 65.35C205.2 41.74 216.9 24.61 228.2 13.81C239.4 3.178 248.7 0 256 0C263.3 0 272.6 3.178 283.8 13.81C295.1 24.61 306.8 41.74 317.3 65.35C328.8 91.38 338.2 123.6 344.3 160H344.3zM18.61 160C48.59 85.94 112.2 29.09 190.6 8.442C165.1 42.62 145.3 96.14 135.3 160H18.61zM131.2 192C129.1 212.6 127.1 234 127.1 256C127.1 277.1 129.1 299.4 131.2 320H8.065C2.8 299.5 0 278.1 0 256C0 233.9 2.8 212.5 8.065 192H131.2zM194.7 446.6C183.2 420.6 173.8 388.4 167.7 352H344.3C338.2 388.4 328.8 420.6 317.3 446.6C306.8 470.3 295.1 487.4 283.8 498.2C272.6 508.8 263.3 512 255.1 512C248.7 512 239.4 508.8 228.2 498.2C216.9 487.4 205.2 470.3 194.7 446.6H194.7zM190.6 503.6C112.2 482.9 48.59 426.1 18.61 352H135.3C145.3 415.9 165.1 469.4 190.6 503.6V503.6zM321.4 503.6C346.9 469.4 366.7 415.9 376.7 352H493.4C463.4 426.1 399.8 482.9 321.4 503.6V503.6z" />
														</svg>
														<span>
															<xsl:value-of select="//agent[1]/website" />
														</span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-9 pd-left-0">
								<div id="genie-map" style="height: 300px; position: relative;z-index:1;" tabindex="0">
									<xsl:comment/>
								</div>
							</div>
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
			<div class="modal fade  fl-thankyou-modal" id="fl-thankyou-message" tabindex="-1" role="dialog" aria-labelledby="fl-thankyou-message" aria-hidden="false">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="fl-close-modal" data-dismiss="modal">
						<img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/images/close-modal-cross.png" alt="" />
					</div>

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
								<h2 class="widget text-center heading-font subtitle-color">
									<p></p>
									<p>Thank you for your request!</p>
									<p>We will be contacting you soon.</p>
									<p></p>
								</h2>
								<div class="fl-btn-close widget text-center">
									<a href="JavaScript:Void(0);" class="btn btn-value-info widget heading-font subtitle-color-as-bg background-as-color editable">
										<xsl:text>CLOSE</xsl:text>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<xsl:call-template name="agent-about" />

			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />
			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>
