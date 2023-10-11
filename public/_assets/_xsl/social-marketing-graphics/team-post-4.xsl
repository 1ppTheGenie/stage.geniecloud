<?xml version="1.0"?>
<!--
	Asset Name:	TEAM POST 4
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

		<text x="5%" y="" class="futura-text" font-size="230%" font-weight="800" style="letter-spacing:0.3px;">
			<tspan x="5%" y="33%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'THE BEST'" />
					<xsl:with-param name="default" select="'THE BEST'" />
				</xsl:call-template>
			</tspan>
			<tspan x="5%" y="39.5%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'REAL ESTATE'" />
					<xsl:with-param name="default" select="'REAL ESTATE'" />
				</xsl:call-template>
			</tspan>
			<tspan x="5%" y="46%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'TEAM JUST'" />
					<xsl:with-param name="default" select="'TEAM JUST'" />
				</xsl:call-template>
			</tspan>
			<tspan x="5%" y="53%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'GOT BETTER.'" />
					<xsl:with-param name="default" select="'GOT BETTER.'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="5%" y="60.5%" fill="#fff" class="futura-text" font-size="100%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'(because they have me now)'" />
				<xsl:with-param name="default" select="'(because they have me now)'" />
			</xsl:call-template>
		</text>

		<image x="50%" y="30%" width="50%" height="70%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
	</xsl:template>
</xsl:stylesheet>