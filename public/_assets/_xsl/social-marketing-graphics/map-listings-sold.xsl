<?xml version="1.0"?>
<!--
	Asset Name: Active Listings
	Tags: 		Map, Listings, Infographic
	Sizes:		Facebook
	Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:import href="map-listings-table.xsl" />

	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='sold']" />

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:call-template name="map-listings-table">
			<xsl:with-param name="status" select="'sold'" />
			<xsl:with-param name="colorScheme" select="'--sold-red'" />
		</xsl:call-template>

		<xsl:call-template name="listings-footer">
			<xsl:with-param name="min" select="number(8)" />
			<xsl:with-param name="nodes" select="$mapListingNodes" />

			<xsl:with-param name="summary" select="' sold listings.'" />
		</xsl:call-template>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>