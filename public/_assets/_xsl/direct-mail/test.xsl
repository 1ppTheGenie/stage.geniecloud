<?xml version="1.0"?>
<!--
	Asset Name: Test
	Tags: 		Direct Mail
	Sizes:		Postcard
	Supports:	Area, Print, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<rect x="0%" y="0%" height="100%" width="40%" fill="var(--theme-body-background)"></rect>
		<text x="8%" y="8%" font-style="futura" font-weight="900" fill="var(--theme-heading-color)" font-size="300%">JUST SOLD</text>
		<text x="2%" y="21%" font-style="futura" font-weight="900" fill="var(--theme-heading-color)" font-size="120%">IN CROCKER HIGHLANDS - TRESTLE GLEN-2</text>
		<text x="4%" y="28%" font-size="180%" font-weight="700">
			<tspan x="10%">SCAN TO SEE</tspan>
			<tspan x="5%" dy="8%">HOW YOUR <tspan fill="var(--theme-sub-heading-color)" font-size="140%" y="35%">HOME</tspan>
			</tspan>
			<tspan x="10%" dy="8%">COMPARES!</tspan>
		</text>
		<text x="4%" y="28%" font-size="180%" font-weight="700">
		</text>
	</xsl:template>
</xsl:stylesheet>