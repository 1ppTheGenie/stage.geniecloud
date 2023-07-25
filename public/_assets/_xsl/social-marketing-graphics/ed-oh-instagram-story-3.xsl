<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Instagram Story 3
	Tags:		Agent Ad, LC
	Sizes:		Instagram Story 
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

		<rect x="0" y="0" height="100%" width="100%" fill="#fff"></rect>

		<image x="3%" y="1.3%" width="94%" height="40%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<image x="3%" y="41.8%" width="46.7%" height="27.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-2" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<rect x="50.5%" y="41.8%" height="27.5%" fill="var(--theme-heading-color)" width="46.2%"></rect>
		<text class="futura-text" x="61.8%" y="52.5%" fill="var(--theme-body-background)" font-size="250%" font-weight="800" width="20%">
			<tspan>Open House</tspan>
			<tspan class="futura-text" x="68%" dy="3%">1-4pm</tspan>
		</text>

		<rect x="3%" y="70%" width="46.7%" height="28.5%" fill="var(--theme-body-background)"></rect>

		<foreignObject class="futura-text" x="11%" y="80%" height="30%" width="30%" fill="var(--theme-heading-color)" style="">
			<div class="center open-house-div">
				<h2 class="futura-text" style="color:var(--theme-heading-color);font-size:40px;line-height: 45px;margin:0 0;font-weight:700;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areanames'" />
						<xsl:with-param name="default" select="concat(//single/address/street,' ')" />
					</xsl:call-template>
				</h2>
				<h3 class="futura-text" style="font-weight:600;font-size:40px;margin-top:0;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areanames'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</h3>
			</div>
		</foreignObject>

		<rect x="50.5%" y="70%" width="46.7%" height="28.5%" fill="#e3e3e3"></rect>
		<image x="50.6%" y="70.2%" width="46.6%" height="28.4%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
	</xsl:template>
</xsl:stylesheet>