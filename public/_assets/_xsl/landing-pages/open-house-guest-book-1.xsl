<?xml version="1.0"?>
<!--
	Asset Name:			LC-OH-GUESTBOOK
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area, Listing
	Permission: 		Funnels
		Default Download:    area-insider-reports/market-insider
	Render Key:			landing-page/Open-House-Guest-Book-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl"/>

	<xsl:template name="landing-page">
		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="seoImage" select="//single/photoPrimary" />
			<xsl:with-param name="secondaryCSS" select="'open-house-guest-book-1'" />
			<xsl:with-param name="defaultUtmSource" select="'OH Guest 1'" />
			<xsl:with-param name="defaultUtmCampaign" select="concat( $listingAddressLine1, ', ', $listingAddressLine2 )" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'Open House Registration from ', //single/address/street )" />
		</xsl:call-template>

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
											<image width="100%" height="290" style="object-fit:cover" preserveAspectRatio="xMidYMid meet">
												<xsl:attribute name="src">
													<xsl:value-of select="$primaryImage"/>
												</xsl:attribute>
											</image>
										</div>
									</div>

									<div class="open-house-details text-center">
										<h2 class="subtitle-font heading-color">
											<span>
												<xsl:value-of select="$listingAddressLine1" />
											</span>
											<span class="second-span">
												<xsl:value-of select="$listingAddressLine2" />
											</span>
										</h2>

										<h6 class="subtitle-font heading-color" style="font-weight:400;">
											<xsl:value-of select="concat( ' MLS #: ', //single/mlsNumber)" />
										</h6>

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
								<image width="100%" height="100%" preserveAspectRatio="xMidYMid meet">
									<xsl:attribute name="src">
										<xsl:call-template name="listing-image">
											<xsl:with-param name="index" select="number(2)" />
											<xsl:with-param name="preferPrimary" select="'true'" />
										</xsl:call-template>
									</xsl:attribute>
								</image>
								<div class="open-house-form-overlay heading-color-as-bg">
									<xsl:comment/>
								</div>
								<div class="open-house-gust-date text-center heading-font background-as-color">

									<h1 class="background-as-color heading-font editable">
										<xsl:text>Open House Guest Book</xsl:text>
									</h1>
									<h3 class="address-part subtitle-font background-as-color">
										<xsl:copy-of select="$listingAddressHTML" />
									</h3>

									<xsl:if test="//openHouse">
										<h4 class="background-as-color editable">
											<p>
												<!-- Sunday, March 13th<br/> 12 pm - 2 pm -->
												<xsl:value-of select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ' - ', //openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends)" />
											</p>
										</h4>
									</xsl:if>
								</div>
								<div class="open-house-gust-from-details body-font">
									<form id="form_step1" class="funnel-create-lead fl-thankyou-modal">
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
											<h4 class="background-as-color heading-font" style="font-weight:400;">
												<xsl:text>I'd like to get:</xsl:text>
											</h4>
											<div class="custom-control custom-checkbox mb-3">
												<ul class="background-as-color heading-font">
													<li>
														<label class="custom-control-label heading-font" for="customCheck1">
															<input type="checkbox" class="custom-control-input reset-form market-insider-report" id="customCheck1" name="meta[market-insider-report]" value="Yes"/>
															<xsl:copy-of select="concat( 'The latest Market insider report for ', //area/name )"/>
														</label>
													</li>
													<li>
														<label class="custom-control-label heading-font" for="customCheck2">
															<input type="checkbox" class="custom-control-input reset-form" id="customCheck2" name="meta[notification]" value="Yes"/>
															<xsl:text>First notification when similar properties hit the market</xsl:text>
														</label>
													</li>
													<li>
														<label class="custom-control-label property heading-font" for="customCheck3">
															<input type="checkbox" class="custom-control-input reset-form" onclick="showAddressInput()" id="customCheck3" name="meta[value-assesment]" value="Yes"/>
															<xsl:text>A TODAY VALUE assessment of my home</xsl:text>
														</label>
													</li>
												</ul>
											</div>
											<div class="form-group property-address" style="display: none;">
												<input type="text" name="meta[propertyAddress]" class="form-control reset-form" placeholder="Address"/>
											</div>
										</div>
										<div class="form-group">
											<div class="fl-btn-value text-center">
												<button class="btn heading-font subtitle-color-as-bg background-as-color btn-submit step1-button">
													<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" class="headings-svg">
														<path d="M13 18v-4h-7v-4h7v-4l6 6-6 6zm-1-16c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12z"></path>
													</svg>
													<span class="heading-font"> Check In </span>
												</button>
											</div>
											<span class="funnel-loader">
												<xsl:comment/>
											</span>
										</div>
									</form>
									<xsl:call-template name="flyer-download-popup"/>
								</div>
							</div>
						</div>
					</div>
				</section>

				<xsl:call-template name="agent-about" />

				<div class="funnel-footer-background">
					<xsl:call-template name="agent-details" />
					<xsl:call-template name="default-thank-you-popup">
						<xsl:with-param name="message" select="'Welcome to our Open House!'" />
					</xsl:call-template>
					<xsl:call-template name="copyright" />
				</div>
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
			<script>
				<xsl:value-of select="'
                const showAddressInput = function() {
                  const checkBox = document.getElementById(`customCheck3`);
                  document.getElementsByClassName(`property-address`)[0].style.display = (checkBox.checked == true) ? `block` : `none`;
                }

				document.addEventListener( `genie-lead-created`, function(lead) { gg.redirectToParentAsset( { lead_id: lead.detail.key } ); } );
				'"/>
			</script>
		</body>
	</xsl:template>
</xsl:stylesheet>
