<?xml version="1.0"?>
<!--
	Asset Name:	Open House Listing Command
	Tags:		Listing Command
	Supports:	Collection	
	Version:	1.0
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="listing-commands.xsl" />

	<xsl:template name="template-folders">
		<xsl:value-of select="'[`Step One`, `Step Two`]'" />
	</xsl:template>

	<xsl:template name="asset-box">
		<xsl:param name="asset" />

		<div class="post">
			<h4>
				<xsl:value-of select="@name" />
			</h4>

			<xsl:choose>
				<xsl:when test="count($asset/image) &gt; 1">
					<div class="overlap">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="$asset/image[1]/@src" />
							</xsl:attribute>
						</img>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="$asset/image[2]/@src" />
							</xsl:attribute>
						</img>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="$asset/image[1]/@src" />
						</xsl:attribute>
						<xsl:attribute name="class">
							<xsl:value-of select="$asset/image[1]/@class" />
						</xsl:attribute>
					</img>
				</xsl:otherwise>
			</xsl:choose>

			<a class="download" target="_blank">
				<xsl:attribute name="href">
					<xsl:value-of select="$asset/@link" />
				</xsl:attribute>
			</a>
		</div>
	</xsl:template>

	<xsl:template name="listing-command">
		<xsl:variable name="description">
			Temp description
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="secondaryCSS" select="'open-house-lc'" />
		</xsl:call-template>

		<body>
			<link rel="preconnect" href="https://fonts.googleapis.com" />
			<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700&amp;display=swap" rel="stylesheet" />

			<main>
				<div class="banner">
					<xsl:attribute name="style">
						<xsl:value-of select="concat( 'background-image: url(', $primaryImage, ')' )" />
					</xsl:attribute>
					<span class="overlay"></span>
					<img class="logo-img">
						<xsl:attribute name="src">
							<xsl:value-of select="$companyLogo" />
						</xsl:attribute>
					</img>
					<h1>
						<span>
							<xsl:value-of select="//agent[1]/firstName" />
						</span>
						<span>
							<xsl:text>'s Open House</xsl:text>
						</span>
						<br/>
						<xsl:text>Domination Kit</xsl:text>
					</h1>
					<div class="address">
						<span>
							<xsl:value-of select="$listingAddressLine1" />
						</span>
						<span>
							<xsl:value-of select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date )" />
						</span>
						<span>
							<xsl:value-of select="concat( //openHouse/session[1]/@starts, ' - ', //openHouse/session[1]/@ends )" />
						</span>
					</div>
					<!-- logo -->
					<!-- <span class="powered-label">
						<xsl:text>Powered by: </xsl:text>
					</span> -->
					<image class="genie-logo" preserveAspectRatio="xMidYMid slice" style="position: absolute; right: 3%; width: 200px; height: 200px; top: -4%;">
						<xsl:attribute name="src">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/genie-logo-1.png' )" />
						</xsl:attribute>
					</image>
					<!-- end -->
				</div>
				<!-- <div class="profile">
					<img>
						<xsl:attribute name="src">
