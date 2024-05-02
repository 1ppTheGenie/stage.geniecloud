<?xml version="1.0"?>
<!--
	Asset Name: Active Listings - Satellite Map
	Tags:		Map, Listings, Infographic
	Sizes:		Facebook
	Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="//listings/listing[@state='active']">
			    <xsl:sort select="@isAgent" data-type="number" order="descending"/>
    			<xsl:sort select="@sortDate" data-type="number" order="descending"/>

				<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',listPrice:'&quot;, @listPrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;', dom:&quot;, @dom, &quot;},&quot; )" />
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<foreignObject x="0%" y="0%" width="100%" height="100%">
					<div width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="map-output">
				<xsl:with-param name="style" select="'streets-v11'" />
				<xsl:with-param name="iconType" select="'flag'" />
			</xsl:call-template>
			</div>
		</foreignObject>
	</xsl:template>
</xsl:stylesheet>