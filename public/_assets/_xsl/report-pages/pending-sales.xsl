<?xml version="1.0"?>
<!--
	Asset Name: Currently For Sale
	Tags: 		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports: 	Area, Multi-Listing
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<g style="transform:translateY(12%)">
			<text x="50%" y="2%" class="align-center upper" style="font-size:180%">
				<xsl:value-of select="//area/name" />
			</text>
			<use x="42%" y="16%" width="16%" height="16%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#up-icon' )" />
			</use>
			<text x="50%" y="33%" class="center upper sub-heading" style="font-size: 350%;">
				<tspan>Pending Sales</tspan>
			</text>
			<text x="50%" y="43%" class="center" style="font-size: 550%">
				<xsl:value-of select="count($listingsTotalPending)" />
			</text>
			<text x="50%" y="58%" class="center bold medium sub-heading">
				<xsl:text>As of </xsl:text>
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>