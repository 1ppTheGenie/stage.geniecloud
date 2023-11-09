<?xml version="1.0"?>
<!--
	Asset Name: Fast Facts Letter No.1
	Tags:		Social Marketing Ad
	Sizes:		US Letter
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text{ dominant-baseline:middle; }'" />

		</style>

		<xsl:call-template name="letter-report-header">
			<xsl:with-param name="title" select="'Market Performance'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>

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

		<text x="50%" y="21%" class="center" font-size="280%" data-max-width="80%">
			<tspan>
				<xsl:value-of select="concat( 'The number of ', //areas/area/name, ' individual' , ' ', lower-case($singularPropertyType), ' ', 'sales ', $salesCountChangeTerm, ' by ', format-number( $salesCountPercent, '#%' ), ' in')" />
			</tspan>
			<tspan x="50%" dy="3%">
				<xsl:value-of select="concat( ' this period, with ', //statistics/@soldPropertyTypeCount, ' sold vs ', //previous/@totalSold, ' in the previous ', $month_type,'.' )" />
			</tspan>
		</text>

		<g style="transform:translate(4%,26%)">
			<g style="transform:translateX(1%)">
				<image x="10%" y="0" width="18%" height="22%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg' )" />
					</xsl:attribute>
				</image>
				<text x="0%" y="12%" class="align-center">
					<tspan x="19%" dy="6%" font-size="130%">Active</tspan>
					<tspan x="19%" dy="3%" class="super-bold" fill="var(--theme-sub-heading-color)" font-size="110%">
						<xsl:value-of select="count(//listings/listing[@state='active'])" />
					</tspan>
				</text>
			</g>

			<g style="transform:translateX(35%)">
				<image x="0" y="0" width="18%" height="22%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-pending.svg' )" />
					</xsl:attribute>
				</image>

				<text x="0%" y="12%" class="align-center">
					<tspan x="9%" dy="6%" font-size="130%">Pending</tspan>
					<tspan x="9%" dy="3%" class="super-bold" fill="var(--theme-sub-heading-color)" font-size="110%">
						<xsl:value-of select="count(//listings/listing[@state='pending'])" />
					</tspan>
				</text>
			</g>

			<g style="transform:translateX(47%)">
				<image x="14%" y="0" width="18%" height="22%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-sold.svg' )" />
					</xsl:attribute>
				</image>
				<text class="align-center" x="0%" y="12%">
					<tspan x="23%" dy="6%" font-size="130%">
						<xsl:value-of select="concat('Sold in ',//output/@areaPeriod, ' MOs ' )" />
					</tspan>
					<tspan x="23%" dy="3%" class="super-bold" fill="var(--theme-sub-heading-color)" font-size="110%">
						<xsl:value-of select="count(//listings/listing[@state='sold'])" />
					</tspan>
				</text>
			</g>
		</g>

		<g style="transform:translate(6%,50%)">
			<g style="transform: translateX(15%);">
				<use x="5%" y="2%" width="10%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#homes-icon' )" />
				</use>
				<text x="0" y="0" class="align-center">
					<tspan x="10%" y="15%" font-size="130%">
						<xsl:value-of select="concat( 'Total Individual ', $propertyType, ' in Area' )" />
					</tspan>
					<tspan x="10%" y="18%" fill="var(--theme-sub-heading-color)" class="bold" font-size="110%">
						<xsl:value-of select="format-number(//statistics/@taxrollCount, '###,###')" />
					</tspan>
				</text>
			</g>

			<g style="transform:translateX(52%)">
				<use x="5%" y="2%" width="10%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#homes-being-sold-icon' )" />
				</use>
				<text x="0" y="20%" class="align-center">
					<tspan x="10%" y="15%" font-size="130%">12 Month Turn Over Rate</tspan>
					<tspan x="10%" y="18%" fill="var(--theme-sub-heading-color)" class="bold" font-size="110%">
						<xsl:value-of select="format-number(//statistics/@turnOver, '#.0%')" />
					</tspan>
				</text>
			</g>

			<g style="transform: translate(15%, 18%)">
				<use x="5%" y="2%" width="10%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-dom-icon' )" />
				</use>
				<text x="0" y="20%" class="align-center">
					<tspan x="10%" y="15%" font-size="130%">Average Days on Market</tspan>
					<tspan x="10%" y="18%" fill="var(--theme-sub-heading-color)" class="bold" font-size="110%">
						<xsl:value-of select="//statistics/@averageDaysOnMarket" />
					</tspan>
				</text>
			</g>
			<g style="transform:translate(52%, 18%)">
				<use x="5%" y="2%" width="10%" height="13%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-yih-icon' )" />
				</use>
				<text x="0" y="20%" class="align-center">
					<tspan x="10%" y="15%" font-size="130%">
                        Average Years in 
						<xsl:value-of select="$singularPropertyType" />
					</tspan>
					<tspan x="10%" y="18%" fill="var(--theme-sub-heading-color)" class="bold" font-size="110%">
						<xsl:value-of select="//statistics/@averageYearsInHome" />
					</tspan>
				</text>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>