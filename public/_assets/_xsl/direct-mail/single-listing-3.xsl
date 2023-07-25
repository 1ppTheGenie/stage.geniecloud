<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing No.3
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="single-listing-common-03.xsl"/>

	<xsl:variable name="listingStatusCaption">
		<xsl:choose>
			<xsl:when test="number(//single/statusTypeID)=1">
				<xsl:value-of select="'Just Listed'" />
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=2">
				<xsl:value-of select="'Just Sold'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'Pending'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<style>
			<xsl:value-of select="'
		    text{
		        dominant-baseline: auto;
		    }
			text.listing-address-two-line tspan.heading {
				font-weight: bold!important;
				font-size: 200%!important;
			}
			text.listing-address-two-line tspan:last-child {
				transform: translateY(6%);
				font-size: 150%!important;
			}

			.icon-stat tspan {
				font-weight: var(--theme-bold);
				font-size: 75%;
			}
			.icon-stat tspan:first-child {
				font-size: 125%;
			}'" />
		</style>

		<xsl:call-template name="single-listing-common-03" />

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>