<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending V4 Back
	Tags:		Social Marketing Ad
	Sizes:		Postcard
Supports:	Area, QRCode
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:import href="icons.xsl" />

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

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
<rect x="63.5%" y="0%" width="36.5%" height="100%" fill="#fff" />
<rect x="63.5%" y="3%" stroke-width="1" fill-opacity="1" width="0.1%" height="93%" fill="var(--theme-body-color)" />


		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<xsl:variable name="min_sale_price" select="//area/statistics/@minSalePrice" />
		<xsl:variable name="prev_min_sale_price" select="//area/statistics/previous/@medianSalePrice" />
		<xsl:variable name="min_sale_price_change" select="($min_sale_price - $prev_min_sale_price) div $prev_min_sale_price * 100" />

		<text x="25%" y="3%" fill="var(--theme-heading-color)" style="font-size:220%;" class="center upper" data-max-width="50%">
			<tspan class="center">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="concat('SEE WHAT TRENDING WITH ', //area/name )" />
				</xsl:call-template>
			</tspan>
		</text>
		<g>
			<image x="0.5%" y="30%" width="10%" height="12%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<foreignObject x="-1.3%" y="7%" width="27%" height="45%" style="transform: translate(12.5%, 5%);">
				<div style=" height:260px;">
					<xsl:call-template name="map-output">
						<xsl:with-param name="style" select="'streets-v11'" />
					</xsl:call-template>
				</div>
				<div style="position:absolute;z-index:999;height: 10%;width:110%;left:0;bottom: -1.2%;">
					<svg width="25%" height="100%">
						<image x="-7%" y="4%" width="100%" height="100%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/MapArrow.svg' )" />
							</xsl:attribute>
						</image>

						<text x="6%" y="28%" fill="#fff" style="font-size:80%;">
								New (Active)
						</text>
					</svg>
					<svg width="25%" height="100%" style="transform: translateX(-11px);">
						<image x="0%" y="4%" width="100%" height="100%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/MapArrow-green.svg' )" />
							</xsl:attribute>
						</image>

						<text x="6%" y="28%" fill="#fff" style="font-size:80%;transform: translateX(25%);">
								Active
						</text>
					</svg>
					<svg width="25%" height="100%" style="transform: translateX(-21%);">
						<image x="0%" y="4%" width="100%" height="100%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/MapArrow-yellow.svg' )" />
							</xsl:attribute>
						</image>

						<text x="6%" y="28%" fill="#fff" style="font-size:80%;transform: translateX(25%);">
								Pending
						</text>
					</svg>
					<svg width="25%" height="100%" style="transform: translateX(-28%);">
						<image x="0%" y="4%" width="100%" height="100%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/MapArrow-red.svg' )" />
							</xsl:attribute>
						</image>

						<text x="6%" y="28%" fill="#fff" style="font-size:80%;transform: translateX(25%);">
								Sold
						</text>
					</svg>
				</div>
			</foreignObject>

			<use x="39%" y="13%" width="4%" height="10%" stroke="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#home-icon' )" />
			</use>
			<text x="46%" y="12%" fill="var(--theme-heading-color)" style="font-size:130%;" class="upper">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'home values '" />

					<xsl:with-param name="default" select="concat($singularPropertyType,' ', 'values?')" />
				</xsl:call-template>
			</text>
			<text class="center" style="transform: translate(11.5%, 5%);">
				<tspan x="41%" y="13%" fill="var(--theme-heading-color)" style="font-size:100%;" class="upper">
					<xsl:choose>
						<xsl:when test="$min_sale_price_change > 0">
<xsl:value-of select="concat( 'upto ',  format-number( $min_sale_price_change, '#.00') , '% in the ' )" />

						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="' 0% '" />
								<xsl:with-param name="default" select="' 0% '" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
				<tspan x="41%" y="16%" fill="var(--theme-heading-color)" style="font-size:100%;" class="upper">
					<xsl:choose>
						<xsl:when test="number(//areas/area[1]/statistics/@lookbackMonths)=1">
							<xsl:text>Last Month</xsl:text>
						</xsl:when>
						<xsl:otherwise>
