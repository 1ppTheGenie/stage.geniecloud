<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
	<xsl:include href="global-variables.xsl"/>

	<xsl:preserve-space elements="*" />

	<xsl:output method="html" encoding="utf-8" indent="no" omit-xml-declaration="yes" doctype-public="html" />

	<xsl:template match="/">
		<html lang="en">
			<xsl:attribute name="class">
				<xsl:value-of select="concat( 'genie-collection id-', //output/@collectionID, ' template-', //output/@collectionTemplate, ' plugin-v', //output/@version )" />
			</xsl:attribute>

			<script>
				<xsl:value-of select="concat( 'window.gg = {}; let ggSettings = { agentID:`', //output/@userId, '`, areaID:', number(//area/id), ', mlsNumber:`', //single/mlsNumber, '`, mlsID:`', //single/mlsID, '`, pricePercent:`', //output/@pricePercent, '`, blurPrice:', boolean(//output/@blurPrice='1' or //output/@blurPrice='true'), ', requireSignin:', boolean(//output/@requireSignin='1' or //output/@requireSignin='true'), ', propertyType:', number(//area/statistics/@propertyType), ',noCopyright:', boolean(//output/@noCopyright='1' or //output/@noCopyright='true'), ',openHouseTimes:`', //output/@openHouseTimes, '`,hideAVM:', boolean(//output/@hideAVM='1' or //output/@hideAVM='true'), ',downloadUrl:`', //output/@downloadUrl, '`,isLeadCapture:', boolean(//output/@isLeadCapture='1' or //output/@isLeadCapture='true'), ', lead: { propertyId:', number(//lead/property_id), ', firstName:`', //lead/property/firstName, '`, lastName:`', //lead/property/lastName, '`, email:`', //lead/property/emailAddress, '`}};' )" />
				<xsl:value-of select="concat( 'window.ghub = { SINGLE:  0, CONDO: 1, site_url: `', //output/@siteUrl, '`, api_url: `', //output/@apiUrl, '`, mapStyle: `satellite-v9`, google_key: `', //output/@googleKey, '`, mapbox_key: `', //output/@mapboxKey, '` };')" />
			</script>

			<xsl:call-template name="listing-command" />
		</html>
	</xsl:template>

	<xsl:template name="css-links">
		<xsl:param name="primaryCSS" select="'common'" />
		<xsl:param name="secondaryCSS" select="''" />

		<link rel="stylesheet" type="text/css" href="/_assets/_css/genie-colors.css" />

		<xsl:if test="$primaryCSS!=''">
			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href">
					<xsl:value-of select="concat(  '/_assets/listing-commands/css/', $primaryCSS, '.css')" />
				</xsl:attribute>
			</link>

			<xsl:if test="$primaryCSS='common'">
				<link rel="stylesheet" media="screen and (min-width:1024px)" href="/_assets/listing-commands/css/wide.css" />
			</xsl:if>
		</xsl:if>

		<xsl:if test="$secondaryCSS!=''">
			<link rel="stylesheet" type="text/css">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( '/_assets/listing-commands/css/', $secondaryCSS, '.css')" />
				</xsl:attribute>
			</link>
		</xsl:if>

		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( '/_assets/themes/', //output/@theme, '.css')" />
			</xsl:attribute>
		</link>
	</xsl:template>

	<xsl:template name="standard-header">
		<xsl:param name="title" select="concat( $listingAddressLine1, ', ' , $listingAddressLine2, ' | ', //agent[1]/marketingName, ' ' , //agent[1]/address/company )" />

		<xsl:param name="description" select="substring(concat( 'View details, pricing, photos, floorplan, for ',  $listingAddressLine1, '. ' , //single/description, '...') ,0, 373 )" />

		<xsl:param name="site_name" select="concat( 'Presented by ', //agent[1]/marketingName, ' ' , //agent[1]/address/company  )" />

		<xsl:param name="primaryCSS" select="'common'" />
		<xsl:param name="secondaryCSS" select="''" />
		<xsl:param name="includeFooterCSS" select="'true'" />

		<head>
			<meta name="viewport" content="width=device-width" />
			<meta name="description">
				<xsl:attribute name="content">
					<xsl:value-of select="$description" />
				</xsl:attribute>
			</meta>
			<meta itemprop="description">
				<xsl:attribute name="content">
					<xsl:value-of select="$description" />
				</xsl:attribute>
			</meta>
			<meta charset="utf-8"/>

			<title>
				<xsl:value-of select="$title" />
			</title>

			<xsl:call-template name="css-links">
				<xsl:with-param name="primaryCSS" select="$primaryCSS" />
				<xsl:with-param name="secondaryCSS" select="$secondaryCSS" />
			</xsl:call-template>
		</head>
	</xsl:template>
</xsl:stylesheet>