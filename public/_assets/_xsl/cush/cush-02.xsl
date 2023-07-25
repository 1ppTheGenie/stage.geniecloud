<?xml version="1.0"?>
<!--
	Asset Name: Cush 02
	Tags: 		Social Marketing Ad
	Sizes:		Facebook
	Supports:	Area, Print
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-02.jpg' )" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="cropped-container" />
	</xsl:template>
	<xsl:template name="cropped-content">
	</xsl:template>
</xsl:stylesheet>
