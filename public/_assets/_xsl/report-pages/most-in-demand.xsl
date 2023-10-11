<?xml version="1.0"?>
<!--
	Asset Name: Most In Demand
	Tags: 		Social Marketing Ad
	Sizes: 		Facebook, Postcard
	Supports: 	Area
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
			<use x="42%" y="16%" width="16%" height="16%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#blue-col-icon' )" />
			</use>
			<text x="50%" y="33%" class="center upper sub-heading" style="font-size: 350%;">
				<tspan>Most in demand</tspan>
			</text>
			<text x="50%" y="45%" class=" center medium">
				<tspan>For all residential</tspan>
			</text>
			<text x="50%" y="49%" class="center super-large">
				<tspan>
<xsl:value-of select="//single/bedrooms/@count" />

					<xsl:text>+ Bedrooms</xsl:text>
				</tspan>
			</text>
			<text x="50%" y="63%" class="center bold sub-heading medium">
				<xsl:text>As of </xsl:text>
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>