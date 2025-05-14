<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Instagram Story 1
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

		 <style>
			<xsl:value-of select="'
			.open-house-fobject{
				position: relative;
			    font-family: var(theme-subtitle-font);
			    fill: var(theme-heading-color);
			    font-weight: 700;
			    font-size: 60px;
			    height: 100%;
			    width: 50%;
			    transform: translate(5%,2%);
			}
			.open-house-div{		
			    position: absolute;
			    bottom: 17.5%;
			    left: 7%;	
			}'" />
		</style> 

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<!-- Gradient layer start -->

		<xsl:if test="//output/@themeHue='dark'">
			<image x="0%" y="70%" width="100%" height="30%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<!-- <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottomlightlayer-dark.png' )" /> -->
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/black-gradient-bottom.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<xsl:if test="//output/@themeHue='light'">
			<image x="0%" y="60%" width="100%" height="40%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottomlightlayer-light.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>

		 <foreignObject font-weight="700" font-size="60" height="50%" width="50%" class="open-house-fobject">
			<div class="open-house-div">
				<div style="">
					<h2 class="upper" style="font-family:var(--theme-heading-font); color:var(theme-heading-color);font-size: 60px;line-height: 1;margin:0 0;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'areanames'" />
							<xsl:with-param name="default" select="concat(//single/address/street,' ')" />
						</xsl:call-template>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'areanames'" />
							<xsl:with-param name="default" select="//area/name" />
						</xsl:call-template>
					</h2>
				</div>
				<!-- <div style="display:none">
					<h2 class="upper" style="font-family:var(theme-heading-font); color:var(theme-heading-color); font-size: 60px;line-height: 1;margin-top: 30px;">Open Today <br/> 1PM - 4PM</h2>
				</div> -->
			</div>
		</foreignObject>
		<xsl:choose>
      <xsl:when test="count(//openHouse/session) &gt; 0">
		<text x="90" y="85.5%" fill="var(theme-heading-color)" font-family="var(--theme-heading-font)" font-size="60" font-weight="700" style="line-height: 1;text-transform: uppercase;">
			<tspan>Open Today</tspan>
		  <tspan x="90" dy="3.5%">
            <xsl:call-template name="editable">
              <xsl:with-param name="id" select="'Open House'" />
              <xsl:with-param name="default" select="concat(//openHouse/session[1]/@starts, ' - ', //openHouse/session[1]/@ends)" />
            </xsl:call-template>
          </tspan>
		</text>
      </xsl:when>
      <xsl:otherwise>
        <text x="90" y="85.5%" fill="var(theme-heading-color)" font-family="var(--theme-heading-font)" font-size="60" font-weight="700" style="line-height: 1;text-transform: uppercase;">
			<tspan>Open Today</tspan>
			<tspan x="90" dy="3.5%">1pm - 4pm</tspan>
		</text>
      </xsl:otherwise>
    </xsl:choose>
	</xsl:template>

</xsl:stylesheet>