<?xml version="1.0"?>
<!--
	Asset Name:			OH RSVP
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
		<!-- <link rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/css/open-house-guest-book-2.css' )" />
			</xsl:attribute>
		</link> -->
		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>
		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Open House ', //area/name )" />
			<xsl:with-param name="description" select="$head-description" />
			<xsl:with-param name="seoImage" select="//single/photoPrimary" />
			<xsl:with-param name="secondaryCSS" select="'open-house-guest-book-2'" />
			<xsl:with-param name="defaultUtmSource" select="'OH Guest 2'" />
			<xsl:with-param name="defaultUtmCampaign" select="concat( $listingAddressLine1, ', ', $listingAddressLine2 )" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'Open House RSVP Registration from ', //single/address/street )" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>

			<script>
				<xsl:value-of select="concat( &quot;const polygon = &quot;, //area[1]/geojson, &quot;;&quot; )" />
				<xsl:value-of select="concat( &quot;const listing = [{caption: 'HH', state:'&quot;, //single/listingStatus, &quot;',lat:&quot;, //single/latitude, &quot;,lng:&quot;, //single/longitude, &quot;}]; &quot; )" />
				<xsl:value-of select="concat( 'document.addEventListener( `DOMContentLoaded`, function () { if( typeof drawMap !== `undefined` ) { drawMap( `genie-map`, `', //output/@mapStyle, '`,`', //output/@mapboxKey, '`, { lat: ', //single/latitude, ', lng: ', //single/longitude, ' }, polygon, listing, `', null, '`, ', 1, ' );}});' )" />
			</script>

			<div id="step1" class="background steps funnel-open-houes-guest1">
				<section class="open-houes-guest1">
					<div class="container-fluid">
						<div class="row open-houes-guest1-info">
							<div class="col-md-6 top-align col-sm-12 background">
								<div class="v-align">
									<div class="image-container">
										<div>
											<img width="100%" height="290" style="object-fit:cover">
												<xsl:attribute name="src">
													<xsl:value-of select="$primaryImage"/>
												</xsl:attribute>
											</img>
										</div>
									</div>

									<div class="open-house-details text-center">
										<h2 class="subtitle-font heading-color">
											<span>
												<xsl:value-of select="$listingAddressLine1" />
											</span>
											<xsl:value-of select="$listingAddressLine2" />
										</h2>

										<h6 class="subtitle-font heading-color">
											<xsl:text>MLS #</xsl:text>
											<xsl:value-of select="//single/mlsNumber" />
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
								<img width="100%" height="100%">
									<xsl:attribute name="src">
										<xsl:call-template name="listing-image">
											<xsl:with-param name="index" select="number(2)" />
											<xsl:with-param name="preferPrimary" select="'true'" />
										</xsl:call-template>
									</xsl:attribute>
								</img>
								<div class="open-house-form-overlay heading-color-as-bg">
									<xsl:comment/>
								</div>
								<div class="open-house-gust-date text-center heading-font background-as-color">
									<h1 class="background-as-color editable">
										<xsl:text>Open House RSVP</xsl:text>
									</h1>
									<h3 class="address-part subtitle-font background-as-color">
										<xsl:copy-of select="$listingAddressHTML" />
									</h3>
									<h4 class="background-as-color editable">
										<!-- Sunday, March 13th<br/> 12 pm - 2 pm -->
										<xsl:value-of select="concat( //single/openHouse , ' ' )"/>
									</h4>
								</div>
								<div class="open-house-gust-from-details body-font">
									<form id="form_step1" class="funnel-create-lead">
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
														<label class="custom-control-label property" for="showAddressInput">
															<input type="checkbox" class="custom-control-input reset-form" onclick="showAddressInput()" id="showAddressInput" name="meta[value-assesment]" value="Yes"/>
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
												<button class="btn heading-font subtitle-color-as-bg background-as-color btn-submit step1-button">
													<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" class="background-svg">
														<path d="M13 18v-4h-7v-4h7v-4l6 6-6 6zm-1-16c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12z"></path>
													</svg>
													<span> Check In </span>
												</button>
											</div>
											<span class="funnel-loader">
												<xsl:comment/>
											</span>
										</div>
									</form>
									<xsl:call-template name="default-thank-you-popup"/>
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
                function showAddressInput() {
                  // Get the checkbox
                  var checkBox = document.getElementById(`showAddressInput`);
                  // Get the output text
                  var addressInput = document.getElementsByClassName(`property-address`)[0];

                  // If the checkbox is checked, display the output text
                  if (checkBox.checked == true){
                    addressInput.style.display = `block`;
                  } else {
                    addressInput.style.display = `none`;
                  }
                }'"/>
		</script>
	</xsl:template>
</xsl:stylesheet>
