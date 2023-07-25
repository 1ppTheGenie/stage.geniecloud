<?xml version="1.0"?>
<!--
	Asset Name: Market Report Open Book
	Tags: Social Marketing Ad
	Sizes: Facebook, Postcard
	Supports: Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="map-listings-active.xsl"/>
	<xsl:import href="map-listings-table.xsl"/>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			.market-report-open-book g#map-listings-row svg.maps rect:nth-child(4), .market-report-open-book g#map-listings-row svg.maps rect:nth-child(2) {
			    transform: skewX(0deg);
			}
			.market-report-open-book g#map-listings-row svg.maps {
			    overflow: visible;
			}
			.market-report-open-book g#map-listings-row svg.maps foreignObject {
			    transform: skew(0deg, 00deg);
			}'" />
		</style>

		<image x="5%" y="0" width="90%" height="100%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/open-book-bg2.png' )" />
			</xsl:attribute>
		</image>

		<g style="transform:scale(0.35)translate(28%, 155%)skew(26deg, -23deg)" class="market-report-open-book">
			<xsl:call-template name="map-listings-active" />
		</g>

		<g style="transform:scale(0.33)translate(140%, 77%)skew(31deg, -18deg)" class="market-report-open-book">
			<xsl:call-template name="map-listings-table">
				<xsl:with-param name="status" select="'sold'" />
				<xsl:with-param name="colorScheme" select="'--sold-red'" />
			</xsl:call-template>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>