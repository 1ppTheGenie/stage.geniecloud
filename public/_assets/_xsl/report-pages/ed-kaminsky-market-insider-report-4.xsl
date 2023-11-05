<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Market Insider Report 4
	Tags:		Map, Listings, Infographic
	Sizes:		Facebook
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>
		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="//listings/listing">
				<xsl:if test="position() &lt;= 50">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',listPrice:'&quot;, @listPrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;', dom:&quot;, @dom, &quot;},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>

		<!-- <xsl:call-template name="mixed-listings" /> -->
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text {dominant-baseline:middle;}'" />
		</style>

		<foreignObject x="0" y="0" width="100%" height="100%">
			<div data-width="100%" data-height="100%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
					<!-- <xsl:with-param name="iconType" select="'dot'" /> -->
				</xsl:call-template>
			</div>
		</foreignObject>

		<svg height="58.5%" width="31.2%" x="5.5%" y="34.8%">
			<rect x="0" y="0" width="100%" height="112%" fill="#1b1c38cc"></rect>
			<text x="6%" y="14%" class="upper futura-text" fill="#fff" font-size="130%" font-weight="400" style="   
				  letter-spacing:6px;" data-max-width="20%">
		         CLASSIFIED:
			</text>
			<text x="6%" y="25%" fill="#fff" class="futura-text" font-size="240%" font-weight="800" style=" letter-spacing:1px;" data-max-width="22%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanames'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
			</text>
			<text x="6%" y="35%" fill="#fff" class="futura-text" style=" font-size:170%;font-weight:800;letter-spacing:1px;">
				Spy Satellite Overview
			</text>
			<line x1="5%" y1="35%" x2="56%" y2="35%" style="stroke:red;stroke-width:3" />

			<svg x="6%" y="44%">
				<circle cy="6%" r="16" fill="var(--new)" cx="5%"></circle>
				<text x="5%" y="6.6%" class="center bold" style="font-size:92%;" fill="#fff">
					<xsl:value-of select="count($listingsTotalNew)" />
				</text>
				<text x="12%" y="6.6%" font-size="120%" class="futura-text" font-weight="600" fill="#fff">
					<xsl:call-template name="view-period">
						<xsl:with-param name="prefix" select="'Listed in past '" />
					</xsl:call-template>
				</text>
			</svg>
			<svg x="6%" y="56%">
				<circle cy="6%" r="16" fill="var(--active-green)" cx="5%"></circle>
				<text x="5%" y="6.6%" class="center bold" style="font-size:92%;" fill="#fff">
					<xsl:value-of select="count($listingsTotalActive)" />
				</text>
				<text x="12%" y="6.6%" font-size="120%" class="futura-text" font-weight="600" fill="#fff">
						Currently for sale
				</text>
			</svg>
			<svg x="6%" y="68%">
				<circle cy="6%" r="16" fill="var(--pending-yellow)" cx="5%"></circle>
				<text x="5%" y="6.6%" class="center bold" style="font-size:92%;" fill="#fff">
					<xsl:value-of select="count($listingsTotalPending)" />
				</text>
				<text x="12%" y="6.6%" font-size="120%" class="futura-text" font-weight="600" fill="#fff">
						Pending
				</text>
			</svg>
			<svg x="6%" y="80%">
				<circle cy="6%" r="16" fill="var(--sold-red)" cx="5%"></circle>
				<text x="5%" y="6.6%" class="center bold" style="font-size:92%;" fill="#fff">
					<xsl:value-of select="count($listingsTotalSold)" />
				</text>
				<text x="12%" y="6.6%" font-size="120%" class="futura-text" font-weight="600" fill="#fff">
					<xsl:call-template name="view-period">
						<xsl:with-param name="prefix" select="'Sold in past '" />
					</xsl:call-template>
				</text>
			</svg>
		</svg>
	</xsl:template>
</xsl:stylesheet>