<?xml version="1.0"?>
<!--
Asset Name: Listings on the Market
Tags: 		Social Marketing Ad
Sizes: 		Facebook, Postcard
Supports: 	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<image preserveAspectRatio="xMidYMid slice" width="100%" opacity="0.4" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<g>
			<g style="transform:translate(0%, 2.5%)">
				<xsl:call-template name="area-heading">
					<xsl:with-param name="default" select="'listing on market'" />
					<xsl:with-param name="id" select="'market-update-title'" />
				</xsl:call-template>
			</g>
			<g style="transform:translate(5%,45%)">
				<g class="fast-fact" style="transform:translateX(0)">
					<image x="-2%" y="-4%" width="15%" height="25%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-sold.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="20%" class="upper">
						<tspan x="14%" y="0" class="bold super-large">
							<xsl:value-of select="$listingsTotalNew" />
						</tspan>
						<tspan x="14%" y="13%">
							new listings
						</tspan>
					</text>
				</g>

				<g class="fast-fact" style="transform:translateX(31%)">
					<image x="-2%" y="-4%" width="15%" height="25%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg' )" />
						</xsl:attribute>
					</image>

					<text x="0" y="20%" class="upper">
						<tspan x="14%" y="0" class="bold super-large">
							<xsl:value-of select="$listingsTotalActive" />
						</tspan>
						<tspan x="14%" y="13%">
							active listings
						</tspan>
					</text>
				</g>

				<g class="fast-fact" style="transform:translateX(62%)">
					<image x="-2%" y="-4%" width="15%" height="25%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-pending.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="20%" class="upper">
						<tspan x="14%" y="0" class="bold super-large">
							<xsl:value-of select="$listingsTotalPending" />
						</tspan>
						<tspan x="14%" y="13%">
							pending listings
						</tspan>
					</text>
				</g>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>