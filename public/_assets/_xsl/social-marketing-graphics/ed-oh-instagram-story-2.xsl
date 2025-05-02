<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Instagram Story 2
	Tags:		Agent Ad, LC
	Sizes:		Instagram Story 
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

<xsl:import href="common.xsl" />
<xsl:import href="lc-social-media.xsl" />


	<xsl:template name="svg-body">
		<!-- <link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link> -->

<rect x="0%" y="0%" width="100%" height="100%" fill="#fff" />


		<image x="2.5%" y="1%" width="95%" height="35.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

<rect x="2.5%" y="37.1%" width="95%" height="26%" fill="var(--theme-body-background)" />


		<text class="capitalize center" x="50%" y="43.2%" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-weight="700" font-size="70">Open 1-4pm</text>

		<line xmlns="" x1="45%" y1="49%" x2="55.2%" y2="49%" style="stroke:var(--theme-body-color);stroke-width:2.5"></line>

		<text class="capitalize center" x="50%" y="51%" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-weight="500" font-size="50" data-max-width="80%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'streetaddress'" />
				<xsl:with-param name="default" select="concat(//single/address/street,' ')" />
			</xsl:call-template>
		</text>

		<text class="capitalize center" x="50%" y="53.7%" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-weight="700" font-size="60" data-max-width="80%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areaname'" />
				<xsl:with-param name="default" select="//area/name" />
			</xsl:call-template>
		</text>

		<image x="2.5%" y="64%" width="95%" height="35%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-2" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>
	</xsl:template>

</xsl:stylesheet>