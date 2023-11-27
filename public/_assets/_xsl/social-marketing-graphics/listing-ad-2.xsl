<?xml version="1.0"?>
<!--
	Asset Name:	Listing Ad 02
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<text x="50%" y="2%" class="sub-heading center bold" style="font-size:220%;">
			<xsl:value-of select="$status-caption" />
		</text>

		<g style="transform: translateY( 10%);">
			<image preserveAspectRatio="xMidYMid slice" width="60%" height="85%">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="image-1" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>

			<text x="62.5%" y="12%" class="bold" style="font-size:110%;">
				<tspan>
<xsl:call-template name="soldListedPrice" />

				</tspan>
			</text>

			<g style="transform:translate(49%,20%)">
<rect width="49%" height="34%" style="fill:var(--theme-body-background);" />


				<image x="2%" y="2%" preserveAspectRatio="xMidYMid slice" width="45%" height="30%">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="image-2" />
						<xsl:with-param name="idx" select="2" />
					</xsl:call-template>
				</image>

				<g class="upper" style="transform: translate( 13.5%, 35%); font-weight:600">
					<text y="0">
<xsl:call-template name="listing-address-line-one" />

					</text>
					<text y="3.5%">
						<xsl:value-of select="//single/address/city" />
						<xsl:text>,</xsl:text>
					</text>

					<text y="7%">
						<xsl:value-of select="//single/address/state" />
						<xsl:text>&#32;</xsl:text>
						<xsl:value-of select="//single/address/zip" />
					</text>

					<image x="2%" y="12%" width="20%" height="12%" id="logo" preserveAspectRatio="xMinYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="$companyLogo" />
						</xsl:attribute>
					</image>
				</g>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>