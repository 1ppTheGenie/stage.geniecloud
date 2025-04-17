<?xml version="1.0"?>
<!--
Asset Name:	Multi-Step Area/Listing Command
Size:		Landing Page
Tags:		Listing Command, Area Command
Supports:	Collection	
Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0">
	<xsl:import href="listing-commands.xsl" />

	<xsl:template name="template-folders">
		<xsl:value-of select="'[`Step One`, `Step Two`]'" />
	</xsl:template>

	<xsl:template name="asset-box">
		<xsl:param name="asset" />

		<div class="post">
			<xsl:attribute name="data-title">
				<xsl:value-of select="$asset/@name" />
			</xsl:attribute>

			<xsl:attribute name="data-renderkey">
				<xsl:value-of select="$asset/@renderKey" />
			</xsl:attribute>

			<xsl:if test="$asset/@pageCount!=''">
				<xsl:attribute name="data-pagecount">
					<xsl:value-of select="$asset/@pageCount" />
				</xsl:attribute>
			</xsl:if>

			<h4>
				<span class="rendering-spinner">
					<xsl:comment/>
				</span>
			</h4>
		</div>
	</xsl:template>


	<xsl:template name="listing-command">
		<xsl:variable name="description">
			<xsl:call-template name="overridable">
				<xsl:with-param name="id" select="'seo-description'" />
				<xsl:with-param name="default" select="''" />
			</xsl:call-template>
		</xsl:variable>

		<xsl:call-template name="standard-header">
			<xsl:with-param name="description" select="$description" />
			<xsl:with-param name="title">
				<xsl:choose>
					<xsl:when test="not(//single)">
						<xsl:value-of select="concat( //areas/area[1]/name, ' &#124; ' ,//agent[1]/marketingName, ' ' , //agent[1]/address/company )" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( $listingAddressLine1, ', ' , $listingAddressLine2, ' &#124; ' , //agent[1]/marketingName, ' ' , //agent[1]/address/company )" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
		</xsl:call-template>

		<body>
			<link href="https://fonts.googleapis.com" rel="preconnect" />
			<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700&amp;display=swap" rel="stylesheet" />
			<link rel="stylesheet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/listing-commands/css/marketing-steps-lc1.css' )" />
				</xsl:attribute>
			</link>

			<script type="module" crossorigin="crossorigin" src="/_assets/listing-commands/js/common.js">
				<xsl:value-of select="';'" />
			</script>

			<main>
				<div class="banner">
					<xsl:attribute name="style">
						<xsl:if test="$primaryImageNoDefault != ''">
							<xsl:value-of select="concat( 'background-image: url(', $primaryImageNoDefault, ')' )" />
						</xsl:if>
					</xsl:attribute>

					<xsl:if test="not(//single)">
						<!-- Is Area Command -->
						<xsl:variable name="arrow" select="'=>'" />
						<script>
							<xsl:value-of select="concat('const polygon =', //area[1]/geojson,';' )" />
							<xsl:value-of select="concat('const options = { mapStyle: `', //output/@mapStyle,'`, zoom: 17 };' )" />
							<xsl:value-of select="concat( 'window.ghUrl = `', //output/@siteUrl, '_assets`; ' )" />
							<xsl:value-of disable-output-escaping="yes" select="'document.addEventListener( `genie-landing-loaded`, function() { return window.gHub.makeMap( `genie-map`, options, { geoJson: polygon } ); })'" />
						</script>
						<div id="genie-map" style="width:100vw;height:100%;position:absolute;top:0;">
							<xsl:comment />
						</div>

						<script async="async" src="{concat( //output/@siteUrl, '_assets/landing-pages/_global.js' )}">
							<xsl:comment><!-- Genie Global JS --></xsl:comment>
						</script>

						<style>
							<xsl:value-of select="'div.banner span.overlay {z-index: 10!important;}'" />
						</style>
					</xsl:if>

					<span class="overlay">
						<xsl:comment/>
					</span>

					<img class="logo-img" title="Company Logo">
						<xsl:attribute name="src">
							<xsl:value-of select="$companyLogo" />
						</xsl:attribute>
					</img>
					<h1>
						<span>
							<xsl:value-of select="concat( //agent[1]/firstName, $apos, 's' )" />
						</span>
						<br/>
						<xsl:call-template name="overridable">
							<xsl:with-param name="id" select="'page-title'" />
							<xsl:with-param name="default" select="'Marketing Toolkit'" />
						</xsl:call-template>
					</h1>
					<xsl:if test="$listingAddressLine1 !=''">
						<div class="address">
							<span>
								<xsl:value-of select="$listingAddressLine1" />
							</span>
						</div>
					</xsl:if>

					<image title="The Genie AI" class="genie-logo" preserveAspectRatio="xMidYMid slice" src="/_assets/_img/genie-logo-1.png" />

					<div style="position:absolute;bottom:-100px;top:unset;left:0;right:0;margin:auto;display:flex;justify-content:center;">
						<div class="profile" style="width:200px;height:200px;margin:1%;">
							<img>
								<xsl:attribute name="title">
									<xsl:value-of select="//agent[1]/marketingName" />
								</xsl:attribute>
								<xsl:attribute name="src">
									<xsl:copy-of select="//agent[1]/photo" />
								</xsl:attribute>
							</img>
						</div>

						<xsl:if test="$hasMultipleAgents">
							<div class="profile" style="width:200px;height:200px;margin:1%;">
								<img>
									<xsl:attribute name="title">
										<xsl:value-of select="//agent[2]/marketingName" />
									</xsl:attribute>

									<xsl:attribute name="src">
										<xsl:copy-of select="//agent[2]/photo" />
									</xsl:attribute>
								</img>
							</div>
						</xsl:if>
					</div>
				</div>

				<xsl:for-each select="//collection/sections/section">
					<xsl:sort select="number(@sort)" data-type="number" order="ascending" />
					<xsl:sort select="@name" />

					<div class="section">
						<div class="section-heading">
							<h3 class="light">
								<xsl:value-of select="@name" />
							</h3>

							<xsl:if test="@caption!=''">
								<h2>
									<xsl:value-of select="@caption" />
								</h2>
							</xsl:if>

							<xsl:if test="@description!=''">
								<p>
									<xsl:value-of select="@description" />
								</p>
							</xsl:if>

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
							<xsl:for-each select="./asset">
								<xsl:sort select="number(@sort)" data-type="number" order="ascending" />

								<xsl:call-template name="asset-box">
									<xsl:with-param name="asset" select="." />
								</xsl:call-template>
							</xsl:for-each>

							<xsl:for-each select="./doc">
								<xsl:call-template name="asset-box">
									<xsl:with-param name="asset" select="." />
								</xsl:call-template>
							</xsl:for-each>
						</div>
					</div>
				</xsl:for-each>

				<!-- footer -->
				<section class="footer-marketing-kit">
					<div>
						<xsl:if test="//single/mlsNumber != ''">
							<p>
								<b>Property: </b>
								<xsl:value-of select="$listingAddressLine1" />
							</p>
							<p>
								<b>MLS: </b>
								<xsl:value-of select="//single/mlsNumber" />
							</p>
							<p>
								<b>Listing Agent: </b>
								<xsl:choose>
									<xsl:when test="//single/listingAgent != ''">
										<xsl:value-of select="//single/listingAgent" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'n/a'" />
									</xsl:otherwise>
								</xsl:choose>
							</p>
						</xsl:if>
					</div>

					<div>
						<p>
							<b>Created On:&#160;</b>
							<xsl:value-of select="genie:format-date( //collection/@assembled, '[M02]-[D]-[Y0001]' )" />
						</p>
						<p>
							<b>Prepared For:&#160;</b>
							<xsl:value-of select="//agent[1]/marketingName" />
						</p>
						<p>
							<b>Area Name:&#160;</b>
							<xsl:value-of select="//areas/area[1]/name" />
						</p>
					</div>

					<div>
						<p>
							<b>Collection:&#160;</b>
							<xsl:value-of select="//collection/@name" />
						</p>
						<p>
							<b>Collection ID:&#160;</b>
							<xsl:value-of select="//collection/@id" />
						</p>
						<p>
							<b>Re-render this kit:&#160;</b>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="concat( //output/@apiUrl, 're-render?renderId=', //collection/@id )" />
								</xsl:attribute>
								<xsl:text>Click to re-render</xsl:text>
							</a>
						</p>
					</div>
				</section>
			</main>
		</body>

		<footer>
			<xsl:if test="$personalLogo!=''">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="$companyLogo!=''">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</img>
			</xsl:if>
		</footer>
	</xsl:template>
</xsl:stylesheet>												
