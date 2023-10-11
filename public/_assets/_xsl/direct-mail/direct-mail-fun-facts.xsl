<?xml version="1.0"?>
<!--
	Asset Name: Fun Facts
	Tags: 		Infographic
	Sizes:		Postcard
	Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<text x="50%" y="7%" class="heading center bold upper" font-size="180%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'dmff1'" />
				<xsl:with-param name="default" select="concat( 'Fun Facts about ', //area[1]/name)" />
			</xsl:call-template>
		</text>

		<g style="transform:translate(8%,17%)">
			<use x="0%" y="3%" width="10%" height="13%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#homes-icon' )" />
			</use>
			<text x="9%" y="4%" class="sub-heading medium">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'yourneighborhood'" />
						<xsl:with-param name="default" select="concat('Total', ' ', $propertyType)" />
					</xsl:call-template>
				</tspan>
				<tspan x="9%" dy="4%" style="font-weight:600">
<xsl:value-of select="format-number(//statistics/@taxrollCount, '###,###')" />

				</tspan>
			</text>
		</g>

		<g style="transform:translate(34%,17%)">
			<image x="0" y="2%" width="10%" height="15%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-sold.svg' )" />
				</xsl:attribute>
			</image>
			<text x="9%" y="4%" class="sub-heading medium">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'yourneighborhood'" />
						<xsl:with-param name="default" select="concat($propertyType, ' ', 'Sold' )" />
					</xsl:call-template>
				</tspan>
				<tspan x="9%" dy="4%" style="font-weight:600">
<xsl:value-of select="format-number(//statistics/@soldPropertyTypeCount, '###,###')" />

				</tspan>
			</text>
		</g>

		<g style="transform:translate(8%,36%)">
			<image x="0" y="1%" width="10%" height="15%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg' )" />
				</xsl:attribute>
			</image>
			<text x="9%" y="4%" class="sub-heading medium">
				<tspan>Currently Active</tspan>
				<tspan x="9%" dy="4%" style="font-weight:600">
					<xsl:value-of select="//statistics/@activePropertyTypeCount" />
				</tspan>
			</text>
		</g>

		<g style="transform:translate(34%,36%)">
			<use x="0%" y="3%" width="10%" height="13%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-dom-icon' )" />
			</use>
			<text x="9%" y="3%" class="sub-heading medium">
				<tspan>Average Days</tspan>
				<tspan x="9%" dy="4%">on Market</tspan>
				<tspan x="9%" dy="4%" style="font-weight:600">
<xsl:value-of select="//statistics/@averageDaysOnMarket" />

				</tspan>
			</text>
		</g>

		<g style="transform:translate(8%,53%)">
			<use x="0%" y="3%" width="10%" height="13%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#homes-being-sold-icon' )" />
			</use>
			<text x="9%" y="3%" class="sub-heading medium">
				<tspan>
<xsl:call-template name="view-period" />

				</tspan>
				<tspan x="9%" dy="4%">Turnover Rate</tspan>
				<tspan x="9%" dy="4%" style="font-weight:600">
<xsl:value-of select="format-number(//statistics/@turnOver, '#.0%')" />

				</tspan>
			</text>
		</g>

		<g style="transform:translate(34%,53%)">
			<use x="0%" y="3%" width="10%" height="13%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#user-icon' )" />
			</use>
			<text x="9%" y="3%" class="sub-heading medium">
				<tspan>% Owner</tspan>
				<tspan x="9%" dy="4%">Occupied</tspan>
				<tspan x="9%" dy="4%" style="font-weight:600">
<xsl:value-of select="format-number(//statistics/@ownerOccupancy, '#.0%')" />

				</tspan>
			</text>
		</g>

		<line x1="60%" y1="20%" x2="60%" y2="70%" stroke="var(--theme-body-color)" stroke-width="8" />

		<g style="transform:translate(68%,22%)">
			<text x="0" y="0" class="upper sub-heading">
				<tspan>Highest Sale Price</tspan>
				<tspan x="0" dy="3%" style="font-size:250%;">
<xsl:value-of select="format-number(//statistics/@maxSalePrice, '$###,###')" />

				</tspan>
			</text>
			<text x="0" y="18%" class="upper sub-heading">
				<tspan>Average Sale Price</tspan>
				<tspan x="0" dy="3%" style="font-size:250%;">
<xsl:value-of select="format-number(//statistics/@averageSalePrice, '$###,###')" />

				</tspan>
			</text>
			<text x="0" y="36%" class="upper sub-heading">
				<tspan>Lowest Sale price</tspan>
				<tspan x="0" dy="3%" style="font-size:250%;">
<xsl:value-of select="format-number(//statistics/@minSalePrice, '$###,###')" />

				</tspan>
			</text>
		</g>

		<text x="50%" y="75%" class="center sub-heading" style="font-size:130%;">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'dmff2'" />

					<xsl:with-param name="default" select="concat( 'Would your' , ' ', lower-case($singularPropertyType),' ', 'sell for more than your next door neighbor?')" />
				</xsl:call-template>
			</tspan>
			<tspan x="50%" dy="8%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'dmff3'" />
					<xsl:with-param name="default" select="concat( 'Compare property values like a boss at ', //agent[1]/website )" />
				</xsl:call-template>
			</tspan>
		</text>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>