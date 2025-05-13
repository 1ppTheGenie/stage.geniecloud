<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Vip Entry 2
	Tags:		Map, Listings, Infographic
	Sizes:		Door Hanger
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<image x="19.5%" y="4.8%" width="41%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:choose>
				<xsl:when test="//output/@themeHue='dark'">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoDark" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoLight" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</image>
		<image x="64%" y="6%" width="13%" class="center" height="3%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:choose>
				<xsl:when test="//output/@themeHue='dark'">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent/companyLogoDark" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="//agent/companyLogoLight" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</image>
		<svg height="100%" width="100%">
			<circle cx="50%" cy="21.5%" r="12%" fill="#282843" />
		</svg>
		<line xmlns="" x1="70%" y1="22.5%" x2="100%" y2="22.5%" stroke="#282843" stroke-width="0.3%" />


		<text x="50%" y="33%" class="center" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" font-weight="700" font-size="480%">
			<tspan x="50%" dy="2.8%">Are you as</tspan>
			<tspan x="50%" dy="2.8%">tired of monthly</tspan>
			<tspan x="50%" dy="2.8%">real estate market</tspan>
			<tspan x="50%" dy="2.8%">update postcards</tspan>
			<tspan x="50%" dy="2.8%">as we are?</tspan>
		</text>

		<text x="50%" y="49.5%" class="center" font-family="var(--theme-body-font)" fill="var(--theme-heading-color)" font-weight="700" font-size="480%">
			<tspan x="50%" dy="3%">We don’t even</tspan>
			<tspan x="50%" dy="3%">read our own.</tspan>
		</text>
		<line xmlns="" x1="25%" y1="54%" x2="75%" y2="54%" stroke="red" stroke-width="0.3%" />
		<line xmlns="" x1="25%" y1="57.2%" x2="75%" y2="57.2%" stroke="red" stroke-width="0.3%" />


		<image x="36.5% " y="66%" width="26%" height="10%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download-new.png' )" />
			</xsl:attribute>
		</image>
		<text x="50%" y="78.5%" class="center" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" font-weight="700" font-size="400%" style="word-spacing: -7px;">It’s time for something better:</text>
		<text x="50%" y="81.4%" class="center" fill="var(--theme-sub-heading-color)" font-weight="700" font-size="390%" style="word-spacing: -5px;">KRG’s All-New
			<tspan font-style="italic">Market Insider </tspan>
		</text>

		<line xmlns="" x1="9%" y1="86%" x2="91%" y2="86%" stroke="var(--theme-sub-heading-color)" stroke-width="0.1%" />


		<text class="center" x="50%" y="86%" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" font-weight="500" font-size="240%">
			<tspan x="50%" dy="1.5%">ALL-DIGITAL <tspan fill="var(--theme-sub-heading-color)">•</tspan> THE INFO YOU NEED, UPDATED DAILY</tspan>
			<tspan x="50%" dy="1.7%">YOUR HOME’S CURRENT VALUE IN JUST SECONDS</tspan>
			<tspan x="50%" dy="1.7%">NO ADS <tspan fill="var(--theme-sub-heading-color)">•</tspan> NO POSTCARDS <tspan fill="var(--theme-sub-heading-color)">•</tspan> 100% FREE FOREVER</tspan>
		</text>

		<line xmlns="" x1="9%" y1="94%" x2="91%" y2="94%" stroke="var(--theme-sub-heading-color)" stroke-width="0.1%" />
	</xsl:template>
</xsl:stylesheet>