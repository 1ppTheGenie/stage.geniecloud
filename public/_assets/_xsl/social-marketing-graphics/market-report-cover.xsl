<?xml version="1.0"?>
<!--
	Asset Name:	Market Report Cover
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<g style="transform: rotate(-24deg)  translate(-13%, 32%) skew(4deg, 3deg);">
			<image x="15%" y="15%" width="60%" height="60%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
		</g>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid meet">

			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/market_report_cover_bg-full.png' )" />
			</xsl:attribute>
		</image>

		<g style="transform: rotate(335deg) translate(-21%, 17.5%) skew(-3deg, 7deg) scale(1.1);">
			<g style="transform: translate(26%, 23%) skew(10deg, 0deg) rotate(-1deg);clip-path: polygon(0px 250px,250px 450px,875px 70px,27px 16px);">
				<rect width="42%" height="245" fill="var(--theme-body-background)" fill-opacity="0.7" />
			</g>

			<g style="transform: translate(-3.5%, -6%) rotate(-0.2deg) skew(7deg, 0deg);">
				<svg height="80" width="300" x="40%" y="34%">
					<path stroke-linecap="butt" d="M5 20 l30 0" fill="none" stroke="var(--theme-body-color)" stroke-width="2"></path>
				</svg>

				<text x="50%" y="36%" class="center upper bold" style="fill:var(--theme-body-color);    font-size: 100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'marketinsider'" />
						<xsl:with-param name="default" select="'market insider'" />
					</xsl:call-template>
				</text>

				<svg height="80" width="300" x="57%" y="34.2%">
					<path stroke-linecap="butt" d="M5 20 l30 0" fill="none" stroke="var(--theme-body-color)" stroke-width="2"></path>
				</svg>

				<text x="50%" y="39%" class="sub-heading center bold upper" style="font-size:200%;font-weight:500;" data-max-width="45%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</text>

				<text x="50%" y="46%" class="normal center" style="fill:var(--theme-body-color);">
					<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
				</text>

				<text x="50%" y="50%" class="normal center bold" style="fill:var(--theme-body-color);">
					<xsl:text>Courtesy of </xsl:text>
					<xsl:value-of select="//agent[1]/firstName" />

					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="//agent[1]/lastName" />
				</text>

				<image x="42%" y="55%" width="16%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>