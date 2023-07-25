<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Great Intel
	Tags: 		Map, Listings, Infographic
	Sizes:		Facebook, Facebook Ad, Facebook Post
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="map-listings-table.xsl"/>

	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='active']" />

	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/intel-white-bg-01.jpg' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="36.5%" fill="#0e1232" class="center futura-text super-bold" style="font-size:270%;">Great intel, but you’re still missing the</text>

		<text x="50%" y="45%" fill="#b2934e" class="center futura-text super-bold" style="font-size:270%;">most critical piece of information.</text>

		<text x="50%" y="55%" fill="#0e1232" class="center futura-text" style="font-size:110%;">(and this classified, top-secret document is useless to you without it)</text>
	</xsl:template>
</xsl:stylesheet>