<?xml version="1.0"?>
<!--
	Asset Name:	Just Listed
	Tags:		Social Marketing Ad
	Sizes:		Postcard, Print
	Supports:	Listing
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
<rect stroke="var(--theme-body-color)" stroke-width="8" fill-opacity="0" x="3.2%" y="5%" width="93%" height="89%" />

		<g style="transform:translate(0%,40%)">
			<rect width="100%" height="19%" fill="var(--theme-body-background)" fill-opacity="0.7" />
			<text x="50%" y="0%" class="large medium sub-heading upper center" style="font-size: 300%; font-weight:600;">
<xsl:call-template name="listing-address-line-one" />

			</text>
			<text x="50%" y="10%" class="large medium sub-heading upper center" style="font-size: 300%; font-weight:600;">
<xsl:call-template name="listing-address-line-two" />

			</text>
		</g>
		<image x="43%" y="65.5%" width="20%" height="20%" id="logo" preserveAspectRatio="xMidYMid meet" dominant-baseline="middle" transform="translate(-75,0)">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<filter x="-0.7" y="-0.7" width="2.5" height="2.3" id="solid">
<feFlood flood-color="var(--theme-body-background)" />

			<feComposite in="SourceGraphic" operator="xor" />
		</filter>

		<xsl:variable name="soldListed">
<xsl:value-of select="$soldListed" />

		</xsl:variable>

		<text x="50%" y="90%" filter="url(#solid)" class="upper bold center" style="font-size:150%;">
			<tspan class="narrow">Just</tspan>
			<tspan>
				<xsl:value-of select="concat( '&#160;', $soldListed )" />
			</tspan>
		</text>

		<text x="50%" y="90%" fill="var(--theme-body-color)" class="upper bold center" style="font-size:150%;">
			<tspan class="narrow">Just</tspan>
			<tspan>
				<xsl:value-of select="concat( '&#160;', $soldListed )" />
			</tspan>
		</text>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>