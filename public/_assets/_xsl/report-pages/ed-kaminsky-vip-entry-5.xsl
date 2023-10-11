<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Vip Entry 5
	Tags:		Map, Listings, Infographic
	Sizes:		Door Hanger
	Supports:	Area, Multi-Listing
	Pages:		report-pages/ed-kaminsky-vip-entry-5,report-pages/ed-kaminsky-vip-entry-4
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-condensed.css')" />

		</link>

		<rect x="0" y="0" width="100%" height="100%" fill="#0d0f30" style="background: #0d0f30;"></rect>

		<image x="20%" y="4.6%" width="41%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
			</xsl:attribute>
		</image>
		<image x="64.2%" y="4.6%" width="13.2%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/exp-white.png' )" />
			</xsl:attribute>
		</image>

		<svg height="100%" width="100%">
			<circle cx="50%" cy="21.3%" r="12%" fill="#282843" />
		</svg>
		<line xmlns="" x1="0%" y1="21.5%" x2="50%" y2="21.5%" stroke="#282843" stroke-width="0.3%">
		</line>

		<text x="50%" y="34.1%" class="futura-text upper center" fill="#fff" font-size="1100%" font-weight="800" style="letter-spacing:1.5px;">
		    DID YOU
		</text>
		<text x="50%" y="40.6%" class="futura-text upper center" fill="#fff" font-size="1100%" font-weight="800" style="letter-spacing:1px;">
		    FEEL THAT?
		</text>

		<line xmlns="" x1="11%" y1="51.5%" x2="89%" y2="51.5%" stroke="#b0934c" stroke-width="0.2%">
		</line>
		<text x="50%" y="52.6%" class="futura-text center" fill="#fff" font-size="600%" font-weight="700" style="word-spacing:5px;">
		    Your home’s value
		</text>
		<text x="50%" y="56%" class="futura-text center" fill="#fff" font-size="580%" font-weight="700">
		    just changed. Again.
		</text>
		<line xmlns="" x1="11%" y1="60.7%" x2="89%" y2="60.7%" stroke="#b0934c" stroke-width="0.2%">
		</line>

		<image x="34.5% " y="66.6%" width="25.5%" height="9.9%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download.png' )" />
			</xsl:attribute>
		</image>
		<text x="13%" y="78%" class="futura-text" font-weight="700" font-size="425%" style="text-anchor: inherit;">
			<tspan x="50%" dy="1.3%" class="center" fill="#fff">Scan to
				<tspan fill="#a18d4c"> instantly </tspan>learn </tspan>
		</text>
		<text x="50%" y="81.7%" class="futura-text center" fill="#fff" font-size="425%" font-weight="700">
		    your home’s current value.
		</text>

		<image x="0% " y="89%" width="100%" height="11%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/pile-of-money.png' )" />
			</xsl:attribute>
		</image>
	</xsl:template>
</xsl:stylesheet>