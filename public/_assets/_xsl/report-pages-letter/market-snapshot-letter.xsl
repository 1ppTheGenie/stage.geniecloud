<?xml version="1.0"?>
<!--
	Asset Name:	Market Snapshot Letter
	Tags:		Text
	Supports:	Area, Multi-Listing
	Sizes:		US Letter
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="map-output-letter">
		<!-- 
			Valid styles are (April 2020):
				streets-v11
				outdoors-v11
				light-v10
				dark-v10
				satellite-v9
				satellite-streets-v11 (streets)

				For updates:
				https://docs.mapbox.com/api/maps/#styles
		-->
		<xsl:param name="style" select="'streets-v11'" />
		<xsl:param name="iconType" select="''" />
		<xsl:param name="mapContainer" select="'genie-map'" />
		<xsl:param name="scale" select="'1'" />

		<div style="width:100%;height:100%;">
			<xsl:attribute name="id">
				<xsl:value-of select="$mapContainer" />
			</xsl:attribute>
			<!-- Force a closing tag, otherwise Chrome throws a wobbly -->
			<xsl:comment />

			<div class="leaflet-overlay-pane" style="position: absolute;z-index:9999999999;width:100%;height:100%;">
				<svg style="width: 100%; height: 100%; point-events:none;">
<xsl:call-template name="map-overlay" />

				</svg>
			</div>
		</div>

		<script>
			<xsl:value-of select="concat( &quot;var wkt='&quot;, //area/geojson, &quot;';&quot;)" />
			<xsl:value-of select="concat( 'document.addEventListener( `DOMContentLoaded`, function () { if( typeof drawMap !== `undefined` ) { drawMap( `',$mapContainer,'`,`', $style,'`,`',//output/@mapboxKey,'`, { lat: ', //area/centerLat, ', lng: ', //area/centerLng, ' }, wkt, listings, `', $iconType, '`, ', $scale, ' );}});' )" />
		</script>
	</xsl:template>

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="//listings/listing[@salePrice!='']">
<xsl:sort select="@salePrice" data-type="number" order="descending" />

				<xsl:if test="position()=1">
					<xsl:value-of select="concat( &quot;{caption: 'HH', state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'text {dominant-baseline:middle;}'" />

		</style>
		<symbol id="up-icon" class="stat-icon">
			<svg aria-hidden="true" focusable="false"
				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512">
				<path d="M88 166.059V468c0 6.627 5.373 12 12 12h56c6.627 0 12-5.373 12-12V166.059h46.059c21.382 0 32.09-25.851 16.971-40.971l-86.059-86.059c-9.373-9.373-24.569-9.373-33.941 0l-86.059 86.059c-15.119 15.119-4.411 40.971 16.971 40.971H88z"></path>
			</svg>
		</symbol>
		<symbol id="down-icon" class="stat-icon">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512">
				<path d="M168 345.941V44c0-6.627-5.373-12-12-12h-56c-6.627 0-12 5.373-12 12v301.941H41.941c-21.382 0-32.09 25.851-16.971 40.971l86.059 86.059c9.373 9.373 24.569 9.373 33.941 0l86.059-86.059c15.119-15.119 4.411-40.971-16.971-40.971H168z"></path>
			</svg>
		</symbol>

		<xsl:variable name="medianSalePrice" select="number(//statistics/@medianSalePrice)" />
		<xsl:variable name="previousMedianSalePrice" select="number(//previous/@medianSalePrice)" />
		<xsl:variable name="change" select="$medianSalePrice div $previousMedianSalePrice" />
		<xsl:variable name="formattedChange" select="format-number( abs( 1 - $change ), '#.0%' )" />

		<!-- <text x="50%" y="53%" class="upper center heading" font-size="180%" data-max-width="80%">
