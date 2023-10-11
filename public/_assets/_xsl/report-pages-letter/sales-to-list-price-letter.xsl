<?xml version="1.0"?>
<!--
	Asset Name:	Sale To List Bars Letter
	Tags:		Text, Infographic
	Supports:	Area
	Sizes:		US Letter
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
	    	.banner{min-width:35%;}
	    	text {dominant-baseline: middle;}
			text.h1.upper{transform: translateY(6.5%);}
			.map-marker .banner svg{transform: translateY(2px);}
			foreignObject.map-marker {transform: translateY(2%);}'"/>
		</style>

		<xsl:call-template name="svg-defs" />

		<xsl:call-template name="area-heading-letter">
			<xsl:with-param name="default" select="'Sale to List Price'" />
			<xsl:with-param name="id" select="'market-update-title'" />
		</xsl:call-template>

		<xsl:variable name="maxAllPrices">
<xsl:for-each select="//previous/@averageSalePrice &#124; //statistics/@averageListPriceForSold &#124; //statistics/@averageSalePrice &#124; //previous/@averageListPriceForSold">
				<xsl:sort select="." order="descending" data-type="number"/>
				<xsl:if test="position() = 1">
					<xsl:value-of select="."/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<g style="transform:translate(2.5%,26%);">
			<xsl:value-of select="$maxAllPrices"/>
			<g style="transform:translateX(2.5%)">
				<xsl:call-template name="lozenge-letter">
					<xsl:with-param name="fill-id" select="'5'" />
					<xsl:with-param name="price-type" select="'AVG. LIST PRICE'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'middle'" />
					<xsl:with-param name="caption">
						<xsl:value-of select="//date/@period"/>
					</xsl:with-param>

					<xsl:with-param name="width" select="//statistics/@averageListPriceForSold div $maxAllPrices"/>
					<xsl:with-param name="value">
						<xsl:call-template name="format-price">
							<xsl:with-param name="price" select="//statistics/@averageListPriceForSold"/>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</g>
			<g style="transform:translate(2.5%, 10%)">
				<xsl:call-template name="lozenge-letter">
					<xsl:with-param name="fill-id" select="'2'" />
					<xsl:with-param name="price-type" select="'AVG. SALE PRICE'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'middle'" />
					<xsl:with-param name="caption">
						<xsl:value-of select="//date/@period"/>
					</xsl:with-param>
					<xsl:with-param name="width" select="//statistics/@averageSalePrice div $maxAllPrices"/>
					<xsl:with-param name="value">
						<xsl:call-template name="format-price">
							<xsl:with-param name="price" select="//statistics/@averageSalePrice"/>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</g>

			<g style="transform:translate(2.5%, 20%)">
				<xsl:call-template name="lozenge-letter">
					<xsl:with-param name="fill-id" select="'5'" />
					<xsl:with-param name="price-type" select="'AVG. LIST PRICE'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'middle'" />
					<xsl:with-param name="caption">
						<xsl:value-of select="//date/@previousPeriod"/>
					</xsl:with-param>
					<xsl:with-param name="width" select="//previous/@averageListPriceForSold div $maxAllPrices"/>
					<xsl:with-param name="value">
						<xsl:call-template name="format-price">
							<xsl:with-param name="price" select="number( //previous/@averageListPriceForSold  )"/>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</g>
			<g style="transform:translate(2.5%, 30%)">
				<xsl:call-template name="lozenge-letter">
					<xsl:with-param name="fill-id" select="'2'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'middle'" />
					<xsl:with-param name="price-type" select="'AVG. SALE PRICE'" />
					<xsl:with-param name="caption">
						<xsl:value-of select="//date/@previousPeriod"/>
					</xsl:with-param>
					<xsl:with-param name="width" select="//previous/@averageSalePrice div $maxAllPrices"/>
					<xsl:with-param name="value">
						<xsl:call-template name="format-price">
							<xsl:with-param name="price" select="number( //previous/@averageSalePrice )"/>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</g>
		</g>

		<g>
			<rect x="25%" y="88%" width="50" height="28" stroke-width="2" fill="url(#main-bar-5)"/>
			<text x="32%" y="89.4%" class="normal upper">Avg. List Price</text>

			<rect x="50%" y="88%" width="50" height="28" stroke-width="2" fill="url(#main-bar-2)"/>
			<text x="57%" y="89.4%" class="normal upper">Avg. Sold Price</text>
		</g>

		<g style="transform: translate(15%, 70%);">
			<polyline style="fill:#fff; filter: drop-shadow(2px 3px 9px var(--theme-body-color));" points="0,55 0,40 0,0 250,0 250,110 0,110 0,70"></polyline>

			<text x="15%" y="3%" class="center" fill="#000" style="font-size:140%;">
				<xsl:choose>
					<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
						<xsl:text>Last Month</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' Months')"/>
					</xsl:otherwise>
				</xsl:choose>
			</text>
			<text x="15%" y="7%" class="center" fill="#000" style="font-size:290%;">
				<xsl:value-of select="format-number( //statistics/@averageSalePrice div //statistics/@averageListPriceForSold, '#.00%' )" />
			</text>
			<text x="29%" y="13%" class="align-right" style="font-size:125%; line-height:120%; dominant-baseline: alphabetic;">
				<tspan>Average Days on Market </tspan>
				<tspan dx="0.5%" class="bold">
					<xsl:value-of select="//statistics/@averageDaysOnMarket" />
				</tspan>
			</text>
		</g>

		<g style="transform: translate(55%, 70%);">
			<polyline style="fill:#fff; filter: drop-shadow(2px 3px 9px var(--theme-body-color));" points="0,55 0,40 0,0 250,0 250,110 0,110 0,70"/>
			<text x="15%" y="3%" class="center" fill="#000" style="font-size:140%;">
				<xsl:choose>
					<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
						<xsl:text>Previous Month</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( 'Previous ', //areas/area[1]/statistics/@lookbackMonths, ' Months')"/>
					</xsl:otherwise>
				</xsl:choose>
			</text>
			<text x="15%" y="7%" class="center" fill="#000" style="font-size:290%;">
				<xsl:value-of select="format-number( //previous/@averageSalePrice div  //previous/@averageListPriceForSold, '#.00%' )" />
			</text>
			<text x="29%" y="13%" class="align-right" style="font-size:125%;dominant-baseline: alphabetic;">
				<tspan>Average Days on Market </tspan>
				<tspan dx="0.5%" class="bold">
					<xsl:value-of select="format-number( //previous/@averageDaysOnMarket, '#' )" />
				</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>