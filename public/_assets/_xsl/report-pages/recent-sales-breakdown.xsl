<?xml version="1.0"?>
<!--
	Asset Name:	Recent Sales Breakdown
	Tags: 		Social Marketing Ad, Infographic
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			.banner{ min-width:35%; }
			text{ dominant-baseline: middle; }
			text.h1.upper{ transform: translateY(6.5%); }
			text.upper.rsb { transform: translateY(-2%); }
			.map-marker .banner svg{ transform: translateY(2px); }
			foreignObject.map-marker { transform: translateY(2%); }'" />
		</style>

		<xsl:call-template name="svg-defs" />

		<g style="transform:translateY(2.5%)">
			<xsl:call-template name="area-heading">
				<xsl:with-param name="default" select="'Recent Sales Breakdown'" />
				<xsl:with-param name="id" select="'market-update-title'" />
			</xsl:call-template>
		</g>

		<text x="53%" y="15%" class="align-center medium capitalize" style="fill:var(--theme-body-color);">
			<xsl:call-template name="view-period">
				<xsl:with-param name="prefix" select="'Last '" />
			</xsl:call-template>
		</text>

		<xsl:variable name="totalSales" select="count(//listings/listing[not(@salePrice = '')])" />

		<xsl:variable name="maxSales">
			<xsl:for-each select="//statistics/byValue/range">
				<xsl:sort select="@sold" data-type="number" order="descending" />

				<xsl:if test="position() = 1">
					<xsl:value-of select="@sold" />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="count(//listings/listing[not(@salePrice = '')]) > 0">
				<xsl:variable name="sortedSalesValues">
					<xsl:for-each select="//listings/listing[not(@salePrice = '')]">
						<xsl:sort select="@salePrice" data-type="number"/>
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="count" select="count($sortedSalesValues/listing)"/>
				<xsl:variable name="maxLowerQuartile" select="$sortedSalesValues/listing[round($count * 0.25)]/@salePrice"/>
				<xsl:variable name="minUpperQuartile" select="$sortedSalesValues/listing[round($count * 0.75)]/@salePrice"/>

				<g style="transform: translate(5%, 20%)">
					<g style="transform: translateY(10%)">
						<xsl:call-template name="lozenge">
							<xsl:with-param name="fill-id" select="'5'" />
							<xsl:with-param name="available-space" select="number(0.55)" />
							<xsl:with-param name="caption">
								<tspan x="0">
									<xsl:value-of select="genie:currency-format( $maxLowerQuartile, 0 )" />
								</tspan>
								<tspan x="0" dy="3.5%">
									<xsl:text>Or Less</xsl:text>
								</tspan>
							</xsl:with-param>
							<xsl:with-param name="width" select="0.5" />
							<xsl:with-param name="diamond-caption" select="format-number( round($count * 0.25) div $totalSales, '#%' )" />
							<xsl:with-param name="value" select="concat( format-number( round($count * 0.25), '#,###' ), ' sales' )" />
						</xsl:call-template>
					</g>

					<g style="transform: translateY(30%)">
						<xsl:call-template name="lozenge">
							<xsl:with-param name="fill-id" select="'4'" />
							<xsl:with-param name="available-space" select="number(0.55)" />
							<xsl:with-param name="caption">
								<tspan x="0">
									<xsl:value-of select="genie:currency-format( $maxLowerQuartile,0 )" />
								</tspan>
								<tspan x="0" dy="3.5%">
									<xsl:value-of select="concat( 'To ', genie:currency-format( $minUpperQuartile, 0 ) )" />
								</tspan>
							</xsl:with-param>
							<xsl:with-param name="width" select="1" />
							<xsl:with-param name="diamond-caption" select="format-number( round($count * 0.5) div $totalSales, '#%' )" />
							<xsl:with-param name="value" select="concat( format-number( round($count * 0.5), '#,###' ), ' sales' )" />
						</xsl:call-template>
					</g>

					<g style="transform: translateY(50%)">
						<xsl:call-template name="lozenge">
							<xsl:with-param name="fill-id" select="'2'" />
							<xsl:with-param name="available-space" select="number(0.55)" />
							<xsl:with-param name="caption">
								<tspan x="0">
									<xsl:value-of select="genie:currency-format( $minUpperQuartile, 0 )" />
								</tspan>
								<tspan x="0" dy="3.5%">
									<xsl:text>Or More</xsl:text>
								</tspan>
							</xsl:with-param>
							<xsl:with-param name="width" select="0.5" />
							<xsl:with-param name="diamond-caption" select="format-number( round($count * 0.25) div $totalSales, '#%' )" />
							<xsl:with-param name="value" select="concat( format-number( round($count * 0.25), '#,###' ), ' sales' )" />
						</xsl:call-template>
					</g>
				</g>
			</xsl:when>
			<xsl:otherwise>
				<g style="transform: translate(5%, 20%)">
					<text style="font-size:150%" font-weight="bold" fill="var(--theme-body-color)">
						<xsl:value-of select="concat( 'Sales data for ', //area[1]/name, ' is not available right now.')" />
					</text>
				</g>
			</xsl:otherwise>
		</xsl:choose>

		<g style="transform: translate(81%, 45%);">
			<polyline style="fill:#fff; filter: drop-shadow(2px 3px 9px var(--theme-body-color)); transform: rotate(180deg); transform-origin: 8% 10%;" points="-20,60 0,40 0,0 200,0 200,120 0,120 0,80" />

			<text x="8%" y="11%" class="center" style="font-size:420%" font-weight="bold" fill="#000">
				<xsl:value-of select="//statistics/@averageDaysOnMarket" />
			</text>

			<text x="8%" y="24%" class="medium center">
				<tspan style="font-size:80%">Average Days on Market</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>