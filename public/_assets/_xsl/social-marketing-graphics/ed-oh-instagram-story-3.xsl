<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Instagram Story 3
	Tags:		Agent Ad, LC
	Sizes:		Instagram Story 
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

<xsl:import href="common.xsl" />
<xsl:import href="lc-social-media.xsl" />


	<xsl:template name="svg-body">
		<!-- <link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link> -->

		<rect x="0" y="0" height="100%" width="100%" fill="#fff"></rect>

		<image x="3%" y="1.3%" width="94%" height="40%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<image x="3%" y="41.8%" width="46.7%" height="27.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-2" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<rect x="50.5%" y="41.8%" height="27.5%" fill="var(--theme-heading-color)" width="46.2%"></rect>
		<g transform="translate(800, 1000)" text-anchor="middle">
  <text x="0" y="0" 
        fill="var(--theme-body-background)" 
        font-family="var(--theme-heading-font)" 
        font-size="40" 
        font-weight="900" 
        text-anchor="middle">
    <tspan x="0">Open House</tspan>
    <tspan x="0" dy="1.2em">1–4pm</tspan>
  </text>
</g>


		<rect x="3%" y="70%" width="46.7%" height="28.5%" fill="var(--theme-body-background)"></rect>
		<g  transform="translate(280, 1530)" text-anchor="middle">
  <text 
    x="0" y="0" 
  >
    <tspan id="street-text" fill="var(--theme-heading-color)" 
    font-size="40" 
    font-weight="900" 
	font-family="var(--theme-heading-font)"
    style="line-height:1.2;" >
      <!-- Replace this with dynamic XSL content if needed -->
      <xsl:call-template name="editable">
        <xsl:with-param name="id" select="'areanames'" />
        <xsl:with-param name="default" select="concat(//single/address/street,' ')" />
      </xsl:call-template>
    </tspan>
  </text>

  <text 
    x="0" y="50" 
  >
    <tspan id="area-name-text" fill="var(--theme-heading-color)" 
    font-size="40" 
    font-weight="400"
	font-family="var(--theme-heading-font)">
      <xsl:call-template name="editable">
        <xsl:with-param name="id" select="'areanames'" />
        <xsl:with-param name="default" select="//area/name" />
      </xsl:call-template>
    </tspan>
  </text>
</g>


		<rect x="50.5%" y="70%" width="46.7%" height="28.5%" fill="#e3e3e3"></rect>
		<image x="50.6%" y="70.2%" width="46.6%" height="28.4%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
	</xsl:template>
</xsl:stylesheet>