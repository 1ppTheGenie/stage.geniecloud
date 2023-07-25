<?xml version="1.0"?>
<!--
	Asset Name:			Market Report Insider Instant Download - Style 7
	Component:			InstantDownload
	Tags:				Infographic
	Sizes:				Embed
	Supports:			Area, DateRange, CampaignName, DownloadOptions
	Permission: 		Embed Widgets
	Default Download:	area-insider-reports/market-insider
	Approved: 			False
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="embeds.xsl"/>

	<xsl:template name="body">
		<xsl:variable name="renderAs" select="'html'"/>

		<xsl:call-template name="embed">
			<xsl:with-param name="component" select="'InstantDownload'" />
			<xsl:with-param name="variation" select="7" />
			<xsl:with-param name="renderAs" select="$renderAs"/>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>