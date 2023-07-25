<?xml version="1.0"?>
<!--
	Asset Name:	Is now a good time to sell?
	Tags:		Text
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<g>
			<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<rect x="3%" y="5%" width="94%" height="90%" stroke-width="2" fill-opacity="0" stroke="var(--theme-body-color)" />

			<rect x="5%" y="8%" width="90%" height="83%" stroke-width="2" fill-opacity="0" stroke="var(--theme-body-color)" />
			<g transform="translate(80 110)">
				<rect width="87%" height="400" fill="var(--theme-body-background)" fill-opacity="0.7" />
			</g>
			<g style="transform: translate(0%, -14%);">
				<svg height="80" width="300" x="24%" y="34.2%">
					<path stroke-linecap="butt" d="M5 20 l30 0" fill="none" stroke="var(--theme-body-color)" stroke-width="1"></path>
				</svg>

				<text x="50%" y="35%" class="medium center upper" style="fill:var(--theme-body-color);">
			Custom Property Marketing Analysis
				</text>
				<svg height="80" width="300" x="73%" y="34.5%">
					<path stroke-linecap="butt" d="M5 20 l30 0" fill="none" stroke="var(--theme-body-color)" stroke-width="1"></path>
				</svg>
				<text x="50%" y="42%" class="sub-heading center bold upper" style="font-size:300%;font-weight:600;">
					<xsl:value-of select="//single/address/street" />
				</text>
				<text x="50%" y="52%" class="sub-heading center bold upper" style="font-size:300%;font-weight:600;">
					<tspan>
						<xsl:value-of select="//single/address/city" />
					</tspan>
					<xsl:text disable-output-escaping="yes">&#160;</xsl:text>
					<xsl:value-of select="//single/address/zip" />
				</text>
				<text x="50%" y="64%" class="medium center" style="fill:var(--theme-body-color);">

					<xsl:value-of select="genie:format-date( //output/@reportDate, 'M/D/Y')" />
				</text>
				<text x="50%" y="71%" class="medium center bold" style="fill:var(--theme-body-color);">
					<xsl:text>Prepared by: </xsl:text>
					<xsl:value-of select="//agent[1]/marketingName" />
				</text>
				<image x="35%" y="79%" width="28%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>