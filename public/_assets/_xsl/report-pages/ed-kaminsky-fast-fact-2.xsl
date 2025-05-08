<?xml version="1.0"?>
<!--
	Asset Name:	Ed Kaminsky Fast Fact 2
	Tags:		Text
	Supports:	Area, Map, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<!-- <link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />
		</link> -->

		<xsl:variable name="salesCountChange" select="//statistics/@soldPropertyTypeCount div //previous/@totalSold" />
		<xsl:variable name="salesCountPercent" select="abs( 1 - $salesCountChange )" />
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

		<xsl:variable name="month_type">
			<xsl:choose>
				<xsl:when test="//output/@areaPeriod &gt; 1">
					<xsl:value-of select="concat(//output/@areaPeriod, ' months' )" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="' 30 days'" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/intel-white-bg-01.jpg' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="8%" class="futura-text super-bold align-center" font-size="400%" style="letter-spacing:1px;">
			<tspan fill="#0d0f30">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Market'" />
					<xsl:with-param name="default" select="'Market '" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#b2934e">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Performance'" />
					<xsl:with-param name="default" select="'Performance'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="50%" y="20%" class="futura-text upper align-center" font-size="150%" font-weight="500" fill="#0d0f30" style="letter-spacing:5px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat(//area/name ,' ', $singularPropertyType,'S')" />
			</xsl:call-template>
		</text>

		<rect xmlns="" x="0%" y="28%" width="100%" height="18%" fill="#0d0f30"></rect>
		<text x="50%" y="24%" class="upper align-center" font-weight="500" fill="#383950" style="font-family: serif !important;font-size: 147px;line-height: 74%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="'CONFIDENTIAL'" />
			</xsl:call-template>
		</text>

		<text x="50%" y="33%" class="futura-text align-center" font-size="107%" fill="#fff">
			<tspan>
				<xsl:text>KRG's undercover informant's latest message: "</xsl:text>
			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Area Text'" />
					<xsl:with-param name="default" select="concat(//area/name ,' individual ', $singularPropertyType,' sales ')" />
				</xsl:call-template>
			</tspan>
			<tspan class="bold">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Area Text'" />
					<xsl:with-param name="default" select="concat($salesCountChangeTerm, ' by ')" />
				</xsl:call-template>
			</tspan>
			<tspan class="bold" x="50%" dy="4%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Sales Text'" />
					<xsl:with-param name="default" select="concat(format-number( $salesCountPercent, '#%' ),' ')" />

				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Compared Text'" />
					<xsl:with-param name="default" select="'when compared to the same '" />

				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'last '" />
				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Year Text'" />
					<xsl:with-param name="default" select="' period in 2022.'" />

				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:text>"</xsl:text>
			</tspan>
		</text>

		<g class="futura-text" style="transform:translate(5%,50%)">
			<g style="transform:translateX(-1%)">
				<image x="0" y="0" width="10%" height="13%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Sold.svg' )" />
					</xsl:attribute>
				</image>
				<text x="2%" y="0" fill="#0d0f30">
					<tspan x="10%" dy="2%" font-size="250%" class="super-bold">
						<xsl:value-of select="concat(count(//listings/listing[@state='sold']),' homes' )" />

					</tspan>
					<tspan x="10%" dy="7%" font-size="100%" font-weight="600">
						<xsl:value-of select="'sold in past 12-month'" />

					</tspan>
				</text>
			</g>

			<g style="transform:translateX(31%)">
				<image x="0" y="0" width="10%" height="13%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Active.svg' )" />
					</xsl:attribute>
				</image>
				<text x="2%" y="0%" fill="#0d0f30">
					<tspan x="11%" dy="2%" font-size="250%" class="super-bold">
						<xsl:value-of select="concat(count(//listings/listing[@state='active']),' homes' )" />

					</tspan>
					<tspan x="11%" dy="7%" font-size="100%" font-weight="600">
						<xsl:value-of select="'currently for sale'" />

					</tspan>
				</text>
			</g>

			<g style="transform:translateX(62%)">
				<image x="0" y="0" width="10%" height="13%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Pending.svg' )" />
					</xsl:attribute>
				</image>

				<text x="2%" y="0%" fill="#0d0f30">
					<tspan x="11%" dy="2%" font-size="250%" class="super-bold">
						<xsl:value-of select="concat(count(//listings/listing[@state='pending']),' homes' )" />

					</tspan>
					<tspan x="11%" dy="7%" font-size="100%" font-weight="600">
						<xsl:value-of select="'currently in escrow'" />

					</tspan>
				</text>
			</g>
		</g>

		<rect xmlns="" x="5%" y="68%" width="90%" height="0.5%" fill="#b2934e"></rect>

		<g class="futura-text" style="transform:translate(3%,75%)">
			<g style="transform:translateX(-1%)">
				<image x="0" y="0" width="10%" height="11%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Asset-6.svg' )" />
					</xsl:attribute>
				</image>
				<text x="2%" y="0" fill="#0d0f30">
					<tspan x="9%" dy="1%" font-size="250%" class="super-bold">
						<xsl:value-of select="format-number(//statistics/@taxrollCount, '###,###')" />

					</tspan>
					<tspan x="9%" dy="7%" font-size="100%" font-weight="600">
						<xsl:value-of select="concat('total ',translate($propertyType,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), ' in area')" />

					</tspan>
				</text>
			</g>

			<g style="transform:translateX(22%)">
				<image x="0" y="0" width="10%" height="11%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Asset-7.svg' )" />
					</xsl:attribute>
				</image>
				<text x="2%" y="0%" fill="#0d0f30">
					<tspan x="9%" dy="1%" font-size="250%" class="super-bold">
						<xsl:value-of select="format-number(//statistics/@turnOver, '#.0%')" />

					</tspan>
					<tspan x="9%" dy="7%" font-size="100%" font-weight="600">
						<xsl:value-of select="'12-mo turn over rate'" />

					</tspan>
				</text>
			</g>

			<g style="transform:translateX(47%)">
				<image x="0" y="0" width="10%" height="11%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Asset-8.svg' )" />
					</xsl:attribute>
				</image>

				<text x="2%" y="0%" fill="#0d0f30">
					<tspan x="9%" dy="1%" font-size="250%" class="super-bold">
						<xsl:value-of select="//statistics/@averageDaysOnMarket" />

					</tspan>
					<tspan x="9%" dy="7%" font-size="100%" font-weight="600">
						<xsl:value-of select="'avg. days on market'" />

					</tspan>
				</text>
			</g>

			<g style="transform:translateX(70%)">
				<image x="0" y="0" width="10%" height="11%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Asset-9.svg' )" />
					</xsl:attribute>
				</image>

				<text x="2%" y="0%" fill="#0d0f30">
					<tspan x="9%" dy="1%" font-size="250%" class="super-bold">
						<xsl:value-of select="//statistics/@averageYearsInHome" />

					</tspan>
					<tspan x="9%" dy="7%" font-size="100%" font-weight="600">
						<!-- <xsl:value-of select="'avg. years in home'" /> -->
						<xsl:value-of select="concat('avg. years in ',translate($singularPropertyType,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))" />

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