<?xml version="1.0"?>
<!--
	Asset Name: Market Insider Download Ad No. 1
	Tags:		Area, Infographic
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Facebook Post, Area, PricePercent
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper">
			<xsl:with-param name="nobg" select="'false'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="svg-body">
		<svg width="100%" height="100%" viewBox="0 0 200 200" fill="none">
			<defs>
				<radialGradient id="myGradient">
					<stop offset="10%" stop-color="#fff5" />
					<stop offset="95%" stop-color="#fff0" />
				</radialGradient>
			</defs>

			<circle cx="100" cy="100" r="96" fill="url('#myGradient')" />
		</svg>

		<xsl:variable name="change" select="genie:area-price-change( //areas/area[1]/statistics, //output/@pricePercent, 0 )" />

		<image width="16%" height="16%" x="42%" y="10%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'price-change-arrow'" />
				<xsl:with-param name="default">
					<xsl:choose>
						<xsl:when test="$change < 0">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/dn-red.svg' )" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/up-arrow-new.svg' )" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
		</image>

		<g style="transform:translateY(30%)">
			<text x="50%" y="0" class="upper bold center" fill="var(--theme-sub-heading-color)" font-size="165%" font-weight="bold">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:text>&#160;</xsl:text>
					<xsl:call-template name="property-type-caption">
<xsl:with-param name="short" select="'true'" />
<xsl:with-param name="singular" select="'true'" />

					</xsl:call-template>
				</tspan>
				<tspan> values have </tspan>

				<tspan x="50%" y="6%" text-decoration="underline">
					<xsl:choose>
						<xsl:when test="$change < 0">
							<xsl:text>fallen</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>risen</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
				<tspan> an average of:</tspan>
			</text>
		</g>

		<g style="transform:translateY(50%)">
			<xsl:choose>
				<xsl:when test="//output/@pricePercent = 'price'">
					<xsl:value-of select="genie:currency-format( $change, 0 )" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="format-number( $change, '#.#' )" />
				</xsl:otherwise>
			</xsl:choose>
		</g>

		<g style="transform:translateY(70%)">
			<text x="90%" y="0" class="right" font-size="140%" fill="var(--theme-sub-heading-color)">
				<xsl:choose>
					<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
						<xsl:text>in the last 30 days</xsl:text>
					</xsl:when>
					<xsl:otherwise>
<xsl:value-of select="concat( 'in the last ', //areas/area[1]/statistics/@lookbackMonths, ' months')" />

					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<g style="transform:translateY(80%)">
<rect x="25%" y="0" rx="30" ry="30" width="50%" height="10%" fill="var(--theme-sub-heading-color)" />


			<text x="50%" y="5%" class="upper bold center middle" fill="var(--theme-body-color)" font-size="110%">
				Download My Report &#8594;
			</text>
		</g>
	</xsl:template>
</xsl:stylesheet>
