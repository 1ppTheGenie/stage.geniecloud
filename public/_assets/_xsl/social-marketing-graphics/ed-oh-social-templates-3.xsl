<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Social Templates 3
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1 
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="lc-social-media.xsl" />


	<xsl:template name="svg-body">
		<image x="0%" y="0%" width="50%" height="50%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<rect x="50%" y="0%" width="50%" height="50%" fill="var(--theme-body-background)"></rect>
		<rect x="0%" y="50%" width="50%" height="50%" fill="var(--theme-heading-color)"></rect>

		<image x="50%" y="50%" width="50%" height="50%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-2" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<foreignObject x="55%" y="14.5%" height="28%" width="40%" fill="000">
			<div class="street-address align-center">
				<h1 style="color:var(--theme-heading-color);padding: 0px 8px;line-height: 1.2;font-size: 220%; font-weight:900;margin-bottom: 0; font-family:var(--theme-heading-font)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'streetname'" />
						<xsl:with-param name="default" select="concat(//single/address/street,' ')" />
					</xsl:call-template>
				</h1>
				<h2 width="100%" style="color:var(--theme-heading-color);font-size: 250%;font-weight:400;margin: 0;font-family:var(--theme-heading-font)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</h2>
			</div>
		</foreignObject>

		<text xmlns="" fill="var(--theme-body-background)" font-size="130%">
			<tspan x="13.5%" y="69.5%" class="upper" font-family="var(--theme-heading-font)" font-size="190%" font-weight="700">Open House</tspan>
			<tspan x="14.4%" class="upper" y="75.5%" font-family="var(--theme-heading-font)" font-size="190%" font-weight="700">1pm - 4pm</tspan>
		</text>

<rect fill="#fff" stroke-width="0" fill-opacity="1" x="49.5%" y="0" width="0.7%" height="100%" />
<rect fill="#fff" stroke-width="0" fill-opacity="1" x="0%" y="49.5%" width="100%" height="0.7%" />

	</xsl:template>
</xsl:stylesheet>