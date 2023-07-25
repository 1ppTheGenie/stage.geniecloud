<?xml version="1.0"?>
<!--
	Asset Name: Map & Table with Sold Listings Letter
	Tags: 		Map, Listings, Infographic
	Sizes:		US Letter
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="map-listings-table-letter.xsl"/>

	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='sold']" />

	<xsl:template name="svg-body">
		<xsl:variable name="pendingListingCount" select="count($mapListingNodes)" />
		<xsl:variable name="mobile" select="//agent[1]/mobile" />

		<xsl:if test="$pendingListingCount = 0">
			<xsl:call-template name="map-listings-table-header">
				<xsl:with-param name="status" select="'sold'" />
				<xsl:with-param name="colorScheme" select="'--sold-red'" />
				<xsl:with-param name="totalCount" select="$pendingListingCount" />
				<xsl:with-param name="listings" select="//listings/listing[@state='sold']" />
			</xsl:call-template>
			<rect xmlns="" x="7%" y="25%" rx="10" ry="10" width="85%" height="60%" fill-opacity="0" stroke-width="2" stroke="var(--sold-red)"></rect>

			<xsl:call-template name="empty-listing-text" />
		</xsl:if>

		<xsl:if test="$pendingListingCount &gt; 0">
			<xsl:call-template name="map-listings-table">
				<xsl:with-param name="status" select="'sold'" />
				<xsl:with-param name="colorScheme" select="'--sold-red'" />
				<xsl:with-param name="totalCount" select="$pendingListingCount" />
				<xsl:with-param name="listings" select="//listings/listing[@state='sold']" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="count($mapListingNodes) != 0">
			<xsl:call-template name="listings-footer">
				<xsl:with-param name="min" select="number(8)" />
				<xsl:with-param name="nodes" select="$listingsTotalPending"/>
				<xsl:with-param name="summary" select="concat(' ', 'sold', ' listings.')" />
			</xsl:call-template>
		</xsl:if>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>