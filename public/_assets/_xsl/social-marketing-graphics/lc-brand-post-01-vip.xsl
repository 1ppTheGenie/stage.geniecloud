<?xml version="1.0"?>
<!--
	Asset Name:	LC-BRAND-POST-01-VIP
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="lc-social-media.xsl"/>
	<xsl:import href="lc-prop-posts.xsl"/>

	<xsl:template name="svg-body">
		<xsl:call-template name="lc-prop-vip-common">
			<xsl:with-param name="status" select="'false'"/>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>