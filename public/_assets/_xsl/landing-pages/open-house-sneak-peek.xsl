<?xml version="1.0"?>
<!--
	Asset Name:			OH SNEAK PEEK
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
		Render Key:			landing-page/Open-House-Guest-Book-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl"/>

	<xsl:template name="landing-page">
		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>
		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Open House Sneak Peek', //area/name )" />
			<xsl:with-param name="description" select="$head-description" />
			<xsl:with-param name="seoImage" select="//single/photoPrimary" />
			<xsl:with-param name="secondaryCSS" select="'open-house-guest-book-2'" />
			<xsl:with-param name="defaultUtmSource" select="'Open House Sneak'" />
			<xsl:with-param name="defaultUtmCampaign" select="concat( //single/address/street, ' ' ,//single/address/city , ', ' ,//single/address/state , ' ' ,//single/address/zip )" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'Open House Sneak Peek Registration from ', //single/address/street )" />
		</xsl:call-template>

		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/css/open-house-sneak-peak.css' )" />
			</xsl:attribute>
		</link>

		<head>
			<meta name="description">
				<xsl:attribute name="content">
					<xsl:value-of select="$head-description" />
				</xsl:attribute>
			</meta>

			<meta property="og:title">
				<xsl:attribute name="content">
					<xsl:value-of select="concat( 'Welcome to our open house for ', //single/mlsNumber )" />
				</xsl:attribute>
			</meta>
			<meta property="og:image" content=""/>
			<meta property="og:description">
				<xsl:attribute name="content">
				</xsl:attribute>
			</meta>
			<meta property="og:description">
				<xsl:attribute name="content">
					<xsl:value-of select="$head-description" />
				</xsl:attribute>
			</meta>

			<meta property="og:type" content="website" />
			<meta charset="utf-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1"/>

			<title>Open House Guest Book</title>

			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_css/genie-colors.css' )" />
				</xsl:attribute>
			</link>
			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/css/common.css' )" />
				</xsl:attribute>
			</link>
			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/css/footer-common.css' )" />
				</xsl:attribute>
			</link>
			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/themes/', //output/@theme, '.css' )" />
				</xsl:attribute>
			</link>
		</head>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>

			<div id="step1" class="background steps funnel-open-houes-guest1">
				<section class="open-houes-guest1">
					<div class="container-fluid">
						<div class="row open-houes-guest1-info">
							<div class="col-md-6 top-align col-sm-12 background">
								<div class="v-align">
									<div class="image-container">
										<div>
											<img width="100%" height="290" style="object-fit:cover;filter: blur(8px);-webkit-filter: blur(8px);" alt="Open House">
												<xsl:attribute name="src">
													<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/open-house-1.jpg' )" />
												</xsl:attribute>
											</img>
										</div>
									</div>

									<div class="open-house-details text-center">

										<h2 class="subtitle-font heading-color">
											<span>
												<xsl:choose>
													<xsl:when test="number(//single/statusTypeID)=2">
														<xsl:text>XXXX </xsl:text>
														<xsl:value-of select="//single/address/streetName" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="//single/address/street" />
													</xsl:otherwise>
												</xsl:choose>
											</span>
											<xsl:value-of select="//single/address/city" />
											<xsl:text> , </xsl:text>
											<xsl:value-of select="//single/address/state" />
											<xsl:text></xsl:text>
											<xsl:value-of select="//single/address/zip" />
										</h2>

										<h3 class="subtitle-font heading-color">

											<strong>
												<xsl:value-of select="format-number( //single/price, '$###,###')"/>
											</strong>
										</h3>
										<ul class="room-details body-font body-color">
											<li>
												<div>
													<xsl:value-of select="//single/bedrooms/@count" />
												</div>
												<xsl:text> Bed</xsl:text>
											</li>
											<li>
												<div>
													<xsl:value-of select="$listingTotalBathrooms" />
												</div>
												<xsl:text> Bath</xsl:text>
											</li>
											<li>
												<div>
													<xsl:value-of select="//single/squareFeet" />
												</div>
												<xsl:text> Sq. Ft.</xsl:text>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-12 pd-40  min-height banner-img position-relative">
								<img width="100%" height="100%" alt="Open House">
									<xsl:attribute name="src">
										<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/open-house-2.jpg' )" />
									</xsl:attribute>
								</img>
								<div class="open-house-form-overlay heading-color-as-bg">
									<xsl:comment/>
								</div>
								<div class="open-house-gust-date text-center heading-font background-as-color">
									<h1 class="background-as-color editable">
										<span>
											<xsl:text>SNEAK PEEK</xsl:text>
										</span>
                                        -
										<span>
											<xsl:text>INSIDER ACCESS</xsl:text>
										</span>
									</h1>
									<h3 class="address-part subtitle-font background-as-color">
										<xsl:text>Why we need this info:</xsl:text>
									</h3>
									<p class="body-font background-as-color">
										<xsl:text>
									        Department of Real Estate regulations do not allow ANY REALTOR to present off MLS marker properties to the general public. Filling out this form meets the requirements. DON'T WORRY, we will not SPAM you or sell your info to any one.
										</xsl:text>
									</p>
								</div>
								<div class="open-house-gust-from-details body-font" style="padding: 1rem;">
									<form class="funnel-create-lead">
										<div class="form-group">
											<input type="text" name="fullName" class="form-control reset-form contact_name" placeholder="Full Name" required="required"/>
										</div>
										<div class="form-group">
											<input type="email" name="emailAddress" class="form-control reset-form contact_email" placeholder="Email Address" required="required"/>
										</div>
										<div class="form-group">
											<input type="tel" name="phoneNumber" class="form-control phone reset-form" placeholder="Phone Number" required="required"/>
										</div>
										<div class="form-group">
											<h4 class="background-as-color heading-font">
												<xsl:text>I'd like to get:</xsl:text>
											</h4>
											<div class="custom-control custom-checkbox mb-3">
												<ul class="background-as-color heading-font">
													<li>
														<label class="custom-control-label" for="customCheck1">
															<input type="checkbox" class="custom-control-input reset-form market-insider-report" name="meta[market-insider-report]" value="Yes"/>
															<xsl:copy-of select="concat( 'The latest Market insider report for ', //area/name )"/>
														</label>
													</li>
													<li>
														<label class="custom-control-label" for="customCheck2">
															<input type="checkbox" class="custom-control-input reset-form" id="customCheck2" name="meta[notification]" value="Yes"/>
															<xsl:text>First notification when similar properties hit the market</xsl:text>
														</label>
													</li>
													<li>
														<label class="custom-control-label property" for="customCheck3">
															<input type="checkbox" class="custom-control-input reset-form" id="customCheck3" name="meta[value-assesment]" value="Yes"/>
															<xsl:text>A TODAY VALUE assessment of my home</xsl:text>
														</label>
													</li>
												</ul>
											</div>
											<div class="form-group property-address" style="display: none;">
												<input type="text" name="meta[property-address]" class="form-control reset-form" placeholder="Address"/>
											</div>
										</div>
										<div class="form-group">
											<div class="fl-btn-value text-center">
												<button class="btn heading-font subtitle-color-as-bg heading-color btn-submit step1-button">
													<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" class="heading-svg">
														<path d="M13 18v-4h-7v-4h7v-4l6 6-6 6zm-1-16c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12z"></path>
													</svg>
													<span> Join Now </span>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>

			<xsl:call-template name="agent-about" />

			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="default-thank-you-popup" />
				<xsl:call-template name="copyright" />
			</div>
			<style>
				<xsl:value-of select="'
				#about-section {
				    margin-top: 150px;
				}
				.team-about-wrapper {
				    display: none;
				}
				.agent-details{
					border-bottom:none;
				}'"/>
			</style>
		</body>
	</xsl:template>
</xsl:stylesheet>
