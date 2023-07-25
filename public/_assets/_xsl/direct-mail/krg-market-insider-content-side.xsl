<?xml version="1.0"?>
<!--
	Asset Name: KRG Market Insider Content Side
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />
		<xsl:variable name="mapListingNodes" select="//listings/listing[@state='sold']" />

		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="$mapListingNodes">
				<xsl:if test="position() &lt;= 6">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',salePrice:'&quot;, @salePrice, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">

		<defs>
			<linearGradient id="lgrad" x1="0%" y1="52%" x2="100%" y2="48%">
				<stop offset="0%" style="stop-color:var(--theme-body-background);stop-opacity:0.81" />
				<stop offset="37%" style="stop-color:var(--theme-body-background);stop-opacity:0.85" />
				<stop offset="85%" style="stop-color:var(--theme-body-background);stop-opacity:0.96" />
				<stop offset="87%" style="stop-color:var(--theme-body-background);stop-opacity:0.97" />
				<stop offset="90%" style="stop-color:var(--theme-body-background);stop-opacity:0.99" />
				<stop offset="93%" style="stop-color:var(--theme-body-background);stop-opacity:1.00" />
				<stop offset="100%" style="stop-color:var(--theme-body-background);stop-opacity:1.00" />
			</linearGradient>
		</defs>
		<rect x="0" y="0" width="50%" height="100%" fill="var(--theme-heading-color)"/>
		<image x="0%" y="0%" width="50%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/krg-single-listing.jpg' )" />
			</xsl:attribute>
		</image>
		<rect x="0" y="0" width="50%" height="100%" fill="url(#lgrad)"/>
		<image x="36.5%" y="75%" width="13.5%" height="28.1%" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		<foreignObject x="50%" y="0%" width="50%" height="100%">
			<div data-width="50%" data-height="100%" style="z-index:-50;">
				<xsl:call-template name="map-output">
					<xsl:with-param name="iconType" select="'flag'" />
					<xsl:with-param name="style" select="'streets-v11'" />
				</xsl:call-template>
			</div>
		</foreignObject>
		<line stroke="var(--theme-heading-color)" stroke-width="0.3%" x1="50%" x2="50%" y1="0" y2="100%" />

		<xsl:call-template name="cropped-container" />

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
				<xsl:with-param name="height" select="'35%'" />
			</xsl:call-template>
		</g>
	</xsl:template>

	<xsl:template name="cropped-content">

		<g>

			<text x="4%" y="10%" class="upper narrow" fill="var(--theme-sub-heading-color)" style="font-size: 170%;letter-spacing:2px; font-weight:500;font-family:var(--theme-sub-heading-font)" data-max-width="40%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanames'" />
					<xsl:with-param name="default" select="concat(//area/name, ' TRENDS')" />
				</xsl:call-template>
			</text>
			<text x="4%" y="25%" class="middle lower" fill="var(--theme-heading-color)" style="font-family:var(--theme-heading-font); letter-spacing: 1px; font-size:285%; font-weight:800;">
				<tspan>
					<xsl:value-of select="format-number(//statistics/@soldPropertyTypeCount, '###,###')"/>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'neighbors'" />
						<xsl:with-param name="default" select="' NEIGHBORS'" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'sold'" />
						<xsl:with-param name="default" select="'sold'" />
					</xsl:call-template>
				</tspan>
				<tspan dx="2%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'homes'" />

						<xsl:with-param name="default" select="lower-case( $propertyType)" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%" fill="var(--theme-sub-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'inthe'" />
						<xsl:with-param name="default" select="'IN JUST THE '" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%" fill="var(--theme-sub-heading-color)">
					<xsl:choose>
						<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
							<xsl:text>LAST 30 DAYS.</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' Months')"/>
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>

			<text x="4%" y="61%" class="bold" fill="var(--theme-heading-color)" style="font-size:100%;font-weight:800;font-family:var(--theme-body-font);">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scan'" />
						<xsl:with-param name="default" select="'SCAN TO SEE '" />
					</xsl:call-template>
				</tspan>
				<tspan fill="var(--theme-sub-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'whosonthemove'" />
						<xsl:with-param name="default" select="'WHO’S ON THE MOVE.'" />
					</xsl:call-template>
				</tspan>
			</text>

			<svg width="41%" height="22%" x="0.8%" y="48%" version="3.0" id="Layer_1" viewBox="0 0 2000 452" style="enable-background:new 0 0 2000 452;" xml:space="preserve">
				<g>
					<path fill="var(--theme-sub-heading-color)" d="M1757.79,75.26c-58.07,0-105.31,47.24-105.31,105.31v117.14c0,42.23-34.36,76.59-76.59,76.59H136.91v11.53
                        h1438.98c48.59,0,88.12-39.53,88.12-88.12V180.57c0-51.71,42.07-93.78,93.78-93.78h114.2V75.26H1757.79z"/>
					<polygon fill="var(--theme-sub-heading-color)" points="1841.9,44.98 1834.31,53.66 1865.73,81.13 1835.02,109.35 1842.82,117.84 1883,80.92     "/>
				</g>
			</svg>
		</g>

		<text x="4%" y="80%" class="bold" style="font-size:150%; font-family: var(--theme-body-font);" data-max-width="30%" fill="var(--theme-heading-color)">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentName'" />
					<xsl:with-param name="default" select="//agent[1]/marketingName" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="4%" y="84.9%" style="font-size:90%;font-weight:500;font-family: var(--theme-body-font);" data-max-width="32%" fill="var(--theme-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>
		<text x="4%" y="89%" style="font-size:120%;font-family: var(--theme-body-font);" data-max-width="32%" fill="var(--theme-body-background)">
			<tspan fill="var(--theme-sub-heading-color)" class="bold">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'m'" />
					<xsl:with-param name="default" select="'m'" />
				</xsl:call-template>
			</tspan>
			<tspan x="6%" fill="var(--theme-heading-color)" style="font-weight:500;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select=" //agent[1]/mobile" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="4%" y="92%" fill="var(--theme-heading-color)" data-max-width="32%" style="font-family: var(--theme-body-font);font-size:120%;">
			<tspan dy="0.2%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'e'" />
					<xsl:with-param name="default" select="'e'" />
				</xsl:call-template>
			</tspan>
			<tspan x="6%" dy="0.5%" fill="var(--theme-heading-color)" style="font-weight:400; font-size:85%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmarketingEmail'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</tspan>
		</text>
		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="69%" y="84%" width="25%" height="13%" id="logo" preserveAspectRatio="xMinYMid meet">

					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogo" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="69%" y="84%" width="11%" height="13%" class="center" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
				<image x="83%" y="84%" width="16%" height="13%" class="center" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>