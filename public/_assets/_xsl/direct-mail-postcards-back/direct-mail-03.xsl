<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Back - No.2
	Tags: 		Infographic
	Sizes:		Postcard
	Supports:	Area, Map, Multi-Listing
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="//listings/listing">
				<xsl:sort order="ascending" select="@state" />
				<xsl:if test="position() &lt;= 50">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<foreignObject x="0" y="0" width="94%" height="90%" style="transform: translate(2.5%, 5%);">
			<div style="transform: translate(67%, 0%); height:550px;width:60%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
				</xsl:call-template>
			</div>
			<div style="position:absolute;top:67.3%;right:-62%;z-index:999;height:35%">
				<svg height="100%" width="900">

					<rect x="0" y="0" width="30%" height="100%" fill="var(--theme-sub-heading-color)" fill-opacity="0.7"></rect>

					<text x="3%" y="6%" class="capitalize" fill="var(--theme-body-background)" style="font-size:150%;font-weight:600;" data-max-width="20%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'areanames'" />
							<xsl:with-param name="default" select="//area/name" />
						</xsl:call-template>
							 Homes
					</text>

					<text x="3%" y="18.8%" class="capitalize" fill="var(--theme-body-background)" style="font-size:80%;">
						<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
					</text>
					<svg x="1%" y="30%">
						<circle cy="7%" r="12" fill="var(--theme-emphasis-color)" cx="3%"></circle>
						<text x="3%" y="3.3%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
							<xsl:value-of select="count($listingsTotalNew)" />
						</text>
						<text x="6%" y="1%" fill="var(--theme-body-background)" style="font-size:120%;">
								New (Active)
						</text>
					</svg>
					<svg x="1%" y="46%">
						<circle cy="7%" r="12" fill="var(--active-green)" cx="3%"></circle>
						<text x="3%" y="3.3%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
							<xsl:value-of select="count($listingsTotalActive)" />
						</text>
						<text x="6%" y="1%" fill="var(--theme-body-background)" style="font-size:120%;">
								Active
						</text>
					</svg>
					<svg x="1%" y="62.5%">
						<circle cy="7%" r="12" fill="var(--pending-yellow)" cx="3%"></circle>
						<text x="3%" y="3.3%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
							<xsl:value-of select="count($listingsTotalPending)" />
						</text>
						<text x="6%" y="1%" fill="var(--theme-body-background)" style="font-size:120%;">
								Pending
						</text>
					</svg>
					<svg x="1%" y="78%">
						<circle cy="7%" r="12" fill="var(--sold-red)" cx="3%"></circle>
						<text x="3%" y="3.3%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
							<xsl:value-of select="count($listingsTotalSold)" />
						</text>
						<text x="6%" y="1%" fill="var(--theme-body-background)" style="font-size:120%;">
								Sold
						</text>
					</svg>
				</svg>
			</div>
		</foreignObject>
		<xsl:call-template name="cropped-container" />
	</xsl:template>
	<xsl:template name="cropped-content">
		<style>
			<xsl:value-of select="'foreignObject p {margin:0;}'" />
		</style>

		<g style="transform: translate(2.5%, 5%);">
			<text class="sub-heading capitalize bold" style="font-size:200%" y="2%" data-max-width="35%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
				<tspan x="0" dy="6%" class="upper tiny" style="font-weight:400;" fill="var(--theme-body-color)">
					<xsl:value-of select="//date/@period" />
				</tspan>
			</text>
			<svg x="0" y="1%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#house-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@soldPropertyTypeCount, ' ', $singularPropertyType ,' ',  'Sold')" />
				</text>
			</svg>
			<svg x="0" y="11%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#map-pin-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@activePropertyTypeCount,' ', $singularPropertyType,' ',' Active')" />
				</text>
			</svg>
			<svg x="0" y="21%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#dollar-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( format-number( //statistics/@averageSalePrice, '$###,###'), ' Average Sales Price' )" />
				</text>
			</svg>
			<svg x="0" y="31%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( format-number( //statistics/@avgPricePerSqFtSold, '$###,###'), ' / SqFt' )" />
				</text>
			</svg>
			<svg x="0" y="41%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@averageDaysOnMarket, ' Average days on market' )" />
				</text>
			</svg>
			<svg x="0" y="51%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#barchart-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( format-number(//statistics/@turnOver, '#.0%'), ' turnover rate' )" />
				</text>
			</svg>
		</g>
		<g style="transform: translate(2.5%, 80%);">
			<text fill="var(--theme-body-color)" style="font-size:100%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="strapline" />
					<xsl:with-param name="default" select="'VISIT THE INTERNETS MOST POWERFUL TOOL:'" />
				</xsl:call-template>
			</text>
			<text class="sub-heading bold" y="4%" style="font-size:120%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
		</g>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>