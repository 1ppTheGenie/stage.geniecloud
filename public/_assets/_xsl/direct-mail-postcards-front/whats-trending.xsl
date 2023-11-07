<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending
	Tags:		Direct Mail
Supports:	Area, Multi-Listing, Print, PricePercent, QRCode
	Sizes:		Postcard
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
<xsl:value-of select="'var listings=['" />

			<xsl:for-each select="//listings/listing">
<xsl:sort order="ascending" select="@state" />

				<xsl:if test="position() &lt;= 100">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
<xsl:value-of select="'];'" />

		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'foreignObject#description p {--description-line-limit:12;}'" />

		</style>

		<xsl:call-template name="cropped-container" />

		<foreignObject x="2%" y="14%" width="33%" height="41%">
			<div data-width="33%" data-height="45%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
				</xsl:call-template>
			</div>

			<div style="position:absolute;top:0;left:0;z-index:999;height:55%;width:45%;">
				<svg height="100%" width="100%">
<xsl:call-template name="map-key" />

				</svg>
			</div>
		</foreignObject>

<rect x="63%" y="55%" width="37%" height="45%" fill="#fff" />


<line x1="35%" x2="100%" y1="20.5%" y2="20.5%" stroke="var(--theme-emphasis-color)" stroke-width="1" />


		<line x1="73.5%" x2="73.5%" y1="0" y2="20.5%" stroke="var(--theme-emphasis-color)" stroke-width="1" />

<line x1="63%" x2="63%" y1="55%" y2="100%" stroke="var(--theme-emphasis-color)" stroke-width="1" />


		<line x1="35%" x2="35%" y1="0" y2="55%" stroke="var(--theme-emphasis-color)" stroke-width="1" />

		<line x1="0" x2="100%" y1="55%" y2="55%" stroke="var(--theme-emphasis-color)" stroke-width="1" />
	</xsl:template>

	<xsl:template name="cropped-content">
<rect x="73.5%" y="0%" width="25%" height="19.5%" fill="#fff" />


		<g style="transform: translate(54.5%, 1.5%);">
			<text x="20%" y="3%" fill="#000" font-weight="600" style="font-size:80%;">
<xsl:value-of select="//agent[1]/address/street" />

			</text>
			<text x="20%" y="6%" fill="#000" font-weight="600" style="font-size:82%;">
<xsl:value-of select="concat( //agent[1]/address/city, ', ', //agent[1]/address/state, ' ', //agent[1]/address/zip )" />

			</text>
		</g>

		<g style="transform: translate(36.5%, 27%);">
			<text x="0" y="0" class="bold" fill="var(--theme-heading-color)" style="font-size:220%;">
				<tspan x="0" y="0">See What's</tspan>
				<tspan x="0" y="7%">Trending with</tspan>
			</text>
			<text x="0" y="14%" class="bold" fill="var(--theme-heading-color)" style="font-size:220%;" data-max-width="30%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanames'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
			</text>
		</g>

		<text x="2%" y="6.5%" class="upper bold" fill="var(--theme-heading-color)" style="font-size:140%;" data-max-width="28%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="//area/name" />
			</xsl:call-template>
		</text>

		<g style="transform: translate(0, 3.5%);">
			<text x="36.5%" y="0" fill="var(--theme-heading-color)" style="font-size:180%;font-weight:800;">
				<tspan>
					<xsl:call-template name="property-type-caption">
<xsl:with-param name="short" select="'true'" />
<xsl:with-param name="singular" select="'true'" />

					</xsl:call-template>
				</tspan>
				<tspan x="36.5%" y="4.7%">Values</tspan>
			</text>
		</g>

		<g style="transform: translate(74%, 2%);">
			<xsl:variable name="change" select="genie:area-price-change( //areas/area[1]/statistics, 'price', 0 )" />

			<image width="5.5%" height="10%" x="-26%" y="1%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'price-change-arrow'" />
					<xsl:with-param name="default">
						<xsl:choose>
							<xsl:when test="$change > 0">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/up-arrow-new.svg' )" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/circle-down-arrow.svg' )" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</image>

			<text x="-1.5%" y="1.8%" class="bold right medium" fill="var(--theme-heading-color)" style="font-size:190%;">
				<xsl:value-of select="genie:currency-format( $change, 0 )" />
			</text>

			<text x="-1.5%" y="7.5%" class="right small" fill="var(--theme-heading-color)" style="font-size:90%;font-weight:700;">
				<xsl:choose>
					<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
						<xsl:text>Last 30 days</xsl:text>
					</xsl:when>
					<xsl:otherwise>
