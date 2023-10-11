<?xml version="1.0"?>
<!--
	Asset Name: Fast Facts Letter No.2
	Tags:		Social Marketing Ad
	Sizes:		US Letter
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			rect#rounded-rect {
			    transform: translateY(-4px);
			}
			text.center.central {
			    transform: translateY(-4px);
			}
            text{
	           dominant-baseline:middle;	      
}'" />
		</style>
		<g>
			<xsl:call-template name="letter-report-header">
				<xsl:with-param name="title" select="'Fast Facts'" />
				<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
			</xsl:call-template>

			<text x="50%" y="20%" class="heading center" font-size="30px">
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'Last '" />
				</xsl:call-template>
			</text>

			<g style="transform:translate(19%,25%)">
				<xsl:call-template name="property-count-letter">
					<xsl:with-param name="transform" select="'transform:translateX(-12%)'" />
					<xsl:with-param name="icon" select="'home-plus-icon'" />
					<xsl:with-param name="icon-fill" select="'#40719b'" />
					<xsl:with-param name="broder-stroke-color" select="'#414c56'" />
<xsl:with-param name="caption" select="'New'" />

					<xsl:with-param name="count" select="$listingsTotalNew" />
<xsl:with-param name="description" select="'0-30 DAYS'" />

				</xsl:call-template>

				<xsl:call-template name="property-count-letter">
					<xsl:with-param name="transform" select="'transform:translateX(10.2%)'" />
					<xsl:with-param name="icon-fill" select="'#8dc641'" />
					<xsl:with-param name="broder-stroke-color" select="'#517134'" />

					<xsl:with-param name="icon" select="'home-speaker-icon'" />
					<xsl:with-param name="caption" select="'Active'" />
<xsl:with-param name="count" select="$listingsTotalActive" />

					<xsl:with-param name="description" select="'TOTAL'" />
				</xsl:call-template>

				<xsl:call-template name="property-count-letter">
					<xsl:with-param name="transform" select="'transform:translateX(32.5%)'" />
					<xsl:with-param name="icon" select="'home-dot-icon'" />
					<xsl:with-param name="icon-fill" select="'#fad542'" />
					<xsl:with-param name="broder-stroke-color" select="'#d5952a'" />
					<xsl:with-param name="caption" select="'Pending'" />
<xsl:with-param name="count" select="$listingsTotalPending" />

					<xsl:with-param name="description">
						<xsl:call-template name="view-period" />
					</xsl:with-param>
				</xsl:call-template>

				<xsl:call-template name="property-count-letter">
					<xsl:with-param name="transform" select="'transform:translateX(55%)'" />
					<xsl:with-param name="icon" select="'home-lock-icon'" />
					<xsl:with-param name="icon-fill" select="'#ed8571'" />
					<xsl:with-param name="broder-stroke-color" select="'#bd3927'" />
					<xsl:with-param name="caption" select="'Sold'" />
<xsl:with-param name="count" select="$listingsTotalSold" />

					<xsl:with-param name="description">
						<xsl:call-template name="view-period" />
					</xsl:with-param>
				</xsl:call-template>
			</g>

			<g style="transform:translate(5%,47%)">
				<g style="transform:translateX(20.5%)">

					<image x="1%" y="0" width="15%" height="7%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/clock-green.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="7%" class="align-center">
						<tspan x="10%" dy="2.5%" class="upper" style="font-size:120%;">Average</tspan>
						<tspan x="10%" dy="2.5%" class="upper" style="font-size:120%;">Days On Market</tspan>
						<tspan x="10%" dy="3.3%" class="heading" style="font-size:240%;">
							<xsl:value-of select="//statistics/@averageDaysOnMarket" />
						</tspan>
					</text>
				</g>
				<g style="transform:translateX(52.5%)">
					<image x="2.5%" y="0" width="15%" height="7%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/up-green.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="7%" class="align-center">
						<tspan x="10%" dy="2.5%" class="upper" style="font-size:120%;">Average List Price</tspan>
						<tspan x="10%" dy="2.5%" class="upper" style="font-size:120%;">Per Square Foot</tspan>
						<tspan x="10%" dy="3.3%" class="heading" style="font-size:240%;">
<xsl:value-of select="format-number(//statistics/@avgPricePerSqFtList, '$###,###')" />

						</tspan>
						<tspan x="10%" dy="4%" style="font-size:100%;">
							<xsl:variable name="prevValue" select="number(//statistics/previous/@avgPricePerSqFtList)" />
							<xsl:variable name="direction">
								<xsl:choose>
									<xsl:when test="$prevValue > number(//statistics/@avgPricePerSqFtList)">
<xsl:value-of select="'Down'" />

									</xsl:when>
									<xsl:otherwise>
<xsl:value-of select="'Up'" />

									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>

							<xsl:value-of select="concat( $direction, ' from ', format-number( $prevValue, '$###,###' ) )" />
						</tspan>
					</text>
				</g>
				<g style="transform: translate(20%,25%)">
					<image x="2.5%" y="0" width="15%" height="7%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/up-green.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="7%" class="align-center">
						<tspan x="10%" dy="2.5%" class="upper" style="font-size:120%;">Average Sold Price</tspan>
						<tspan x="10%" dy="2.5%" class="upper" style="font-size:120%;">Per Square Foot</tspan>
						<tspan x="10%" dy="3.3%" class="heading" style="font-size:240%;">
<xsl:value-of select="format-number(//statistics/@avgPricePerSqFtSold,  '$###,###')" />

						</tspan>
						<tspan x="10%" dy="4%" style="font-size:100%;">
							<xsl:variable name="prevValue" select="number(//statistics/previous/@avgPricePerSqFtSold)" />
							<xsl:variable name="direction">
								<xsl:choose>
									<xsl:when test="$prevValue > number(//statistics/@avgPricePerSqFtSold)">
<xsl:value-of select="'Down'" />

									</xsl:when>
									<xsl:otherwise>
<xsl:value-of select="'Up'" />

									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>

							<xsl:value-of select="concat( $direction, ' from ', format-number( $prevValue, '$###,###' ) )" />
						</tspan>
					</text>
				</g>
				<g style="transform: translate(52.5%,25%);">

					<image x="2.5%" y="0" width="15%" height="7%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/price-level.svg' )" />
						</xsl:attribute>
					</image>

					<text x="0" y="7%" class="align-center">
						<tspan x="10%" dy="2.5%" class="upper " style="font-size:120%;">Average Sale Price</tspan>
						<tspan x="10%" dy="2.5%" class="upper " style="font-size:120%;">To List Price</tspan>
						<tspan x="10%" dy="3.3%" class="heading" style="font-size:240%;">
<xsl:value-of select="format-number( //statistics/@averageSalePrice div //statistics/@averageListPriceForSold, '#.0%')" />

						</tspan>
					</text>
				</g>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>