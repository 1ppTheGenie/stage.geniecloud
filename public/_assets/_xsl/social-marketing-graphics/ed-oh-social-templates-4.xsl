<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Social Templates 4
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

	<xsl:import href="common.xsl"/>
	<xsl:import href="lc-social-media.xsl"/>

	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>

		<xsl:call-template name="lc-prop-post-03-common" />
	</xsl:template>

	<xsl:template name="lc-prop-post-03-common">
		<xsl:param name="status" select="'true'"/>

		<image x="0" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<!-- Gradient layer start -->
		<xsl:if test="//output/@themeShade='Dark'">
			<image x="0%" y="70%" width="100%" height="30%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottomlightlayer-dark.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<xsl:if test="//output/@themeShade='Light'">
			<image x="0%" y="60%" width="100%" height="40%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottom-gradient-layer-2.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<!-- Gradient layer End -->

		<text class="futura-text upper" fill="var(--theme-heading-color)" x="3.8%" y="80%" font-weight="600" font-size="200%" data-max-width="70%" style="letter-spacing: 0.8px;">Open 1-4pm
		</text>

		<text class="futura-text capitalize" fill="var(--theme-heading-color)" x="3.8%" y="89.6%" font-weight="400" font-size="115%" data-max-width="70%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="concat(//single/address/street,', ', //area/name)" />
			</xsl:call-template>
		</text>

		<svg x="60%" y="63%">
			<polygon points="222,46 222,250 35,255" fill="var(--theme-heading-color)" />
		</svg>
		<svg x="77%" y="78%" width='180' height='180'>
			<circle cx="57" cy="48" r="47" stroke='#fff' stroke-width='3' fill='#e3e3e3' />
		</svg>

		<g style="transform: translateY(0);">
			<clipPath id="clipCircle">
				<circle r="7.8%" cx="87%" cy="86.5%"></circle>
			</clipPath>
			<image x="79%" y="73.5%" width="17%" height="30%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
		</g>
	</xsl:template>

</xsl:stylesheet>