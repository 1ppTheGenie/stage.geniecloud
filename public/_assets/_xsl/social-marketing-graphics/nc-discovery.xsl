<?xml version="1.0"?>
<!--
	Asset Name: Neighborhood Market Report Ad No.1
	Tags: 		Neighborhood Market, Report
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Facebook Post, Listing, Area, Map, MapIcon, ListingStatus, ListingCount
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-scripts">
		<xsl:if test="//output/@mapStyle!='no-map'">
			<xsl:call-template name="map-files" />

			<xsl:call-template name="mixed-listings">
				<xsl:with-param name="limit" select="//output/@listingCount" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'.leaflet-interactive {fill:#3388ff;stroke:#3388ff;fill-opacity:0.2;}'"/>
		</style>
		<xsl:choose>
			<xsl:when test="//output/@mapStyle!='no-map' or //area/image=''">
				<foreignObject x="0" y="0" width="100%" height="100%">
					<div data-width="100%" data-height="100%">
						<xsl:call-template name="map-output">
							<xsl:with-param name="style" select="'streets-v11'" />
							<xsl:with-param name="iconType" select="'flag'" />
						</xsl:call-template>
					</div>
				</foreignObject>
			</xsl:when>
			<xsl:otherwise>
				<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="concat('area-image-', //area/id)" />
						<xsl:with-param name="default" select="concat( //output/@siteUrl, '_assets/_img/place_holder.jpg' )" />
						<xsl:with-param name="preferArea" select="'true'" />
					</xsl:call-template>
				</image>

				<xsl:call-template name="map-overlay" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="map-overlay">
		<svg width="100%" height="20%" viewBox="0 0 100 100" preserveAspectRatio="none">
			<polygon fill-opacity="80%" fill="var(--theme-body-background)" stroke-width="2" stroke="var(--theme-emphasis-color)" x="0" y="0" points="0,2 0,70 50,100 100,70 100,2"></polygon>
		</svg>

		<text x="50%" y="8.25%" class="bold center middle upper" fill="var(--theme-heading-color)" stroke="none" font-size="325%" data-max-width="80%" style="font-family: var(--theme-heading-font);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="concat('area-name-', //area/id)" />
				<xsl:with-param name="default" select="//area/name" />
			</xsl:call-template>
		</text>

		<g style="transform: translate(0,78%)">
			<rect width="100%" height="20%" fill="var(--theme-body-background)" fill-opacity="80%"/>
			<text x="50%" y="4%" class="center" style="font-size:27px;line-height:7%;font-family: var(--theme-body-font);letter-spacing:4px;" fill="var(--theme-body-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketreport'" />
					<xsl:with-param name="default" select="'Neighborhood Market Report'" />
				</xsl:call-template>
			</text>
			<text x="50%" y="10%" class="center" style="font-size: 27px;font-family: var(--theme-body-font);letter-spacing:4px;" fill="var(--theme-body-color)">
				<xsl:value-of select="concat( genie:format-date( //output/@reportDate, '[MNn]'), ' Edition' )" />
			</text>
		</g>
	</xsl:template>
</xsl:stylesheet>