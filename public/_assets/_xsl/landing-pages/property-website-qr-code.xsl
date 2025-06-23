<?xml version="1.0"?>
<!--
	Asset Name: Property Website QR Code
	Tags: 		propert qr
	Sizes:		instagram-Square
	Supports:	Area, Print
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<xsl:call-template name="qr-code">
            <xsl:with-param name="width" select="'100%'" />
            <xsl:with-param name="height" select="'100%'" />
        </xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
