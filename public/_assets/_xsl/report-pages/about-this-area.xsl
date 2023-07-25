<?xml version="1.0"?>
<!--
	Asset Name:	About This Area
	Tags:		Text
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<rect x="10%" y="20%" width="80%" height="60%" fill-opacity="0" stroke="var(--theme-body-color)" />

		<rect x="11.5%" y="22.5%" width="77%" height="55%" fill="var(--theme-sub-heading-color)" />

		<text x="50%" y="40%" class="large bold center upper" style="fill:var(--theme-body-background);">
			<xsl:value-of select="//area/name" />
		</text>
		<text x="50%" y="49%" class="large center capitalize" style="fill:var(--theme-body-background);">Market Statistics</text>
	</xsl:template>
</xsl:stylesheet>