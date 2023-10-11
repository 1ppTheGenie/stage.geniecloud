<?xml version="1.0"?>
<!--
	Asset Name: Map & Table with Sold Listings
	Tags: 		Map, Listings, Infographic
	Sizes:		Facebook, Facebook Ad, Facebook Post
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="map-listings-table.xsl" />


	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='sold']" />

	<xsl:template name="include-in-render">
		<xsl:choose>
			<xsl:when test="count($mapListingNodes) = 0">
				<xsl:value-of select="'false'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'true'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:call-template name="map-listings-table">
			<xsl:with-param name="status" select="'sold'" />
			<xsl:with-param name="colorScheme" select="'--sold-red'" />
		</xsl:call-template>

		<xsl:call-template name="listings-footer">
			<xsl:with-param name="min" select="number(8)" />
<xsl:with-param name="nodes" select="$listingsTotalSold" />

			<xsl:with-param name="summary" select="concat(' ', 'sold', ' listings.')" />
		</xsl:call-template>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>