<?xml version="1.0"?>
<!--
	Asset Name: Active Listings Map
	Tags:		Map, Listings, Infographic
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Facebook Post, Area, MultiListing, Map, MapKey, MapIcon, ListingStatus, ListingCount
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="social-cta">
		<xsl:value-of select="'Override this value'" />
	</xsl:template>

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper">
			<xsl:with-param name="nobg" select="'true'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="//listings/listing[@state='active']">
				<xsl:if test="position() &lt;= 6">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;', dom:&quot;, @dom, &quot;},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<foreignObject x="0" y="0" width="100%" height="100%">
			<div data-width="100%" data-height="100%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="//output/@mapStyle" />
					<xsl:with-param name="iconType" select="//output/@mapIcon" />
				</xsl:call-template>
			</div>

			<xsl:if test="//output/@mapKey='true'">
				<svg x="2%" y="2%" height="30%" width="27.5%">
					<xsl:call-template name="map-key"/>
				</svg>
			</xsl:if>
		</foreignObject>
	</xsl:template>
</xsl:stylesheet>