<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' Months')" />

					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<g style="transform: translate(0%, 2.5%);">
			<g style="transform: translate(69%, 22%);">
				<use x="0" y="2%" width="3.8%" height="5.3%" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon' )" />
				</use>
				<text x="3.7%" y="2.5%" class="upper bold" fill="var(--theme-heading-color)" style="font-size:220%;">
					Buyers
				</text>
			</g>

			<g style="transform: translate(69%, 30%);">
				<use x="0" y="2%" width="3.8%" height="5.3%" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon' )" />
				</use>
				<text x="3.7%" y="2.5%" class="upper bold" fill="var(--theme-heading-color)" style="font-size:220%;">
					Listings
				</text>
			</g>

			<g style="transform: translate(69%, 38%);">
				<use x="0" y="2%" width="3.8%" height="5.3%" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon' )" />
				</use>
				<text x="3.7%" y="2.5%" class="upper bold" fill="var(--theme-heading-color)" style="font-size:220%;">
					Market Facts
				</text>
			</g>
		</g>

		<g style="transform: translate(2%, 55%);">
			<g style="transform: translate(15%, 5%);">
				<text x="-4%" y="2%" class="h1 upper bold" fill="var(--theme-heading-color)" style="font-size:170%;" data-max-width="28%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentName'" />
						<xsl:with-param name="default" select="//agent[1]/marketingName" />
					</xsl:call-template>
				</text>

				<text x="-4%" y="6%" class="bold" font-size="135%" fill="var(--theme-heading-color)" style="text-transform:uppercase;" data-max-width="28%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'innovatorrealtor'" />
						<xsl:with-param name="default" select="concat(//area/name, ' SPECIALIST' )" />
					</xsl:call-template>
				</text>

				<text x="-4%" y="10.5%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:190%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>

				<text x="-4%" y="16%" class="bold" fill="var(--theme-heading-color)" style="font-size:140%;" data-max-width="28%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>

				<text x="-15%" y="33%" font-size="60%" fill="var(--theme-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'licenseno'" />
						<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
					</xsl:call-template>
				</text>

				<xsl:choose>
					<xsl:when test="$companyLogo='' or $personalLogo=''">
						<image x="-15%" y="18%" width="14%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
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
						<image x="0%" y="20%" width="14%" height="8%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="$personalLogo" />
							</xsl:attribute>
						</image>
						<image x="-15%" y="20%" width="14%" height="8%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="$companyLogo" />
							</xsl:attribute>
						</image>
					</xsl:otherwise>
				</xsl:choose>

				<foreignObject x="0" y="30%" width="45%" height="15%" style="color:var(--theme-heading-color);-webkit-line-clamp:6;font-size:66%;line-height:%;">
					<p>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'trends-disclaimer'" />
							<xsl:with-param name="default" select="concat( 'Neighborhood Market Trends Information provided by third-party sources is deemed reliable, but not guaranteed. If your',  ' ', lower-case($singularPropertyType),' ','is currently listed for sale, this is not intended to be a solicitation. &#169; ', $currentYear )" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</g>

			<g style="transform: translate(41%, 3%);">
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'12%'" />
				</xsl:call-template>

				<use x="12%" y="2%" width="7.5%" height="15%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/qr.svg#qr-code' )" />
				</use>

				<text x="1.5%" y="20.8%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:90%;">Get Full Report</text>
			</g>

			<xsl:if test="//agent[1]/photo">
				<clipPath id="circleClip">
					<circle r="6%" cx="5%" cy="14%" />
				</clipPath>

				<image clip-path="url(#circleClip)" x="0%" y="5%" width="10%" height="20%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:copy-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
			</xsl:if>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>