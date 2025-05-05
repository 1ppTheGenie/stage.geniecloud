<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Instagram Story 4
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

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<!-- Gradient layer start  -->

		<xsl:if test="//output/@themeHue='dark'">
			<image x="0%" y="70%" width="100%" height="30%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/black-gradient-bottom.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<xsl:if test="//output/@themeHue='light'">
			<image x="0%" y="50%" width="100%" height="50%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottomlightlayer-light.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<!-- Gradient layer End -->

		<xsl:choose>
      <xsl:when test="count(//openHouse/session) &gt; 0">
		<text x="4%" y="86%" fill="var(--theme-heading-color)" font-weight="800" font-family="var(--theme-heading-font)" font-size="50" style="letter-spacing:1px;word-spacing:-10px;">
			<xsl:text>Open</xsl:text>
          <xsl:call-template name="editable">
            <xsl:with-param name="id" select="'Open House'" />
            <xsl:with-param
              name="default"
              select="concat(substring-before(//openHouse/session[1]/@starts, substring(//openHouse/session[1]/@starts, string-length(//openHouse/session[1]/@starts) - 1)), '-', substring-before(//openHouse/session[1]/@ends, substring(//openHouse/session[1]/@ends, string-length(//openHouse/session[1]/@ends) - 1)), substring(//openHouse/session[1]/@ends, string-length(//openHouse/session[1]/@ends) - 1))"
            />
          </xsl:call-template>
		</text>
      </xsl:when>
      <xsl:otherwise>
        <text x="4%" y="86%" fill="var(--theme-heading-color)" font-weight="800" font-family="var(--theme-heading-font)" font-size="50" style="letter-spacing:1px;word-spacing:-10px;">
			 Open 1-4pm
		</text>
      </xsl:otherwise>
    </xsl:choose>
		<text x="4%" y="89.5%" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-weight="600" font-size="40" data-max-width="80%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'address'" />
				<xsl:with-param name="default" select="concat(//single/address/street,' ')" />
			</xsl:call-template>
		</text>

		<text x="4%" y="92%" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-weight="500" font-size="35" data-max-width="80%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="//area/name" />
			</xsl:call-template>
		</text>
		<svg x="788" y="1600">
			<polygon points="292,11 292,326 11,326" fill="var(--theme-heading-color)" />
		</svg>
		<svg x="78.5%" y="86.5%" width="180%" height="100%">
			<circle cx="98" cy="99" r="89" stroke="#fff" stroke-width="8" fill="#e1e1e1"></circle>
		</svg>

		<g transform="rotate(7, 940, 1775)">
			<clipPath id="clipCircle">
				<circle r="5.5%" cx="87.5%" cy="91.6%"></circle>
			</clipPath>

			<image x="80%" y="78%" width="15%" height="29%" preserveAspectRatio="xMaxYMid meet" clip-path="url(#clipCircle)">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
		</g>
	</xsl:template>

</xsl:stylesheet>