<xsl:value-of select="$areaWithPropertyType" />

		</text>

		<text x="50%" y="56%" class="upper center sub-heading" font-size="320%">
			Market Snapshot
		</text> -->

		<xsl:call-template name="letter-report-header">
			<xsl:with-param name="title" select="'Market Snapshot'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>

		<foreignObject x="10%" y="16%" height="15%" width="80%" class="medium center">
			<p style="font-size:100%;line-height:130%; color:var(--theme-body-color); font-family: var(--theme-body-font);">
				<xsl:value-of select="concat( 'The ', //areas/area/name, ' area has had the median sale price ')" />

				<xsl:choose>
					<xsl:when test="$change > 1">
						<xsl:value-of select="concat( ' increase by ', $formattedChange )" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( ' decrease by ', $formattedChange )" />
					</xsl:otherwise>
				</xsl:choose>

				<xsl:text> over the </xsl:text>
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="'last '" />
				</xsl:call-template>
				<xsl:text>. Take a look at the details below!</xsl:text>
			</p>
		</foreignObject>

		<text x="50%" y="28%" font-size="140%" class="center bold sub-heading" data-max-width="45%">
			<xsl:text>Highest sale price of </xsl:text>
			<xsl:call-template name="property-type-caption" />
		</text>

		<text x="50%" y="32%" font-size="240%" class="center heading">
			<tspan>
<xsl:value-of select="format-number( //statistics/@maxSalePrice, '$###,###')" />

			</tspan>
		</text>

		<text x="50%" y="35%" class="center " font-size="105%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
			<tspan>Sold on 
				<xsl:for-each select="//listings/listing[@salePrice!='']">
<xsl:sort select="@salePrice" data-type="number" order="descending" />

					<xsl:if test="position()=1">
						<xsl:value-of select="genie:format-date( //output/@sinceDate, '[MNn] [D], [Y0001]')" />
					</xsl:if>
				</xsl:for-each>
			</tspan>
		</text>

		<text x="50%" y="38.5%" font-size="140%" class="center bold sub-heading" data-max-width="40%">
			<xsl:text>Average sale price of </xsl:text>
			<xsl:call-template name="property-type-caption" />
		</text>

		<text x="50%" y="42%" font-size="240%" class="center heading">
			<tspan>
<xsl:value-of select="format-number( //statistics/@averageSalePrice, '$###,###')" />

			</tspan>
		</text>

		<g id="avg-sale-up-down-rate">
			<use class="bold" x="65.5%" y="47.5%" width="20%" height="2%">
				<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="$change > 1">
							<xsl:value-of select="'#up-icon'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'#down-icon'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="fill">
					<xsl:choose>
						<xsl:when test="$change > 1">
							<xsl:value-of select="'#7aa253'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'#b21f23'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</use>

			<text x="77%" y="48.3%" class="bold" font-size="105%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
				<xsl:variable name="since">
					<xsl:value-of select="genie:format-date( //output/@sinceDate, '[MNn] [Y0001]')" />
				</xsl:variable>

				<xsl:choose>
					<xsl:when test="$change > 1">
						<tspan>
							<xsl:value-of select="concat( ' Up ', $formattedChange, ' since '  )" />
						</tspan>
						<tspan x="77%" dy="2%">
							<xsl:value-of select="concat( ' ', $since )" />
						</tspan>
					</xsl:when>
					<xsl:otherwise>
						<tspan>
							<xsl:value-of select="concat( ' Up ', $formattedChange, ' since '  )" />
						</tspan>
						<tspan x="77%" dy="2%">
							<xsl:value-of select="concat( ' ', $since )" />
						</tspan>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<text x="50%" y="46%" font-size="140%" class="center bold sub-heading" data-max-width="40%">
			<xsl:text>Median sale price of </xsl:text>
			<xsl:call-template name="property-type-caption" />
		</text>

		<text x="50%" y="49.5%" font-size="240%" class="center heading">
			<tspan>
<xsl:value-of select="format-number( //statistics/@medianSalePrice, '$###,###')" />

			</tspan>
		</text>

		<foreignObject x="7%" y="55%" width="85%" height="40%">
			<div data-width="85%" data-height="40%">
				<xsl:call-template name="map-output-letter">
					<xsl:with-param name="style" select="'streets-v11'" />
				</xsl:call-template>
			</div>
		</foreignObject>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>