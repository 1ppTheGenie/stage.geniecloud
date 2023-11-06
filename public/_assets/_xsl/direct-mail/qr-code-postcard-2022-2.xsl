<?xml version="1.0"?>
<!--
	Asset Name: Qr code postcard 2022 2
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="qr-code-postcards-2022.xsl" />


	<xsl:template name="svg-body">
		<rect x="61%" y="0" width="39%" height="100%" fill="var(--theme-body-background)"></rect>

		<image x="61%" y="0" width="39%" height="49.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
				<xsl:with-param name="preferPrimary" select="'true'" />
			</xsl:call-template>
		</image>

		<image x="61%" y="50.2%" width="39%" height="49.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<xsl:call-template name="cropped-container" />
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