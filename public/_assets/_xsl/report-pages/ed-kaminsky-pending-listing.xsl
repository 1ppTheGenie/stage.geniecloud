<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Pending Listing
	Tags: 		Map, Listings, Infographic
	Sizes:		Facebook, Facebook Ad, Facebook Post
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="map-listings-table.xsl" />


	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='pending']" />
	<xsl:variable name="pendingListingCount" select="count($mapListingNodes)" />

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
			<tspan x="37.5%" fill="#e1e1e1">Currently</tspan>
			<tspan x="65.2%" fill="#b2934e" class="futura-text">Pending</tspan>
		</text>

		<xsl:call-template name="ed-showing-listing">
      <xsl:with-param name="nodes" select="$listingsTotalPending" />

			<xsl:with-param name="min" select="number(12)" />
		</xsl:call-template>

		<xsl:variable name="pendingListingCount" select="count($mapListingNodes)" />

		<text x="50%" y="29%" class="center futura-text" font-size="110%" fill="#b0934c" style="word-spacing:5px; text-transform: uppercase;">
			<xsl:text>SHOWING </xsl:text>
			<xsl:choose>
				<xsl:when test="$pendingListingCount &lt; 12">
				<xsl:value-of select="$pendingListingCount" />
				</xsl:when>
				<xsl:otherwise>
				<xsl:value-of select="12" />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text> OF </xsl:text>
			<xsl:value-of select="$pendingListingCount" />
			<xsl:text> TOTAL LISTINGS</xsl:text>
		</text>




		<xsl:if test="$pendingListingCount &gt; 0">
			<xsl:call-template name="ed-listings-table">
				<xsl:with-param name="status" select="'pending'" />
				<xsl:with-param name="colorScheme" select="'--pending-yellow'" />
				<xsl:with-param name="totalCount" select="$pendingListingCount" />
				<xsl:with-param name="listings" select="//listings/listing[@state='pending']" />
			</xsl:call-template>
		</xsl:if>

		<text x="50%" y="91%" class="center futura-text" font-size="110%" style="letter-spacing: 5.5px; word-spacing:6px;">
			<tspan fill="#e1e1e1">ADDRESSES  REDACTED - - - - - </tspan>
			<tspan fill="#b2934e">LOOSE LIPS END ESCROWS</tspan>
		</text>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>