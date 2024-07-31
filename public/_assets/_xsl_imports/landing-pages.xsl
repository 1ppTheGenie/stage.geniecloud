<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="global-variables.xsl" />
	<xsl:import href="genie-functions.xsl" />
	<xsl:import href="snippet-processor.xsl" />

	<xsl:mode on-no-match="shallow-copy" />

	<xsl:output method="html" encoding="utf-8" indent="no" omit-xml-declaration="yes" doctype-system="" doctype-public="html" />

	<xsl:template match="/">
		<html lang="en">
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'genie-landing-page ', //output/@theme, ' ', //output/@themeHue, ' asset-v', //output/@assetVersion )" />
			</xsl:attribute>

			<xsl:if test="not(exists(//output/@testing))">
				<script async="async" src="https://www.googletagmanager.com/gtag/js?id=G-GCVGRFNGMD">
					<xsl:comment>						<!-- Google tag (gtag.js) --></xsl:comment>
				</script>
				<script>
					<xsl:value-of disable-output-escaping="yes" select="'window.dataLayer = window.dataLayer || [];function gtag(){dataLayer.push(arguments);}gtag(`js`, new Date()); gtag(`config`, `G-GCVGRFNGMD`);'" />
				</script>
			</xsl:if>

			<xsl:if test="//output/@testing">
				<base href="{//output/@siteUrl}" />
			</xsl:if>

			<script>
				<xsl:value-of select="concat( 'window.ghUrl = `', //output/@siteUrl, '_assets`; ' )" />
				<xsl:value-of select="concat( 'window.gHub = { alternateShade: `', //output/@alternateHue, '`, propertyCaptions: `', $propertyType, ',', $longPropertyType, ',', $singularPropertyType, '`, buildUrl: function( filename ) { return `${window.ghUrl}/${filename}`; }, agentId:`', //output/@userId, '`, areaId:', number(//area/id), ', mlsNumber:`', //single/mlsNumber, '`, mlsId:`', //single/mlsId, '`, pricePercent:`', //output/@pricePercent, '`, blurPrice:', boolean(//output/@blurPrice='1' or //output/@blurPrice='true'), ', requireSignin:', boolean(//output/@requireSignin='1' or //output/@requireSignin='true'), ', propertyType:', number(//area/statistics/@propertyType), ',noCopyright:', boolean(//output/@noCopyright='1' or //output/@noCopyright='true'), ',openHouseTimes:`', //output/@openHouseTimes, '`,hideAVM:', boolean(string(//output/@hideAVM)='1' or //output/@hideAVM='true'), ',downloadUrl:`', //output/@downloadUrl, '`,isLeadCapture:', boolean(//output/@isLeadCapture='1' or //output/@isLeadCapture='true'), ', SINGLE:  0, CONDO: 1, siteUrl: `', //output/@siteUrl, '`, apiUrl: `', //output/@apiUrl, '`, mapStyle: `satellite-v9`, googleKey: `', //output/@googleKey, '`, mapboxKey: `', //output/@mapboxKey, '` };')" />
			</script>

			<script async="async" src="{concat( //output/@siteUrl, '_assets/landing-pages/_global.js' )}">
				<xsl:comment>					<!-- Genie Global JS --></xsl:comment>
			</script>

			<xsl:call-template name="landing-page" />
		</html>
	</xsl:template>

	<xsl:template name="virtual-tour-embed">
		<xsl:choose>
			<xsl:when test="contains(//single/virtualTourUrl, 'player.vimeo.com') or contains(//single/virtualTourUrl, 'youtube.com/embed')">
				<iframe height="315px" frameborder="0" allow="fullscreen;accelerometer;autoplay;clipboard-write;encrypted-media;gyroscope;picture-in-picture;" allowfullscreen="">
					<xsl:attribute name="src">
						<xsl:value-of select="//single/virtualTourUrl" />
					</xsl:attribute>
					<xsl:comment/>
				</iframe>
			</xsl:when>

			<xsl:otherwise>
				<div class="virtual-tour body-font">
					<a class="btn btn-small btn-info" target="_blank">
						<xsl:attribute name="href">
							<xsl:value-of select="//single/virtualTourUrl"/>
						</xsl:attribute>
						<svg width="22" fill="#ffffff" viewBox="0 0 512 512"
							xmlns="http://www.w3.org/2000/svg">
							<path d="M448,256c0-106-86-192-192-192S64,150,64,256s86,192,192,192S448,362,448,256Z" style="fill:none;stroke:#ffffff;stroke-miterlimit:10;stroke-width:60px"/>
							<path d="M216.32,334.44,330.77,265.3a10.89,10.89,0,0,0,0-18.6L216.32,177.56A10.78,10.78,0,0,0,200,186.87V325.13A10.78,10.78,0,0,0,216.32,334.44Z"/>
						</svg>
						<xsl:text>&#160;Click here to view Virtual Tour</xsl:text>
					</a>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="editable">
		<xsl:param name="id" />
		<xsl:param name="default" />
		<xsl:param name="data-msg" select="'false'" />
		<xsl:param name="data-element" select="'p'" />

		<xsl:if test="//output/@isEditing">
			<xsl:attribute name="data-element">
				<xsl:value-of select="$data-element" />
			</xsl:attribute>
			<xsl:attribute name="data-editable">
				<xsl:value-of select="'true'" />
			</xsl:attribute>
			<xsl:attribute name="data-default">
				<xsl:value-of select="$default" />
			</xsl:attribute>
			<xsl:attribute name="data-name">
				<xsl:value-of select="$id" />
			</xsl:attribute>
			<xsl:if test="$data-msg='true'">
				<xsl:attribute name="data-msg">
					<xsl:value-of select="'social-post'" />
				</xsl:attribute>
			</xsl:if>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="//overrides/*[name()=$id][1]">
				<xsl:value-of select="//overrides/*[name()=$id][1]" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$default" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="head-meta">
		<root>
			<title>Welcome to your GenieHub Landing page</title>
			<description>You're visting a GenieHub Landing page</description>
		</root>
	</xsl:template>

	<xsl:template name="copyright">
		<xsl:param name="url" select="'http://thegenie.ai'" />
		<div class="bottom-bar-copyright">
			<div id="copyright">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-sm-4 ">
							<img alt="1parkplace" src="/_assets/_img/1pp-logo.png" />
							<p class="heading-font ">
								<strong>
									<xsl:text>Copyright &#169; </xsl:text>
									<span id="copyright-year">
										<xsl:value-of select="//output/@year" />
									</span>
									<a target="_blank" href="#">1parkplace, Inc.</a>.
								</strong>
								<xsl:text>All rights reserved.</xsl:text>
							</p>
						</div>
						<div class="col-md-4 col-sm-4 text-center">
							<p class="heading-font">
								<strong>
									<a href="#" target="_blank">TheGenie.ai.</a>
								</strong>
								<br/>
								<img class="footer-middle-img" src="/_assets/_img/made-with-love.png">
									<xsl:attribute name="alt" select="concat( 'Made with Love in San Diego - pV', //output/@pluginVersion,', aV', //output/@assetVersion )" />
								</img>
								<br/>
								<strong>US Patent #:</strong> 10,713,325</p>
						</div>
						<div class="col-md-4 col-sm-4 img-min-height">
							<p class="heading-font">
								<strong>Power Tools</strong>
								<xsl:text> for your Real Estate Business!</xsl:text>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="agent-about">
		<a name="about" />
		<section id="about-section" class="background abt-sec">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="agent-details">
							<div class="photo">
								<span class=" f-name">
									<xsl:value-of select="concat('Call/Text ', //agent[1]/firstName,' for your private showing:' )" />
								</span>
								<img>
									<xsl:attribute name="alt">
										<xsl:value-of select="//agent[1]/marketingName" />
									</xsl:attribute>
									<xsl:attribute name="src">
										<xsl:value-of select="//agent[1]/photo" />
									</xsl:attribute>
								</img>
							</div>
							<div class="details">
								<h3 class="agent-name heading-font body-color">
									<xsl:value-of select="//agent[1]/marketingName" />
								</h3>
								<h2 class=" body-font">
									<xsl:value-of select="//agent[1]/marketingTitle" />
								</h2>
								<h3 class="agent-phone">
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="concat( 'tel:',//agent[1]/mobile )" />
										</xsl:attribute>
										<xsl:value-of select="//agent[1]/mobile" />
									</a>
								</h3>
								<button class="btn subtitle-font background-as-color contact-me-btn">
									<span class="contact-svg">
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" version="3.0" id="Capa_1" x="0px" y="0px" viewBox="0 0 469.2 469.2" style="enable-background:new 0 0 469.2 469.2;" xml:space="preserve" fill="var(--theme-body-background)">
											<g>
												<path d="M22.202,77.023C25.888,75.657,29.832,74.8,34,74.8h401.2c4.168,0,8.112,0.857,11.798,2.224L267.24,246.364c-18.299,17.251-46.975,17.251-65.28,0L22.202,77.023z M464.188,377.944c3.114-5.135,5.012-11.098,5.012-17.544V108.8c0-4.569-0.932-8.915-2.57-12.899L298.411,254.367L464.188,377.944z M283.2,268.464c-13.961,11.961-31.253,18.027-48.6,18.027c-17.347,0-34.64-6.06-48.6-18.027L20.692,391.687c4.094,1.741,8.582,2.714,13.308,2.714h401.2c4.726,0,9.214-0.973,13.308-2.714L283.2,268.464z M2.571,95.9C0.932,99.885,0,104.23,0,108.8V360.4c0,6.446,1.897,12.409,5.012,17.544l165.777-123.577L2.571,95.9z"></path>
											</g>
										</svg>
									</span>
                                        Contact Me
								</button>
								<h2 class="agent-website body-color body-font">
									<a target="_blank">
										<xsl:attribute name="href">
											<xsl:choose>
												<xsl:when test="substring( //agent[1]/website, 1, 4 ) = 'http'">
													<xsl:value-of select="//agent[1]/website" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat( 'https://', //agent[1]/website )" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<xsl:value-of select="//agent[1]/website" />
									</a>
								</h2>
								<h4 class="agent-code body-color body-font">
									<xsl:value-of select="//agent[1]/marketingLicense" />
								</h4>
							</div>
							<div class="agent-logo">
								<div class="funnel-about-company-logo">
									<div class="funnel-personal-logo genie-logo-light">
										<xsl:attribute name="style">
											<xsl:value-of select="concat( 'background: url(', //agent[1]/companyLogoLight, ')' )" />
										</xsl:attribute>
									</div>
									<div class="funnel-personal-logo genie-logo-dark">
										<xsl:attribute name="style">
											<xsl:value-of select="concat( 'background: url(', //agent[1]/companyLogoDark, ')' )" />
										</xsl:attribute>
									</div>
								</div>
								<div class="funnel-about-personal-logo">
									<div class="funnel-personal-logo genie-logo-light">
										<xsl:attribute name="style">
											<xsl:value-of select="concat( 'background: url(', //agent[1]/personalLogoLight, ')' )" />
										</xsl:attribute>
									</div>
									<div class="funnel-personal-logo genie-logo-dark">
										<xsl:attribute name="style">
											<xsl:value-of select="concat( 'background: url(', //agent[1]/personalLogoDark, ')' )" />
										</xsl:attribute>
									</div>
								</div>
							</div>
						</div>
						<div class="team-about-wrapper">
							<xsl:if test="//agent[1]/marketingAbout != ''">
								<h4 class="body-font body-color">About</h4>
								<div class="personal-mission team-about">
									<div class="summary">
										<p class="body-font body-color">
											<xsl:copy-of select="$marketingAboutWithBreaks" />
										</p>
									</div>
								</div>
							</xsl:if>
						</div>
					</div>
				</div>
			</div>
		</section>

		<div class="modal fade contact-modal" id="contact-me" tabindex="-1" role="dialog" aria-labelledby="fl-thankyou-message" aria-hidden="false">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 490 490" data-dismiss="modal">
					<polygon fill="var(--theme-emphasis-color)" stroke-width="30px" stroke="var(--theme-emphasis-color)" points="11.387,490 245,255.832 478.613,490 489.439,479.174 255.809,244.996 489.439,10.811 478.613,0 245,234.161 11.387,0 0.561,10.811 234.191,244.996 0.561,479.174 " />
				</svg>
				<div class="modal-content">
					<div class="modal-body">
						<div class="modal-background-img background">
							<h1 class="modal_title heading-color heading-font">Fill in your details below </h1>
							<p class="modal_subtitle body-font body-color">Our team will get in touch with you within 24 hours.</p>
							<form class="funnel-create-lead" style="margin:0">
								<input type="hidden" name="genieTags" value="ClickCta,RequestMoreInfo" />

								<div class="form-group">
									<input type="text" placeholder="Enter Name*" name="fullName" class="form-control heading-font heading-color phone" id="name" required="" />
								</div>
								<div class="form-group">
									<input type="email" placeholder="Enter Email*" name="emailAddress" class="form-control heading-font heading-color step1-input" id="email" />
								</div>
								<div class="form-group">
									<input type="text" placeholder="Enter Phone No.*" name="phoneNumber" class="form-control heading-font heading-color step1-input" id="phonenumber" required="" />
								</div>
								<div class="form-group">
									<textarea placeholder="Enter Message" name="note" class="form-control heading-font heading-color step1-input" id="message" rows="6"></textarea>
								</div>
								<div class="fl-btn-value text-center">
									<button class="btn btn-value-info widget heading-font heading-color-as-bg background-as-color">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="replaceBR">
		<xsl:param name="str" />

		<xsl:analyze-string select="$str" regex="\n">
			<xsl:matching-substring>
				<br/>
			</xsl:matching-substring>
			<xsl:non-matching-substring>
				<xsl:value-of select="."/>
			</xsl:non-matching-substring>
		</xsl:analyze-string>
	</xsl:template>

	<xsl:template name="agent-details">
		<div id="agent-contact" class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="footer-style footer-area">
						<div class="funnel-footer-company-logo">
							<div class="funnel-company-logo your_logo_class editable">
								<xsl:attribute name="style">
									<xsl:value-of select="concat( 'background: url(', $companyLogoInverse, ')' )" />
								</xsl:attribute>
							</div>
						</div>
						<ul class="heading-font outline" style="padding: 0;">
							<xsl:if test="string(//agent[1]/marketingName)!=''">
								<li>
									<xsl:value-of select="//agent[1]/marketingName" />
								</li>
							</xsl:if>
							<xsl:if test="string(//agent[1]/mobile)!=''">
								<li>
									<xsl:attribute name="href">
										<xsl:value-of select="concat( 'tel:',//agent[1]/mobile )" />
									</xsl:attribute>
									<xsl:value-of select="//agent[1]/mobile" />
								</li>
							</xsl:if>
							<xsl:if test="string(//agent[1]/address/company)!=''">
								<li>
									<xsl:value-of select="//agent[1]/address/company" />
								</li>
							</xsl:if>
							<xsl:if test="string(//agent[1]/marketingLicense)!=''">
								<li>
									<xsl:value-of select="//agent[1]/marketingLicense" />
								</li>
							</xsl:if>
						</ul>

						<xsl:if test="string(//agent[1]/website)!=''">
							<p class="heading-font">
								<a target="_blank">
									<xsl:attribute name="href">
										<xsl:value-of select="concat( 'https://', //agent[1]/website )" />
									</xsl:attribute>
									<xsl:value-of select="//agent[1]/website" />
								</a>
							</p>
						</xsl:if>

						<p class="heading-font">
							<xsl:call-template name="agent-address-line-one" />
							<br/>
							<xsl:call-template name="agent-address-line-two" />
						</p>
					</div>
				</div>
				<div class="col-md-12">
					<xsl:if test="string(//agent[1]/disclaimerExtra/text())!=''">
						<p>
							<xsl:call-template name="replaceBR">
								<xsl:with-param name="str" select="//agent[1]/disclaimerExtra/text()"/>
							</xsl:call-template>
						</p>
					</xsl:if>

					<xsl:variable name="isExternalPrivacy">
						<xsl:value-of select="//agent[1]/privacyPolicy='external' or //agent[1]/privacyPolicy='External Link'" />
					</xsl:variable>

					<div class="term-condition text-center heading-font">
						<xsl:if test="string(//mlsDisplay/text())!=''">
							<a href="#" class="heading-font toggle" data-container="#mls-disclaimer">MLS/IDX Disclaimer</a>
							<xsl:text>&#160;&#124;&#160;</xsl:text>
						</xsl:if>
						<a class="privacy-policy heading-font" target="_blank">
							<xsl:if test="$isExternalPrivacy">
								<xsl:attribute name="href">
									<xsl:value-of select="//agent[1]/privacySource" />
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="not($isExternalPrivacy)">
								<xsl:attribute name="href">
									<xsl:value-of select="'#'" />
								</xsl:attribute>
								<xsl:attribute name="class">
									<xsl:value-of select="'privacy-policy heading-font toggle'" />
								</xsl:attribute>
								<xsl:attribute name="data-container">
									<xsl:value-of select="'#privacy-policy'" />
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Privacy Policy</xsl:text>
						</a>
					</div>
					<xsl:if test="string(//mlsDisplay/text())!='external'">
						<div id="mls-disclaimer">
							<xsl:copy-of select="//mlsDisplay/text()" />
							<xsl:comment/>
						</div>
					</xsl:if>
					<xsl:if test="not($isExternalPrivacy)">
						<div id="privacy-policy">
							<xsl:copy-of select="replace(//agent[1]/privacyPolicy/text(), '\\n', '&lt;br/&gt;')" />
							<xsl:comment/>
						</div>
					</xsl:if>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="css-links">
		<xsl:param name="primaryCSS" select="'common'" />
		<xsl:param name="secondaryCSS" select="''" />
		<xsl:param name="includeFooterCSS" select="'true'" />
		<link rel="stylesheet" type="text/css" href="/_assets/_css/genie-colors.css" />
		<xsl:if test="$primaryCSS!=''">
			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( '/_assets/landing-pages/css/', $primaryCSS, '.css')" />
				</xsl:attribute>
			</link>
		</xsl:if>
		<xsl:if test="$secondaryCSS!=''">
			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( '/_assets/landing-pages/css/', $secondaryCSS, '.css')" />
				</xsl:attribute>
			</link>
		</xsl:if>
		<xsl:if test="$includeFooterCSS='true'">
			<link rel="stylesheet" type="text/css" href="/_assets/landing-pages/css/footer-common.css" />
		</xsl:if>
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( '/_assets/themes/', //output/@theme, '.css')" />
			</xsl:attribute>
		</link>
	</xsl:template>
	<xsl:template name="standard-header">
		<xsl:param name="title" select="concat(  $listingAddressLine1, ', ' , $listingAddressLine2, ' &#124; ' ,//agent[1]/marketingName, ' ' , //agent[1]/address/company )" />
		<xsl:param name="description" select="substring(concat( 'View details, pricing, photos, floorplan, for ', $listingAddressLine1, '. ' , //single/description, '...') ,0, 373 )" />
		<xsl:param name="site_name" select="concat( 'Presented by ', //agent[1]/marketingName, ' ' , //agent[1]/address/company  )" />
		<xsl:param name="seoImage" select="$primaryImage" />
		<xsl:param name="primaryCSS" select="'common'" />
		<xsl:param name="secondaryCSS" select="''" />
		<xsl:param name="includeFooterCSS" select="'true'" />
		<xsl:param name="defaultUtmSource" select="''" />
		<xsl:param name="defaultUtmCampaign" select="''" />
		<xsl:param name="leadNotePrompt" select="''" />
		<xsl:variable name="seoTitle">
			<xsl:choose>
				<xsl:when test="//overrides/seo-title">
					<xsl:value-of select="//overrides/seo-title" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$title" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="seoDescription">
			<xsl:choose>
				<xsl:when test="//overrides/seo-description">
					<xsl:value-of select="//overrides/seo-description" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$description" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<head>
			<meta name="description">
				<xsl:attribute name="content">
					<xsl:value-of select="$seoDescription" />
				</xsl:attribute>
			</meta>
			<meta property="og:site_name">
				<xsl:attribute name="content">
					<xsl:value-of select="$site_name" />
				</xsl:attribute>
			</meta>
			<meta property="og:title">
				<xsl:attribute name="content">
					<xsl:value-of select="$seoTitle" />
				</xsl:attribute>
			</meta>
			<meta property="og:image">
				<xsl:attribute name="content">
					<xsl:value-of select="$primaryImage" />
				</xsl:attribute>
			</meta>
			<meta name="twitter:image">
				<xsl:attribute name="content">
					<xsl:value-of select="$primaryImage" />
				</xsl:attribute>
			</meta>
			<meta itemprop="author">
				<xsl:attribute name="content">
					<xsl:value-of select="//agent[1]/marketingName" />
				</xsl:attribute>
			</meta>
			<meta property="og:description">
				<xsl:attribute name="content">
					<xsl:value-of select="$seoDescription" />
				</xsl:attribute>
			</meta>
			<meta itemprop="description">
				<xsl:attribute name="content">
					<xsl:value-of select="$seoDescription" />
				</xsl:attribute>
			</meta>
			<meta name="twitter:title">
				<xsl:attribute name="content">
					<xsl:value-of select="$seoTitle" />
				</xsl:attribute>
			</meta>
			<meta name="twitter:domain">
				<xsl:attribute name="content">
					<xsl:value-of select="//output/@siteUrl" />
				</xsl:attribute>
			</meta>
			<meta name="twitter:description">
				<xsl:attribute name="content">
					<xsl:value-of select="$seoDescription" />
				</xsl:attribute>
			</meta>
			<meta property="og:type" content="'website'" />
			<meta name="twitter:card" content="summary_large_image" />
			<meta charset="utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />
			<title>
				<xsl:value-of select="$seoTitle" />
			</title>
			<xsl:call-template name="css-links">
				<xsl:with-param name="primaryCSS" select="$primaryCSS" />
				<xsl:with-param name="secondaryCSS" select="$secondaryCSS" />
				<xsl:with-param name="includeFooterCSS" select="$includeFooterCSS" />
			</xsl:call-template>

			<xsl:if test="not(exists(//output/@testing))">
				<script>
					<xsl:value-of select="'(function(h,o,t,j,a,r){ h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)}; h._hjSettings={hjid:1194877,hjsv:6}; a=o.getElementsByTagName(`head`)[0]; r=o.createElement(`script`);r.async=1; r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;a.appendChild(r); })(window,document,`https://static.hotjar.com/c/hotjar-`,`.js?sv=`);'" />
				</script>
				<script>
					<xsl:value-of select="concat( 'window.hj( `identify`, `', //agent[1]/aspNetUserId, '`, { leadID: `', //lead/genieLeadId, '`, url: window.location.href, asset: `', //output/@stylesheet, '`});')" />
				</script>
			</xsl:if>
			<xsl:call-template name="landing-header-additions" />
			<xsl:call-template name="process-snippet">
				<xsl:with-param name="snippet" select="//agent[1]/snippetHeadTag" />
			</xsl:call-template>
			<xsl:if test="//agent[1]/googleAnalyticsId">
				<script async="async">
					<xsl:attribute name="src">
						<xsl:value-of select="concat('https://www.googletagmanager.com/gtag/js?id=', //agent[1]/googleAnalyticsId)"/>
					</xsl:attribute>
				</script>
				<script>
					<xsl:value-of select="concat('
						window.dataLayer = window.dataLayer || [];
						function gtag(){dataLayer.push(arguments);}
						gtag(`js`, new Date());
						gtag(`config`, `', //agent[1]/googleAnalyticsId, '`);
					')" />
				</script>
			</xsl:if>
			<xsl:if test="//agent[1]/facebookPixelId">
				<script>
					<xsl:value-of select="concat('
						!function(f,b,e,v,n,t,s)
						{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
						n.callMethod.apply(n,arguments):n.queue.push(arguments)};
						if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=`2.0`;
						n.queue=[];t=b.createElement(e);t.async=!0;
						t.src=v;s=b.getElementsByTagName(e)[0];
						s.parentNode.insertBefore(t,s)}(window,document,`script`,
						`https://connect.facebook.net/en_US/fbevents.js`);
						fbq(`init`, `', //agent[1]/facebookPixelId, '`);
						fbq(`track`, `PageView`);
					')" />
				</script>
				<noscript>
					<xsl:element name="img">
						<xsl:attribute name="height">1</xsl:attribute>
						<xsl:attribute name="width">1</xsl:attribute>
						<xsl:attribute name="src">
							<xsl:value-of select="concat('https://www.facebook.com/tr?id=', //agent[1]/facebookPixelId, '&amp;ev=PageView&amp;noscript=1')"/>
						</xsl:attribute>
					</xsl:element>
				</noscript>
			</xsl:if>
		</head>
	</xsl:template>

	<xsl:template name="landing-header-additions">
		<xsl:comment>			<!-- For overrides --></xsl:comment>
	</xsl:template>

	<xsl:template name="render-key">
		<xsl:value-of select="concat (//output/@folder, '/', //output/@stylesheet )" />
	</xsl:template>


	<xsl:template name="market-comment">
		<xsl:variable name="totalSold" select="//areas/area[1]/statistics/@soldPropertyTypeCount" />
		<xsl:variable name="totalSoldLastPeriod" select="//areas/area[1]/statistics/previous/@totalSold" />
		<xsl:variable name="soldDelta">
			<xsl:choose>
				<xsl:when test="number($totalSold) > 0 and number($totalSoldLastPeriod) > 0">
					<xsl:value-of select="$totalSold div $totalSoldLastPeriod - 1" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="number(0)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="deltaCaption">
			<xsl:choose>
				<xsl:when test="$soldDelta &lt; 0">
					<xsl:text>shrunk</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>increased</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<p>
			<xsl:value-of select="concat( 'The number of closed ', //area/name, ' ', $singularPropertyType, ' sales have ', $deltaCaption, ' by ', format-number( $soldDelta, '#.#%' ), ' in the ', $lookbackPeriodName, ' from ', $totalSoldLastPeriod, ' to ', $totalSold, '. ' )" />
			<xsl:choose>
				<xsl:when test="number($soldDelta) < -0.05">
					<xsl:value-of select="concat('This unusual reduction in listing inventory to the ', //area/name, ' ', $propertyType, ' market creates a huge demand from buyers. If you&#180;re looking to sell your home for the highest possible price there has not been a better time.')" />
				</xsl:when>
				<xsl:when test="number($soldDelta) >= 0.05">
					<xsl:value-of select="concat('This increase in listing inventory to the ', //area/name, ' ', $propertyType, ' market means more possible competition and if you&#180;re looking to sell make sure you choose the best REALTOR who knows how to maximize your home value.')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat('This shows the listing inventory to the ', //area/name, ' ', $propertyType, ' market is steady and healthy. If you&#180;re looking to sell make sure you choose the best REALTOR who knows how to maximize your home value.')" />
				</xsl:otherwise>
			</xsl:choose>
		</p>
	</xsl:template>

	<xsl:template name="listing-agent-bullets">
		<xsl:for-each select="//listingAgent">
			<xsl:sort select="@count" order="ascending" data-type="number" />

			<p class="listing-agent-bullets">
				<xsl:if test="@name!=''">
					<xsl:variable name="agentName">
						<xsl:choose>
							<xsl:when test="@email!=''">
								<a>
									<xsl:attribute name="href" select="concat( 'mailto:', @email )"/>
									<xsl:value-of select="@name" />
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@name" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>

					<span>
						<xsl:choose>
							<xsl:when test="number(@count)=1">
								<xsl:text>Listed by: </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>Co-Listed by: </xsl:text>
							</xsl:otherwise>
						</xsl:choose>

						<xsl:copy-of select="$agentName" />
					</span>
				</xsl:if>
				<xsl:if test="@license!=''">
					<span>
						<xsl:value-of select="@license" />
					</span>
				</xsl:if>
				<xsl:if test="@broker!=''">
					<span>
						<xsl:value-of select="@broker" />
					</span>
				</xsl:if>
				<xsl:if test="@phone!=''">
					<span>
						<xsl:value-of select="concat( 'Contact: ', @phone )" />
					</span>
				</xsl:if>
			</p>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="data-access">
		<div class="popup-dialog">
			<div id="data-access" class="lead-capture-form">
				<h1>Access Private Data Now</h1>
				<p>
					Some state laws require verification of your email address in order to access
					past sales. Not to worry though, you're only a minute away from seeing the sales
					data you are looking for and your email will be kept private, secure &amp; will
					never be sold or spammed!
				</p>
				<input type="text" name="name" placeholder="Your Name" />
				<input type="email" name="email" placeholder="Your Email" />
				<input type="text" name="phone" placeholder="Your Phone No." />
				<button>Sign In</button>
				<a style="color: var(--theme-body-color)">Privacy Policy</a>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="default-thank-you-popup">
		<xsl:param name="message" select="'Thank you, your request has been successfully submitted!'" />
		<div id="form-thank-you" class="popup-dialog thank-modal">
			<div id="fl-thankyou-modal" class="modal-dialog modal-dialog-centered" role="document">
				<div class="fl-close-modal close-popup" data-dismiss="modal">
					<img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/images/close-modal-cross.png" alt="" />
				</div>
				<div class="modal-content">
					<div class="modal-body">
						<div class="modal-background-img background">
							<div class="fl-thumb-icon text-center subtitle-color-as-bg">
								<div class="circle-icon background close-popup">
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="var(--theme-sub-heading-color)">
										<path d="M128 447.1V223.1c0-17.67-14.33-31.1-32-31.1H32c-17.67 0-32 14.33-32 31.1v223.1c0 17.67 14.33 31.1 32 31.1h64C113.7 479.1 128 465.6 128 447.1zM512 224.1c0-26.5-21.48-47.98-48-47.98h-146.5c22.77-37.91 34.52-80.88 34.52-96.02C352 56.52 333.5 32 302.5 32c-63.13 0-26.36 76.15-108.2 141.6L178 186.6C166.2 196.1 160.2 210 160.1 224c-.0234 .0234 0 0 0 0L160 384c0 15.1 7.113 29.33 19.2 38.39l34.14 25.59C241 468.8 274.7 480 309.3 480H368c26.52 0 48-21.47 48-47.98c0-3.635-.4805-7.143-1.246-10.55C434 415.2 448 397.4 448 376c0-9.148-2.697-17.61-7.139-24.88C463.1 347 480 327.5 480 304.1c0-12.5-4.893-23.78-12.72-32.32C492.2 270.1 512 249.5 512 224.1z" fill="var(--theme-sub-heading-color)" />
									</svg>
								</div>
							</div>
							<h2 class="widget text-center heading-font subtitle-color">
								<xsl:value-of select="$message" />
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="flyer-download-popup">
		<div id="flyer-popup" class="popup-dialog flyer-popup">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="fl-close-modal close-popup" data-dismiss="modal">
					<img src="https://myneighborhood.re/wp-content/themes/stuff-rentals/content-modules/images/close-modal-cross.png" alt="" />
				</div>
				<div class="modal-content">
					<div class="modal-body">
						<div class="modal-background-img background">
							<h1 class="widget text-center heading-font heading-color">                            
                                WELCOME!                            
							</h1>
							<image preserveAspectRatio="xMidYMid meet" style="margin:10px auto; display:block; position:relative; max-width:100%;" src="/_assets/_img/welcome-modal.jpg" />
							<p class="body-font heading-color text-center" style="font-size: 20px;">Please download our Home Flyer</p>
							<div class="text-center mb-3 download-assets">
								<a href="" target="_blank" class="btn heading-font subtitle-color-as-bg background-as-color btn-submit download-flyer"> Download Flyer&#160;
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="16" height="16" fill="var(--theme-body-background)">
										<path d="M480 352h-133.5l-45.25 45.25C289.2 409.3 273.1 416 256 416s-33.16-6.656-45.25-18.75L165.5 352H32c-17.67 0-32 14.33-32 32v96c0 17.67 14.33 32 32 32h448c17.67 0 32-14.33 32-32v-96C512 366.3 497.7 352 480 352zM432 456c-13.2 0-24-10.8-24-24c0-13.2 10.8-24 24-24s24 10.8 24 24C456 445.2 445.2 456 432 456zM233.4 374.6C239.6 380.9 247.8 384 256 384s16.38-3.125 22.62-9.375l128-128c12.49-12.5 12.49-32.75 0-45.25c-12.5-12.5-32.76-12.5-45.25 0L288 274.8V32c0-17.67-14.33-32-32-32C238.3 0 224 14.33 224 32v242.8L150.6 201.4c-12.49-12.5-32.75-12.5-45.25 0c-12.49 12.5-12.49 32.75 0 45.25L233.4 374.6z" />
									</svg>
								</a>
								<span class="body-font subtitle-color">or</span>
								<a href="" target="_blank" class="btn heading-font subtitle-color-as-bg background-as-color btn-submit ">View Listing Details 
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" width="16" height="16" fill="var(--theme-body-background)">
										<path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z" />
									</svg>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="add-genie-embed">
		<xsl:param name="embed" />
		<div class="genie-embed">
			<xsl:attribute name="data-genie-layout">
				<xsl:value-of select="$embed" />
			</xsl:attribute>
			<xsl:attribute name="data-genie-agentid">
				<xsl:value-of select="//output/@userId" />
			</xsl:attribute>
			<xsl:attribute name="data-genie-theme">
				<xsl:value-of select="//output/@theme" />
			</xsl:attribute>
			<xsl:attribute name="data-genie-areaid">
				<xsl:value-of select="//areas/area[1]/id" />
			</xsl:attribute>
			<xsl:if test="//output/@areaPeriod!=''">
				<xsl:attribute name="data-genie-areaperiod">
					<xsl:value-of select="//output/@areaPeriod" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="//single/@mlsNumber!=''">
				<xsl:attribute name="data-genie-mlsnumber">
					<xsl:value-of select="//single/@mlsNumber" />
				</xsl:attribute>
				<xsl:attribute name="data-genie-mlsid">
					<xsl:value-of select="//single/@mlsId" />
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="//output/@mapStyle!=''">
				<xsl:attribute name="data-genie-mapstyle">
					<xsl:value-of select="//output/@mapStyle" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="//output/@mapIcon!=''">
				<xsl:attribute name="data-genie-mapicon">
					<xsl:value-of select="//output/@mapIcon" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="//output/@mapKey!=''">
				<xsl:attribute name="data-genie-mapkey">
					<xsl:value-of select="//output/@mapKey" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="//output/@pricePercent!=''">
				<xsl:attribute name="data-genie-pricepercent">
					<xsl:value-of select="//output/@pricePercent" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="//output/@blurPrice!=''">
				<xsl:attribute name="data-genie-blurprice">
					<xsl:value-of select="//output/@blurPrice" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="//output/@requireSignin!=''">
				<xsl:attribute name="data-genie-signin">
					<xsl:value-of select="//output/@requireSignin" />
				</xsl:attribute>
			</xsl:if>
			<xsl:text>&#160;</xsl:text>
		</div>
	</xsl:template>
	<xsl:template name="gallery">
		<xsl:if test="count(//single/images/image)&gt;1">
			<div id="property-gallery-container">
				<div id="property-gallery" class="property-gallery lightgallery">
					<xsl:comment />
				</div>
			</div>
			<div class="property-image-show-btn text-center">
				<button class="btn btn-value-info subtitle-font background-as-color toggle" data-container="#property-gallery">
					<xsl:text>Show More</xsl:text>
				</button>
			</div>
			<script>
				<xsl:value-of select="'window.gHub.galleryImages=['" />

				<xsl:for-each select="//single/images/image">
					<xsl:value-of select="concat( &quot;'&quot;, @src, &quot;', &quot; )" />
				</xsl:for-each>
				<xsl:value-of select="']; 
				
				document.addEventListener(`genie-landing-loaded`, function () {
					window.gHub.galleryButton( 
						document.querySelector(`.property-image-show-btn button`), 
						document.getElementById(`property-gallery`) 
					); 
				});'" />
			</script>
		</xsl:if>
	</xsl:template>


	<xsl:template name="green-red-arrow">
		<xsl:param name="up" select="boolean(1)" />

		<svg viewBox="0 0 491 491">
			<xsl:if test="not($up)">
				<xsl:attribute name="style">
					<xsl:value-of select="'transform:rotate(180deg)'" />
				</xsl:attribute>
			</xsl:if>

			<use>
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons.svg#circle-up-arrow' )"/>
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:choose>
						<xsl:when test="not($up)">
							<xsl:value-of select="'var(--sold-red)'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'var(--active-green)'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</use>
		</svg>
	</xsl:template>
</xsl:stylesheet>