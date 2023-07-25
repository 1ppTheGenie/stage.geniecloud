<?xml version="1.0"?>
<!--
	Asset Name: Recent Sales Letter
	Tags: 		Social Marketing Ad
	Sizes: 		US Letter
	Supports:	Area, Multi-Listing
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text {dominant-baseline: middle;}'" />
		</style>

		<g style="transform:translateY(16%)">
			<text x="50%" y="19%" class="align-center upper sub-heading" font-size="180%">
				<xsl:value-of select="$areaWithPropertyType" />
			</text>
			<text x="50%" y="24%" class="align-center medium capitalize" fill="var(--theme-body-color)">
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'Last '" />
				</xsl:call-template>
			</text>
			<text x="50%" y="30%" class="center upper sub-heading" font-size="350%">
				<tspan>Recent </tspan>
				<tspan style="fill:var(--theme-body-color)">Sales</tspan>
			</text>

			<rect x="40%" y="35%" width="19%" height="10.7%" rx="10" fill="#cc5541" fill-opacity="100%"/>
			<text x="49.5%" y="41%" class="bold align-center" fill="#fff" font-size="430%">
				<xsl:value-of select="$listingsTotalSold"/>
			</text>

			<text x="50%" y="50%" class="center bold medium" fill="var(--theme-body-color)">
				<xsl:text>As of </xsl:text>
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
			</text>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>