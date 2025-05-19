<?xml version="1.0"?>
<!--
	Asset Name:	Ed Kaminsky Fast Fact 1
	Tags:		Text
	Supports:	Area, Map, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts"></xsl:template>

	<xsl:template name="svg-body">
		<xsl:variable name="singularPropertyTypeChangesName">
			<xsl:choose>
				<xsl:when test="number(//areas/area[1]/statistics/@propertyType) = 0">
					<xsl:text>single family home</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Condos</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="medianSalePrice" select="number(//statistics/@medianSalePrice)" />
		<xsl:variable name="previousMedianSalePrice" select="number(//previous/@medianSalePrice)" />
		<xsl:variable name="change" select="$medianSalePrice div $previousMedianSalePrice" />
		<xsl:variable name="formattedChange" select="format-number( abs( 1 - $change ), '#.0%' )" />

		<xsl:variable name="medianCountChange" select="//statistics/@medianSalePrice div //previous/@medianSalePrice" />
		<xsl:variable name="medianSalePercent" select="abs( 1 - $medianCountChange )" />

		<xsl:variable name="averageCountChange" select="//statistics/@averageSalePrice div //previous/@averageSalePrice" />
		<xsl:variable name="averageSalePercent" select="abs( 1 - $averageCountChange )" />

		<xsl:variable name="averagePerSqftSalePriceChange" select="//statistics/@avgPricePerSqFtSold div //previous/@avgPricePerSqFtSold" />
		<xsl:variable name="averagePerSqftSalePriceChangePercent" select="abs( 1 - $averagePerSqftSalePriceChange )" />

		<xsl:variable name="salesCountChange" select="//statistics/@soldPropertyTypeCount div //previous/@totalSold" />

		<xsl:variable name="salesCountPercent" select="abs( 1 - $salesCountChange )" />

		<xsl:variable name="medianSaleChangeTerm">
			<xsl:choose>
				<xsl:when test="$medianCountChange > 1">
					<xsl:value-of select="'PriceUp'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'PriceDown'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="averageSaleChangeTerm">
			<xsl:choose>
				<xsl:when test="$averagePerSqftSalePriceChange > 0">
					<xsl:value-of select="'PriceUp'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'PriceDown'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="salesCountChangeTerm">
			<xsl:choose>
				<xsl:when test="$salesCountChange > 1">
					<xsl:value-of select="'increased'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'decreased'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- <link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link> -->
		<style type="text/css">
			@import url("/_assets/_css/futura-embedded.css");
		</style>
		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<svg class="background-shape">
			<clipPath id="myPolygon">
