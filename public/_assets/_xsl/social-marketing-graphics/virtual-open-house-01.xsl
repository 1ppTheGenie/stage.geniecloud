<?xml version="1.0"?>
<!--
	Asset Name:	Virtual Open House - Style 1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Instagram, LinkedIn
	Supports:	Open House, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<image x="2.5%" y="4.5%" width="47.25%" height="44.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<image x="51.25%" y="4.5%" width="46.25%" height="44.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<image x="2.5%" y="51.25%" width="47.25%" height="44.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>

		<image x="51.25%" y="51.25%" width="47.25%" height="44.25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>

		<rect x="30%" y="38%" width="40%" height="25%" fill="var(--theme-body-background)" fill-opacity="80%" />
		<text x="50%" y="41%" class="upper" text-anchor="middle" fill="var(--theme-heading-color)" style="font-size: 300%;letter-spacing: 2;font-weight:600;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'openhouse'" />
				<xsl:with-param name="default" select="'Open'" />
			</xsl:call-template>
		</text>
		<text x="50%" y="50%" class="upper" text-anchor="middle" fill="var(--theme-heading-color)" style="font-size: 300%;letter-spacing: 2;font-weight:600;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'openhouse'" />
				<xsl:with-param name="default" select="'House'" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>