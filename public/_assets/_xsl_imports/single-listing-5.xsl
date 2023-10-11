<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing No.1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="single-listing-common-05.xsl" />


	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:call-template name="single-listing-common-05" />
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>