<polygon points="0,0 540,0 840,630 0,630" fill="#12142d" />

			</clipPath>

			<image x="-5%" y="-10%" width="85%" height="110%" clip-path="url(#myPolygon)" preserveAspectRatio="xMidYMin slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/left-bgimage-04.png' )" />
				</xsl:attribute>
			</image>

			<!-- <rect style="transform: rotate(334deg);" x="37.5%" y="35%" width=".5%" height="117%" fill="#fff"></rect> -->
		</svg>

		<!-- <image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<image x="0" y="0" width="70%" height="100%" preserveAspectRatio="xMidYMin slice">
            <xsl:attribute name="href">
                <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/left-bgimage-04.png' )" />
            </xsl:attribute>
        </image> -->

		<text x="3.5%" y="14.6%" class="futura-text bold" font-size="400%" style="letter-spacing:1px;">
			<tspan fill="#0d0f30">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Fast'" />
					<xsl:with-param name="default" select="'Fast '" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#b2934e">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Facts'" />
					<xsl:with-param name="default" select="'Facts'" />
				</xsl:call-template>
			</tspan>
		</text>

		<line xmlns="" stroke="#b2934e" stroke-width="0.4%" y2="30%" x2="3.5%" y1="47%" x1="3.5%"></line>

		<!-- <line y2="251" x2="50" y1="136" x1="50" stroke-width="0.4%" stroke="#b2934e" xmlns=""></line>    -->

		<text x="5.5%" y="30%" class="futura-text bold upper" font-size="150%" fill="#0d0f30" data-max-width="45%">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat(//area/name ,' ', $singularPropertyType,'S')" />
			</xsl:call-template>
		</text>

		<!-- <text x="7%" y="35%" class="futura-text" font-size="100%" fill="#0d0f30" font-weight="600">
			<tspan data-max-width="40%">
				<xsl:value-of select="concat('Our special ops team is reporting that the ', //area/name)" />
			</tspan>			
			<tspan x="7%" dy="3%">
				<xsl:value-of select="'area has experienced a 16% median sale price increase '" />
			</tspan>

			<tspan x="7%" dy="3%">
				<xsl:value-of select="'over the past 12 months. Here’s the top-line data:'" />
			</tspan>
		</text>  -->

		<foreignObject x="5.5%" y="36.5%" height="15%" width="40%" class="medium futura-text">
			<p style="font-size: 68%;line-height: 147%;color:#0d0f30;margin:0;font-weight:600;">

				<xsl:value-of select="concat('Our special ops team is reporting that the ', //area/name, ' area has experienced a ')" />

				<b>
					<xsl:choose>
						<xsl:when test="$medianCountChange > 1">

							<xsl:value-of select="concat(' ', format-number( $medianSalePercent, '#%' ), ' median sale price increase')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(' ', format-number( $medianSalePercent, '#%' ), ' median sale price decrease')" />
						</xsl:otherwise>
					</xsl:choose>
				</b>

				<xsl:text> over the </xsl:text>

				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'past '" />
				</xsl:call-template>

				<xsl:text>. Here’s the top-line data:</xsl:text>

				<!-- Our special ops team is reporting that the <xsl:value-of select="//area/name" /> area has experienced a <span class="bold">16% median sale price increase</span> over the past 12 months. Here’s the top-line data: -->
			</p>
		</foreignObject>

		<g style="transform:translate(7%,40%)">
			<g>
				<text x="0" y="0" class="align-center futura-text" fill="#0d0f30">
					<tspan x="10.5%" y="20%" font-size="218%" class="super-bold">
						<!-- <xsl:value-of select="'$4,250,000'" /> -->
<xsl:value-of select="format-number( //statistics/@maxSalePrice, '$###,###')" />

					</tspan>
					<tspan x="10%" y="26.5%" font-size="108%">
<xsl:value-of select="concat('Highest ', $singularPropertyTypeChangesName, ' sale')" />

					</tspan>
				</text>
			</g>

			<g style="transform:translateX(23%)">
				<image x="9%" y="11.5%" width="8%" height="8%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/',$medianSaleChangeTerm,'.svg' )" />
					</xsl:attribute>
				</image>
				<text x="13%" y="14.2%" class="align-center futura-text" font-size="100%" fill="#fff">
					<xsl:value-of select="concat('', format-number( $medianSalePercent, '#%' ))" />
				</text>
				<text x="0" y="20%" class="align-center futura-text" fill="#0d0f30">
					<tspan x="13%" y="20%" font-size="218%" class="super-bold">
<xsl:value-of select="format-number( //statistics/@medianSalePrice, '$###,###')" />

					</tspan>
					<tspan x="13%" y="26.5%" font-size="108%">
<xsl:value-of select="concat('Median ', $singularPropertyTypeChangesName, ' sale')" />

					</tspan>
				</text>
			</g>
		</g>

		<g style="transform:translate(7%,60%)">
			<g>
				<text x="0" y="0" class="align-center futura-text" fill="#0d0f30">
					<tspan x="10%" y="20%" font-size="218%" class="super-bold">
						<!-- <xsl:value-of select="'$2,520,500'" /> -->
<xsl:value-of select="format-number( //statistics/@averageSalePrice, '$###,###')" />

					</tspan>
					<tspan x="10%" y="26.5%" font-size="108%">
<xsl:value-of select="concat('Average ', $singularPropertyTypeChangesName, ' sale')" />

					</tspan>
				</text>
			</g>

			<g style="transform:translateX(23%)">
				<image x="10%" y="11.5% " height="8%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/',$averageSaleChangeTerm,'.svg' )" />
					</xsl:attribute>
				</image>
				<text x="13.5%" y="14.2%" class="align-center futura-text" font-size="100%" fill="#fff">
					<xsl:value-of select="concat('', format-number( $averagePerSqftSalePriceChangePercent, '#%' ))" />
				</text>
				<text x="0" y="20%" class="align-center futura-text" fill="#0d0f30">
					<tspan x="13%" y="20%" font-size="218%" class="super-bold">
<xsl:value-of select="format-number( //statistics/@avgPricePerSqFtSold, '$###,###')" />

					</tspan>

					<tspan x="13%" y="26.5%" font-size="108%">
<xsl:value-of select="'Average sale price per square foot'" />

					</tspan>
				</text>
			</g>
		</g>

		<!-- <text x="4%" y="50%" class="futura-text super-bold" font-size="230%" fill="#b0934c">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'area description'" />
				<xsl:with-param name="default" select="'Our special ops team is reporting that the Mira Costa area has experienced a 5.8% median sale price decrease over the past 12 months. Here’s the top-line data:'" />
			</xsl:call-template>
		</text> -->




		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>