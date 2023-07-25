<?xml version="1.0"?>
<!--
	Asset Name: Fast Facts No.1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<text x="50%" y="6.5%" class="sub-heading center upper" font-size="180%" style="letter-spacing:2px;">
			<xsl:value-of select="$areaWithPropertyType" />
		</text>

		<text x="50%" y="12.8%" class="heading center upper" font-size="280%" style="letter-spacing:2px;">
			<xsl:text>Market Performance</xsl:text>
		</text>

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
		<text x="50%" y="23.3%" class="center medium">
			<tspan>
				<xsl:value-of select="concat( 'The number of ', //areas/area/name, ' individual' , ' ', lower-case($singularPropertyType), ' ', 'sales ', $salesCountChangeTerm, ' by ', format-number( $salesCountPercent, '#%' ), ' in')" />
			</tspan>
			<tspan x="50%" dy="6.4%">
				<xsl:value-of select="concat( ' this period, with ', //statistics/@soldPropertyTypeCount, ' sold vs ', //previous/@totalSold, ' in the previous ', $month_type,'.' )" />
			</tspan>
		</text>

		<g style="transform:translate(5%,37%)">
			<g style="transform:translateX(-1%)">
				<image x="0" y="0" width="15%" height="22%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-sold.svg' )" />
					</xsl:attribute>
				</image>
				<text x="2%" y="0">
					<tspan x="14%" dy="3.5%" font-size="110%">Recently Sold</tspan>
					<tspan x="14%" dy="4.5%" class="super-bold" fill="var(--theme-sub-heading-color)" font-size="100%">
						<xsl:value-of select="concat( $propertyType, ': ', count(//listings/listing[@state='sold']) )"/>
					</tspan>
				</text>
			</g>

			<g style="transform:translateX(31%)">
				<image x="0" y="0" width="15%" height="22%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg' )" />
					</xsl:attribute>
				</image>
				<text x="2%" y="0%">
					<tspan x="14%" dy="3.5%" font-size="110%">Currently Active</tspan>
					<tspan x="14%" dy="4.5%" class="super-bold" fill="var(--theme-sub-heading-color)" font-size="100%">
						<xsl:value-of select="concat( $propertyType, ': ', count(//listings/listing[@state='active']) )"/>
					</tspan>
				</text>
			</g>

			<g style="transform:translateX(62%)">
				<image x="0" y="0" width="15%" height="22%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-pending.svg' )" />
					</xsl:attribute>
				</image>

				<text x="2%" y="0%" class="align-center">
					<tspan x="19.8%" dy="3.5%" font-size="110%">Currently Pending</tspan>
					<tspan x="17.6%" dy="4.5%" class="super-bold" fill="var(--theme-sub-heading-color)" font-size="100%">
						<xsl:value-of select="concat( $propertyType, ': ', count(//listings/listing[@state='pending']) )"/>
					</tspan>
				</text>
			</g>
		</g>

		<g style="transform:translate(5%,59%)">
			<g>
				<use x="5%" y="3%" width="10%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#homes-icon' )" />
				</use>
				<text x="0" y="0" class="align-center">
					<tspan x="10%" y="20%" font-size="110%">
						<xsl:value-of select="concat( 'Total Individual ', $propertyType, ' in Area' )" />
					</tspan>
					<tspan x="10%" y="24.5%" fill="var(--theme-sub-heading-color)" class="bold" font-size="110%">
						<xsl:value-of select="concat( 'Individual ', $propertyType, ': ',format-number(//statistics/@taxrollCount, '###,###'))"/>
					</tspan>
				</text>
			</g>

			<g style="transform:translateX(23%)">
				<use x="5%" y="3%" width="10%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#homes-being-sold-icon' )" />
				</use>
				<text x="0" y="20%" class="align-center">
					<tspan x="10%" y="20%" font-size="110%">12 Month Turn Over Rate</tspan>
					<tspan x="10%" y="24.5%" fill="var(--theme-sub-heading-color)" class="bold" font-size="110%">
						<xsl:value-of select="concat($propertyType, ': ',format-number(//statistics/@turnOver, '#.0%'))"/>
					</tspan>
				</text>
			</g>

			<g style="transform:translateX(46%)">
				<use x="5%" y="3%" width="10%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-dom-icon' )" />
				</use>
				<text x="0" y="20%" class="align-center">
					<tspan x="10%" y="20%" font-size="110%">Average Days on Market</tspan>
					<tspan x="10%" y="24.5%" fill="var(--theme-sub-heading-color)" class="bold" font-size="110%">
						<xsl:value-of select="concat($propertyType, ': ',//statistics/@averageDaysOnMarket)"/>
					</tspan>
				</text>
			</g>
			<g style="transform:translateX(69%)">
				<use x="5%" y="3%" width="10%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-yih-icon' )" />
				</use>
				<text x="0" y="20%" class="align-center">
					<tspan x="10%" y="20%" font-size="110%">
                        Average Years in 
						<xsl:value-of select="$singularPropertyType" />
					</tspan>
					<tspan x="10%" y="24.5%" fill="var(--theme-sub-heading-color)" class="bold" font-size="110%">
						<xsl:value-of select="concat($propertyType, ': ',//statistics/@averageYearsInHome)"/>
					</tspan>
				</text>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>