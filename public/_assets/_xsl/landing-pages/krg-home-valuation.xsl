<?xml version="1.0"?>
<!--
	Asset Name:			KRG Home Valuation
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
		Default Download:	area-insider-reports/market-insider
	Render Key:			landing-page/TheGenie-Instant-Download-v6-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="landing-pages.xsl" />
	<xsl:import href="landing-pages-market-insider.xsl" />


	<xsl:template name="landing-page">
		<xsl:variable name="description">
			<xsl:value-of select="concat( 'The ', //area/name, ' market is shifting! View the latest market trends and grab your customized report now.' )" />
		</xsl:variable>
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/css/krg-home-valuation.css' )" />
			</xsl:attribute>
		</link>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Market-Insider Report: Instant Download for ', //area/name )" />
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="secondaryCSS" select="'market-insider-instant-download-v1'" />
		</xsl:call-template>

		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', $cssThemeClass)" />
			</xsl:attribute>

			<div id="step1" class="steps heading-color-as-bg banner-top-section-info section">
				<form id="form_step1" class="funnel_create_lead" data-callback="template4_step1">
					<div class="step1" style="background-image: url('/_assets/_img/home-value-bg.jpg');">
						<nav class="navbar navbar-inverse">
							<div class="container">
								<div class="navbar-header">
									<!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        				<span class="icon-bar"><xsl:comment/></span>
				        				<span class="icon-bar"><xsl:comment/></span>
				        				<span class="icon-bar"><xsl:comment/></span>
				        			</button> -->
									<a class="navbar-brand" href="https://www.itzsold.com/">
										<image x="0%" y="0%">
											<xsl:attribute name="src">
												<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-logo.png' )" />
											</xsl:attribute>
										</image>
									</a>
								</div>
							</div>
						</nav>
						<div class="banner-img">
							<div class="container-fluid">
								<div class="">
									<div class="">
									</div>
									<div class="">
										<div class="bg-heading futura-text">
											<h1 class="futura-text">Whoa, did you feel&#160;that?<br/>
Your home's price just changed.</h1>
											<div role="form" class="wpcf7" lang="en-US" dir="ltr">
												<form method="post" class="wpcf7-form funnel-create-lead" id="form_step1">
													<div class="display-form">
														<div class="form-field">
															<span class="wpcf7-form-control-wrap your-name">
																<input type="text" name="fullName" class=" edit" placeholder="Enter a PROPERTY ADDRESS" />
															</span>
														</div>
														<div class="che_box submit-btn">
															<input type="submit" value="Get Report" class="title-button btn btn-warning" />
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
				</form>
			</div>

			<div class="container session ">
				<div class="container footer futura-text">
					<div class="first-part text-center">
						<p class="first-para futura-text">FOR YOUR EYES ONLY:</p>
						<h1 class="first-part-heading futura-text">Want the <i>real</i> scoop on the market?<br/>
 Become an insider (but keep it to yourself).</h1>
						<a href="javascript:void(0)" class="btn btn-primary download-report-btn genie-module-subtitle-color-as-bg genie-module-background-as-color  genie-module-heading-font">Get Report Now</a>
					</div>
				</div>
				<div class="container-fluid">
					<div class="second-part text-center futura-text">
						<h3>Your custom (and free) INSIDER report includes:</h3>
						<p>
							<span class="span-text">Market prediction video from <xsl:value-of select="//agent[1]/marketingName" />
							</span> • Median sale price • Average sale price • Avg. sale price per square foot High sale price • Number of homes sold • Number of homes for sale • Maps of current, pending, sold homes Details of all currently-listed homes • Details of recently sold homes • Details of currently pending homes Avg. days on market • Avg. length of ownership • 12-month turn over rate</p>
						<a href="javascript:void(0)" class="btn btn-primary download-report-btn genie-module-subtitle-color-as-bg genie-module-background-as-color  genie-module-heading-font">Get Report Now</a>
					</div>
				</div>
				<div class="container footer-logo-text futura-text">
					<div class="row">
						<div class="col-md-9">
							<p>
								<xsl:value-of select="//agent[1]/marketingName" />
 CALIFORNIA DEPARTMENT OF REAL ESTATE <xsl:value-of select="//agent[1]/marketingLicense" />
&#124; EXP REALTY OF CALIFORNIA, INC.CALIFORNIA DEPARTMENT OF REAL ESTATE #01878277. THE INFORMATION CONTAINED IN THIS DOCUMENT, INCLUDING, BUT NOT LIMITED TO, SQUARE FOOTAGE AND/OR ACREAGE, HAS BEEN PROVIDED BY VARIOUS SOURCES WHICH MAY INCLUDE THE SELLER, PUBLIC RECORDS, THE MULTIPLE LISTING SERVICE OR OTHER SOURCES. BROKER HAS NOT AND WILL NOT INVESTIGATE OR VERIFY THE ACCURACY OF THIS INFORMATION.</p>
						</div>
						<div class="col-md-3 text-center">
							<image class="logo2" x="0%" y="0%">
								<xsl:attribute name="src">
									<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-footer-logo.png' )" />
								</xsl:attribute>
							</image>
							<!-- <img class="logo2" src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/funnels/kaminsky-home-valuation/image/logo2.png" /> -->
						</div>
					</div>
				</div>
				<div class="top-secret">
					<image x="0%" y="0%">
						<xsl:attribute name="src">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/top-secret.png' )" />
						</xsl:attribute>
					</image>
					<!-- <img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/funnels/kaminsky-home-valuation/image/top-secret.png" /> -->
				</div>
				<xsl:call-template name="agent-details" />
				<xsl:call-template name="copyright" />
			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>												
