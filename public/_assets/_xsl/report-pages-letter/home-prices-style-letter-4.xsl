<?xml version="1.0"?>
<!--
    Asset Name: Home Price Style Letter No.4
    Tags: Social Marketing Ad
    Sizes: US Letter
	Supports: 	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="change">
		<xsl:param name="value" />
		<xsl:param name="x" />
		<xsl:param name="y" />
		<xsl:param name="valueX" />
		<xsl:param name="valueY" />

		<xsl:choose>
			<xsl:when test="number($value) = 0">
				<text x="50%" y="75%" class="center" font-size="150%">
						No Change
				</text>
			</xsl:when>
			<xsl:otherwise>

				<xsl:if test="number($value) &gt; 0">
					<svg aria-hidden="true" focusable="false"
						xmlns="http://www.w3.org/2000/svg" width="25" height="19" x="62%" y="28.5%" viewBox="0 0 256 512">
						<path d="M88 166.059V468c0 6.627 5.373 12 12 12h56c6.627 0 12-5.373 12-12V166.059h46.059c21.382 0 32.09-25.851 16.971-40.971l-86.059-86.059c-9.373-9.373-24.569-9.373-33.941 0l-86.059 86.059c-15.119 15.119-4.411 40.971 16.971 40.971H88z" fill="var(--theme-body-color)"></path>
					</svg>
				</xsl:if>
				<xsl:if test="number($value) &lt;= 0">
					<svg aria-hidden="true" focusable="false"
						xmlns="http://www.w3.org/2000/svg" width="25" height="19" x="62%" y="28.5%" viewBox="0 0 256 512">
						<path d="M168 345.941V44c0-6.627-5.373-12-12-12h-56c-6.627 0-12 5.373-12 12v301.941H41.941c-21.382 0-32.09 25.851-16.971 40.971l86.059 86.059c9.373 9.373 24.569 9.373 33.941 0l86.059-86.059c15.119-15.119 4.411-40.971-16.971-40.971H168z" fill="var(--theme-body-color)"></path>
					</svg>
				</xsl:if>

				<text x="65%" y="31.6%" font-size="135%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
<xsl:value-of select="format-number( abs( number($value) ), '#.0%' )" />

				</text>
			</xsl:otherwise>
		</xsl:choose>

		<text x="63%" y="40%" font-size="135%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
			<xsl:call-template name="view-period">
<xsl:with-param name="prefix" select="'Last '" />

			</xsl:call-template>
		</text>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'text{ dominant-baseline:middle; }'" />

		</style>

		<xsl:call-template name="letter-report-header">
			<xsl:with-param name="title" select="'Average Prices'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>

		<!-- <rect xmlns="" x="25%" y="19%" stroke="var(theme-body-color)" stroke-width="1" fill-opacity="1" height="1" width="440"></rect> -->

		<xsl:variable name="prevAvgSalePrice" select="//statistics/previous/@medianSalePrice" />
		<xsl:variable name="currAvgSalePrice" select="//statistics/@medianSalePrice" />
		<xsl:variable name="priceChange" select="($currAvgSalePrice div $prevAvgSalePrice) - 1" />
		<xsl:variable name="priceChangeFormat" select="format-number( number( abs( number($priceChange) ) ), '#.0%' )" />
		<xsl:variable name="priceChangeTerm">
			<xsl:choose>
				<xsl:when test="$priceChange > 0">
					<xsl:value-of select="'increased'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'fell'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="reportDate">
			<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
		</xsl:variable>
		<xsl:variable name="month_type">
			<xsl:choose>
				<xsl:when test="//output/@areaPeriod &gt; 1">
					<xsl:value-of select="concat(//output/@areaPeriod, ' months' )" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="' 30 days'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<text x="50%" y="21%" class="center" font-family="var(--theme-body-font)" fill="var(--theme-body-color)" font-size="140%" data-max-width="70%">

			<tspan>
				<xsl:value-of select="concat( 'As of ', $reportDate, ', ', //areas/area/name, ' median sales price for' )" />
			</tspan>
			<tspan x="50%" dy="2.7%">
				<xsl:value-of select="concat(lower-case( $propertyType ),' ', $priceChangeTerm, ' by ', $priceChangeFormat , ' over the last ', $month_type,'.' )" />
			</tspan>
			<tspan x="50%" dy="2.7%">
				<xsl:value-of select="'Take a look at the details below!'" />
			</tspan>
		</text>
		<g style="transform:translate(-25%,35%)">
			<svg x="5%" width="100%" height="35%">
				<use x="4%" y="12.5%" width="100%" height="22%">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="number($priceChange) > 0">
<xsl:value-of select="'#up-icon'" />

							</xsl:when>
							<xsl:otherwise>
<xsl:value-of select="'#down-icon'" />

							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</use>
				<text x="63%" y="9%" class="sub-heading" font-size="130%">Highest Sales Price</text>
				<text x="63%" y="21%" class="heading" font-size="310%" font-weight="500">
<xsl:value-of select="format-number( //statistics/@maxSalePrice, '$###,###')" />

				</text>

				<xsl:call-template name="change">
<xsl:with-param name="value" select="( //statistics/@maxSalePrice div //statistics/previous/@maxSalePrice ) - 1" />

				</xsl:call-template>
			</svg>
		</g>
		<g style="transform:translate(-25%,56%)">
			<svg x="5%" width="100%" height="35%">
				<use x="4%" y="12.5%" width="100%" height="22%">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="number($priceChange) > 0">
<xsl:value-of select="'#up-icon'" />

							</xsl:when>
							<xsl:otherwise>
<xsl:value-of select="'#down-icon'" />

							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</use>
				<text x="63%" y="9%" class="sub-heading" font-size="130%">Median Sales Price</text>
				<text x="63%" y="21%" class="heading" font-size="310%" font-weight="500">
<xsl:value-of select="format-number( //statistics/@medianSalePrice, '$###,###')" />

				</text>

				<xsl:call-template name="change">
					<xsl:with-param name="value" select="$priceChange" />
				</xsl:call-template>
			</svg>
		</g>
		<g style="transform:translate(-25%,77%)">
			<svg x="5%" width="100%" height="35%">
				<use x="4%" y="12.5%" width="100%" height="22%">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="( //statistics/@minSalePrice div //statistics/previous/@minSalePrice  ) - 1 > 0">
<xsl:value-of select="'#up-icon'" />

							</xsl:when>
							<xsl:otherwise>
<xsl:value-of select="'#down-icon'" />

							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</use>
				<text x="63%" y="9%" class="sub-heading" font-size="130%">Lowest Sales Price</text>
				<text x="63%" y="21%" class="heading" font-size="310%" font-weight="500">
<xsl:value-of select="format-number( //statistics/@minSalePrice, '$###,###')" />

				</text>

				<xsl:call-template name="change">
<xsl:with-param name="value" select="( //statistics/@minSalePrice div //statistics/previous/@minSalePrice  ) - 1" />

				</xsl:call-template>
			</svg>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>