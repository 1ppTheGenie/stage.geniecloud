<?xml version="1.0"?>
<!--
	Asset Name:	Coit Mailer Back
	Tags:		Direct Mail
	Supports:	Area, Multi-Listing, Print, PricePercent, QRCode
	Sizes:		Postcard
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:value-of select="'var listings=['"/>
			<xsl:for-each select="//listings/listing">
				<xsl:sort order="ascending" select="@state"/>
				<xsl:if test="position() &lt;= 100">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:value-of select="'];'"/>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/compass-serif.css') "/>
		</link>

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
					<xsl:call-template name="map-key"/>
				</svg>
			</div>
		</foreignObject>

		<rect x="63%" y="55%" width="37%" height="45%" fill="#fff"/>

		<line x1="35%" x2="100%" y1="20.5%" y2="20.5%" stroke="var(--theme-emphasis-color)" stroke-width="1"/>

		<line x1="73.5%" x2="73.5%" y1="0" y2="20.5%" stroke="var(--theme-emphasis-color)" stroke-width="1" />

		<line x1="63%" x2="63%" y1="55%" y2="100%" stroke="var(--theme-emphasis-color)" stroke-width="1"/>

		<line x1="35%" x2="35%" y1="0" y2="55%" stroke="var(--theme-emphasis-color)" stroke-width="1" />

		<line x1="0" x2="100%" y1="55%" y2="55%" stroke="var(--theme-emphasis-color)" stroke-width="1" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<rect x="73.5%" y="0%" width="25%" height="19.5%" fill="#fff"/>

		<g style="transform: translate(54.5%, 1.5%);">
			<text x="20%" y="3%" fill="#000" font-weight="600" style="font-size:80%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'streetaddress'" />
					<xsl:with-param name="default" select="//agent[1]/address/street" />
				</xsl:call-template>
			</text>
			<text x="20%" y="6%" fill="#000" font-weight="600" style="font-size:82%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'cityaddress'" />
					<xsl:with-param name="default" select="concat( //agent[1]/address/city, ', ', //agent[1]/address/state, ' ', //agent[1]/address/zip )" />
				</xsl:call-template>
			</text>
		</g>

		<g style="transform: translate(36.5%, 23.5%);">
			<text x="0" y="0" class="serif-text" fill="var(--theme-heading-color)" font-size="280%" font-weight="600">
				<tspan x="0" y="0">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'sloganone'" />
						<xsl:with-param name="default" select="'Local. Knowledgable.'" />
					</xsl:call-template>
				</tspan>
				<tspan x="0" y="8.5%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'slogantwo'" />
						<xsl:with-param name="default" select="'Experienced. Results.'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="0" y="19%" class="" fill="var(--theme-heading-color)" font-size="105%" font-weight="400">
				<tspan x="0" dy="0%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'clientbioone'" />
						<xsl:with-param name="default" select="'Susan Canavan and Deirdre Coit have been unrivaled in your community for over'" />
					</xsl:call-template>
				</tspan>
				<tspan x="0" dy="3.2%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'clientbiosecond'" />
						<xsl:with-param name="default" select="'thirty-five years as skillful, connected, and resourceful representatives of owners selling'" />
					</xsl:call-template>
				</tspan>
				<tspan x="0" dy="3.2%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'clientbiothird'" />
						<xsl:with-param name="default" select="'their homes. If you’ve been thinking about making a move, connect with them today!'" />
					</xsl:call-template>
				</tspan>
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
						<xsl:with-param name="short" select="'true'"/>
						<xsl:with-param name="singular" select="'true'"/>
					</xsl:call-template>
				</tspan>
				<tspan x="36.5%" y="4.7%">Values</tspan>
			</text>
		</g>

		<g style="transform: translate(74%, 2%);">
			<xsl:variable name="change" select="genie:area-price-change( //areas/area[1]/statistics, //output/@pricePercent, '' )" />

			<image width="5.5%" height="10%" x="-26%" y="1%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'price-change-arrow'" />
					<xsl:with-param name="default">
						<xsl:choose>
							<xsl:when test="$change != 0">
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/circle-down-arrow.svg' )" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/up-arrow-new.svg' )" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</image>

			<text x="-1.5%" y="1.8%" class="bold right medium" fill="var(--theme-heading-color)" style="font-size:190%;">
				<xsl:choose>
					<xsl:when test="//output/@pricePercent = 'price'">
						<xsl:value-of select="genie:currency-format( $change, 0 )" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="abs($change) < 35">
								<xsl:value-of select="format-number( $change, '#.#%' )" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="format-number( $change, '#%' )" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</text>

			<text x="-1.5%" y="7.5%" class="right small" fill="var(--theme-heading-color)" style="font-size:90%;font-weight:700;">
				<xsl:choose>
					<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
						<xsl:text>Last 30 days</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' Months')"/>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<g style="transform: translate(2%, 55%);">
			<g style="transform: translate(15%, 5%);">

				<text x="1%" y="2%" class="h1 upper bold" font-size="160%" fill="var(--theme-heading-color)" data-max-width="25%">
					<tspan x="1%" y="0">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'innovatorrealtor'" />
							<xsl:with-param name="default" select="concat('Your ',//area/name)" />
						</xsl:call-template>
					</tspan>
					<tspan x="1%" y="5%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'innovatorrealtor'" />
							<xsl:with-param name="default" select="'SPECIALIST' " />
						</xsl:call-template>
					</tspan>
				</text>

				<text x="1%" y="10.5%" class="" fill="var(--theme-heading-color)" style="font-size:190%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>

				<text x="1%" y="16.6%" class="bold" fill="var(--theme-heading-color)" style="font-size:150%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'firstagentname'" />
						<xsl:with-param name="default" select="'Susan Canavan'" />
					</xsl:call-template>
				</text>

				<text x="1%" y="21.1%" class="bold" fill="var(--theme-heading-color)" style="font-size:80%;" data-max-width="28%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'licenseno'" />
						<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
					</xsl:call-template>
				</text>
				<text x="1%" y="23.8%" class="bold" fill="var(--theme-heading-color)" style="font-size:150%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'secondagentname'" />
						<xsl:with-param name="default" select="'Deirdre Coit'" />
					</xsl:call-template>
				</text>
				<text x="1%" y="28%" class="bold" fill="var(--theme-heading-color)" style="font-size:80%;" data-max-width="28%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'licenseno'" />
						<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
					</xsl:call-template>
				</text>

				<foreignObject x="-15%" y="30%" width="60%" height="15%" style="color:var(--theme-heading-color);font-size:54%;">
					<p>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'trends-disclaimer'" />
							<xsl:with-param name="default" select="'Compass is a licensed real estate broker (01991628) in the State of California and abides by Equal Housing Opportunity laws. All material presented herein is intended for informational purposes only. Information is compiled from sources deemed reliable but is subject to errors, omissions, changes in price, condition, sale, or withdraw without  notice. If your home is currently listed for sale, this is not intended to be a solicitation. To reach the Compass main office call 760.249.2120'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</g>

			<g style="transform: translate(41%, 3%);">
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'12%'" />
					<xsl:with-param name="height" select="'20%'" />
				</xsl:call-template>

				<use href="#qr-code-svg" x="12%" y="2%" width="7.5%" height="15%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/qr.svg#qr-code' )" />
				</use>

				<text x="1.5%" y="20.8%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:90%;">Get Full Report</text>
			</g>

			<xsl:if test="//agent[1]/photo">
				<image x="0%" y="5%" width="15%" height="30%" preserveAspectRatio="xMidYMid slice">
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