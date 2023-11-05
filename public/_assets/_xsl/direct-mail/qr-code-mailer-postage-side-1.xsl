<?xml version="1.0"?>
<!--
	Asset Name:	Qr Code Mailer Postage Side 1
	Tags:		Text
Supports:	Area, QRCode
	Sizes:		Postcard
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<script>
			<xsl:text>var listings=[</xsl:text>
			<xsl:for-each select="//listings/listing">
				<xsl:if test="position() &lt;= 6">
					<xsl:value-of select="concat( &quot;{state:'&quot;, @state, &quot;',lat:'&quot;, @lat, &quot;',lng:'&quot;, @lon, &quot;'},&quot; )" />
				</xsl:if>
			</xsl:for-each>
			<xsl:text>];</xsl:text>
		</script>
	</xsl:template>

	<xsl:template name="svg-body">

		<rect x="0" y="54.5%" stroke="#000" stroke-width="1" fill-opacity="1" width="100%" height=".5" fill="#000" />


		<rect x="35%" y="18.5%" stroke="#000" stroke-width="1" fill-opacity="1" width="65%" height=".5" fill="#000" />


		<rect x="75.9%" y="0%" stroke="#000" stroke-width="1" fill-opacity="1" width=".5" height="18.5%" fill="#000" />


		<rect x="63%" y="54.5%" stroke="#000" stroke-width="1" fill-opacity="1" width=".5" height="45%" fill="#000" />


		<rect x="34.9%" y="0%" stroke="#000" stroke-width="1" fill-opacity="1" width=".5" height="54.5%" fill="#000" />


		<rect x="63.1%" y="54.7%" width="36.8%" height="45%" fill="#fff" />
		<rect x="76.1%" y="0%" width="23.8%" height="18.2%" fill="#fff" />


		<xsl:call-template name="cropped-container" />
	</xsl:template>
	<xsl:template name="cropped-content">

		<style>
			<xsl:value-of select="'
			foreignObject#description p {--description-line-limit:12;}
			font-weight-normal{	font-weight: 600} 
			'" />
		</style>

		<g style="transform: translate(57%, 3%);">
			<text x="20%" y="3%" fill="#000" style="font-size:120%">
				<xsl:value-of select="//agent[1]/address/street" />
			</text>
			<text x="20%" y="6.2%" fill="#000" style="font-size:120%">
				<xsl:value-of select="//agent[1]/address/city" />

				<xsl:text>, </xsl:text>
				<xsl:value-of select="//agent[1]/address/state" />

				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="//agent[1]/address/zip" />
			</text>
		</g>

		<g style="transform: translate(36%, 26%);">
			<text x="0" y="0" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:225%;" data-max-width="30%">
				<tspan x="0" y="0%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'seewhat'" />
						<xsl:with-param name="default" select="'See What’s'" />
					</xsl:call-template>
				</tspan>
				<tspan x="0" dy="6%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'trending'" />
						<xsl:with-param name="default" select="'Trending with'" />
					</xsl:call-template>
				</tspan>
				<tspan x="0" dy="7%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<text x="2%" y="4%" class="upper bold" fill="var(--theme-sub-heading-color)" style="font-size:200%;" data-max-width="30%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areaname'" />
				<xsl:with-param name="default" select="//area/name" />
			</xsl:call-template>
		</text>
		<g style="transform: translate(0, 6%);">
			<text x="36%" y="0" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:150%;">Homes 
				<tspan x="36%" y="4%">Values</tspan>
			</text>
		</g>

		<g style="transform: translate(75%, 6%);">

			<image width="5%" height="9%" x="-22%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="default" select="concat( //output/@siteUrl, '_assets/_img/icons/up-arrow-new.svg' )" />
				</xsl:call-template>
			</image>

			<text x="0" y="-1%" class="bold right" fill="var(--theme-sub-heading-color)" style="font-size:250%;">$217,395</text>

			<text x="0" y="6.5%" class="right" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
				<xsl:choose>
					<xsl:when test="//areas/area[1]/statistics/@lookbackMonths='1'">
						<xsl:text>Last Month</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( 'Last ', //areas/area[1]/statistics/@lookbackMonths, ' Months')" />

					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<g style="transform: translate(0%, 1.5%);">

			<g style="transform: translate(70%, 22%);">
				<use x="0" y="2%" width="4%" height="6%" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon-2' )" />
				</use>
				<text x="4%" y="2%" class="upper bold" fill="var(--theme-sub-heading-color)" style="font-size:200%;">
					buyer
				</text>
			</g>

			<g style="transform: translate(70%, 30%);">
				<use x="0" y="2%" width="4%" height="6%" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon-2' )" />
				</use>
				<text x="4%" y="2%" class="upper bold" fill="var(--theme-sub-heading-color)" style="font-size:200%;">
					Listings
				</text>
			</g>

			<g style="transform: translate(70%, 38%);">
				<use x="0" y="2%" width="4%" height="6%" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-mark-icon-2' )" />
				</use>
				<text x="4%" y="2%" class="upper bold" fill="var(--theme-sub-heading-color)" style="font-size:200%;">
					Market Facts
				</text>
			</g>
		</g>

		<foreignObject x="1.5%" y="14%" width="33%" height="40%">
			<div width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
				<div style="height: 100%;width:100%;">
					<xsl:call-template name="map-output">
						<xsl:with-param name="style" select="'streets-v11'" />
					</xsl:call-template>
				</div>

				<div style="position:absolute;top:0;left:0;z-index:999;height:60%;width:58%;">
					<svg height="100%" width="100%">
						<filter x="-7%" y="-0.5" width="1.6" height="8.5" id="solid">
							<feFlood flood-color="var((--theme-body-color)" flood-opacity="0.2" />
							<feComposite in="SourceGraphic" operator="xor" />
						</filter>

						<svg filter="url(#solid)" fill="var(--theme-body-background)">

							<svg x="3%" y="9%">
								<circle cy="10%" r="12" fill="var(--theme-emphasis-color)" cx="7%"></circle>
								<text x="7%" y="5%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
									<xsl:value-of select="count($listingsTotalNew)" />
								</text>
								<text x="15%" y="3%" fill="var(--theme-body-background)" style="font-size:100%;">
								New (Active)
								</text>
							</svg>
							<svg x="3%" y="32%">
								<circle cy="10%" r="12" fill="var(--active-green)" cx="7%"></circle>
								<text x="7%" y="5%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
									<xsl:value-of select="count($listingsTotalActive)" />
								</text>
								<text x="15%" y="4%" fill="var(--theme-body-background)" style="font-size:100%;">
								Active
								</text>
							</svg>
							<svg x="3%" y="54%">
								<circle cy="10%" r="12" fill="var(--pending-yellow)" cx="7%"></circle>
								<text x="7%" y="5%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
									<xsl:value-of select="count($listingsTotalPending)" />
								</text>
								<text x="15%" y="4%" fill="var(--theme-body-background)" style="font-size:100%;">
								Pending
								</text>
							</svg>
							<svg x="3%" y="78%">
								<circle cy="10%" r="12" fill="var(--sold-red)" cx="7%"></circle>
								<text x="7%" y="5%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
									<xsl:value-of select="count($listingsTotalSold)" />
								</text>
								<text x="15%" y="4%" fill="var(--theme-body-background)" style="font-size:100%;">
								Sold
								</text>
							</svg>
						</svg>
					</svg>
				</div>
			</div>
		</foreignObject>

		<svg width="63%" height="100%;" style="position:absolute;">
			<g style="transform: translate(3%, 44%);">

				<g>
					<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
						<circle r=".3185" cx=".5" cy=".5" />
					</clipPath>

					<xsl:if test="//agent[1]/photo">
						<image x="-3%" y="10%" width="20%" height="24%" clip-path="url(#clipCircle)">
							<xsl:attribute name="href">
								<xsl:copy-of select="//agent[1]/photo" />
							</xsl:attribute>
						</image>
					</xsl:if>

					<g style="transform: translate(6%, 0%);">
						<text class="h1 upper bold" x="11%" y="16%" fill="var(--theme-sub-heading-color)" style="font-size:200%;">
							<tspan>
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'agentname'" />
									<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'')" />
								</xsl:call-template>
							</tspan>
						</text>

						<text x="11%" y="21.5%" style="font-size:200%;" fill="var(--theme-sub-heading-color)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'innovatorrealtor'" />
								<xsl:with-param name="default" select="'Innovator REALTOR'" />
							</xsl:call-template>
						</text>
						<text x="11%" y="27%" class="bold" fill="" style="font-size:250%;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentmobile'" />
								<xsl:with-param name="default" select="//agent[1]/mobile" />
							</xsl:call-template>
						</text>
					</g>
				</g>
				<g>
					<image x="0" y="33%" width="14%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="$companyLogo" />
						</xsl:attribute>
					</image>
					<text x="1%" y="46%" style="font-size:85%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
				</g>
				<g style="transform: translate(17%, 0);">
					<foreignObject x="0%" y="46%" width="76%" height="4%" style="color:var(--theme-sub-heading-color);-webkit-line-clamp:6; font-size: 70%;line-height: 120%;">
						<xsl:call-template name="solicitation-disclaimer" />
					</foreignObject>
				</g>
			</g>
		</svg>

		<g style="transform:translate(41.58%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'19.5%'" />
				<xsl:with-param name="height" select="'19.5%'" />
			</xsl:call-template>
		</g>
		<image x="56%" y="58%" width="6.5%" height="12%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/scan-qr.svg' )" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>