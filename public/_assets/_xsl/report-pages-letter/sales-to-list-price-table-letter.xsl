<?xml version="1.0"?>
<!--
	Asset Name:	Sale To List Price Table
	Tags:		Table
	Supports:	Area
	Sizes:		US Letter
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<g style="transform:translate(0,5%)">
			<text x="50%" y="0" class="align-center upper" style="font-size:180%">
				<xsl:value-of select="$areaWithPropertyType" />
			</text>
			<text x="50%" y="6%" class="align-center upper sub-heading" style="font-size: 250%">Sale to List Price</text>
			<text x="50%" y="15%" class="align-center capitalize medium">
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
			</text>
		</g>

		<g style="transform:translate(2%,27%)">
			<text class="upper center bold" font-size="120%">
				<tspan x="6%">Month</tspan>
				<tspan x="20%">Quantity Sold</tspan>
				<tspan x="38%">Avg List Price $</tspan>
				<tspan x="58%">Avg Sale Price $</tspan>
				<tspan x="74%">Avg DOM*</tspan>
				<tspan x="86%">Sale to List %</tspan>
			</text>

			<xsl:for-each select="//statistics/history/period">
<xsl:sort select="@period" data-type="number" order="descending" />

				<xsl:if test="position() &lt; 7">
					<line x1="2%" x2="94%" stroke="var(--vivid-color-1)">
						<xsl:attribute name="y1">
							<xsl:value-of select="concat( -2 + ( position() * 9 ), '%' )" />
						</xsl:attribute>
						<xsl:attribute name="y2">
							<xsl:value-of select="concat( -2 + ( position() * 9 ), '%' )" />
						</xsl:attribute>
					</line>
					<text class="center" font-size="130%">
						<xsl:attribute name="y">
							<xsl:value-of select="concat( 1 + ( position() * 9 ), '%' )" />
						</xsl:attribute>
						<tspan x="6%">
							<xsl:value-of select="@periodName" />
						</tspan>
						<tspan x="20%">
							<xsl:value-of select="@totalSold" />
						</tspan >
						<tspan x="38%">
							<xsl:call-template name="format-price">
<xsl:with-param name="price" select="@averageListPrice" />

							</xsl:call-template>
						</tspan>
						<tspan x="58%">
							<xsl:call-template name="format-price">
<xsl:with-param name="price" select="@averageSalePrice" />

							</xsl:call-template>
						</tspan>
						<tspan x="74%">
<xsl:value-of select="@averageDaysOnMarket" />

						</tspan>
						<tspan x="86%">
<xsl:value-of select="format-number( @averageSalePrice div @averageListPrice, '#.00%' )" />

						</tspan>
					</text>
				</xsl:if>
			</xsl:for-each>
		</g>

		<text y="90%" class="align-center" style="font-size:70%">
			<tspan x="50%" dy="2.5%">
				<xsl:call-template name="agent-contact" />
			</tspan>
		</text>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>