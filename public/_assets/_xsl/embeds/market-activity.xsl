<?xml version="1.0"?>
<!--
	Asset Name:	Market Activity
	Sizes:		Embed
	Supports:	Area, Map, BothPropertyTypes, DateRange
	Component:	MarketActivity
	Permission: Embed Widgets
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="embeds.xsl"/>

	<xsl:template name="body">
		<xsl:param name="renderAs" select="'html'"/>

		<xsl:call-template name="embed">
			<xsl:with-param name="component" select="'MarketActivity'" />
			<xsl:with-param name="renderAs" select="$renderAs"/>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>