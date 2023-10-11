<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail - No.3
	Tags: 		Infographic
	Sizes:		Facebook
	Supports:	Area, Multi-Listing
	Approved: 	False
	Render Key:	direct-mail/direct-mail-02-AREASLUG
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<g style="transform: translate(2.5%, 5%);">
			<text class="sub-heading capitalize bold" style="font-size:170%">
				<xsl:value-of select="//area/name" />
				<tspan x="0" dy="7%" class="upper tiny narrow" fill="var(--theme-body-color)">
					<xsl:value-of select="//date/@period" />
				</tspan>
			</text>
			<svg x="0" y="1%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute href="#house-icon"
				</use>
<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
						<xsl:call-template name="editable">
<xsl:with-param name="id" select="'yourneighborhood'" />

							<xsl:with-param name="default" select="concat( //statistics/@soldPropertyTypeCount, ' ',$propertyType,' ','Sold' )" />
						</xsl:call-template>
					</text>
				</svg>
				<svg x="0" y="11%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

					<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
					<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#map-pin-icon' )" />
					</use>
					<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborhood'" />
							<xsl:with-param name="default" select="concat( //statistics/@activePropertyTypeCount, ' ',$propertyType,' ','Active' )" />
						</xsl:call-template>
					</text>
				</svg>
				<svg x="0" y="21%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

					<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
					<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#dollar-icon' )" />
					</use>
					<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
						<tspan>
							<xsl:value-of select="concat( format-number( //statistics/@averageSalePrice, '$###,###'), ' Average Sales Price' )" />
						</tspan>
					</text>
				</svg>
				<svg x="0" y="31%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

					<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
					<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
					</use>
					<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
						<xsl:value-of select="concat( format-number( //statistics/@avgPricePerSqFtSold, '$###,###'), ' / SqFt' )" />
					</text>
				</svg>

				<svg x="0" y="41%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

					<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
					<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
					</use>
					<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
						<xsl:value-of select="concat( //statistics/@averageDaysOnMarket, ' Average Days on Market' )" />
					</text>
				</svg>
				<svg x="0" y="51%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

					<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
					<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#barchart-icon' )" />
					</use>
					<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
<xsl:value-of select="concat( format-number(//statistics/@turnOver, '#.0%'), ' Turnover rate' )" />

					</text>
				</svg>
			</g>
			<g style="transform: translate(2.5%, 80%);">
				<text fill="var(--theme-body-color)">
					<tspan>more information</tspan>
					<tspan class="upper" x="0" dy="4%" style="font-size:80%">
						<xsl:value-of select="//agent[1]/marketingName" />
					</tspan>
				</text>
				<text class="sub-heading bold" y="7%" style="font-size:130%">
					<xsl:value-of select="//agency/website" />
				</text>
			</g>

			<foreignObject x="40%" y="5%" width="57.5%" height="90%">
				<xsl:call-template name="map-files" />

				<script>
					<xsl:text>var listings=[</xsl:text>
					<xsl:for-each select="//listings/listing[@state='active']">
						<xsl:if test="position() &lt;= 6">
							<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;', dom:&quot;, @dom, &quot;},&quot; )" />
						</xsl:if>
					</xsl:for-each>
					<xsl:text>];</xsl:text>
				</script>

				<div style="height: 560px; width:100%;">
					<xsl:call-template name="map-output">
						<xsl:with-param name="style" select="'streets-v11'" />
					</xsl:call-template>
				</div>
			</foreignObject>

			<g style="transform: translate(75.6%, 62%);">
				<rect x="0" y="0" width="30%" height="32%" fill="var(--theme-sub-heading-color)"></rect>

				<text x="1%" y="2%" class="capitalize" fill="var(--theme-body-background)" style="font-size:130%;font-weight:600;" data-max-width="23%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'yourneighborhood'" />
						<xsl:with-param name="default" select="concat( //area/name , ' ',$singularPropertyType )" />
					</xsl:call-template>
				</text>

				<text x="1%" y="6.5%" class="capitalize" fill="var(--theme-body-background)">
					<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
				</text>

				<svg x="1%" y="10%">
					<circle cy="3%" r="12" fill="var(--theme-emphasis-color)" cx="1%"></circle>
					<text x="1%" y="1.8%" class="small center" fill="var(--theme-body-background)">
						<xsl:value-of select="$listingsTotalNew" />
					</text>
					<text x="3%" y="1.4%" fill="var(--theme-body-background)">
					New (Active)
					</text>
				</svg>

				<svg x="1%" y="15%">
					<circle cy="3%" r="12" fill="var(--active-green)" cx="1%"></circle>
					<text x="1%" y="1.8%" class="small center" fill="var(--theme-body-background)">
						<xsl:value-of select="$listingsTotalActive" />
					</text>
					<text x="3%" y="1.4%" fill="var(--theme-body-background)">
					Active
					</text>
				</svg>

				<svg x="1%" y="20%">
					<circle cy="3%" r="12" fill="var(--pending-yellow)" cx="1%"></circle>
					<text x="1%" y="1.8%" class="small center" fill="var(--theme-body-background)">
						<xsl:value-of select="$listingsTotalPending" />
					</text>
					<text x="3%" y="1.4%" fill="var(--theme-body-background)">
					Pending
					</text>
				</svg>

				<svg x="1%" y="25%">
					<circle cy="3%" r="12" fill="var(--sold-red)" cx="1%"></circle>
					<text x="1%" y="1.8%" class="small center" fill="var(--theme-body-background)">
						<xsl:value-of select="$listingsTotalSold" />
					</text>
					<text x="3%" y="1.4%" fill="var(--theme-body-background)">
					Sold
					</text>
				</svg>
			</g>
		</xsl:template>
	</xsl:stylesheet>