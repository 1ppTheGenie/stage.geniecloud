<?xml version="1.0"?>
<!--
	Asset Name: Average Days On Market Letter 
	Tags: 		Social Marketing Ad
	Sizes:		US Letter
	Supports:	Area
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<g style="transform:translateY(22%)">
			<text x="50%" y="4%" class="align-center upper sub-heading" style="font-size:180%;" data-max-width="90%">
				<xsl:value-of select="$areaWithPropertyType" />
			</text>

			<text x="50%" y="9%" class="align-center medium" style=" fill:var(--theme-body-color)" font-family="var(--theme-heading-font)">
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'Last '" />
				</xsl:call-template>
			</text>
			<use x="42%" y="11%" width="16%" height="16%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#clock-green-icon' )" />
			</use>

			<text x="50%" y="27%" class="bold center medium upper" style=" fill:var(--theme-body-color); font-size: 240%; font-weight: 500;" font-family="var(--theme-heading-font)">
				<tspan>Average</tspan>
			</text>
			<text x="50%" y="31.5%" class="center upper" style="font-size: 350%;fill:var(--theme-body-color)" font-family="var(--theme-heading-font)">
				<tspan>Days On Market</tspan>
			</text>

			<text x="50%" y="37.5%" class="center sub-heading" style="font-size: 620%;font-weight:500;">
				<tspan>
					<xsl:value-of select="//statistics/@averageDaysOnMarket"/>
				</tspan>
			</text>

			<text x="50%" y="49.5%" class="center bold medium" style=" fill:var(--theme-body-color)" font-family="var(--theme-heading-font)">
				<xsl:text>As of </xsl:text>
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
			</text>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>