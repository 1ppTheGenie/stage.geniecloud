<?xml version="1.0"?>
<!--
	Asset Name:	Coit Mailer Front
	Tags:		Direct Mail
Supports:	Area, Multi-Listing, Print, PricePercent, QRCode
	Sizes:		Postcard
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/compass.css')" />

		</link>
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/compass-serif.css')" />

		</link>

		<style>
			<xsl:value-of select="'
				.serif-text{font-family: `Compass Serif`;	}
				.italic-text{ font-family: Compass; }'" />
		</style>
		<rect x="0%" y="0%" width="37%" height="100%" fill="#000" />
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<foreignObject font-size="400%" height="100%" width="50%" class="whats-trending">
			<div style="width: 65%;margin:30px 30px;">
				<h2 contenteditable="true" class="upper serif-text" style="color: #fff;font-size: 60px;line-height:66px;margin: 0 0;font-weight: 400;letter-spacing: 3px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'WHAT’S'" />
						<xsl:with-param name="default" select="concat('WHAT’S TRENDING WITH ', //area/name ,' HOMES' )" />
					</xsl:call-template>
				</h2>
			</div>
		</foreignObject>

		<image x="2.7%" y="81%" width="15%" height="15%" id="logo" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$personalLogoInverse" />
			</xsl:attribute>
		</image>

		<text x="20%" y="92%" font-size="135%" fill="#fff">
			<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [Y0001]')" />
		</text>

		<text x="40%" y="4.5%" class="serif-text" font-size="290%" style="font-style:italic;" fill="var(--theme-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'zillowtext'" />
				<xsl:with-param name="default" select="'See what Zillow can’t show you'" />
			</xsl:call-template>
		</text>

		<g style="transform: translate(40%, 65%);">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'12%'" />
				<xsl:with-param name="height" select="'20%'" />
			</xsl:call-template>

			<use x="0%" y="2%" width="7.5%" height="15%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/qr.svg#qr-code' )" />
			</use>
			<text x="-3%" y="10%" fill="#98a898" style="font-size:38%;font-weight:500;text-align:right;">
				<tspan x=".2%" style="text-align:right;">Scan the</tspan>
				<tspan x="0%" dy="1.3%" style="text-align:right;">QR Code</tspan>
				<tspan x="0%" dy="1.3%" style="text-align:right;">with your</tspan>
				<tspan x=".5%" dy="1.3%" style="text-align:right !important;">camera</tspan>
			</text>
		</g>

		<g style="transform: translate(0%, 0%);">
			<g style="transform: translate(65.5%, 21.7%);">
				<use x="0" y="2%" width="9%" height="7.7%" fill="var(--theme-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon' )" />
				</use>
				<text x="6.5%" y="3.5%" fill="var(--theme-heading-color)" font-size="170%" font-weight="500">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Community Trends'" />
						<xsl:with-param name="default" select="'Community Trends'" />
					</xsl:call-template>
				</text>
			</g>

			<g style="transform: translate(65.5%, 33.5%);">
				<use x="0" y="2%" width="9%" height="7.7%" fill="var(--theme-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon' )" />
				</use>
				<text x="6.5%" y="3.5%" fill="var(--theme-heading-color)" font-size="170%" font-weight="500">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Neighborhood Trends'" />
						<xsl:with-param name="default" select="'Neighborhood Trends'" />
					</xsl:call-template>
				</text>
			</g>

			<g style="transform: translate(65.5%, 45.3%);">
				<use x="0" y="2%" width="9%" height="7.7%" fill="var(--theme-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon' )" />
				</use>
				<text x="6.5%" y="3.5%" fill="var(--theme-heading-color)" font-size="170%" font-weight="500">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Multi-Year Trends'" />
						<xsl:with-param name="default" select="'Multi-Year Trends'" />
					</xsl:call-template>
				</text>
			</g>
			<g style="transform: translate(65.5%, 57.5%);">
				<use x="0" y="2%" width="9%" height="7.7%" fill="var(--theme-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon' )" />
				</use>
				<text x="6.5%" y="3.5%" fill="var(--theme-heading-color)" font-size="170%" font-weight="500">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Buyer Trends'" />
						<xsl:with-param name="default" select="'Buyer Trends'" />
					</xsl:call-template>
				</text>
			</g>
		</g>

		<image x="77.5%" y="85%" width="20%" height="15%" id="logo" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<text x="54.7%" y="72.2%" font-size="200%" fill="#000">
			<xsl:text>.</xsl:text>
		</text>
		<text x="58.8%" y="72.2%" font-size="200%" fill="#000">
			<xsl:text>.</xsl:text>
		</text>
		<text x="54.7%" y="80%" font-size="200%" fill="#000">
			<xsl:text>.</xsl:text>
		</text>
		<text x="58.8%" y="80%" font-size="200%" fill="#000">
			<xsl:text>.</xsl:text>
		</text>
		<text x="54.7%" y="88%" font-size="200%" fill="#000">
			<xsl:text>.</xsl:text>
		</text>
		<text x="58.8%" y="88%" font-size="200%" fill="#000">
			<xsl:text>.</xsl:text>
		</text>
	</xsl:template>
</xsl:stylesheet>