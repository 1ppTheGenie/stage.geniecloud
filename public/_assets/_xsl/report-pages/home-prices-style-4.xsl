<?xml version="1.0"?>
<!--
	Asset Name:	Home Price Style No.4
	Tags: 		Social Marketing Ad
	Sizes: 		Facebook, Postcard
	Supports: 	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="change">
		<xsl:param name="value" />

		<xsl:choose>
			<xsl:when test="$value = 0">
				<text x="50%" y="75%" class="center" font-size="150%">
					<xsl:text>No Change</xsl:text>
				</text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$value &gt; 0">
					<svg aria-hidden="true" focusable="false"
						xmlns="http://www.w3.org/2000/svg" width="23" height="21" x="36%" y="71%" viewBox="0 0 256 512">
						<path d="M88 166.059V468c0 6.627 5.373 12 12 12h56c6.627 0 12-5.373 12-12V166.059h46.059c21.382 0 32.09-25.851 16.971-40.971l-86.059-86.059c-9.373-9.373-24.569-9.373-33.941 0l-86.059 86.059c-15.119 15.119-4.411 40.971 16.971 40.971H88z" fill="var(--theme-body-color)" />
					</svg>
				</xsl:if>
				<xsl:if test="$value &lt;= 0">
					<svg aria-hidden="true" focusable="false"
						xmlns="http://www.w3.org/2000/svg" width="23" height="21" x="36%" y="71%" viewBox="0 0 256 512">
						<path d="M168 345.941V44c0-6.627-5.373-12-12-12h-56c-6.627 0-12 5.373-12 12v301.941H41.941c-21.382 0-32.09 25.851-16.971 40.971l86.059 86.059c9.373 9.373 24.569 9.373 33.941 0l86.059-86.059c15.119-15.119 4.411-40.971-16.971-40.971H168z" fill="var(--theme-body-color)" />
					</svg>
				</xsl:if>

				<text x="50%" y="77%" class="center" font-size="130%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
					<xsl:value-of select="format-number( abs( number($value) ), '#.0%' )" />
				</text>
			</xsl:otherwise>
		</xsl:choose>

		<text x="50%" y="90%" class="center" font-size="130%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
			<xsl:call-template name="view-period">
				<xsl:with-param name="prefix" select="'Last '" />
			</xsl:call-template>
		</text>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text{dominant-baseline:middle;}'" />
		</style>

		<text x="50%" y="9%" class="sub-heading center upper" font-size="180%" fill="var(--theme-body-color)" style="letter-spacing:2.5px;" data-max-width="90%">
			<xsl:value-of select="$areaWithPropertyType" />
		</text>

		<text x="50%" y="18%" class="heading center upper" font-size="330%" font-weight="500">
			<xsl:text>Average Prices</xsl:text>
		</text>

		<svg height="80" width="300" x="40%" y="25%">
			<path stroke="var(--theme-body-color)" stroke-width="0.2%" d="M5 20 l215 0"/>
		</svg>

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

		<text x="50%" y="36%" class="center medium" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
			<tspan>
				<xsl:value-of select="concat( 'As of ', $reportDate, ', ', //areas/area/name, ' median sales price for',' ', lower-case( $propertyType ) )" />
			</tspan>
			<tspan x="50%" y="43%">
				<xsl:value-of select="concat( $priceChangeTerm, ' by ', $priceChangeFormat , ' over the last ', $month_type, '. Take a look at the details below!' )" />
			</tspan>
		</text>

		<g style="transform:translate(0%,52%)">
			<svg x="5%" width="30%" height="35%" class="no-style-override">
				<use x="0" y="0" width="100%" height="25%" fill="transparent" stroke-width="10" class="no-style-override">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons.svg#', if(number((( //statistics/@maxSalePrice - //statistics/previous/@maxSalePrice ) div //statistics/previous/@maxSalePrice) ) > 0) then 'arrow-up-green' else 'arrow-down-red' )" />
					</xsl:attribute>
				</use>
				<text x="50%" y="41%" class="center sub-heading" font-size="120%">Highest Sales Price</text>
				<text x="50%" y="59%" class="align-center large heading" style="font-size: 250%;">
					<xsl:value-of select="format-number( //statistics/@maxSalePrice, '$###,###')" />
				</text>

				<xsl:call-template name="change">
					<xsl:with-param name="value" select="(( //statistics/@maxSalePrice - //statistics/previous/@maxSalePrice ) div //statistics/previous/@maxSalePrice)" />
				</xsl:call-template>
			</svg>

			<svg x="35%" width="30%" height="35%" class="no-style-override">
				<use x="0" y="0" width="100%" height="25%" fill="transparent" stroke-width="10" class="no-style-override">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons.svg#', if(number($priceChange) > 0) then 'arrow-up-green' else 'arrow-down-red' )" />
					</xsl:attribute>
				</use>
				<text x="50%" y="41%" class="center sub-heading" font-size="120%">Median Sales Price</text>
				<text x="50%" y="59%" class="align-center large heading" style="font-size: 250%;">
					<xsl:value-of select="format-number( //statistics/@medianSalePrice, '$###,###')" />
				</text>

				<xsl:call-template name="change">
					<xsl:with-param name="value" select="$priceChange" />
				</xsl:call-template>
			</svg>

			<svg x="65%" width="30%" height="35%" class="no-style-override">
				<use x="0" y="0" width="100%" height="25%" fill="transparent" stroke-width="10" class="no-style-override">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons.svg#', if((//statistics/@minSalePrice div //statistics/previous/@minSalePrice) - 1 > 0) then 'arrow-up-green' else 'arrow-down-red' )" />
					</xsl:attribute>
				</use>
				<text x="50%" y="41%" class="center sub-heading" font-size="120%">Lowest Sales Price</text>
				<text x="50%" y="59%" class="align-center large heading" style="font-size: 250%;">
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