<?xml version="1.0"?>
<!--
	Asset Name:	Cover - 01
	Tags:		Text
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<rect x="3%" y="4.8%" width="94%" height="90%" fill-opacity="0" stroke="var(--theme-body-color)" stroke-width="2"/>

		<rect x="5%" y="9%" width="90%" height="81%" fill="var(--theme-body-background)" stroke="var(--theme-body-color)" stroke-width="2"/>

		<g style="transform:translateY(-8%)">
			<svg height="80" width="300" x="37%" y="34.2%">
				<path stroke-linecap="butt" d="M5 20 l30 0" fill="none" stroke="var(--theme-body-color)" stroke-width="1"></path>
			</svg>

			<text x="50%" y="35%" class="medium center upper" style="fill:var(--theme-body-color);">
				<xsl:text>Market Insider</xsl:text>
			</text>
			<svg height="80" width="300" x="59.5%" y="34.5%">
				<path stroke-linecap="butt" d="M5 20 l30 0" fill="none" stroke="var(--theme-body-color)" stroke-width="1"></path>
			</svg>
			<text x="50%" y="42%" class="heading center bold upper" style="font-size:300%;font-weight:500;fill:var(--theme-body-color);" data-max-width="70%">
				<xsl:value-of select="//area/name" />
			</text>
			<text x="50%" y="54%" class="medium center" style="fill:var(--theme-body-color);">
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
			</text>
			<text x="50%" y="61%" class="medium center bold" style="fill:var(--theme-body-color);">
				<xsl:text>Courtesy of</xsl:text>
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="//agent[1]/firstName" />
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="//agent[1]/lastName" />
			</text>
			<image x="35%" y="69%" width="28%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>
	</xsl:template>
</xsl:stylesheet>