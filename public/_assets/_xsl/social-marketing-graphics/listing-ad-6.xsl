<?xml version="1.0"?>
<!--
	Asset Name:	Listing Ad 03
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">

		<text x="50%" y="5%" class="large upper center" fill="var(--theme-heading-color)" style="font-weight:600;letter-spacing:1px;">
			FUN FACTS:
		</text>

		<image x="0" y="15%" width="100%" height="50%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/avocado.svg' )" />
			</xsl:attribute>
		</image>

		<text class="large center" fill="var(--theme-heading-color)" style="font-weight:400;letter-spacing:2px;">
			<tspan x="50%" y="67.5%">Avocados last longer than</tspan>
			<tspan x="50%" y="75.5%">well-priced houses</tspan>
			<tspan x="50%" y="83.5%">in a hot market.</tspan>
		</text>
	</xsl:template>
</xsl:stylesheet>