<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' Months')" />

						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>
		</g>
		<svg>
			<use x="45.5%" y="30.2%" width="1.5%" height="1.5%" stroke="var(--theme-sub-heading-color)" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-icon' )" />
			</use>
			<text x="48%" y="29%" fill="var(--theme-heading-color)" style="font-size:130%;" class="upper">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'buyers '" />
						<xsl:with-param name="default" select="'buyers '" />
					</xsl:call-template>
				</tspan>
			</text>
		</svg>

		<svg y="4%">
			<use x="45.5%" y="30.2%" width="1.5%" height="1.5%" stroke="var(--theme-sub-heading-color)" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-icon' )" />
			</use>
			<text x="48%" y="29%" fill="var(--theme-heading-color)" style="font-size:130%;" class="upper">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'listings '" />
						<xsl:with-param name="default" select="'listings '" />
					</xsl:call-template>
				</tspan>
			</text>
		</svg>
		<svg y="8%">
			<use x="45.5%" y="30.2%" width="1.5%" height="1.5%" stroke="var(--theme-sub-heading-color)" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-icon' )" />
			</use>
			<text x="48%" y="29%" fill="var(--theme-heading-color)" style="font-size:130%;" class="upper">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'market facts '" />
						<xsl:with-param name="default" select="'market facts '" />
					</xsl:call-template>
				</tspan>
			</text>
		</svg>
		<use x="46%" y="46%" width="9%" height="9%" stroke="var(--theme-sub-heading-color)">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-down-icon' )" />
		</use>

		<g style="transform:translate(42%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'19.5%'" />
			</xsl:call-template>
		</g>

		<g style="transform: translate(58%, 39%);">
			<text style="font-size:90%">
				<tspan x="0%" y="4.8%" class="center" fill="var(--theme-body-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Scan to get'" />
						<xsl:with-param name="default" select="'Scan to get the'" />
					</xsl:call-template>
				</tspan>
				<tspan x="0%" y="7.8%" class="center" fill="var(--theme-body-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'the full report'" />
						<xsl:with-param name="default" select="'full report'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

<rect x="1%" y="60%" width="42%" height="27%" fill="var(--theme-heading-color)" />


		<g style="transform:translate(8%,64.7%)">
			<svg width="35%" height="17.5%">

				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
<circle r=".2500" cx=".5" cy=".5" />

				</clipPath>

				<image x="-6.7%" y="-22%" width="27.5%" height="99%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)" style="transform: scale(1.85);">
					<xsl:attribute name="href">
						<xsl:copy-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>

				<text x="29%" y="0%" class="upper" style="font-weight:600;font-size:180%;letter-spacing:4px;" fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'')" />
					</xsl:call-template>
				</text>
				<text x="29%" y="35%" width="65%" height="20%" style="color:var(--theme-body-background)">
					<tspan style="font-size:100%;" fill="var(--theme-body-background)">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
<xsl:with-param name="default" select="concat( //agent[1]/mobile , ' &#124; ')" />

						</xsl:call-template>
					</tspan>
					<tspan x="59%" y="0%" class="upper" style="font-size:100%;" fill="var(--theme-body-background)">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentlicencesNumber'" />
							<xsl:with-param name="default" select="//agent[1]/licencesNumber" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="29%" y="53.5%" style="font-size:100%;" fill="var(--theme-body-background)">

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</text>

				<text x="29%" y="73%" style="font-size:100%;" fill="var(--theme-body-background)">

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>
			</svg>
		</g>

<rect x="0" y="89%" stroke-width="1" fill-opacity="1" width="63%" height=".1%" fill="var(--theme-body-color)" />

		<foreignObject x="2%" y="91%" width="60%" height="4%" style="color:var(--theme-heading-color);font-size:60%;">

<xsl:call-template name="solicitation-disclaimer" />

		</foreignObject>

		<text class="small" fill="#000" style="font-weight:600;font-size:100%;">
			<tspan x="65.5%" y="7%">
<xsl:call-template name="listing-address-line-one" />

				<xsl:text>,</xsl:text>
			</tspan>
			<tspan x="65.5%" y="10%">
<xsl:call-template name="listing-address-line-two" />

			</tspan>
		</text>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>