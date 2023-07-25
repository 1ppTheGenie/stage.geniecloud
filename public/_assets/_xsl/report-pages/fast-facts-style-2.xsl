<?xml version="1.0"?>
<!--
	Asset Name: Fast Facts No.2
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			rect#rounded-rect {
			    transform: translateY(-4px);
			}
			text.center.central {
			    transform: translateY(-4px);
			}'"/>
		</style>
		<g>
			<text x="50%" y="5%" class="sub-heading center upper" font-size="180%" style="letter-spacing:2.5px;" data-max-width="90%">
				<xsl:value-of select="$areaWithPropertyType" />
			</text>

			<text x="50%" y="11%" class=" center upper heading" fill="var(--theme-body-color)" font-size="320%">
				<tspan>Fast Facts</tspan>
			</text>

			<text x="50%" y="21.8%" class="heading center medium">
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'Last '" />
				</xsl:call-template>
			</text>

			<g style="transform:translate(19%,30%)">
				<xsl:call-template name="property-count">
					<xsl:with-param name="icon" select="'home-plus'" />
					<xsl:with-param name="icon-fill" select="'#40719b'" />
					<xsl:with-param name="broder-stroke-color" select="'#414c56'" />
					<xsl:with-param name="caption" select="'New'"/>
					<xsl:with-param name="count" select="$listingsTotalNew" />
					<xsl:with-param name="description" select="'0-30 DAYS'"/>
				</xsl:call-template>

				<xsl:call-template name="property-count">
					<xsl:with-param name="transform" select="'transform:translateX(16%)'" />
					<xsl:with-param name="icon-fill" select="'#8dc641'" />
					<xsl:with-param name="broder-stroke-color" select="'#517134'" />

					<xsl:with-param name="icon" select="'home-speaker-icon'" />
					<xsl:with-param name="caption" select="'Active'" />
					<xsl:with-param name="count" select="$listingsTotalActive"/>
					<xsl:with-param name="description" select="'TOTAL'" />
				</xsl:call-template>

				<xsl:call-template name="property-count">
					<xsl:with-param name="transform" select="'transform:translateX(32%)'" />
					<xsl:with-param name="icon" select="'home-dot-icon'" />
					<xsl:with-param name="icon-fill" select="'#fad542'" />
					<xsl:with-param name="broder-stroke-color" select="'#d5952a'" />
					<xsl:with-param name="caption" select="'Pending'" />
					<xsl:with-param name="count" select="$listingsTotalPending"/>
					<xsl:with-param name="description">
						<xsl:call-template name="view-period" />
					</xsl:with-param>
				</xsl:call-template>

				<xsl:call-template name="property-count">
					<xsl:with-param name="transform" select="'transform:translateX(48%)'" />
					<xsl:with-param name="icon" select="'home-lock-icon'" />
					<xsl:with-param name="icon-fill" select="'#ed8571'" />
					<xsl:with-param name="broder-stroke-color" select="'#bd3927'" />
					<xsl:with-param name="caption" select="'Sold'" />
					<xsl:with-param name="count" select="$listingsTotalSold"/>
					<xsl:with-param name="description">
						<xsl:call-template name="view-period" />
					</xsl:with-param>
				</xsl:call-template>
			</g>

			<g style="transform:translate(5%,62%)">
				<g>

					<image x="5%" y="0" width="10%" height="8%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/clock-green.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="20%" class="align-center">
						<tspan x="10%" y="10%" class="upper" style="font-size:120%;">Average</tspan>
						<tspan x="10%" y="14.5%" class="upper" style="font-size:120%;">Days On Market</tspan>
						<tspan x="10%" y="19%" class="heading" style="font-size:240%;">
							<xsl:value-of select="//statistics/@averageDaysOnMarket" />
						</tspan>
					</text>
				</g>
				<g style="transform:translateX(22.5%)">
					<image x="5%" y="0" width="10%" height="8%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/up-green.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="20%" class="align-center">
						<tspan x="10%" y="10%" class="upper " style="font-size:120%;">Average List Price</tspan>
						<tspan x="10%" y="14.5%" class="upper " style="font-size:120%;">Per Square Foot</tspan>
						<tspan x="10%" y="19%" class="heading" style="font-size:240%;">
							<xsl:value-of select="format-number(//statistics/@avgPricePerSqFtList, '$###,###')"/>
						</tspan>
						<tspan x="10%" y="27%" style="font-size:100%;">
							<xsl:variable name="prevValue" select="number(//statistics/previous/@avgPricePerSqFtList)" />
							<xsl:variable name="direction">
								<xsl:choose>
									<xsl:when test="$prevValue > number(//statistics/@avgPricePerSqFtList)">
										<xsl:value-of select="'Down'"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'Up'"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>

							<xsl:value-of select="concat( $direction, ' from ', format-number( $prevValue, '$###,###' ) )" />
						</tspan>
					</text>
				</g>
				<g style="transform:translateX(45%)">
					<image x="5%" y="0" width="10%" height="8%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/up-green.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="20%" class="align-center">
						<tspan x="10%" y="10%" class="upper " style="font-size:120%;">Average Sold Price</tspan>
						<tspan x="10%" y="14.5%" class="upper " style="font-size:120%;">Per Square Foot</tspan>
						<tspan x="10%" y="19%" class="heading" style="font-size:240%;">
							<xsl:value-of select="format-number(//statistics/@avgPricePerSqFtSold,  '$###,###')"/>
						</tspan>
						<tspan x="10%" y="27%" style="font-size:100%;">
							<xsl:variable name="prevValue" select="number(//statistics/previous/@avgPricePerSqFtSold)" />
							<xsl:variable name="direction">
								<xsl:choose>
									<xsl:when test="$prevValue > number(//statistics/@avgPricePerSqFtSold)">
										<xsl:value-of select="'Down'"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="'Up'"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>

							<xsl:value-of select="concat( $direction, ' from ', format-number( $prevValue, '$###,###' ) )" />
						</tspan>
					</text>
				</g>
				<g style="transform:translateX(67.5%)">

					<image x="5%" y="0" width="10%" height="8%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/price-level.svg' )" />
						</xsl:attribute>
					</image>

					<text x="0" y="20%" class="align-center">
						<tspan x="10%" y="10%" class="upper " style="font-size:120%;">Average Sale Price</tspan>
						<tspan x="10%" y="14.5%" class="upper " style="font-size:120%;">To List Price</tspan>
						<tspan x="10%" y="19%" class="heading" style="font-size:240%;">
							<xsl:value-of select="format-number( //statistics/@averageSalePrice div //statistics/@averageListPriceForSold, '#.0%')"/>
						</tspan>
					</text>
				</g>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>