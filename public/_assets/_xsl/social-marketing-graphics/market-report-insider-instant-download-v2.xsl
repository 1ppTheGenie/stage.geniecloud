<?xml version="1.0"?>
<!--
	Asset Name:	Market Report Insider Instant Download V2?
	Tags:		Social Marketing Ad
	Supports:	Facebook Post, Listing, Area
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:param name="price_change" select="//areas/area/statistics/previous/@medianSalePrice - //areas/area/statistics/@medianSalePrice" />

		<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-body-background)"></rect>
		<image x="0" y="-10%" width="100%" height="100%" preserveAspectRatio="xMidYMid meet" style="transform: scaleY(1.2);">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/overlay.png' )" />
			</xsl:attribute>
		</image>
		<use class="center" x="12%" y="50%" width="12%" height="12%" fill="var(--active-green)">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#up-arrow-circle' )" />
		</use>
		<g style="transform: translate(33%, 31%);">
			<text x="16%" y="0" class="upper bold center medium" fill="var(--theme-heading-color)" data-max-width="60%">
				<xsl:value-of select="concat( //area/name,' ', $singularPropertyType , ' Values' )" />
			</text>
			<g style="transform: translate(3%,10%);">
				<rect x="0" y="0" stroke="var(--theme-heading-color)" stroke-width="0.3" fill-opacity="1" width="10%" height="1" fill="var(--theme-heading-color)">
				</rect>

				<rect x="0" y="0.7%" stroke="var(--theme-heading-color)" stroke-width="0.3" fill-opacity="1" width="10%" height="1" fill="var(--theme-heading-color)"></rect>
			</g>

			<text class="center upper bold medium" fill="var(--theme-heading-color)">
				<tspan dx="17%" y="5%">Have Risen an Average of:</tspan>
			</text>
		</g>
		<image x="0" y="23%" opacity="0.3" width="100%" height="100%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bar-graph.png' )" />
			</xsl:attribute>
		</image>
		<g style="transform: translate(36%, 7%);">
			<text x="50%" y="40.5%" class="center upper" style="fill:var(--theme-heading-color);">
				<tspan x="19%" style="font-weight: 500;font-size:300%;">$</tspan>
				<tspan style="font-size:450%;">
					<xsl:choose>
						<xsl:when test="$price_change &lt; 0">
							<xsl:value-of select="format-number( $price_change * -1, '###,###')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="format-number( $price_change, '###,###')" />
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
				<tspan dx="-34%" dy="16%" style="font-size:100%;fill:var(--theme-heading-color);font-weight:500">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="'in the last 12 months'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>