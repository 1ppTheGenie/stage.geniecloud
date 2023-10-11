<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Social Templates 1
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="lc-social-media.xsl" />


	<xsl:template name="svg-body">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect x="7%" y="72.5%" width="39%" height="20%" fill="var(--theme-body-background)"></rect>
		<!-- //agent-image -->
		<rect x="26.5%" y="73.8%" width="18%" height="17.2%" fill="#e3e3e3"></rect>
		<image x="26.5%" y="73.8%" width="18.1%" height="17.2%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		<text xmlns="" x="12%" y="78%" fill="var(--theme-heading-color)" font-size="140%" font-weight="700" class="futura-text">Open
			<tspan x="11%" dy="4.5%">1-4pm </tspan>
		</text>
	</xsl:template>

</xsl:stylesheet>