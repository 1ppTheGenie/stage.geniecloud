<?xml version="1.0"?>
<!--
	Asset Name: ED KAMINSKY CURRENTLY FOR SALE
	Tags: 		Map, Listings, Infographic
	Sizes:		Facebook, Facebook Ad, Facebook Post
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="map-listings-table.xsl" />


	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='active']" />

	<xsl:template name="svg-body">
		<!-- <link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link> -->
		<style type="text/css">
			@import url("/_assets/_css/futura-embedded.css");
		</style>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/blue-back-image.jpg' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="9.8%" fill="#e1e1e1" class="center futura-text upper" font-size="170%" style="letter-spacing: 5px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat(//area/name ,' ', $singularPropertyType,'s')" />
			</xsl:call-template>
		</text>

		<text x="50%" y="13.8%" class=" center futura-text super-bold" font-size="450%">
			<tspan x="37%" fill="#e1e1e1">Currently</tspan>
			<tspan x="58%" fill="#b0934c">For</tspan>
			<tspan x="70%" fill="#b0934c">Sale</tspan>
		</text>

		

				<!-- Calculate total listings (excluding full $listingsTotalActive to avoid double count) -->
				<xsl:variable name="totalListings" select="
				count($listingsTotalNew) +
				count($listingsTotalActiveNotNew) +
				count($listingsTotalPending) +
				count($listingsTotalSold)
				" />

				<!-- Render message text -->
				<text x="50%" y="30%" class="center futura-text" font-size="140%" fill="#e1e1e1">
				<xsl:text>SHOWING 1 OF </xsl:text>
				<xsl:value-of select="$totalListings" />
				<xsl:text> TOTAL LISTINGS</xsl:text>
				</text>





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
			<xsl:call-template name="ed-listings-table">
				<xsl:with-param name="status" select="'active'" />
				<xsl:with-param name="colorScheme" select="'--active-green'" />
				<xsl:with-param name="totalCount" select="$activeListingCount" />
				<xsl:with-param name="listings" select="//listings/listing[@state='active']" />
			</xsl:call-template>
		</xsl:if>

		<text x="50%" y="92.1%" class="center futura-text" font-size="110%" style="letter-spacing: 5px; word-spacing:10px;">
			<tspan fill="#e1e1e1">ADDRESSES  REDACTED - - - - - </tspan>
			<tspan fill="#b0934c" class=" futura-text">HIGHER   SECURITY CLEARAN REQUIRED</tspan>
		</text>

		<xsl:call-template name="ed-showing-listing">
<xsl:with-param name="nodes" select="$activeListingCount" />

			<xsl:with-param name="summary" select="' active listings.'" />
			<xsl:with-param name="min" select="number(12)" />
		</xsl:call-template>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>