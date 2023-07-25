<?xml version="1.0"?>
<!--
	Asset Name: Test 2
	Tags: 		Direct Mail
	Sizes:		Postcard
	Supports:	Area, Print, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<text x="20%" y="10%" class="center" fill="#ffffff" font-size="300%" font-weight="800" font-family="var(--theme-heading-font)" style="letter-spacing: 1px;">
			<xsl:text>Just Sold</xsl:text>
		</text>
		<text x="20%" y="20%" class="center" fill="#ffffff" font-weight="500" font-family="var(--theme-heading-font)" font-size="140%">
			<xsl:text>IN CROCKER HIGHLANDS - TRESTLE GLEN-2</xsl:text>
		</text>

		<text font-size="140%" font-weight="600" x="20%" y="30%" class="center">
			<tspan>
				<xsl:text>SCAN TO SEE </xsl:text>
			</tspan>
			<tspan x="20%" dy="5%">
				<xsl:text>HOW YOUR HOME </xsl:text>
			</tspan>

			<tspan x="20%" dy="5%">
				<xsl:text>COMPARES!</xsl:text>
			</tspan>
		</text>

		<text x="20%" y="50%" class="center" fill="#ffffff" font-weight="500" font-family="var(--theme-heading-font)" font-size="140%">
			<xsl:text>7844 VISTA LAZANJA</xsl:text>
		</text>

		<text x="20%" y="55%" class="center" fill="#ffffff" font-weight="500" font-family="var(--theme-heading-font)" font-size="140%">
			<xsl:text>RANCHO BERNARDO, CA 92127</xsl:text>
		</text>

		<rect x="13%" y="65%" width="10%" height="18%" stroke="var(--theme-body-color)" stroke-width="1" rx="70" ry="70"></rect>
		<clipPath id="clipCircle">
			<circle r="6%" cx="18%" cy="74%" fill="#fff"></circle>
		</clipPath>
		<image x="11.5%" y="65.7%" width="14%" height="21%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)" href="https://reliqus-genie-permanent.s3.ap-south-1.amazonaws.com/Andy-headshot.png"></image>

		<text x="18%" y="85%" class="center" fill="#ffffff" font-weight="500" font-family="var(--theme-heading-font)" font-size="140%">
			<xsl:text>ANDY TSE</xsl:text>
		</text>
		<text x="18%" y="90%" class="center" fill="#ffffff" font-weight="500" font-family="var(--theme-heading-font)" font-size="140%">
			<xsl:text>408.807.8808</xsl:text>
		</text>
	</xsl:template>
</xsl:stylesheet>

<!-- 
	JUST SOLD
IN CROCKER HIGHLANDS - TRESTLE GLEN-2
SCAN TO SEE
HOW YOUR HOME
COMPARES!
7844 VISTA LAZANJA
RANCHO BERNARDO, CA 92127
 -->