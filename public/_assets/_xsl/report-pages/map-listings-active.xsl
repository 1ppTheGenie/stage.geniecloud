<?xml version="1.0"?>
<!--
	Asset Name: Map & Table with Active Listings
	Tags: 		Map, Listings, Infographic
	Sizes:		Facebook, Facebook Ad, Facebook Post
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:import href="map-listings-table.xsl" />

	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='active']" />

	<xsl:template name="svg-body">
		<xsl:variable name="activeListingCount" select="count($mapListingNodes)" />
		<xsl:variable name="mobile" select="//agent[1]/mobile" />

		<xsl:if test="$activeListingCount = 0">
			<xsl:call-template name="map-listings-table-header">
				<xsl:with-param name="status" select="'active'" />
				<xsl:with-param name="colorScheme" select="'--active-green'" />
				<xsl:with-param name="totalCount" select="$activeListingCount" />
				<xsl:with-param name="listings" select="//listings/listing[@state='active']" />
			</xsl:call-template>
			<rect xmlns="" x="7%" y="25%" rx="10" ry="10" width="85%" height="60%" fill-opacity="0" stroke-width="2" stroke="var(--active-green)"></rect>

			<xsl:call-template name="empty-listing-text" />
		</xsl:if>

		<xsl:if test="$activeListingCount &gt; 0">
			<xsl:call-template name="map-listings-table">
				<xsl:with-param name="status" select="'active'" />
				<xsl:with-param name="colorScheme" select="'--active-green'" />
				<xsl:with-param name="totalCount" select="$activeListingCount" />
				<xsl:with-param name="listings" select="//listings/listing[@state='active']" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if test="count($listingsTotalActive) != 0">
			<xsl:call-template name="listings-footer">
				<xsl:with-param name="min" select="number(8)" />
				<xsl:with-param name="nodes" select="$listingsTotalActive" />
				<xsl:with-param name="summary" select="concat(' ', 'active', ' listings.')" />
			</xsl:call-template>
		</xsl:if>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>