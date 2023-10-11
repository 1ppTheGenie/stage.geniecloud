<?xml version="1.0"?>
<!--
	Asset Name:	Listing Map - Style Two
	Component:	ListingMapStyleOne
	Tags:		Infographic, Listings, Map
	Sizes:		Embed
	Supports:	Area, Map, ListingStatus, DateRange
	Permission: Embed Widgets
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="embeds.xsl" />


	<xsl:template name="body">
<xsl:param name="renderAs" select="'html'" />


		<xsl:call-template name="embed">
			<xsl:with-param name="component" select="'ListingMapStyleTwo'" />
			<xsl:with-param name="mode" select="//output/@propertyStatus" />
			<xsl:with-param name="mapStyle" select="//output/@mapStyle" />
<xsl:with-param name="renderAs" select="$renderAs" />

		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>