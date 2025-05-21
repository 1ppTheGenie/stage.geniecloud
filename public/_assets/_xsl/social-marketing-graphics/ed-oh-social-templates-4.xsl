<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Social Templates 4
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
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

    <image x="0" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
      <xsl:call-template name="switch-image">
        <xsl:with-param name="id" select="image-1" />
        <xsl:with-param name="idx" select="1" />
      </xsl:call-template>
    </image>

    <xsl:choose>
      <xsl:when test="//output/@themeHue = 'light'">
        <image x="0%" y="55%" width="100%" height="45%" preserveAspectRatio="xMidYMid slice">
          <xsl:attribute name="href">
            <xsl:value-of select="concat(//output/@siteUrl, '_assets/_img/bottomlightlayer-dark.png')" />
          </xsl:attribute>
        </image>
      </xsl:when>
      <xsl:otherwise>
        <image x="0%" y="60%" width="100%" height="40%" preserveAspectRatio="xMidYMid slice">
          <xsl:attribute name="href">
            <xsl:value-of select="concat(//output/@siteUrl, '_assets/_img/bottomlightlayer-light.png')" />
          </xsl:attribute>
        </image>
      </xsl:otherwise>
    </xsl:choose>

    <!-- Gradient layer start -->

    <!-- Gradient layer End -->

    <xsl:choose>
      <xsl:when test="count(//openHouse/session) &gt; 0">
        <text class="upper" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" x="3.8%" y="81.4%"
          font-weight="800" font-size="60" data-max-width="70%" style="letter-spacing: 1px">
          Open 
          <xsl:call-template name="editable">
            <xsl:with-param name="id" select="'Open House'" />
            <xsl:with-param name="default" select="concat(substring-before(//openHouse/session[1]/@starts, substring(//openHouse/session[1]/@starts, string-length(//openHouse/session[1]/@starts) - 1)), '-', substring-before(//openHouse/session[1]/@ends, substring(//openHouse/session[1]/@ends, string-length(//openHouse/session[1]/@ends) - 1)), substring(//openHouse/session[1]/@ends, string-length(//openHouse/session[1]/@ends) - 1))"
              />
          </xsl:call-template>
        </text>
      </xsl:when>
      <xsl:otherwise>
        <text class="upper" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" x="3.8%" y="81.4%"
          font-weight="800" font-size="60" data-max-width="70%" style="letter-spacing: 1px">
          Open 1-4pm
        </text>
      </xsl:otherwise>
    </xsl:choose>

    <text class="capitalize" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" x="3.8%" y="90.4%"
      font-weight="600" font-size="30" data-max-width="70%" style="letter-spacing: 0.5px">
      <xsl:call-template name="editable">
        <xsl:with-param name="id" select="'areaname'" />
        <xsl:with-param name="default" select="concat(//single/address/street,', ', //area/name)" />
      </xsl:call-template>
    </text>

    <svg x="67.63%" y="54%" width="500" height="500">
      <polygon points="350,186 350,500 65,500" fill="var(--theme-body-background)"></polygon>
    </svg>

    <svg x="78%" y="77.4%" width="200" height="200">
      <!-- Background Circle -->
      <circle cx="95" cy="100" r="90" stroke="var(--theme-body-background)" stroke-width="9" fill="#e3e3e3" />

      <!-- Define clipPath inside the same SVG -->
      <defs>
        <clipPath id="clipCircle">
          <circle r="86" cx="95" cy="100" />
        </clipPath>
      </defs>

      <!-- Image with the same center as the circle -->
      <image x="-5" y="5" style="transform:rotate(-2deg); transform-origin:50% 50%" width="200" height="200" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
        <xsl:attribute name="href">
          <xsl:value-of select="//agent[1]/photo" />
        </xsl:attribute>
      </image>
    </svg>
  </xsl:template>
</xsl:stylesheet>