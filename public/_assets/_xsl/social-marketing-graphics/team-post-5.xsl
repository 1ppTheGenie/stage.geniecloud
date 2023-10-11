<?xml version="1.0"?>
<!--
	Asset Name:	TEAM POST 5
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="lc-social-media.xsl" />


	<xsl:template name="svg-body">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Twilight-17.jpg' )" />
			</xsl:attribute>
		</image>
		<rect x="0%" y="0%" width="100%" height="100%" opacity="0.96" fill="#b2934e" />

		<!-- logo -->
		<image x="5%" y="6%" width="17%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/exp-white.png' )" />
			</xsl:attribute>
		</image>
		<image x="4%" y="85%" width="41%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
			</xsl:attribute>
		</image>
		<!-- logo end -->

		<text x="5%" y="" class="futura-text" font-size="190%" font-weight="800" style="letter-spacing:0.3px;">
			<tspan x="5%" y="28%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'NO ONE’S'" />
					<xsl:with-param name="default" select="'NO ONE’S'" />
				</xsl:call-template>
			</tspan>
			<tspan x="5%" y="34%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'GROWING AS'" />
					<xsl:with-param name="default" select="'GROWING AS'" />
				</xsl:call-template>
			</tspan>
			<tspan x="5%" y="40%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'FAST AS EXP.'" />
					<xsl:with-param name="default" select="'FAST AS EXP.'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="5%" y="" class="futura-text" font-size="190%" font-weight="800" style="letter-spacing:0.3px;">
			<tspan x="5%" y="50%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'BUT THERE’S'" />
					<xsl:with-param name="default" select="'BUT THERE’S'" />
				</xsl:call-template>
			</tspan>
			<tspan x="5%" y="56%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'STILL ROOM'" />
					<xsl:with-param name="default" select="'STILL ROOM'" />
				</xsl:call-template>
			</tspan>
			<tspan x="5%" y="62%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'FOR YOU.'" />
					<xsl:with-param name="default" select="'FOR YOU.'" />
				</xsl:call-template>
			</tspan>
		</text>

		<image x="50%" y="30%" width="50%" height="70%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
	</xsl:template>
</xsl:stylesheet>