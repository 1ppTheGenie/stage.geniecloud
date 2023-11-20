<?xml version="1.0"?>
<!--
	Asset Name:	Market Snapshot
	Tags:		Text
	Supports:	Area, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />


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
		<xsl:variable name="medianSalePrice" select="number(//statistics/@medianSalePrice)" />
		<xsl:variable name="previousMedianSalePrice" select="number(//previous/@medianSalePrice)" />
		<xsl:variable name="change" select="$medianSalePrice div $previousMedianSalePrice" />
		<xsl:variable name="formattedChange" select="format-number( abs( 1 - $change ), '#.0%' )" />

		<text x="3%" y="6%" class="upper heading" font-size="270%" data-max-width="45%">
			<xsl:value-of select="$areaWithPropertyType" />

		</text>

		<text x="3%" y="12.5%" class="upper sub-heading" font-size="180%">
			Market Snapshot
		</text>
		<foreignObject x="3%" y="15.8%" height="25%" width="45%" class="medium">
			<p style="font-size:100%;line-height:150%; color:var(--theme-body-color); font-family: var(--theme-body-font);">
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

		<text x="3%" y="44%" font-size="140%" class="bold sub-heading" data-max-width="45%">
			<xsl:text>Highest sale price of </xsl:text>
			<xsl:call-template name="property-type-caption" />
		</text>

		<text x="3%" y="48.3%" font-size="240%" class="heading">
			<tspan>
				<xsl:value-of select="format-number( //statistics/@maxSalePrice, '$###,###')" />

			</tspan>
		</text>

		<text x="3%" y="55%" class="" font-size="105%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
			<tspan>Sold on 
				<xsl:for-each select="//listings/listing[@salePrice!='']">
					<xsl:sort select="@salePrice" data-type="number" order="descending" />

					<xsl:if test="position()=1">
						<xsl:value-of select="genie:format-date( @soldDate, '[MNn] [D], [Y0001]' )" />
					</xsl:if>
				</xsl:for-each>
			</tspan>
		</text>

		<text x="3%" y="60.3%" font-size="140%" class="bold sub-heading" data-max-width="45%">
			<xsl:text>Average sale price of </xsl:text>
			<xsl:call-template name="property-type-caption" />
		</text>

		<text x="3%" y="65.2%" font-size="240%" class="heading">
			<tspan>
				<xsl:value-of select="format-number( //statistics/@averageSalePrice, '$###,###')" />
			</tspan>
		</text>

		<g id="avg-sale-up-down-rate">
			<use class="bold" x="15.8%" y="80%" width="25%" height="3%" fill="transparent" stroke="var(--theme-heading-color)" stroke-width="15">
				<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="$change > 1">
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons.svg#up-icon' )" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons.svg#down-icon' )" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</use>

			<text x="30%" y="79.5%" class="bold" style="font-size:130%;" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
				<xsl:variable name="since">
					<xsl:value-of select="genie:format-date( //output/@sinceDate, '[MNn] [Y0001]' )" />
				</xsl:variable>

				<xsl:choose>
					<xsl:when test="$change > 1">
						<tspan>
							<xsl:value-of select="concat( ' Up ', $formattedChange, ' since '  )" />
						</tspan>
						<tspan x="30%" dy="4.5%">
							<xsl:value-of select="concat( ' ', $since )" />
						</tspan>
					</xsl:when>
					<xsl:otherwise>
						<tspan>
							<xsl:value-of select="concat( ' Down ', $formattedChange, ' since '  )" />
						</tspan>
						<tspan x="30%" dy="4.5%">
							<xsl:value-of select="concat( ' ', $since )" />
						</tspan>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<text x="3%" y="74%" font-size="145%" class="bold sub-heading" data-max-width="45%">
			<xsl:text>Median sale price of </xsl:text>
			<xsl:call-template name="property-type-caption" />
		</text>

		<text x="3%" y="78.5%" font-size="240%" class="heading">
			<tspan>
				<xsl:value-of select="format-number( //statistics/@medianSalePrice, '$###,###')" />

			</tspan>
		</text>

		<foreignObject x="52%" y="5%" width="45%" height="85%">
			<div data-width="45%" data-height="85%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
				</xsl:call-template>
			</div>
		</foreignObject>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>