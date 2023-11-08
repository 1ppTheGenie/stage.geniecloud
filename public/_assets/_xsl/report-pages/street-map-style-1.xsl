<?xml version="1.0"?>
<!--
	Asset Name: Street Map Style 1
	Tags:		Map, Listings, Infographic
	Sizes:		Facebook
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<xsl:call-template name="mixed-listings" />
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'text {dominant-baseline:middle;}'" />

		</style>

		<foreignObject x="0" y="0" width="100%" height="100%">
			<div data-width="100%" data-height="100%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
					<xsl:with-param name="iconType" select="'flag'" />
				</xsl:call-template>
			</div>
		</foreignObject>

		<svg height="38%" width="25%" y="15%">
			<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-sub-heading-color)" fill-opacity="0.7"></rect>

			<rect x="0%" y="0%" height="26%" width="100%" fill="var(--theme-sub-heading-color)"></rect>
			<text x="4.5%" y="14%" class="upper" fill="var(--theme-body-background)" style="font-size:150%;font-weight:800;letter-spacing:1px;font-family: var(--theme-heading-font);" data-max-width="20%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanames'" />
					<xsl:with-param name="default" select="concat(//area/name, ' Area ', $propertyType)" />
				</xsl:call-template>
			</text>

			<svg x="4%" y="32%">
<circle cy="6%" r="13" fill="var(--new-blue)" cx="5%"></circle>
				<text x="5%" y="6.6%" class="center bold" style="font-size:85%;" fill="#fff">
					<xsl:value-of select="count($listingsTotalNew)" />
				</text>
				<text x="12%" y="6.6%" class="upper" style="font-weight:800" fill="var(--theme-body-background)">
						New (Active)
				</text>
			</svg>
			<svg x="4%" y="49%">
				<circle cy="6%" r="13" fill="var(--active-green)" cx="5%"></circle>
				<text x="5%" y="6.6%" class="center bold" style="font-size:85%;" fill="#fff">
					<xsl:value-of select="count($listingsTotalActive)" />
				</text>
				<text x="12%" y="6.6%" class="upper" style="font-weight:800" fill="var(--theme-body-background)">
						Active
				</text>
			</svg>
			<svg x="4%" y="66%">
				<circle cy="6%" r="13" fill="var(--pending-yellow)" cx="5%"></circle>
				<text x="5%" y="6.6%" class="center bold" style="font-size:85%;" fill="#fff">
					<xsl:value-of select="count($listingsTotalPending)" />
				</text>
				<text x="12%" y="6.6%" class="upper" style="font-weight:800" fill="var(--theme-body-background)">
						Pending
				</text>
			</svg>
			<svg x="4%" y="84%">
				<circle cy="6%" r="13" fill="var(--sold-red)" cx="5%"></circle>
				<text x="5%" y="6.6%" class="center bold" style="font-size:85%;" fill="#fff">
<xsl:value-of select="count($listingsTotalSold)" />

				</text>
				<text x="12%" y="6.6%" class="upper" style="font-weight:800" fill="var(--theme-body-background)">
						Sold
				</text>
			</svg>
		</svg>
	</xsl:template>
</xsl:stylesheet>