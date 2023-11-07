<?xml version="1.0"?>
<!--
	Asset Name: Qr code postcard 2022 1
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
			<xsl:text>
				var style = 'streets-v11';
				var listings=[</xsl:text>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:call-template name="listing-photo-marker">
			<xsl:with-param name="mapLeft" select="number(39)" />
			<xsl:with-param name="pinLeft" select="number(35)" />
			<xsl:with-param name="pinTop" select="number(35)" />
		</xsl:call-template>

		<xsl:call-template name="cropped-container" />

		<foreignObject x="52%" y="5%" width="45%" height="85%">
			<div data-width="45%" data-height="85%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
				</xsl:call-template>
			</div>
		</foreignObject>
	</xsl:template>

	<xsl:template name="cropped-content">
		<xsl:call-template name="qr-code-2022-content-part-1" />

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
			</xsl:call-template>
		</g>
	</xsl:template>
</xsl:stylesheet>