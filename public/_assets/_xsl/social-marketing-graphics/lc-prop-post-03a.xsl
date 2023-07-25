<?xml version="1.0"?>
<!--
	Asset Name:	LC-PROP-POST-03-A
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="lc-prop-posts.xsl"/>

	<xsl:template name="svg-body">
		<xsl:call-template name="lc-prop-post-03-common">
			<xsl:with-param name="status" select="'false'"/>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>