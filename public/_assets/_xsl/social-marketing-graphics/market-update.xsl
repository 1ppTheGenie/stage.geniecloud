<?xml version="1.0"?>
<!--
	Asset Name: Market Update
	Tags: 		Infographic
	Sizes:		Facebook
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'.banner svg{fill: var(--printers-marks);}'" />
		</style>

		<image preserveAspectRatio="xMidYMid slice" width="100%" opacity="0.4" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<xsl:call-template name="svg-defs" />

		<g style="transform: translate(0%, 0%)">
			<xsl:call-template name="area-heading">
				<xsl:with-param name="default" select="'12 Month Market Update'" />
				<xsl:with-param name="id" select="'market-update-title'" />
			</xsl:call-template>
		</g>

		<xsl:variable name="maxAllPrices">
<xsl:for-each select="//previous/@averageSalePrice &#124; //statistics/@averageListPrice &#124; //statistics/@averageSalePrice &#124; //previous/@averageListPriceForSold">
				<xsl:sort select="." order="descending" data-type="number"/>
				<xsl:if test="position() = 1">
					<xsl:value-of select="."/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<g style="transform:translate(2.5%,25%);">
			<g style="transform:translateX(2.5%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'5'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'dominant-baseline: auto;'" />
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
					<xsl:with-param name="fill-id" select="'3'" />
					<xsl:with-param name="caption-width" select="'16'" />
					<xsl:with-param name="caption-align" select="'dominant-baseline: auto;'" />
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
			<g style="transform:translate(3%,45%)">
				<g class="fast-fact" style="transform:translateX(0)">
					<image x="-2%" y="-4%" width="10%" height="20%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-sold.svg' )" />
						</xsl:attribute>
					</image>

					<text x="0" y="20%">
						<tspan x="9%" y="0" class="bold super-large upper">
							<xsl:value-of select="$listingsTotalNew" />
						</tspan>
					</text>
					<g style="transform: translate(3%, -10.5%);">
						<text class="upper">
							<tspan x="14%" y="13%">
								Average
							</tspan>
							<tspan x="14%" y="16%">Days on</tspan>
							<tspan x="14%" y="19%">market</tspan>
						</text>
					</g>
				</g>

				<g class="fast-fact" style="transform:translateX(50%)">

					<image x="-2%" y="-4%" width="10%" height="20%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg' )" />
						</xsl:attribute>
					</image>
					<text x="0" y="20%">
						<tspan x="9%" y="0" class="bold super-large">
							<xsl:value-of select="$listingsTotalActive" />
						</tspan>
					</text>
					<g style="transform: translate(3%, -10.5%);">
						<text class="upper">
							<tspan x="14%" y="13%">
								total
							</tspan>
							<tspan x="14%" y="16%">active</tspan>
							<tspan x="14%" y="19%">listings</tspan>
						</text>
					</g>
				</g>
			</g>
		</g>

		<g style="transform: translate(82%, 28%);">
			<polyline style="fill:#fff;" filter="url(#blurred-shadow)" points="-20,55 0,40 0,0 190,0 190,90 0,90 0,70"></polyline>

			<text x="1%" y="1%" class="left" style="font-size:300%" fill="var(--theme-body-background)">
				<xsl:value-of select="format-number(( //statistics/@soldPropertyTypeCount div //previous/@totalSold ) -1, '0.##%' )" />
			</text>
			<text class="center" x="7%" y="10%" style="font-size: 90%;" fill="var(--theme-body-background)">
				<xsl:value-of select="$lookbackPeriodName" />
			</text>

			<use x="1.5%" y="5%" width="25%" height="3%" fill="#30dd10">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#up-icon' )" />
			</use>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>