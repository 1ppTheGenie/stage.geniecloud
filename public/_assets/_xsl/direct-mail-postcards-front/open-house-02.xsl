<?xml version="1.0"?>
<!--
	Asset Name:	Open House - No.2
	Tags: 		Open House
	Sizes:		Facebook, Instagram
	Supports:	Listing, Print
	Approved: 	False
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
		<rect stroke="var(--theme-body-color)" stroke-width="8" fill-opacity="0" x="3.2%" y="5%" width="93%" height="87%"/>
		<rect width="100%" y="40%" height="24%" fill="var(--theme-body-background)" fill-opacity="0.7" />

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform:translate(0%,40%);">
			<text x="50%" y="1.5%" class="large medium sub-heading upper center" style="font-size: 280%; font-weight:600;">
				<xsl:call-template name="listing-address-line-one"/>
			</text>
			<text x="50%" y="9.8%" class="large medium sub-heading upper center" style="font-size: 280%; font-weight:600;">
				<xsl:call-template name="listing-address-line-two"/>
			</text>
			<text x="50%" y="18%" class="sub-heading center bold" style="font-size:140%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Wednesday, August 4th, 2:52 am - 2:52 am'" />
					<xsl:with-param name="default" select="'Wednesday, August 4th, 2:52 am - 2:52 am'" />
				</xsl:call-template>
			</text>
		</g>

		<image x="42.5%" y="70%" width="15%" height="15%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<filter x="-0.35" y="-0.7" width="1.7" height="2.4" id="solid">
			<feFlood flood-color="var(--theme-body-background)"/>
			<feComposite in="SourceGraphic" operator="xor" />
		</filter>

		<text x="50%" y="90%" class="upper narrow center bold" style="font-size:160%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'openhouse'" />
				<xsl:with-param name="default" select="'Open House'" />
			</xsl:call-template>
		</text>
		<text x="50%" y="90%" fill="var(--theme-body-color)" filter="url(#solid)" class="upper narrow center bold" style="font-size:120%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'openhouse1'" />
				<xsl:with-param name="default" select="'Open House'" />
			</xsl:call-template>
		</text>

		<text fill="var(--theme-heading-color)">Recipients to verify all information.</text>
	</xsl:template>
</xsl:stylesheet>