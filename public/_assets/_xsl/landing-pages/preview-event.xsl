<?xml version="1.0"?>
<!--
	Asset Name:			OH Preview Event
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area, Listing
	Permission: 		Funnels
	Default Download:    area-insider-reports/market-insider
	Render Key:			landing-page/OH-Preview-Event-MLSNUMBER
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="landing-pages.xsl" />


	<xsl:template name="landing-page">
		<xsl:variable name="head-description">
			<xsl:value-of select="concat( 'Welcome ', //area/name, ' readers!' )" />
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="'Welcome Neighbors to this amazing East Manhattan Beach property to be auctioned on Oct 20th 2022'" />
			<xsl:with-param name="description" select="'View details, pricing, photos, floorplan, for 1400 19Th St. AUCTION: Bid October 20-25. Previously Offered for $4M. No Reserve. Daily showings from 1:00PM to 4:00PM. This is a NO MINIMUM NO RESERVE auction, the property will sell at auction to the highest bidder regardless of price. Situated on an expansive corner lot in idyllic East Manhattan Beach, this open-concept, light-filled...'" />

			<xsl:with-param name="seoImage" select="//single/photoPrimary" />
			<xsl:with-param name="secondaryCSS" select="'open-house-event-preview'" />
			<xsl:with-param name="defaultUtmSource" select="'OH Event Preview'" />
			<xsl:with-param name="defaultUtmCampaign" select="concat( $listingAddressLine1, ', ', $listingAddressLine2 )" />
			<xsl:with-param name="leadNotePrompt" select="concat( 'Event Preview ', //single/address/street )" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>

			<div class="container step1">
				<div id="call-to-action">
					<div class="funnel-top-content">
						<h1 class="heading-font">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'cta-line-1'" />
								<xsl:with-param name="default" select="concat( 'WELCOME ', //area/name, ' Readers!' )" />
							</xsl:call-template>
						</h1>

						<h2 class="heading-font subtitle-color">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'cta-line-2'" />
								<xsl:with-param name="default" select="'Make sure you don&#8217;t miss this'" />
							</xsl:call-template>
						</h2>

						<h3 class="heading-font">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'cta-line-3'" />
								<xsl:with-param name="default" select="'Exclusive Auction Preview Event'" />
							</xsl:call-template>
						</h3>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="fl-img-holder">
								<img src="https://myneighborhood.re/wp-content/uploads/2022/09/unknown.png" style="max-width: 100%;" />
							</div>
						</div>
					</div>

					<div class="form-section">
						<div class="preview-form-details heading-font">
							<form class="funnel-create-lead">
								<div class="form-group">
<input type="text" name="fullName" class="form-control reset-form contact_name heading-font" placeholder="Full Name" required="required" />

								</div>
								<div class="form-group">
<input type="email" name="emailAddress" class="form-control reset-form contact_email heading-font" placeholder="Email Address" required="required" />

								</div>
								<div class="form-group">
<input type="tel" name="phoneNumber" class="form-control phone reset-form heading-font" placeholder="Phone Number" required="required" />

								</div>
								<div class="form-group form-buttons heading-font">
									<div class="checkbox-data">
										<p class="heading-font">How would you like to receive your RSVP confirmation:</p>
										<label>
<input type="checkbox" name="meta[confirmViaText]" value="yes" />

											<xsl:text>Text</xsl:text>
										</label>
										<label>
											<input type="checkbox" name="meta[confirmViaEmail]" value="yes" />
											<xsl:text>Email</xsl:text>
										</label>
									</div>
									<div class="fl-btn-value button-data">
										<button class="btn heading-font subtitle-color-as-bg background-as-color btn-submit step1-button">
											<!-- <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" class="headings-svg">
												<path d="M13 18v-4h-7v-4h7v-4l6 6-6 6zm-1-16c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12z"></path>
											</svg> -->
											<span class="heading-font">Confirm</span>
										</button>
									</div>
									<span class="funnel-loader" style="display:none;"></span>
								</div>
							</form>

							<div class="fl-listing-wrapper">
								<div class="text-heading heading-font heading-color">
									<p>
										<strong>Enter your contact info to receive:</strong>
									</p>
								</div>
								<ul class="fl-listing heading-font heading-color">
									<li>VIP entry to the auction preview event</li>
									<li>Complimentary tacos, beer &amp; wine</li>
									<li>Free download of the 1400 19th St digital brochure</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div id="custom-thank-you" style="display:none;">
					<h1 class="main-thankyou-heading heading-font">
						<p>YOUR RSVP has been SAVED - We look forward to seeing&#160;you!</p>
					</h1>

					<div class="main-thankyou-content">
						<div class="row">
							<div class="col-md-6">
								<div class="fl-small-img-holder">
									<img width="100%" style="object-fit:cover" preserveAspectRatio="xMidYMid meet">
										<xsl:attribute name="src">
											<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/img-box.jpg' )" />
										</xsl:attribute>
									</img>
									<div class="image-text-section">
										<div class="thankyou-content">
											<!-- <h2 class="heading-font">Get the Scoop<br/>on the auction</h2> -->
											<a id="search-compare-link" href="https://www.casothebys.com/auctions/1400-19th-st-manhattan-beach-ca" target="_blank">
												<p class="heading-font">
													<xsl:text>GET THE SCOOP</xsl:text>
												</p>
												<p class="heading-font">
													<xsl:text>ON THE AUCTION</xsl:text>
												</p>
												<p class="heading-font">
													Click Here
												</p>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 thank-you-mail-message">
								<div class="download-text">
									<h4 class="heading-font">Download your Property Brochure here:</h4>
								</div>

								<div class="send-icon">
									<div class="icon-download">
										<a class="btn heading-font subtitle-color-as-bg" target="_blank" href="https://myneighborhood.re/wp-content/uploads/2022/09/1400-19th-Brochure.pdf">Download
											<svg width="15" height="15"
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 485 485" class="heading-svg">
<polygon points="380.926,115.57 321.93,115.57 321.93,0 163.07,0 163.07,115.57 104.074,115.57 242.5,267.252" />

												<path d="M0,310v175h485V310H0z M330,412.5c-8.284,0-15-6.716-15-15s6.716-15,15-15c8.284,0,15,6.716,15,15S338.284,412.5,330,412.5
z M400,412.5c-8.284,0-15-6.716-15-15s6.716-15,15-15c8.284,0,15,6.716,15,15S408.284,412.5,400,412.5z" />
											</svg>
										</a>
									</div>
								</div>

								<div class="thank-you-title">
									<p class="heading-font">
										<xsl:value-of select="concat( 'Your ', //area/name, ' Market')" />
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="funnel-footer-background" style="margin-top: 4rem;">
					<xsl:call-template name="agent-about" />

					<xsl:call-template name="agent-details" />
					<xsl:call-template name="copyright" />
				</div>
			</div>

			<script>
				<xsl:value-of select="'
				document.addEventListener( `genie-lead-created`, function(lead) {
					if( document.getElementById( `search-compare-link`).href == `` ) {
						const url = `${window.location.origin}${window.location.pathname}`;
						const urlParams = new URLSearchParams(window.location.search);

						urlParams.delete(`lpo`);
						urlParams.append(`lpo`, `home-compare-search`);
						urlParams.append(`lead_id`, lead.detail.key);

						document.getElementById( `search-compare-link`).href = `${url}?${urlParams.toString()}`;
					}

					document.getElementById(`call-to-action`).style.display = `none`;
					document.getElementById(`custom-thank-you`).style.display = `block`;
});'" />
			</script>
		</body>
	</xsl:template>
</xsl:stylesheet>
