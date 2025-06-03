<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Brochure 01
	Tags:		Direct Mail
	Sizes:		Ipad Landscape
	Supports:	Listing, Multi-Listing
	Pages:		flyers/ed-kaminsky-brochure-01,flyers/ed-kaminsky-brochure-02
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
 .areaname {
				font-size: 33px;
				margin-top: 20px;
				font-weight: 600;
				margin-bottom: 0;
			}

			'" />
		</style>
		<rect x="0%" y="0%" width="100%" height="100%" fill="var(--theme-body-background)" />

		<image x="2%" y="2%" width="96%" height="96%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="$primaryImage" />
			</xsl:attribute>
		</image>
		<image x="64.2%" y="7%" width="30.8%" preserveAspectRatio="xMidYMin meet">
			<xsl:choose>
				<xsl:when test="//output/@themeHue='dark'">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoLight" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoDark" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</image>
		<rect width="49.8%" height="25%" x="4.5%" y="65.2%" fill="var(--theme-heading-color)" />
		<foreignObject x="7%" y="64.8%" height="25%" width="27%">
			<div style="width: 80%;">
				<h2 class="upper"
					style="color:var(--theme-body-background);font-size: 75px;line-height: 0.9;margin-bottom: 34px; font-family:var(--theme-heading-font);letter-spacing: -2px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areanames'" />
						<xsl:with-param name="default" select="$listingAddressLine1" />
					</xsl:call-template>
				</h2>
			</div>
			<div>
				<p class="areaname"
					style="text-transform: capitalize; margin-top:-10px; font-family:var(--theme-heading-font); color:var(--theme-sub-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areanames'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</p>
			</div>
		</foreignObject>
		<g style="transform:translate(37.2%,68.4%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'14.2%'" />
				<xsl:with-param name="height" select="'18.6%'" />
			</xsl:call-template>
		</g>
		<image x="82.6%" y="83%" width="13.3%" preserveAspectRatio="xMidYMin meet">
			<xsl:choose>
				<xsl:when test="//output/@themeHue='dark'">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/companyLogoLight" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/companyLogoDark" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</image>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>