<?xml version="1.0"?>
<!--
	Asset Name:	Market Report Home Price Style 3
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
		<xsl:variable name="change" select="( //statistics/@averageSalePrice div //previous/@averageSalePrice ) - 1" />
		<xsl:variable name="formattedChange" select="format-number( abs( $change ), '#.0%' )" />

		<text x="3%" y="5%" class="upper" font-size="270%" fill="var(--theme-heading-color)" data-max-width="42.5%" style="letter-spacing:2.5px;">
			<xsl:value-of select="$areaWithPropertyType" />

		</text>

		<text x="3%" y="14%" font-size="170%" fill="var(--theme-sub-heading-color)" class="upper">
			<tspan>Market Update</tspan>
		</text>
		<foreignObject x="3%" y="15.8%" height="25%" width="40%" class="medium">
			<p style="font-size:95%;line-height:160%;">
				<xsl:value-of select="concat( 'The ', //areas/area/name, ' area has seen the average sale price ')" />

				<xsl:choose>
					<xsl:when test="$change > 0">
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

		<text x="3%" y="39%" font-size="120%" fill="var(--theme-sub-heading-color)" class="bold">
			<tspan>
				<xsl:value-of select="concat( 'Highest' , ' ', lower-case( $propertyType ), ' ', 'price of',' ' )" />
				<xsl:call-template name="property-type-caption" />
			</tspan>
		</text>
		<text x="3%" y="43.5%" font-size="200%" fill="var(--theme-heading-color)">
			<tspan>
				<xsl:for-each select="//listings/listing[@salePrice!='']">
					<xsl:sort select="@salePrice" data-type="number" order="descending" />

					<xsl:if test="position()=1">
						<xsl:value-of select="format-number( @salePrice, '$###,###')" />

					</xsl:if>
				</xsl:for-each>
			</tspan>
		</text>
		<text x="3%" y="50%" class="normal">
			<tspan>Sold on 
				<xsl:for-each select="//listings/listing[@salePrice!='']">
					<xsl:sort select="@salePrice" data-type="number" order="descending" />

					<xsl:if test="position()=1">
						<xsl:value-of select="genie:format-date( @soldDate, '[MNn] [D], [Y0001]')" />
					</xsl:if>
				</xsl:for-each>
			</tspan>
		</text>

		<text x="3%" y="56%" font-size="120%" fill="var(--theme-sub-heading-color)" class="bold">
			<tspan>
				<xsl:value-of select="concat( 'Average' , ' ', lower-case( $propertyType ), ' ', 'price of',' ' )" />
				<xsl:call-template name="property-type-caption" />
			</tspan>
		</text>

		<text x="3%" y="60.5%" font-size="200%" fill="var(--theme-heading-color)">
			<tspan>
				<xsl:value-of select="format-number( //statistics/@averageSalePrice, '$###,###')" />
			</tspan>
		</text>

		<g id="avg-sale-up-down-rate">
			<use x="15.6%" y="73%" width="25%" height="2.2%" fill="transparent" stroke="var(--theme-heading-color)" stroke-width="15">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#up-icon' )" />
			</use>
			<text x="29%" y="73%" font-size="90%" fill="var(--theme-heading-color)">
				<tspan>

					<xsl:choose>
						<xsl:when test="$change > 0">
							<xsl:value-of select="concat( ' Up by ', $formattedChange, ' since ' )" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat( ' Down by ', $formattedChange, ' since ')" />
						</xsl:otherwise>
					</xsl:choose>
				</tspan>

				<tspan x="28.5%" dy="3.5%">
					<xsl:value-of select="genie:format-date( //output/@sinceDate, '[MNn] [Y0001]')" />
				</tspan>
			</text>
		</g>

		<text x="3%" y="68%" font-size="120%" fill="var(--theme-sub-heading-color)" class="bold">
			<xsl:value-of select="concat( 'Median' , ' ', lower-case( $propertyType ), ' ', 'price of',' ' )" />
			<xsl:call-template name="property-type-caption" />
		</text>

		<text x="3%" y="72.5%" font-size="200%" fill="var(--theme-heading-color)">
			<xsl:for-each select="//listings/listing[@salePrice!='']">
				<xsl:sort select="@salePrice" data-type="number" order="descending" />

				<xsl:if test="position()=round( count(//listings/listing[@salePrice!='']) div 2 )">
					<xsl:value-of select="format-number( @salePrice, '$###,###')" />

				</xsl:if>
			</xsl:for-each>
		</text>

		<text x="3%" y="79%" class="normal">
			<tspan>
				<xsl:text>Sold on </xsl:text>
				<xsl:for-each select="//listings/listing[@salePrice!='']">
					<xsl:sort select="@salePrice" data-type="number" order="descending" />

					<xsl:if test="position()=round( count(//listings/listing[@salePrice!='']) div 2 )">
						<xsl:value-of select="genie:format-date( @soldDate, '[MNn] [D], [Y0001]')" />
					</xsl:if>
				</xsl:for-each>
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
