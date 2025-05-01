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
				<xsl:with-param name="id" select="image-2" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		 <xsl:choose>
        <xsl:when test="//output/@themeHue = 'light'">
          <image x="0%" y="70%" width="100%" height="30%" preserveAspectRatio="xMidYMid slice">
            <xsl:attribute name="href">
              <xsl:value-of select="concat(//output/@siteUrl, '_assets/_img/bottomlightlayer-dark.png')" />
            </xsl:attribute>
          </image>
        </xsl:when>
        <xsl:otherwise>
          <image x="0%" y="60%" width="100%" height="40%" preserveAspectRatio="xMidYMid slice">
            <xsl:attribute name="href">
              <xsl:value-of select="concat(//output/@siteUrl, '_assets/_img/bottom-gradient-layer-2.png')" />
            </xsl:attribute>
          </image>
        </xsl:otherwise>
      </xsl:choose>

		<!-- Gradient layer start -->
		
		<!-- Gradient layer End -->
		<xsl:if test="count(//openHouse/session) &gt; 0">
			<text class="upper" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" x="3.8%" y="82%" font-weight="800" font-size="60" data-max-width="70%" style="letter-spacing: 1px;">
				Open 1-4pm<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="concat(//openHouse/session[1]/@starts,' - ', //openHouse/session[1]/@ends)" />
			</xsl:call-template>
			</text>
		</xsl:if>

		

		<text class="capitalize" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" x="3.8%" y="91%" font-weight="600" font-size="30" data-max-width="70%" style="letter-spacing: 0.5px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="concat(//single/address/street,', ', //area/name)" />
			</xsl:call-template>
		</text>

		<svg x="67.63%" y="54%" width="500" height="500">
            <polygon points="350,200 350,500 70,500" fill="var(--theme-heading-color)"></polygon>
         </svg>
		
		<svg x="77%" y="78%" width="200" height="200">
		<!-- Background Circle -->
		<circle cx="95" cy="100" r="90" stroke="var(--theme-heading-color)" stroke-width="9" fill="#e3e3e3" />

		<!-- Define clipPath inside the same SVG -->
		<defs>
			<clipPath id="clipCircle">
			<circle r="86" cx="95" cy="100" />
			</clipPath>
		</defs>

		<!-- Image with the same center as the circle -->
		<image 
			x="0" 
			y="10" 
			width="200" 
			height="200" 
			preserveAspectRatio="xMidYMid meet" 
			clip-path="url(#clipCircle)">
			<xsl:attribute name="href">
			<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		</svg>
	</xsl:template>

</xsl:stylesheet>