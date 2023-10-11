<?xml version="1.0"?>
<!--
	Asset Name: Home Price Style No.2
	Tags: 		Social Marketing Ad
	Sizes: 		Facebook, Postcard
	Supports: 	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<g>
			<text x="50%" y="6%" class="sub-heading medium center upper" fill="var(--theme-body-color)" style="letter-spacing:2.5px;">
				<xsl:value-of select="$areaWithPropertyType" />
			</text>

			<text x="50%" y="12%" class="heading center upper" font-size="330%" font-weight="500">
				Average Prices
			</text>
			<svg height="80" width="300" x="40%" y="24%">
				<g fill="none">
					<path stroke="var(--theme-body-color)" d="M5 20 l215 0"></path>
				</g>
			</svg>

			<text x="50%" y="32%" class="center medium">
				<tspan>
					<xsl:text>As of </xsl:text>
					<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
					<xsl:text>, the average </xsl:text>
<xsl:value-of select="//areas/area[1]/name" />

					<xsl:text> sales price for </xsl:text>
					<xsl:call-template name="property-type-caption" />
				</tspan>
				<tspan x="50%" y="39%" class="center">
					<xsl:text>decreased by 100% over the </xsl:text>
					<xsl:choose>
						<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
							<xsl:text>last month</xsl:text>
						</xsl:when>
						<xsl:otherwise>
<xsl:value-of select="concat( 'last ', //areas/area[1]/statistics/@lookbackMonths, ' months')" />

						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>. Take a look at the details below!</xsl:text>
				</tspan>
			</text>

			<g style="transform:translate(0,50%)">
				<svg class="" x="5%" width="30%" height="45%">
					<use x="0" y="0" width="100%" height="25%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#down-icon' )" />
					</use>

					<text x="50%" y="30%" width="" class="align-center">Higest Sales Prices</text>
					<text x="50%" y="38%" class="align-center sub-heading large" style="font-size: 230%;">

<xsl:value-of select="format-number(//statistics/@maxSalePrice,  '$###,###')" />

					</text>
					<text x="50%" y="55%" class="align-center">
						<tspan class="super-bold">&#8595;</tspan> TODO%
					</text>
					<text x="50%" y="65%" class="align-center">
						<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
					</text>
				</svg>

				<svg class="" x="35%" width="30%" height="45%">
					<use x="0" y="0" width="100%" height="25%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#up-green-icon' )" />
					</use>
					<text x="50%" y="30%" width="" class="align-center">average Sales Prices</text>
					<text x="50%" y="38%" class="align-center sub-heading large" style="font-size: 230%;">
<xsl:value-of select="format-number(//statistics/@averageSalePrice,  '$###,###')" />

					</text>
					<text x="50%" y="55%" class="align-center">
						<tspan class="super-bold">&#8595;</tspan> TODO%
					</text>
					<text x="50%" y="65%" class="align-center">
						<xsl:choose>
							<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
								<xsl:text>Last Month</xsl:text>
							</xsl:when>
							<xsl:otherwise>
<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' months')" />

							</xsl:otherwise>
						</xsl:choose>
					</text>
				</svg>

				<svg class="" x="65%" width="30%" height="45%">
					<use x="0" y="0" width="100%" height="25%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#down-icon' )" />
					</use>
					<text x="50%" y="30%" width="" class="align-center">lowest Sales Prices</text>
					<text x="50%" y="38%" class="align-center sub-heading large" style="font-size: 230%;">
<xsl:value-of select="format-number(//statistics/@minSalePrice,  '$###,###')" />

					</text>
					<text x="50%" y="55%" class="align-center">
						<tspan class="super-bold">&#8595;</tspan> TODO%
					</text>
					<text x="50%" y="65%" class="align-center">
						<xsl:choose>
							<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
								<xsl:text>Last Month</xsl:text>
							</xsl:when>
							<xsl:otherwise>
<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' months')" />

							</xsl:otherwise>
						</xsl:choose>
					</text>
				</svg>
			</g>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>