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

			.icon-stat tspan {
				font-size: 75%;
			}
			
			.icon-stat tspan:first-child {
				font-size: 125%;
			}
			g#listing-room-details {
			    transform: translate(5%, 59.5%);
			}'" />
		</style>

		<xsl:call-template name="single-listing-common-05" />

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>