<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Sold Listing
	Tags: 		Map, Listings, Infographic
	Sizes:		Facebook, Facebook Ad, Facebook Post
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="map-listings-table.xsl" />


	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='sold']" />
	<xsl:variable name="soldistingCount" select="count($mapListingNodes)" />

	<xsl:template name="svg-body">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/blue-back-image.jpg' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="8.6%" fill="#e1e1e1" class="center futura-text upper" font-size="170%" style="letter-spacing: 5px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat(//area/name ,' ', $singularPropertyType,'s')" />
			</xsl:call-template>
		</text>

		<text x="50%" y="13.9%" class=" center futura-text super-bold" font-size="450%">
			<tspan x="36%" fill="#e1e1e1">Sold In Past </tspan>
			<tspan x="70%" fill="#b2934e">12 Months</tspan>
		</text>

		<xsl:call-template name="ed-showing-listing">
<xsl:with-param name="nodes" select="$listingsTotalSold" />

			<xsl:with-param name="min" select="number(12)" />
		</xsl:call-template>

		<xsl:variable name="soldListingCount" select="count($mapListingNodes)" />
		<xsl:variable name="mobile" select="//agent[1]/mobile" />

		<xsl:if test="$soldListingCount &gt; 0">
			<xsl:call-template name="ed-listings-table">
				<xsl:with-param name="status" select="'sold'" />
				<xsl:with-param name="colorScheme" select="'--sold-red'" />
				<xsl:with-param name="totalCount" select="$soldListingCount" />
				<xsl:with-param name="listings" select="//listings/listing[@state='sold']" />
			</xsl:call-template>
		</xsl:if>

		<text xmlns="" x="54%" y="92%" fill="#e1e1e1" class="center futura-text" font-size="70%">
			<tspan x="28.6%">
                    Your security clearance unlocks even more property details; text
			</tspan>
			<tspan x="49.8%" class="bold">
				<xsl:value-of select="concat(//agent[1]/marketingName, ' at ', //agent[1]/mobile)" />
			</tspan>
			<tspan x="71.5%">for exclusive access. This message will self-destruct in 5 seconds.
			</tspan>
		</text>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>