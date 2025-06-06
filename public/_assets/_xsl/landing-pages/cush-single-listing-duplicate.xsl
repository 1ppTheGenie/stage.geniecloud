<?xml version="1.0"?>
<!--
	Asset Name:			Cush Single Listing -
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
		Default Download:	flyers/single-listing-01
	Render Key:			landing-page/TheGenie-Instant-Download-v6-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl" />
	<xsl:import href="landing-pages-market-insider.xsl" />

	<xsl:template name="landing-page">
		<xsl:variable name="description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>
		<xsl:variable name="listing-caption">
			<xsl:choose>
				<xsl:when test="number(//single/statusTypeID) = 2">
					<xsl:value-of select="'Sold'" />
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID) = 1">
					<xsl:value-of select="'Listed'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'Pending'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Listing details for #', //single/mlsNumber )" />
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="secondaryCSS" select="'cush-single-listing'" />
		</xsl:call-template>
		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', $cssThemeClass)" />
			</xsl:attribute>
			<xsl:variable name="primaryImage">
				<xsl:call-template name="listing-image">
					<xsl:with-param name="index" select="number(1)" />
					<xsl:with-param name="preferPrimary" select="'true'" />
				</xsl:call-template>
			</xsl:variable>
			<div id="step1" class="steps banner-top-section-info section background">
				<header class="header">
					<div class="container custom-container">
						<div class="header-logo">
							<a href="#">
								<div class="agent-company-logo">
									<xsl:attribute name="style">
										<xsl:value-of select="concat( 'background-image: url(', $companyLogo, ')' )" />
									</xsl:attribute>
								</div>
								<xsl:comment/>
							</a>
						</div>
						<nav class="navbar header-navigation">
							<div class="header-buttons">
								<button class="navbar-toggle" type="button">
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
								<div class="phone-btn">
									<a href="tel:+15106982678">
										<svg version="3.0" id="Capa_1"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="18" height="18" viewBox="0 0 891.024 891.024" style="enable-background:new 0 0 891.024 891.024;width: 18px;height: 18px;" xml:space="preserve">
											<g>
												<path d="M2.8,180.875c46.6,134,144.7,286.2,282.9,424.399c138.2,138.2,290.4,236.301,424.4,282.9c18.2,6.3,38.3,1.8,52-11.8
                                        l92.7-92.7l21.6-21.6c19.5-19.5,19.5-51.2,0-70.7l-143.5-143.4c-19.5-19.5-51.2-19.5-70.7,0l-38.899,38.9
                                        c-20.2,20.2-52.4,22.2-75,4.6c-44.7-34.8-89-73.899-131.9-116.8c-42.9-42.9-82-87.2-116.8-131.9c-17.601-22.6-15.601-54.7,4.6-75
                                        l38.9-38.9c19.5-19.5,19.5-51.2,0-70.7l-143.5-143.5c-19.5-19.5-51.2-19.5-70.7,0l-21.6,21.6l-92.7,92.7
                                        C1,142.575-3.5,162.675,2.8,180.875z"></path>
											</g>
										</svg>
									</a>
								</div>
								<div class="email-btn">
									<a href="mailto:">
										<img alt="Bar chart">
											<xsl:attribute name="src">
												<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/email.svg')" />
											</xsl:attribute>
										</img>
									</a>
								</div>
							</div>
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
									<div class="collapse navbar-collapse sidebar-collapse-menu" id="#sidebarMain">
										<div class="nav">
											<ul class="nav genie-module-background">
												<a href="javascript:void(0)" class="closebtn">×</a>
												<li class="nav-item">
													<a class="nav-link active genie-module-heading-color" href="https://www.inspired.re" target="_blank">Home</a>
												</li>
												<li class="nav-item open_about_modal">
													<a class="nav-link active genie-module-heading-color" href="#about-section">About</a>
												</li>
												<li class="nav-item">
													<a class="nav-link active open_lead_form genie-module-heading-color" href="#contact_form">Contact</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</nav>
					</div>
				</header>
				<section class="home-slider">
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
							<xsl:choose>
								<xsl:when test="number(//single/statusTypeID) = 2">
									<xsl:value-of select="'Sold'" />
								</xsl:when>
								<xsl:when test="number(//single/statusTypeID) = 1">
									<xsl:value-of select="'Listed'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'Pending'" />
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="address-1 container">
					</div>
					<div class="hero-details custom-container container">
						<div class="heading-color-as-bg hero-details-inner">
							<div class="hero-price">
								<span class="gradient-color">
									<xsl:value-of select="format-number( //single/price, '$###,###')" />
								</span>
							</div>
							<div class="hero-amenities subtitle-color">
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
						</div>
					</div>
				</section>
				<section class="about-section">
					<div class="container">
						<div class="overview-text">
							<h2 class="heading-title">
								<span class="gradient-color">
									<xsl:text>Overview</xsl:text>
								</span>
							</h2>
							<p class="body-color">
								<xsl:copy-of select="//single/description" />
							</p>
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
											<xsl:text>Beds</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/bedrooms/@count" />
										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>sq. ft</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="//single/squareFeet" />
										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>Baths</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="$listingTotalBathrooms" />
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
											<xsl:text>Garage</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="(//single/parking/@spaces+//single/parking/@garage)" />
										</span>
									</li>
									<li class="body-color">
										<strong>
											<xsl:text>Type</xsl:text>
										</strong>
										<span>
											<xsl:value-of select="$propertyType" />

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
							<div class="col-md-4">
								<a class="cta subtitle-font heading-color-as-bg background-as-color" id="schedule-modal-btn" href="#schedule-modal" data-toggle="modal">
									<xsl:text>Schedule A Showing</xsl:text>
								</a>
							</div>
						</div>
					</div>
				</section>
				<xsl:if test="//single/virtualTourUrl !=''">
					<section class="video-section">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<h2 class="heading-title px-10">
										<span class="gradient-color">
											<xsl:text>Virtual Tour</xsl:text>
										</span>
									</h2>
									<div class="virtual-tour-embed">
										<xsl:call-template name="virtual-tour-embed" />
									</div>
								</div>
							</div>
						</div>
					</section>
				</xsl:if>
				<section class="gallery">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<h2 class="heading-title px-10">
									<span class="gradient-color">
										<xsl:text>Gallery</xsl:text>
									</span>
								</h2>
							</div>
							<div class="col-md-12">
								<div class="gallery-list">
									<div class="gallery-img">
										<img src="https://sdmls-media.cdn-connectmls.com/20220111T124313564/Property_220000594_Photo_1.JPEG" class="img-responsive" />
									</div>
									<div class="gallery-img">
										<img src="https://sdmls-media.cdn-connectmls.com/20220111T124313564/Property_220000594_Photo_2.JPEG" class="img-responsive" />
									</div>
									<div class="gallery-img">
										<img src="https://sdmls-media.cdn-connectmls.com/20220111T124313564/Property_220000594_Photo_3.JPEG" class="img-responsive" />
									</div>
									<div class="gallery-img">
										<img src="https://sdmls-media.cdn-connectmls.com/20220111T124313564/Property_220000594_Photo_4.JPEG" class="img-responsive" />
									</div>
									<div class="gallery-img">
										<img src="https://sdmls-media.cdn-connectmls.com/20220111T124313564/Property_220000594_Photo_5.JPEG" class="img-responsive" />
									</div>
									<div class="gallery-img">
										<img src="https://sdmls-media.cdn-connectmls.com/20220111T124313564/Property_220000594_Photo_6.JPEG" class="img-responsive" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="download-pdf">
					<div class="download-img">
						<img alt="Bar chart" width="100%" height="100%" style="object-fit: cover;">
							<xsl:attribute name="src">
								<xsl:value-of select="concat( //output/@siteUrl, '/_assets/_img/cush-pdf-bg.jpg')" />
							</xsl:attribute>
						</img>
					</div>
					<a class="pdf-btn" data-genie-tags="DownloadMarketReport">
						<xsl:attribute name="href">
							<xsl:value-of select="//output/@downloadUrl" />
						</xsl:attribute>
						<div class="overlay-bg">
							<xsl:comment/>
						</div>
						<span class="gradient-color">
							<xsl:text>Download PDF Flyer</xsl:text>
						</span>
					</a>
				</section>
				<section class="map container">
					<div class="map-form">
						<div class="map-form-inner">
							<h2 class="cld-title heading-title">
								<em>
									<xsl:text>Interested In</xsl:text>
								</em>
								<span class="gradient-color">
									<xsl:call-template name="listing-address-line-one" />
								</span>
							</h2>
							<div role="form" class="wpcf7" lang="en-US" dir="ltr">
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
									<div class="form-field">
										<span class="wpcf7-form-control-wrap your-message">
											<textarea cols="40" name="note" rows="10" class="form-control" placeholder="Message"></textarea>
										</span>
										<input type="submit" value="Send" class="wpcf7-submit step1-button" />
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="map-embed">
						<div class="map-embed-inner mapboxgl-map" id="map">
							<iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=1%20Grafton%20Street,%20Dublin,%20Ireland+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">
								<a href="#">transport gps</a>
							</iframe>
						</div>
					</div>
				</section>
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
				<section class="form-section" id="contact_form">
					<img alt="Bar chart" width="100%" class="form-bg">
						<xsl:attribute name="src">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-form-bg.jpg')" />
						</xsl:attribute>
					</img>
					<div class="overlay-1">
						<xsl:comment/>
					</div>
					<div id="ahead-with-us">
						<div class="container">
							<div class="awu-box">
								<!-- <img alt="Bar chart" width="100%" height="100%">
                            <xsl:attribute name="src">
                                <xsl:value-of select="concat( //output/@siteUrl, '/_assets/_img/cush-form-bg.jpg')" />
                            </xsl:attribute>
                        </img> -->
								<div class="overlay-bg background">
									<xsl:comment/>
								</div>
								<div class="textwidget custom-html-widget">
									<p>
										<xsl:text>Keep up to date with the latest market trends and opportunities in the East Bay.</xsl:text>
									</p>
									<div class="awu-form">
										<div role="form" class="wpcf7" dir="ltr">
											<form class="wpcf7-form init use-floating-validation-tip funnel-create-lead" id="form_step1">
												<div class="awu-field awu-col-6">
													<input type="text" name="fullName" placeholder="Name" />
												</div>
												<div class="awu-field awu-col-6">
													<input type="text" name="emailAddress" placeholder="Email" />
												</div>
												<div class="awu-field awu-col-12">
													<span class="wpcf7-form-control-wrap you-message">
														<textarea name="note" placeholder="Message" cols="30" rows="10"></textarea>
													</span>
													<input type="submit" class="step1-button" value="Send" />
												</div>
											</form>
										</div>
									</div>
								</div>
								<!--  THIS DIV ENDS HERE-->
							</div>
						</div>
					</div>
				</section>
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
								<textarea class="form-control" name="note" cols="40" rows="10"></textarea>
							</div>
							<div class="col-md-12">
								<input type="submit" value="Send" class="submit-btn step1-button" id="request-modal-btn" />
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
								<textarea class="form-control" name="note" cols="40" rows="10"></textarea>
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
			<style>
				<xsl:value-of select="'
				.modal-backdrop {
					position: fixed;
					top: 0;
					right: 0;
					bottom: 0;
					left: 0;
					z-index: 1040;
					background-color: #000;
					opacity: 0.5;
				}
				.stop-scrolling {
					height: 100%;
					overflow: hidden;
				}'" />
			</style>
			<script type="text/javascript">
				<xsl:value-of select="'
					//window.onscroll = function() {document.querySelector(`.header`).classList[document.body.scrollTop >= 150 ? `add` : `remove`](`fixed`) };
					// Get the modal
					var modal = document.getElementById(`schedule-modal`);
					var modal2 = document.getElementById(`request-modal`);
					// Get the button that opens the modal
					var btn = document.getElementById(`schedule-modal-btn`);
					var btn2 = document.getElementById(`request-modal-btn`);
					// Get The Button to close  modal
					var closeBtn = document.getElementById(`schedule-modal-close`);
					var closeBtn2 = document.getElementById(`request-modal-close`);
					btn.onclick = function() {
						document.getElementById(`backdrop`).style.display = `block`
						modal.style.display = `block`
						modal.classList.add(`in`);
					}
					btn2.onclick = function() {
						document.getElementById(`backdrop`).style.display = `block`
						modal2.style.display = `block`
						modal2.classList.add(`in`);
					}
					closeBtn.onclick = function() {
						document.getElementById(`backdrop`).style.display = `none`
						modal.style.display = `none`
						modal.classList.remove(`in`);
					}
					closeBtn2.onclick = function() {
						document.getElementById(`backdrop`).style.display = `none`
						modal2.style.display = `none`
						modal2.classList.remove(`in`);
					}
					var scrollPosition = window.scrollY;
					var logoContainer = document.getElementsByClassName(`header`)[0];
					window.addEventListener(`scroll`, function() {
						scrollPosition = window.scrollY;
						if (scrollPosition >= 150) {
							logoContainer.classList.add(`fixed`);
						} else {
							logoContainer.classList.remove(`fixed`);
						}
});'" />
			</script>
			<xsl:call-template name="agent-about" />
			<div class="funnel-footer-background">
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />
			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>												
