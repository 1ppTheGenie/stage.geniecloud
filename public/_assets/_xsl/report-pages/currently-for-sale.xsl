<?xml version="1.0"?>
<!--
	Asset Name: Currently For Sale
	Tags: 		Social Marketing Ad
	Sizes: 		Facebook, Postcard
	Supports: 	Area
	Approved: 	False
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<g style="transform:translateY(12%)">
			<text x="50%" y="2%" class="align-center upper" style="font-size:180%">
				<xsl:value-of select="//area/name" />
			</text>
			<text x="50%" y="9%" class="sub-heading align-center medium">
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'Last '" />
				</xsl:call-template>
			</text>
			<text x="50%" y="14%" class="center upper sub-heading" style="font-size: 350%;">
				<tspan fill="var(--theme-body-color)">Currently</tspan>
				<tspan> for sale</tspan>
			</text>
			<g style="transform:translate(44%,29%)">
<rect width="13%" height="23%" rx="10" fill="#6c824b" fill-opacity="100%" />

				<text x="6.5%" y="6%" class="bold center" style="fill:var(--theme-body-background); font-size: 350%; ">
					<xsl:value-of select="//statistics/@activePropertyTypeCount" />
				</text>
			</g>
			<text x="50%" y="55%" class="center bold sub-heading medium">
				<xsl:text>As of </xsl:text>
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>