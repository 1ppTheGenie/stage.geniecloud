<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Social Templates 3
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1 
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
  <xsl:import href="common.xsl" />
  <xsl:import href="lc-social-media.xsl" />

  <xsl:template name="svg-body">
    <image x="0%" y="0%" width="50%" height="50%" preserveAspectRatio="xMidYMid slice">
      <xsl:call-template name="switch-image">
        <xsl:with-param name="id" select="image-2" />
        <xsl:with-param name="idx" select="2" />
      </xsl:call-template>
    </image>

    <rect x="50%" y="0%" width="50%" height="50%" fill="var(--theme-body-background)"></rect>
    <rect x="0%" y="50%" width="50%" height="50%" fill="var(--theme-heading-color)"></rect>

    <image x="50%" y="50%" width="50%" height="50%" preserveAspectRatio="xMidYMid slice">
      <xsl:call-template name="switch-image">
        <xsl:with-param name="id" select="image-1" />
        <xsl:with-param name="idx" select="1" />
      </xsl:call-template>
    </image>

    <g transform="translate(810, 180)" text-anchor="middle">
      <text y="0" font-size="35" font-weight="900" fill="var(--theme-heading-color)"
        font-family="var(--theme-heading-font)" dominant-baseline="hanging">
        <xsl:call-template name="editable">
          <xsl:with-param name="id" select="'streetname'" />
          <xsl:with-param name="default" select="concat(//single/address/street,' ')" />
        </xsl:call-template>
      </text>

      <text y="45" font-size="40" font-weight="400" fill="var(--theme-heading-color)"
        font-family="var(--theme-heading-font)" dominant-baseline="hanging">
        <xsl:call-template name="editable">
          <xsl:with-param name="id" select="'areaname'" />
          <xsl:with-param name="default" select="//area/name" />
        </xsl:call-template>
      </text>
    </g>    
    <xsl:choose>
      <xsl:when test="count(//openHouse/session) &gt; 0">
        <text xmlns="" fill="var(--theme-body-background)" font-size="130%">
          <tspan x="13.5%" y="69.5%" class="upper" font-family="var(--theme-heading-font)" font-size="40"
            font-weight="700">Open House</tspan>
          <tspan x="14.4%" class="upper" y="75.5%" font-family="var(--theme-heading-font)" font-size="40"
            font-weight="700">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'Open House'" />
              <xsl:with-param name="default" select="concat(//openHouse/session[1]/@starts, ' - ', //openHouse/session[1]/@ends)" />
            </xsl:call-template>
          </tspan>
        </text>
      </xsl:when>
      <xsl:otherwise>
        <text xmlns="" fill="var(--theme-body-background)" font-size="130%">
          <tspan x="13.5%" y="69.5%" class="upper" font-family="var(--theme-heading-font)" font-size="40"
            font-weight="700">Open House</tspan>
          <tspan x="14.4%" class="upper" y="75.5%" font-family="var(--theme-heading-font)" font-size="40"
            font-weight="700">1pm - 4pm</tspan>
        </text>
      </xsl:otherwise>
    </xsl:choose>

    <rect fill="#fff" stroke-width="0" fill-opacity="1" x="49.5%" y="0" width="0.7%" height="100%" />
    <rect fill="#fff" stroke-width="0" fill-opacity="1" x="0%" y="49.5%" width="100%" height="0.7%" />
  </xsl:template>
</xsl:stylesheet>