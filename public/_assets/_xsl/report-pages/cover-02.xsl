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
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<rect x="3%" y="5%" width="94%" height="90%" stroke-width="2" fill-opacity="0" stroke="var(--theme-body-color)" />

			<rect x="5%" y="8%" width="90%" height="83%" stroke-width="2" fill-opacity="0" stroke="var(--theme-body-color)" />
			<g transform="translate(72 160)">
				<rect width="88%" height="330" fill="var(--theme-body-background)" fill-opacity="0.7" />

				<svg height="80" width="300" x="29%" y="4%">
					<path stroke-linecap="butt" d="M5 20 l30 0" fill="none" stroke="var(--theme-body-color)" stroke-width="1"></path>
				</svg>

				<text x="44%" y="5%" class="medium center upper" style="fill:var(--theme-body-color);">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="'market insider report'" />
					</xsl:call-template>
				</text>
				<svg height="80" width="300" x="55.5%" y="4%">
					<path stroke-linecap="butt" d="M5 20 l30 0" fill="none" stroke="var(--theme-body-color)" stroke-width="1"></path>
				</svg>
				<text x="44%" y="12%" data-max-width="80%" class="sub-heading center bold upper" style="font-size:320%;font-weight:500;">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</text>
				<text x="44%" y="24%" class="medium center" style="fill:var(--theme-body-color);">
					<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
				</text>
				<text x="44%" y="31%" class="center" style="fill:var(--theme-body-color);font-size:120%;font-weight:600;">
					<xsl:text>Courtesy of </xsl:text>
					<xsl:value-of select="//agent[1]/marketingName" />
				</text>
				<image x="29%" y="39%" width="30%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>