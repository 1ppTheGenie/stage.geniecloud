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
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>

		<style>
			<xsl:value-of select="'
			.open-house-fobject{
				position: relative;
			    font-family: var(--theme-subtitle-font);
			    fill: var(--theme-heading-color);
			    font-weight: 700;
			    font-size: 360%;
			    height: 100%;
			    width: 50%;
			    transform: translate(5%,2%);
			}
			.open-house-div{
				width: 450px;
			    height: auto;
			    position: absolute;
			    bottom: 7%;
			    left: 7%;
			    z-index: 999;
			}'" />
		</style>

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<!-- Gradient layer start -->

		<xsl:if test="//output/@themeShade='Dark'">
			<image x="0%" y="70%" width="100%" height="30%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<!-- <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottomlightlayer-dark.png' )" /> -->
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/black-gradient-bottom.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<xsl:if test="//output/@themeShade='Light'">
			<image x="0%" y="60%" width="100%" height="40%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottomlightlayer-light.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>

		<!-- Gradient layer End -->

		<!-- <foreignObject x="7.5%" y="67%" font-family="var(theme-subtitle-font)" fill="var(theme-heading-color)" font-weight="700" font-size="360%" height="50%" width="50%">
			<div style="width: 65%;">
				<h2 contenteditable="true" class="upper futura-text" style="color:var(theme-heading-color);font-size: 64px;line-height: 68px;margin-bottom: 34px;">
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
			<div style="width: 90%;">
				<h2 contenteditable="true" class="upper futura-text" style="color:var(theme-heading-color); font-size: 64px;line-height: 68px;margin-bottom: 34px;">
					Open Today 1-4pm
				</h2>				
			</div>			
		</foreignObject> -->

		<foreignObject font-family="var(--theme-subtitle-font)" fill="var(--theme-heading-color)" font-weight="700" font-size="360%" height="50%" width="50%" class="open-house-fobject">
			<div class="open-house-div">
				<div style="">
					<h2 contenteditable="true" class="upper futura-text" style="color:var(--theme-heading-color);font-size: 60px;line-height: 60px;margin:0 0;">
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
				<div style="">
					<h2 contenteditable="true" class="upper futura-text" style="color:var(--theme-heading-color); font-size: 60px;line-height: 60px;margin-top: 30px;">Open Today 1PM - 4PM</h2>
				</div>
			</div>
		</foreignObject>
	</xsl:template>

</xsl:stylesheet>