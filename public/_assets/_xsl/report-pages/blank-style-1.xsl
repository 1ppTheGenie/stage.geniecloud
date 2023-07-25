<?xml version="1.0"?>
<!--
	Asset Name:	Blank Style 1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'placeholder'"/>
				<xsl:with-param name="default" select="'https://place-hold.it/1200x628/.png'"/>
			</xsl:call-template>
		</image>
	</xsl:template>
</xsl:stylesheet>