<?xml version="1.0"?>
<!--
	Asset Name: Qr code postcard 2022 6
	Tags: 		Direct Mail
	Sizes:		Postcard
	Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:variable name="mapListingNodes" select="//listings/listing[@state='sold']" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />
		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="$mapListingNodes">
				<xsl:if test="position() &lt;= 20">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',salePrice:'&quot;, @salePrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<foreignObject x="61%" y="0%" width="39%" height="100%">
			<div width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
				<div style="height: 650px;width:100%;">
					<xsl:call-template name="map-output">
						<xsl:with-param name="iconType" select="'flag'" />
						<xsl:with-param name="style" select="'streets-v11'" />
					</xsl:call-template>
				</div>
			</div>
		</foreignObject>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g>
			<text x="30%" y="3%" class="center upper" style="font-size: 270%; font-family:var(--theme-heading-font);letter-spacing: 4px" data-max-width="50%">
				<tspan style="font-weight:800;color:var(--theme-sub-heading-color);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areanames'" />
						<xsl:with-param name="default" select="concat(//area/name, ' ')" />
					</xsl:call-template>
				</tspan>
				<tspan x="30%" dy="8%" style="font-weight:600;color:var(--theme-body-color);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'trends'" />
						<xsl:with-param name="default" select="' TRENDS'" />
					</xsl:call-template>
				</tspan>
			</text>

			<circle r="6%" cx="20%" cy="28%" fill="var(--theme-body-color)" stroke="var(--theme-sub-heading-color)" stroke-width="4"></circle>

			<text x="20%" y="28%" class="center upper" fill="var(--theme-sub-heading-color)" font-size="350%" font-family="var(--theme-heading-font)" font-weight="bold" style="dominant-baseline:mathematical">
				<xsl:value-of select="format-number(//statistics/@soldPropertyTypeCount, '###,###')" />
			</text>

			<text x="20%" y="44.5%" class="center upper" fill="var(--theme-body-color)" font-size="160%" font-weight="700" font-family="var(--theme-heading-font)" style="dominant-baseline:auto">
				<tspan style=";">
					<xsl:text>OF YOUR</xsl:text>
					<xsl:text> </xsl:text>
					<tspan fill="var(--theme-sub-heading-color)" font-size="130%" font-weight="800">
						<xsl:text>NEIGHBORS'</xsl:text>
					</tspan>
				</tspan>

				<tspan x="20%" dy="6%">
					<xsl:text>HOMES</xsl:text>
					<xsl:text> </xsl:text>
					<tspan fill="var(--theme-sub-heading-color)" font-size="130%" font-weight="800">
						<xsl:text>SOLD</xsl:text>
					</tspan>
					<xsl:text> </xsl:text>
					<xsl:text>IN THE</xsl:text>
				</tspan>

				<tspan x="20%" dy="6%">
					<xsl:choose>
						<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
							<xsl:text>LAST 30 DAYS</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' Months')" />
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>

			<g style="transform:translate(3%, 2%);">
				<rect x="13%" y="65%" width="10%" height="18%" stroke="var(--theme-body-color)" stroke-width="1" rx="70" ry="70" fill="#ffffff"></rect>

				<clipPath id="clipCircle">
					<circle r="6%" cx="18%" cy="74%" fill="var(--theme-emphasis-color)"></circle>
				</clipPath>

				<image x="13%" y="65%" width="10%" height="18%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>

				<text x="18%" y="85%" class="center upper" fill="var(--theme-body-color)" style="font-size:150%;font-weight:600;font-family:var(--theme-body-font);letter-spacing:2px;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentfirstName'" />
							<xsl:with-param name="default" select="//agent[1]/firstName" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:text>&#160;</xsl:text>
					</tspan>
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentlastname'" />
							<xsl:with-param name="default" select="//agent[1]/lastName" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="18%" y="90%" class="center upper" fill="var(--theme-body-color)" style="font-size:130%;font-weight:600;font-family:var(--theme-body-font);letter-spacing:2px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>
			</g>
			<text class="center upper bold" style="font-family:var(--theme-heading-font); letter-spacing: 1px;">
				<tspan x="50%" y="78%" fill="var(--theme-body-color)" style="font-size: 150%;font-weight:800;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scantosee'" />
						<xsl:with-param name="default" select="'SCAN TO SEE'" />
					</xsl:call-template>
				</tspan>
				<tspan x="50%" y="82%" fill="var(--theme-body-color)" style="font-size: 150%;font-weight:800;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'whosonthe'" />
						<xsl:with-param name="default" select="'WHO’S ON THE'" />
					</xsl:call-template>
				</tspan>
				<tspan x="50%" y="86%" fill="var(--theme-sub-heading-color)" style="font-size: 250%;font-weight:800;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'move'" />
						<xsl:with-param name="default" select="'MOVE!'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
			</xsl:call-template>
		</g>
	</xsl:template>
</xsl:stylesheet>