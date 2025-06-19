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
		<rect x="62.2%" y="0" width="39%" height="100%" fill="var(--theme-heading-color)"></rect>

		<image x="62.38%" y="0" width="38.8%" height="49.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
				<xsl:with-param name="preferPrimary" select="'true'" />
			</xsl:call-template>
		</image>

		<image x="62.38%" y="50.2%" width="38.8%" height="49.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>
		<text x="82%" y="90%" data-max-width="30%" class="center upper" fill="#fff" style="font-size:135%;font-weight:600;font-family:var(--theme-body-font);">
			<tspan>
				<xsl:value-of select="//single/address/street" />
				<xsl:text> &#8226; </xsl:text>
				<xsl:value-of select="//single/address/city" />
			</tspan>
		</text>
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<xsl:call-template name="qr-code-2022-content-part-1" />

		<g style="transform:translate(39.1%, 22.1%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'21.8%'" />
			</xsl:call-template>
		</g>
	</xsl:template>
</xsl:stylesheet>