<?xml version="1.0"?>
<!--
	Asset Name: Recent Sales
	Tags: 		Social Marketing Ad
	Sizes: 		Facebook, Postcard
	Supports:	Area, Multi-Listing
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text { dominant-baseline: middle;}'"/>
		</style>

		<g style="transform:translateY(12%)">
			<text x="50%" y="6.5%" class="align-center upper sub-heading" style="font-size:180%">
				<xsl:value-of select="$areaWithPropertyType" />
			</text>
			<text x="50%" y="13.4%" class="align-center medium capitalize" style="fill:var(--theme-body-color);">
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'Last '" />
				</xsl:call-template>
			</text>
			<text x="50%" y="23.2%" class="center upper sub-heading" style="font-size: 350%;">
				<tspan>Recent </tspan>
				<tspan style="fill:var(--theme-body-color)">Sales</tspan>
			</text>
			<g style="transform:translate(43%,31%)">
				<rect width="14%" height="24%" rx="10" fill="#cc5541" fill-opacity="100%"/>
				<text x="7%" y="12.5%" class="bold align-center" fill="#fff" font-size="430%">
					<xsl:value-of select="$listingsTotalSold"/>
				</text>
			</g>
			<text x="50%" y="60%" class="center bold medium" style="fill:var(--theme-body-color);">
				<xsl:text>As of </xsl:text>
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
			</text>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>