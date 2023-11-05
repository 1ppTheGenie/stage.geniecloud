<?xml version="1.0"?>
<!--
	Asset Name: Listings on the Market
	Tags: 		Infographic
	Supports:	Area, Multi-Listing
	Sizes:		Facebook, Postcard
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
		 	g#icons {
				transform: translate( 0, 45% );
			}
			g#icons text {
				fill: #555;
}'" />
		</style>

		<image preserveAspectRatio="xMidYMid slice" width="100%" opacity="0.4" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<xsl:call-template name="area-heading">
			<xsl:with-param name="id" select="'listing-on-market-title'" />
			<xsl:with-param name="default" select="'Listings on market'" />
			<xsl:with-param name="showDate" select="'false'" />
		</xsl:call-template>

		<g id="icons">
			<g style="transform:translate(0,0)">
				<image width="20%" height="20%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-sold.svg' )" />
					</xsl:attribute>
				</image>
				<g style="transform:translate(16%)">
					<text>
						<tspan class="super-large bold">
							<xsl:value-of select="count($listingsTotalNew)" />
						</tspan>
						<tspan x="0" y="70" class="upper">New Listings</tspan>
					</text>
				</g>
			</g>
			<g style="transform:translate(32.5%)">
				<image width="20%" height="20%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg' )" />
					</xsl:attribute>
				</image>
				<g style="transform:translate(16%)">
					<text style="dominate">
						<tspan class="super-large bold">
							<xsl:value-of select="count($listingsTotalActive)" />
						</tspan>
						<tspan x="0" y="70" class="upper">Active Listings</tspan>
					</text>
				</g>
			</g>
			<g style="transform:translate(67.5%)">
				<image width="20%" height="20%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-pending.svg' )" />
					</xsl:attribute>
				</image>
				<g style="transform:translate(16%)">
					<text>
						<tspan class="super-large bold">
							<xsl:value-of select="count($listingsTotalPending)" />
						</tspan>
						<tspan x="0" y="70" class="upper">Pending Listings</tspan>
					</text>
				</g>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>