<?xml version="1.0"?>
<!--
	Asset Name:	Market Insider Video Section
	Tags:		Text
	Supports:	Area, Map, Multi-Listing
	Sizes:		Facebook
	Approved:	false
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
	</xsl:template>

	<xsl:template name="svg-body">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/blue-back-image.jpg' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="8%" class="super-bold futura-text align-center" font-size="170%">
			<tspan fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'A quick briefing from Security Chief'" />
					<xsl:with-param name="default" select="'A quick briefing from Security Chief '" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#b0934c" class="bold">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketingName'" />
					<xsl:with-param name="default" select="//agent[1]/marketingName" />
				</xsl:call-template>
			</tspan>
		</text>

		<a href="https://www.itzsold.com/evaluation">
			<image x="12%" y="18%" width="75%" height="70%" class="align-center" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/video-image.jpg' )" />
				</xsl:attribute>
			</image>

			<image x="43%" y="28%" width="13%" height="50%" preserveAspectRatio="xMidYMid meet" fill="#fff">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/play-circle-1.svg' )" />
				</xsl:attribute>
			</image>
		</a>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>