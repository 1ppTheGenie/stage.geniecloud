<?xml version="1.0"?>
<!--
	Asset Name: Qr code postcard 2022 3
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="qr-code-postcards-2022.xsl" />


	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:text>var listings=[];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:call-template name="listing-photo-marker">
			<xsl:with-param name="mapLeft" select="number(61)" />
			<xsl:with-param name="pinLeft" select="number(15)" />
			<xsl:with-param name="pinTop" select="number(35)" />
		</xsl:call-template>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
			</xsl:call-template>
		</g>

		<xsl:call-template name="qr-code-2022-content-part-1" />
	</xsl:template>
</xsl:stylesheet>