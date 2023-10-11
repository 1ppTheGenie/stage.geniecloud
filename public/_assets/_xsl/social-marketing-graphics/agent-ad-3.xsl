<?xml version="1.0"?>
<!--
	Asset Name:	Agent Ad 03
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<xsl:variable name="min_sale_price" select="number( //area/statistics/@minSalePrice )" />
		<xsl:variable name="prev_min_sale_price" select="number( //area/statistics/previous/@medianSalePrice )" />
		<xsl:variable name="min_sale_price_change" select="number( ($min_sale_price - $prev_min_sale_price) div $prev_min_sale_price * 100 )" />

		<image x="0%" y="0%" width="90%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

<rect fill="var(--theme-body-background)" x="9%" y="42%" width="91%" height="20%" />

		<g style="transform:translate(9%, 44%);">
			<text x="5%" fill="var(--theme-emphasis-color)" style="font-size:175%;line-height:120%;color:var(--theme-emphasis-color)" data-max-width="50%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentname'" />
					<xsl:with-param name="default" select="concat( 'Learn how some ', //area/name , ' sellers gained' )" />
				</xsl:call-template>
			</text>
			<text x="5%" y="8%" fill="var(--theme-subtitle-color)" class="heading upper bold" style="font-size:240%;line-height:120%;">
				<tspan>
					<xsl:choose>
						<xsl:when test="$min_sale_price_change > 0">
<xsl:value-of select="concat( ' ',  format-number( $min_sale_price_change, '#0.00' ), '%' )" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="' 0% '" />
								<xsl:with-param name="default" select="' 0% '" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="' More Profit '" />
						<xsl:with-param name="default" select="' More Profit '" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>