<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</img>
				</div> -->
				<section class="connect-community">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="img-center">
									<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid meet">
										<xsl:attribute name="src">
											<xsl:copy-of select="//agent[1]/photo" />
										</xsl:attribute>
									</image>
								</div>
							</div>
						</div>
					</div>
				</section>
				<div class="section">
					<div class="section-heading">
						<h3 class="light">Step One</h3>
						<h2>Get people in the door</h2>
						<div class="golden-border">
							<span>
								<xsl:comment/>
							</span>
							<span>
								<xsl:comment/>
							</span>
						</div>
					</div>
					<div class="section-grid">
						<xsl:for-each select="//collection/folders/folder[@name='Step One']/asset">
							<xsl:call-template name="asset-box">
								<xsl:with-param name="asset" select="." />

							</xsl:call-template>
						</xsl:for-each>

						<xsl:for-each select="//collection/additionalDocs/folder[@name='Step One']/doc">
							<xsl:call-template name="asset-box">
								<xsl:with-param name="asset" select="." />

							</xsl:call-template>
						</xsl:for-each>
					</div>
				</div>
				<div class="open-house-checklist">
					<h1>
						<span class="text-gold">But wait, there’s more!</span>
						<br/>Don’t forget your open house checklist.
					</h1>
					<div>
						<svg width="65px" height="75px" viewBox="0 0 21 21"
							xmlns="http://www.w3.org/2000/svg">
							<g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(6 4)">
								<path d="m.5 9.499 4 4.001 4-4.001"></path>
								<path d="m4.5.5v13" transform="matrix(-1 0 0 -1 9 14)"></path>
							</g>
						</svg>

						<svg width="65px" height="75px" viewBox="0 0 21 21"
							xmlns="http://www.w3.org/2000/svg">
							<g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(6 4)">
								<path d="m.5 9.499 4 4.001 4-4.001"></path>
								<path d="m4.5.5v13" transform="matrix(-1 0 0 -1 9 14)"></path>
							</g>
						</svg>

						<svg width="65px" height="75px" viewBox="0 0 21 21"
							xmlns="http://www.w3.org/2000/svg">
							<g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(6 4)">
								<path d="m.5 9.499 4 4.001 4-4.001"></path>
								<path d="m4.5.5v13" transform="matrix(-1 0 0 -1 9 14)"></path>
							</g>
						</svg>
					</div>
				</div>
				<div class="section">
					<div class="section-heading">
						<h3>Step Two</h3>
						<h2>Be prepared...and get the info</h2>
						<div class="golden-border">
							<span>
								<xsl:comment/>
							</span>
							<span>
								<xsl:comment/>
							</span>
						</div>
					</div>
					<div class="section-grid">
						<xsl:for-each select="//collection/folders/folder[@name='Step Two']/asset">
							<xsl:call-template name="asset-box">
								<xsl:with-param name="asset" select="." />
							</xsl:call-template>
						</xsl:for-each>

						<xsl:for-each select="//collection/additionalDocs/folder[@name='Step Two']/doc">
							<xsl:call-template name="asset-box">
								<xsl:with-param name="asset" select="." />
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</div>

				<div class="advert">
					<h1>Get contact info for every visitor, every time. No exceptions.</h1>
					<span class="up-arrow">↑</span>
					<div class="button">This isn't a button. Read the above again.</div>
				</div>

				<!-- footer -->
				<section class="footer-marketing-kit">
					<div class="container">
						<div class="row footer-marketing-kit-inner">
							<div class="col-md-4 col-width">
								<p>
									<b>Property:</b> 736 Center St El Segundo </p>
								<p>
									<b>Prepared For:</b> Adolfo Aguirre </p>
								<p>
									<b>Area Name:</b>
								</p>

								<p class="download-pdf-link">
									<a href="http://dev.myneighborhood.re/wp-content/uploads/instructions/About-this-collection-1673862208.pdf" target="_blank"> About this collection
										<span class="link-icon">
											<svg width="12" height="12" viewBox="0 0 12 12" fill="none"
												xmlns="http://www.w3.org/2000/svg">
												<path d="M6.66665 0L8.86198 2.19533L4.19531 6.862L5.13798 7.80467L9.80465 3.138L12 5.33333V0H6.66665Z" fill="#195386"></path>
												<path d="M10.6667 10.6667H1.33333V1.33333H6L4.66667 0H1.33333C0.598 0 0 0.598 0 1.33333V10.6667C0 11.402 0.598 12 1.33333 12H10.6667C11.402 12 12 11.402 12 10.6667V7.33333L10.6667 6V10.6667Z" fill="#195386"></path>
											</svg>
										</span>
									</a>
								</p>
							</div>
							<div class="col-md-4 col-width">
								<p>
									<b>Collection:</b> LC-Team Agent OH </p>
								<p>
									<b>Listing Agent:</b> Edward Kaminsky</p>
								<p>
									<b>MLS:</b> SB22238504 </p>

								<p class="download-pdf-link">
									<a href="http://dev.myneighborhood.re/wp-content/uploads/instructions/736 Center St -  Marketing Kit 6667 -1673862234.pdf" target="_blank"> Marketing Kit
										<span class="link-icon">
											<svg width="12" height="12" viewBox="0 0 12 12" fill="none"
												xmlns="http://www.w3.org/2000/svg">
												<path d="M6.66665 0L8.86198 2.19533L4.19531 6.862L5.13798 7.80467L9.80465 3.138L12 5.33333V0H6.66665Z" fill="#195386"></path>
												<path d="M10.6667 10.6667H1.33333V1.33333H6L4.66667 0H1.33333C0.598 0 0 0.598 0 1.33333V10.6667C0 11.402 0.598 12 1.33333 12H10.6667C11.402 12 12 11.402 12 10.6667V7.33333L10.6667 6V10.6667Z" fill="#195386"></path>
											</svg>
										</span>
									</a>
								</p>
							</div>
							<div class="col-md-4 col-width">
								<p>
									<b>Created On:</b> 01/16/2023 </p>
								<p>
									<b>Open House Date:</b> Jan 21  •  1:00-4:00</p>
								<p>
									<b>Collection ID:</b> 6667 </p>
							</div>
						</div>
					</div>
				</section>
				<!-- end -->
			</main>
		</body>

		<footer>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="$personalLogoInverse" />
				</xsl:attribute>
			</img>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="$companyLogoInverse" />
				</xsl:attribute>
			</img>
		</footer>
	</xsl:template>
</xsl:stylesheet>												
