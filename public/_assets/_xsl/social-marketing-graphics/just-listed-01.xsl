<?xml version="1.0"?>
<!--
	Asset Name:	Just Listed No.1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="5" fill-opacity="0" x="3.2%" y="5%" width="93%" height="89%"/>
		<g transform="translate(0 250)">
			<rect width="100%" height="130" fill="var(--theme-body-background)" fill-opacity="0.7" />
			<text x="50%" y="1.4%" class="large medium sub-heading upper center" style="font-size: 300%; font-weight:600;">
				<xsl:call-template name="listing-address-line-one"/>
			</text>
			<text x="50%" y="11%" class="large medium sub-heading upper center" style="font-size: 300%; font-weight:600;">
				<xsl:call-template name="listing-address-line-two"/>
			</text>
		</g>
		<image class="center" x="0%" y="64%" width="100%" height="20%" id="logo" preserveAspectRatio="xMidYMid meet" dominant-baseline="middle">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<filter x="-0.7" y="-0.7" width="2.5" height="2.3" id="solid">
			<feFlood flood-color="var(--theme-body-background)"/>
			<feComposite in="SourceGraphic" operator="xor" />
		</filter>

		<text x="50%" y="90%" filter="url(#solid)" class="upper center medium">
			<xsl:value-of select="$status-caption" />
		</text>

		<text x="50%" y="90%" fill="var(--theme-body-color)" class="upper center medium">
			<xsl:value-of select="$status-caption" />
		</text>

		<g id="footer">
			<text fill="var(--theme-heading-color)">Recipients to verify all information.</text>
		</g>
	</xsl:template>
</xsl:stylesheet>