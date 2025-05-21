<?xml version="1.0"?>
<!--
	Asset Name: LC-OH-INVITE-01A
	Tags:		Flyer
	Sizes:		Letter
	Supports:	Listing, Area, QRCode, AsPDF
	Pages:		flyers/lc-oh-invite-01a
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:import href="lc-oh-invite.xsl" />
	
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
				g#footer{
					transform: translate(2.5%, 98.3%);
				}
				g#footer text{
					font-size: 11px;
					fill: #94949D;
				}
				g#footer text a tspan{
					fill: #337ab7;
				}
			'"/>
		</style>

		<xsl:call-template name="lc-oh-invite">
			<xsl:with-param name="sub-heading" select="concat( 'Your Dream ', $singularPropertyType, ' is waiting for&#160;you!')" />
		</xsl:call-template>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>