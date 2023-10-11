<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing No.4
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />
<xsl:import href="single-listing-common-04.xsl" />


	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<style>
			<xsl:value-of select="'
			text.listing-address-two-line tspan.heading {
				font-weight: bold!important;
				font-size: 200%!important;
			}
			text.listing-address-two-line tspan:last-child {
				transform: translateY(6%);
				font-size: 150%!important;
			}
 			.stat-icon svg {
				 fill:var(--theme-body-background);
			 }'" />
		</style>
		<g>
			<xsl:call-template name="single-listing-common-04" />
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>