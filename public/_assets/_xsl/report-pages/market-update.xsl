<?xml version="1.0"?>
<!--
	Asset Name:	Market Update
	Tags:		Text, Infographic
	Supports:	Area, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'text { dominant-baseline: middle;}'" />

		</style>

		<image preserveAspectRatio="xMidYMid slice" width="100%" opacity="0.4" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="full-area-image-1" />
			</xsl:call-template>
		</image>

		<symbol id="up-icon" class="stat-icon">
			<xsl:choose>
				<xsl:when test="//statistics/@medianSalePrice div //statistics/previous/@medianSalePrice &lt; 1">
					<xsl:value-of select="'#down-icon'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'#up-icon'" />
				</xsl:otherwise>
			</xsl:choose>
		</symbol>

		<xsl:call-template name="svg-defs" />

		<g style="transform: translate(0%, 5%)">
			<xsl:variable name="timePeriod">
				<xsl:choose>
					<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
						<xsl:text>30 Day</xsl:text>
					</xsl:when>
					<xsl:otherwise>
<xsl:value-of select="concat( //areas/area[1]/statistics/@lookbackMonths, ' Month')" />

					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:call-template name="area-heading">
				<xsl:with-param name="default" select="concat( $timePeriod, ' Market Update' )" />
				<xsl:with-param name="id" select="'market-update-title'" />
			</xsl:call-template>
		</g>

		<xsl:variable name="maxAllPrices">
<xsl:for-each select="//previous/@medianSalePrice &#124; //statistics/@medianSalePrice">
<xsl:sort select="." order="descending" data-type="number" />

				<xsl:if test="position() = 1">
<xsl:value-of select="." />

				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<g style="transform:translate(2.5%,35%);">
			<g style="transform:translateX(2.5%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'5'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'middle'" />
					<xsl:with-param name="caption">
<xsl:value-of select="//date/@period" />

					</xsl:with-param>
					<xsl:with-param name="left-caption">
<xsl:value-of select="concat( //statistics/@soldPropertyTypeCount, ' sales' )" />

					</xsl:with-param>

<xsl:with-param name="width" select="//statistics/@medianSalePrice div $maxAllPrices" />


					<xsl:with-param name="value">
						<xsl:variable name="formattedPrice">
							<xsl:call-template name="format-price">
<xsl:with-param name="price" select="//statistics/@medianSalePrice" />

							</xsl:call-template>
						</xsl:variable>

						<xsl:value-of select="concat( 'Current Median Sales Price ', $formattedPrice )" />
					</xsl:with-param>
				</xsl:call-template>
			</g>

			<g style="transform:translate(2.5%, 13%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'3'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'middle'" />
					<xsl:with-param name="caption">
						<xsl:value-of select="//date/@previousPeriod" />
					</xsl:with-param>
					<xsl:with-param name="left-caption">
						<xsl:value-of select="concat( //statistics/previous/@totalSold, ' sales' )" />
					</xsl:with-param>
					<xsl:with-param name="width" select="//statistics/previous/@medianSalePrice div $maxAllPrices" />

					<xsl:with-param name="value">
						<xsl:variable name="formattedPrice">
							<xsl:call-template name="format-price">
								<xsl:with-param name="price" select="//statistics/previous/@medianSalePrice" />
							</xsl:call-template>
						</xsl:variable>

						<xsl:value-of select="concat( 'Previous Median Sales Price ', $formattedPrice )" />
					</xsl:with-param>
				</xsl:call-template>
			</g>

			<g style="transform:translate(3%,45%)">
				<g class="fast-fact">
					<image x="0" y="-7.5%" width="10%" height="15%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-sold.svg' )" />
						</xsl:attribute>
					</image>

					<text x="9%" y="0" class="bold super-large upper">
						<xsl:value-of select="//statistics/@averageDaysOnMarket" />
					</text>

					<g style="transform:translateX(2%)">
						<text class="upper">
							<tspan x="14%" y="-3%">Average</tspan>
							<tspan x="14%" y="0">Days on</tspan>
							<tspan x="14%" y="3%">Market</tspan>
						</text>
					</g>
				</g>

				<g class="fast-fact" style="transform:translateX(50%)">
					<image x="0" y="-7.5%" width="10%" height="15%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg' )" />
						</xsl:attribute>
					</image>

					<text x="9%" y="0" class="bold super-large">
						<xsl:value-of select="count($listingsTotalActive)" />
					</text>

					<g style="transform:translateX(2%)">
						<text class="upper">
							<tspan x="14%" y="-3%">Total</tspan>
							<tspan x="14%" y="0">Active</tspan>
							<tspan x="14%" y="3%">Listings</tspan>
						</text>
					</g>
				</g>
			</g>
		</g>

		<g style="transform: translate(82%, 37.5%);">
			<polyline style="fill:#fff;" filter="url(#blurred-shadow)" points="-20,55 0,40 0,0 190,0 190,90 0,90 0,70"></polyline>

			<text class="center" x="7%" y="5%" font-size="250%" font-weight="bold">
				<xsl:value-of select="format-number( ( //statistics/@medianSalePrice div //previous/@medianSalePrice ) - 1, '0.##%' )" />
			</text>

			<text class="center" x="7%" y="10%" font-size="90%">
				<xsl:value-of select="$lookbackPeriodName" />
			</text>

			<use x="1.5%" y="5%" width="25%" height="3%" fill="#30dd10">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#up-icon' )" />
			</use>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>