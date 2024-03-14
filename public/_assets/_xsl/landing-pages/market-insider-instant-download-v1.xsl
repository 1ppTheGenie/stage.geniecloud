<?xml version="1.0"?>
<!--
	Asset Name:			Market Insider Instant Download v1
	Version:			1.0
	Tags:				Landing Page
	Sizes:				Landing Page
	Supports:			Area Funnel
	Permission: 		Funnels
	Default Download:	area-insider-reports/market-insider
	Render Key:			landing-page/TheGenie-Instant-Download-v1-AREASLUG
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
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/landing-pages/css/market-insider-common.css' )" />
			</xsl:attribute>
		</link>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="title" select="concat( 'Market-Insider Report: Instant Download for ', //area/name )" />
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="secondaryCSS" select="'market-insider-instant-download-v1'" />
		</xsl:call-template>

		<body>
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'funnel-market-insider-instant-download ', $cssThemeClass)" />
			</xsl:attribute>

			<div id="step1" class="steps heading-color-as-bg banner-top-section-info section">
				<form id="form_step1" class="funnel-create-lead" data-callback="template4_step1">
					<section class="step1" style="background-image: url('/_assets/_img/home-value-bg.jpg');">
						<div class="funnel-header-company-logo editable" style="background-image: url('/_assets/_img/logo.png');">
							<xsl:comment/>
						</div>

						<div class="container">
							<div class="row">
								<div class="col-lg-8 p-0 text-center">

									<div class="fl-img-holder">

										<img alt="Bar chart">
											<xsl:attribute name="src">
												<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Barton-Hills---Book-Open.png')" />
											</xsl:attribute>
										</img>
										<div class="areaname-info">
											<xsl:comment/>
										</div>
										<div class="areaname-info sold-listing">
											<xsl:comment/>
										</div>
									</div>
								</div>
								<div class="col-lg-4 pr-0">
									<xsl:call-template name="title-section" />
								</div>
							</div>
						</div>
						<div class="container-fuild p-0">
							<div class="wave-design price_rise">

								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" class="background-svg">
									<path fill-opacity="1" stroke-width="0" d="M0,224L48,208C96,192,192,160,288,144C384,128,480,128,576,144C672,160,768,192,864,208C960,224,1056,224,1152,202.7C1248,181,1344,139,1392,117.3L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z">
									</path>
								</svg>
							</div>
						</div>
					</section>
				</form>
			</div>
			<div class="background">
				<section class="home-value-request-for-report background">
					<div class="container">
						<div class="row">
							<div class="col-md-7 col-12 col-center text-center mobile-responsive call-to-action-content heading-color-as-bg">
								<h4 class="funnel-left-text-info heading-font background-as-color">
									<p>Would you also like to know your exact home value in comparison with the&#160;market?</p>
								</h4>
								<div class="request-home-value-report">
									<a href="" class="request-home-value heading-font background-as-color">
										<div class="btn-content-info editable">
                                        Click here to request your home&#160;value
										</div>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="background heading-color background-svg" viewBox="0 0 512 512">
											<path d="M313.941 216H12c-6.627 0-12 5.373-12 12v56c0 6.627 5.373 12 12 12h301.941v46.059c0 21.382 25.851 32.09 40.971 16.971l86.059-86.059c9.373-9.373 9.373-24.569 0-33.941l-86.059-86.059c-15.119-15.119-40.971-4.411-40.971 16.971V216z" style="fill: var(--theme-heading-color);"></path>
										</svg>
									</a>
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
	</xsl:template>
</xsl:stylesheet>												
