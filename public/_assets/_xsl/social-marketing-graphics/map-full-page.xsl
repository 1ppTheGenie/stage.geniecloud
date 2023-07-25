<?xml version="1.0"?>
<!--
	Asset Name: Map (Full Page)
	Tags:		Map, Listings, Infographic
	Sizes:		Facebook, Facebook Ad, Postcard, A4, Twitter
	Supports:	Area, MultiListing, Map, MapKey, MapIcon, ListingStatus, ListingCount
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<xsl:call-template name="mixed-listings">
			<xsl:with-param name="limit" select="//output/@listingCount" />
			<xsl:with-param name="status" select="//output/@listingStatus" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="svg-body">
		<foreignObject x="0" y="0" width="100%" height="100%">
			<div data-width="100%" data-height="100%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="//output/@mapStyle" />
					<xsl:with-param name="iconType">
						<xsl:choose>
							<xsl:when test="//output/@mapIcon !=''">
								<xsl:value-of select="//output/@mapIcon" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'dot'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</div>
		</foreignObject>

		<xsl:if test="//output/@mapKey='true' or //output/@listingStatus='all'">
			<svg x="0%" y="10%" height="25%" width="25%">
				<xsl:call-template name="map-key"/>
			</svg>
		</xsl:if>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>