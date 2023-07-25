<?xml version="1.0"?>
<!--
	Asset Name:	Sale To List Bars
	Tags:		Text, Infographic
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<xsl:call-template name="svg-defs" />

		<image preserveAspectRatio="xMidYMid slice" width="100%" opacity="0.4" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform: translate(0%, 0%)">
			<xsl:call-template name="area-heading">
				<xsl:with-param name="default" select="'Sale to List Price'" />
				<xsl:with-param name="id" select="'market-update-title'" />
			</xsl:call-template>
		</g>

		<xsl:variable name="maxAllPrices">
			<xsl:for-each select="//previous/@averageSalePrice | //statistics/@averageListPrice | //statistics/@averageSalePrice | //previous/@averageListPriceForSold">
				<xsl:sort select="." order="descending" data-type="number"/>
				<xsl:if test="position() = 1">
					<xsl:value-of select="."/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<g style="transform:translate(2.5%,25%);">
			<g style="transform:translateX(2.5%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'4'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'middle'" />
					<xsl:with-param name="caption">
						<xsl:value-of select="//date/@period"/>
					</xsl:with-param>
					<xsl:with-param name="width" select="//statistics/@averageListPrice div $maxAllPrices"/>
					<xsl:with-param name="value">
						<xsl:call-template name="format-price">
							<xsl:with-param name="price" select="//statistics/@averageListPrice"/>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</g>
			<g style="transform:translate(2.5%, 13%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'5'" />
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

			<g style="transform:translate(2.5%, 34%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'4'" />
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

			<g style="transform:translate(2.5%, 47%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'5'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'middle'" />
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

		<rect x="7%" y="85%" width="60" height="25" stroke-width="2" fill="var(--vivid-color-4)"/>
		<text x="13%" y="86%" class="normal upper">Avg. List Price</text>

		<rect x="27%" y="85%" width="60" height="25" stroke-width="2" fill="var(--vivid-color-5)"/>
		<text x="33%" y="86%" class="normal upper">Avg. Sold Price</text>

		<g style="transform: translate(75%, 28%);">
			<polyline style="fill:#fff;" filter="url(#blurred-shadow)" points="-20,55 0,40 0,0 250,0 250,110 0,110 0,70"></polyline>

			<rect x="8%" y="24%" width="4%" height="4%" stroke-width="2" fill="var(--vivid-banner)"/>
			<text x="10%" y="3%" class="medium center" fill="#000">
				<xsl:choose>
					<xsl:when test="number(//areas/area[1]/statistics/@lookbackMonths)=1">
						<xsl:text>Last Month</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' Months')"/>
					</xsl:otherwise>
				</xsl:choose>
			</text>
			<text x="10%" y="8%" class="large center" fill="#000">
				<xsl:value-of select="format-number( number(//statistics/@averageSalePrice) div number(//statistics/@averageListPrice), '#.00%' )" />
			</text>
			<text x="10%" y="20%" class="normal center">Average Days on Market</text>
			<text x="10%" y="27%" class="normal bold center" style="dominant-baseline: auto;">
				<xsl:value-of select="//statistics/@averageDaysOnMarket" />
			</text>
		</g>

		<g style="transform: translate(75%, 62%);">
			<polyline style="fill:#fff;" filter="url(#blurred-shadow)" points="-20,55 0,40 0,0 250,0 250,110 0,110 0,70"/>

			<rect x="8%" y="24%" width="4%" height="4%" stroke-width="2" fill="var(--vivid-banner)"/>
			<text x="10%" y="4%" class="medium center" fill="#000">
				<xsl:choose>
					<xsl:when test="number(//areas/area[1]/statistics/@lookbackMonths)=1">
						<xsl:text>Previous Month</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( 'Previous ', //areas/area[1]/statistics/@lookbackMonths, ' Months')"/>
					</xsl:otherwise>
				</xsl:choose>
			</text>
			<text x="10%" y="9%" class="large center" fill="#000">
				<xsl:value-of select="format-number( //previous/@averageSalePrice div  //previous/@averageListPriceForSold, '#.00%' )" />
			</text>
			<text x="10%" y="20%" class="normal center">Average Days on Market</text>
			<text x="10%" y="27%" class="normal bold center" style="dominant-baseline: auto;">
				<xsl:value-of select="format-number( //previous/@averageDaysOnMarket, '#' )" />
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>