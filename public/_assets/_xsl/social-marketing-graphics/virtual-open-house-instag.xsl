<?xml version="1.0"?>
<!--
	Asset Name:	Virtual Open House - Instagram Version
	Tags:		Social Marketing Ad
	Sizes:		Instagram, Facebook, LinkedIn
	Supports:	Open House, Listing
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<image x="2%" y="2%" width="47%" height="47%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<image x="51%" y="2%" width="47%" height="47%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<image x="2%" y="51%" width="47%" height="47%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>

		<image x="51%" y="51%" width="47%" height="47%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>

		<rect x="26.5%" y="26.5%" width="47%" height="47%" fill="var(--theme-body-background)" fill-opacity="80%" />

		<text x="50%" y="45%" class="upper bold" text-anchor="middle" fill="var(--theme-heading-color)" style="font-size: 250%;overflow:hidden;">Virtual</text>
	</xsl:template>
</xsl:stylesheet>