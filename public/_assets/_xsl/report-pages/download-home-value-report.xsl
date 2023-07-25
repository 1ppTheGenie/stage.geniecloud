<?xml version="1.0"?>
<!--
	Asset Name:	Download your home value report
	Tags:		Text
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<rect x="10%" y="20%" width="80%" height="60%" fill-opacity="0" stroke="var(--theme-body-color)" />

		<rect x="11.5%" y="22.5%" width="77%" height="55%" fill="var(--theme-heading-color)" />

		<text x="50%" y="40%" class="bold center capitalize" style="font-size:400%;fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'DownloadHVR1'" />
				<xsl:with-param name="default" select="'Download your free'" />
			</xsl:call-template>
		</text>
		<text x="50%" y="52.5%" class="center capitalize" style="font-size:340%;fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'DownloadHVR2'" />
				<xsl:with-param name="default" select="'home value report'" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>