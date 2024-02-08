<?xml version="1.0"?>
<!--
	Asset Name: Average Sale Price
	Tags: 		Social Marketing Ad
	Sizes:		Facebook
	Supports: 	Area
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text {dominant-baseline: middle}'" />

		</style>

		<g style="transform:translateY(15%)">
			<text x="50%" y="4%" class="align-center upper sub-heading" style="font-size:180%;">
				<xsl:value-of select="$areaWithPropertyType" />
			</text>

			<text x="50%" y="11%" class="align-center medium" font-family="var(--theme-heading-font)" style="fill:var(--theme-body-color)">
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'Last '" />
				</xsl:call-template>
			</text>

			<use x="42%" y="15%" width="16%" height="16%" fill="var(--theme-sub-heading-color)" class="no-style-override">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#', if(//statistics/@averageSalePrice &lt; //statistics/previous/@averageSalePrice) then 'arrow-down-red' else 'arrow-up-green' )" />
			</use>

			<text x="50%" y="36%" class="center upper" font-family="var(--theme-heading-font)" style="font-size: 275%;fill:var(--theme-body-color)">
				<tspan>Average Sales Price</tspan>
			</text>
			<text x="50%" y="48%" class="center lower sub-heading" style="font-size: 450%;fill:var(--theme-sub-heading-color)">
				<tspan>
					<xsl:call-template name="format-price">
						<xsl:with-param name="price" select="//statistics/@averageSalePrice" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="50%" y="56%" class="center sub-heading" style="font-size:134%;fill:var(--theme-sub-heading-color)">
				<tspan>
					<xsl:value-of select="concat( if(//statistics/@averageSalePrice &lt; //statistics/previous/@averageSalePrice) then 'Down' else 'Up', ' from ')" />
				</tspan>
				<tspan class="lower">
					<xsl:call-template name="format-price">
						<xsl:with-param name="price" select="//statistics/previous/@averageSalePrice" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="50%" y="63%" font-family="var(--theme-heading-font)" class="center bold medium" fill="var(--theme-body-color)">
				<xsl:text>As of </xsl:text>
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
			</text>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>