<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Social Templates 2
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  expand-text="yes"
>
  <xsl:import href="common.xsl" />
  <xsl:import href="lc-social-media.xsl" />

  <xsl:template name="svg-body">
    <!-- <link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link> -->
    <rect
      x="0"
      y="0"
      width="100%"
      height="100%"
      fill="var(--theme-body-background)"
    ></rect>

    <image
      x="26%"
      y="4.8%"
      width="70%"
      height="70%"
      stroke-width="5"
      preserveAspectRatio="xMidYMid slice"
    >
      <xsl:call-template name="switch-image">
        <xsl:with-param name="id" select="image-2" />
        <xsl:with-param name="idx" select="2" />
      </xsl:call-template>
    </image>

    <text
      x="-385"
      y="280"
      transform="rotate(-90, 40, 200)"
      class="upper"
      style="
        color: var(--theme-heading-color);
        font-family: var(--theme-heading-font);
      "
      font-size="40"
      font-weight="600"
    >
      <xsl:value-of select="//area/name" />
    </text>

    <rect
      fill="#e3e3e3"
      stroke-width="1%"
      stroke="#fff"
      fill-opacity="1"
      x="2%"
      y="61.5%"
      width="34%"
      height="33%"
    />

    <image
      x="2.5%"
      y="62%"
      width="33%"
      height="32%"
      preserveAspectRatio="xMidYMin slice"
    >
      <xsl:attribute name="href">
        <xsl:value-of select="//agent[1]/photo" />
      </xsl:attribute>
    </image>
    <xsl:choose>
      <xsl:when test="count(//openHouse/session) &gt; 0">
        <text
          font-family="var(--theme-heading-font)"
          x="40.8%"
          y="78.8%"
          fill="var(--theme-heading-color)"
          font-weight="800"
          font-size="47"
        >
          <xsl:text>Open</xsl:text>
          <xsl:call-template name="editable" >
            <xsl:with-param name="id" select="'Open House'" />
            <xsl:with-param
              name="default"
              select="concat(substring-before(//openHouse/session[1]/@starts, substring(//openHouse/session[1]/@starts, string-length(//openHouse/session[1]/@starts) - 1)), '-', substring-before(//openHouse/session[1]/@ends, substring(//openHouse/session[1]/@ends, string-length(//openHouse/session[1]/@ends) - 1)), substring(//openHouse/session[1]/@ends, string-length(//openHouse/session[1]/@ends) - 1))"
            />
          </xsl:call-template>
        </text>
      </xsl:when>
      <xsl:otherwise>
        <text
          font-family="var(--theme-heading-font)"
          x="40.8%"
          y="78.8%"
          fill="var(--theme-heading-color)"
          font-weight="800"
          font-size="47"
        >
          Open <tspan>1-4pm</tspan>
        </text>
      </xsl:otherwise>
    </xsl:choose>

    <text
      font-family="var(--theme-heading-font)"
      x="40.8%"
      y="85.5%"
      fill="var(--theme-heading-color)"
      font-weight="400"
      font-size="47"
      data-max-width="55%"
      style="letter-spacing: -1px"
    >
      <xsl:value-of select="$listingAddressLine1" />
    </text>
  </xsl:template>
</xsl:stylesheet>
