<?xml version="1.0"?>
<!--
	Asset Name:			GENRIC LEAD GEN
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area, Listing
	Permission: 		Funnels
	Default Download:	area-insider-reports/market-insider
	Approved: 			True
	Render Key:			landing-page/Open-House-Guest-Book-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="landing-pages.xsl" />
<xsl:import href="landing-pages-market-insider.xsl" />


	<xsl:template name="landing-page">
		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="seoImage" select="//single/photoPrimary" />
			<xsl:with-param name="secondaryCSS" select="'lead-gen'" />
			<xsl:with-param name="defaultUtmSource" select="'OH Guest 1'" />
			<xsl:with-param name="defaultUtmCampaign" select="concat( //single/address/street, ' ' ,//single/address/city , ', ' ,//single/address/state , ' ' ,//single/address/zip )" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'Open House Registration from ', //single/address/street )" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>

			<div id="step1" class="steps funnel-lead-gen">
				<section class="step1">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="funnel-top-text">
									<h1 class="heading-font">
										<xsl:text>WELCOME Neighbors!</xsl:text>
									</h1>
									<div class="heading-font subtitle-color second-line">
										<xsl:text>Make sure you don't miss this</xsl:text>
									</div>
									<h2 class="heading-font">
										<xsl:text>Exclusive Auction Preview Event</xsl:text>
									</h2>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="fl-img-holder">
									<img width="100%" style="object-fit:cover" preserveAspectRatio="xMidYMid meet">
										<xsl:attribute name="src">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/lead-gen-image.png' )" />
										</xsl:attribute>
									</img>
								</div>
							</div>
						</div>

						<div class="row third-row">
							<div class="col-md-12">
								<div class="col-sm-6">
									<form id="form_step1" class="funnel-create-lead fl-thankyou-modal">
										<div class="form-group">
<input type="text" class="form-control reset-form contact_name heading-font" id="clientName" name="fullName" placeholder="NAME*" required="required" />

										</div>
										<div class="form-group">
<input type="email" class="form-control reset-form contact_email heading-font " id="email" name="emailAddress" placeholder="EMAIL*" required="required" />

										</div>
										<div class="form-group">
<input type="tel" class="form-control phone reset-form heading-font" id="phoneNumber" name="phoneNumber" placeholder="PHONE NUMBER*" required="required" />

										</div>
										<div class="form-group form-buttons heading-font">
											<div class="checkbox-data">
												<p class="heading-font">How would you like to receive your RSVP confirmation:</p>
												<label>
<input type="checkbox" name="" value="yes" />

													<xsl:text>Text</xsl:text>
												</label>
												<label>
													<input type="checkbox" name="" value="yes" checked="" required="" />
													<xsl:text>Email</xsl:text>
												</label>
											</div>
											<div class="button-data">

<!-- <input type="submit" value="Send" class="wpcf7-submit" /> -->
												<button class="btn btn-primary subtitle-color-as-bg heading-color btn-submit step1-button heading-font">
													<xsl:text>Sign IN</xsl:text>
												</button>
											</div>
										</div>
									</form>
								</div>
								<div class="col-sm-6">
									<div class="fl-listing-wrapper">
										<h4 class="text-heading heading-color heading-font">
											<xsl:text>Enter your contact info to receive:</xsl:text>
										</h4>
										<ul class="fl-listing heading-font heading-color">
											<li>VIP entry to the auction preview event</li>
											<li>Complimentary tacos, beer and wine</li>
											<li>Free download of the 1400 19th St digital brochure</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>

				<!-- section start -->
				<div id="step2" class="steps funnel-lead-gen text-center" style="display:none;">
					<section class="thankyou-sec step3">
						<div class="container">
							<div class="row">
								<div class="col-md-12">

									<div class="main-thankyou-col">

										<div class="main-thankyou-heading">
											<h3 class="heading-font">
												<xsl:text>YOUR RSVP has been SAVED - We look forward to seeing you!</xsl:text>
											</h3>
										</div>

										<div class="main-thankyou-content">
											<div class="row">
												<div class="col-md-6">
													<div class="fl-small-img-holder">
														<img width="100%" height="" style="object-fit:cover" preserveAspectRatio="xMidYMid meet">
															<xsl:attribute name="src">
																<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/img-box.jpg' )" />
															</xsl:attribute>
														</img>
														<div class="image-text-section">
															<div class="more-details-text heading-font editable">
																<a href="https://www.casothebys.com/auctions/1400-19th-st-manhattan-beach-ca" class="heading-font" target="_blank">
																	<xsl:text>GET THE SCOOP</xsl:text>
																</a>
																<br/>
																<a href="https://www.casothebys.com/auctions/1400-19th-st-manhattan-beach-ca" class="heading-font" target="_blank">
																	<xsl:text>ON THE AUCTION</xsl:text>
																</a>
															</div>

															<div class="click-here-text heading-font editable">
																<a href="https://www.casothebys.com/auctions/1400-19th-st-manhattan-beach-ca" class="heading-font" target="_blank">
																	<xsl:text>Click Here</xsl:text>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="col-md-6 thank-you-mail-message">
													<div class="download-text">
														<h3 class="heading-font">
															<xsl:text>Download your Property Brochure here:</xsl:text>
														</h3>
													</div>

													<div class="send-icon">
														<div class="icon-download">
															<button class="btn btn-primary heading-font subtitle-color-as-bg btn-submit step1-button">
																<span class="heading-font">Download</span>
																<svg version="3.0" width="15" height="15" id="Layer_1"
																	xmlns="http://www.w3.org/2000/svg"
																	xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 485 485" style="enable-background:new 0 0 485 485;" xml:space="preserve" class="heading-svg">
																	<g>
<polygon points="380.926,115.57 321.93,115.57 321.93,0 163.07,0 163.07,115.57 104.074,115.57 242.5,267.252" />

																		<path d="M0,310v175h485V310H0z M330,412.5c-8.284,0-15-6.716-15-15s6.716-15,15-15c8.284,0,15,6.716,15,15S338.284,412.5,330,412.5
z M400,412.5c-8.284,0-15-6.716-15-15s6.716-15,15-15c8.284,0,15,6.716,15,15S408.284,412.5,400,412.5z" />
																	</g>
																</svg>
															</button>
														</div>
													</div>

													<div class="thank-you-title">
														<div class="area-name heading-font">
															<xsl:text>Your East Manhattan Beach&#160;Market</xsl:text>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

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
				#about-section{
					padding-top:90px;
				}
				.team-about-wrapper {
				    display: none;
				}
				.agent-details{
					border-bottom:none;
}'" />
			</style>
			<script>
				<xsl:value-of select="'
                const showAddressInput = function () {
                  const checkBox = document.getElementById(`customCheck3`);
                  document.getElementsByClassName(`property-address`)[0].style.display = (checkBox.checked == true) ? `block` : `none`;
                }

				document.addEventListener( `genie-lead-created`, function (lead) { gHub.redirectToParentAsset( { lead_id: lead.detail.key } ); } );
'" />
			</script>
		</body>
	</xsl:template>
</xsl:stylesheet>
