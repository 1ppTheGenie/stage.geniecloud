<?xml version="1.0"?>
<!--
Asset Name: Home Price Style No.1
Tags: 		Social Marketing Ad
Sizes: 		Facebook, Postcard
Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<g>

			<text x="50%" y="6%" class="medium center upper" style="fill:var(--theme-body-color);">
				<xsl:value-of select="//areas/area/name" />
			</text>

			<text x="50%" y="11%" class="sub-heading center upper" style="font-size:300%;font-weight:500;">
			average prices
			</text>

			<foreignObject x="20%" y="19%" width="65%" height="40%">
				<p class="center medium" style="fill:var(--theme-body-color);text-align:center;">
					<xsl:value-of select="concat( 'The ', //areas/area/name,' ', 'area has seen the average sale price ToDo over the' )" />
					<xsl:choose>
						<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
							<xsl:text>last Month</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat( 'last ', //areas/area[1]/statistics/@lookbackMonths, ' months')"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>. Take a look at the details below!</xsl:text>
				</p>
			</foreignObject>
			<text x="50%" y="42%" class="normal bold center">
				<xsl:value-of select="concat( 'Highest' , ' ', lower-case($singularPropertyType), ' ', 'price of Single Family',' ', $propertyType )" />
			</text>
			<text x="50%" y="46%" class="large center" style="fill:var(--theme-body-color);">
				<tspan>$ToDo</tspan>
				<xsl:text disable-output-escaping="yes">&#160;</xsl:text>
				<tspan class="tiny" dy="2%" style="fill:var(--vivid-color-5);font-weight:600;">
					<xsl:value-of select="concat( '(Sold on ', genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]'), ')' )" />
				</tspan>
			</text>

			<text x="50%" y="57%" class="normal center bold">
				<xsl:value-of select="//statistics/@averageSalePrice" />
				<tspan>
					<xsl:value-of select="concat( ' Average' , ' ', lower-case($singularPropertyType), ' ', 'price of Single Family',' ', $propertyType )" />
				</tspan>
			</text>
			<text x="50%" y="61%" class="large center" style="fill:var(--theme-body-color);">
				<tspan>$ToDo</tspan>
				<xsl:text disable-output-escaping="yes">&#160;</xsl:text>
				<tspan class="tiny" dy="2%" style="fill:var(--theme-sub-heading-color);font-weight:600;">
					<xsl:value-of select="concat( '(↓ Down ToDo% since ', genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]'), ')' )" />
				</tspan>
			</text>

			<text x="50%" y="72%" class="normal bold center">
				<xsl:value-of select="concat( 'Median' , ' ', lower-case($singularPropertyType), ' ', 'price of Single Family',' ', $propertyType )" />
			</text>
			<text x="50%" y="76%" class="large center" style="fill:var(--theme-body-color);">
				<tspan>$ToDo</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>