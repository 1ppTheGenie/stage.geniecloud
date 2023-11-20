<?xml version="1.0"?>
<!--
	Asset Name: Neighborhood Market Report Ad No.2
	Tags: 		Neighborhood Market, Report
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Facebook Post, Listing, Area, Map, MapIcon, ListingStatus, ListingCount
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

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
			<xsl:value-of select="'.leaflet-interactive {fill:#3388ff;stroke:#3388ff;fill-opacity:0.2;}'" />
		</style>
		<xsl:choose>
			<xsl:when test="//output/@mapStyle!='no-map'">
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
		<rect width="50%" x="0%" y="79%" height="5.5%" fill="#b31f24" />
		
		<text x="2.5%" y="81.8%" class="bold upper large middle" fill="#fff" style="font-family: var(--theme-body-font);font-size:24px;letter-spacing:1px;" data-max-width="44%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'breakingnews'" />
				<xsl:with-param name="default" select="'BREAKING NEWS'" />
			</xsl:call-template>
		</text>

		<rect width="102%" x="-1" y="84.5%" height="7%" fill="var(--theme-body-background)" fill-opacity="80%" />

		<text x="2.8%" y="88%" class="heading middle bold" style="font-size: 150%;font-family: var(--theme-sub-heading-font);" data-max-width="90%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanamemarket'" />
				<xsl:with-param name="default" select="concat( 'The State of', '&#160;', //area/name, ' Real Estate Market' )" />
			</xsl:call-template>
		</text>
	</xsl:template>

</xsl:stylesheet>