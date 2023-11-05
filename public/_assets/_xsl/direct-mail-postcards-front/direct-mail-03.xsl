<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Open House Postcard - No.1
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House, Multi-Listing, Postcard
	Permission:	Direct Mail
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
		<foreignObject x="1%" y="0%" width="99%" height="100%">

			<div width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
				<div style="height: 600px; width:50%;">
					<xsl:call-template name="map-output">
						<xsl:with-param name="style" select="'streets-v11'" />
					</xsl:call-template>
				</div>

				<div style="position:absolute;top:0;left:0;z-index:999;height:35%">
					<svg height="100%" width="100%">
						<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-sub-heading-color)" fill-opacity="0.7"></rect>
						<text x="3%" y="4%" class="capitalize" fill="var(--theme-body-background)" style="font-size:150%;font-weight:600;" data-max-width="25%">
							<tspan>
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'areaname'" />
									<xsl:with-param name="default" select="//area/name" />
								</xsl:call-template>
							</tspan>
							<tspan dx="2%">
								<xsl:value-of select="$propertyType" />
							</tspan>
						</text>
						<text x="3%" y="18%" class="capitalize" fill="var(--theme-body-background)" style="font-size:100%;">
							<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
						</text>
						<svg x="1%" y="32%">
							<circle cy="5%" r="10" fill="var(--theme-emphasis-color)" cx="5%"></circle>
							<text x="5%" y="1.7%" class="center" fill="var(--theme-body-background)" style="font-size:90%;">
								<xsl:value-of select="count($listingsTotalNew)" />
							</text>
							<text x="13%" y="1.4%" fill="var(--theme-body-background)" style="font-size:100%;">
								New (Active)
							</text>
						</svg>
						<svg x="1%" y="46%">
							<circle cy="5%" r="10" fill="var(--active-green)" cx="5%"></circle>
							<text x="5%" y="1.7%" class="center" fill="var(--theme-body-background)" style="font-size:90%;">
								<xsl:value-of select="count($listingsTotalActive)" />
							</text>
							<text x="13%" y="1.4%" fill="var(--theme-body-background)" style="font-size:100%;">
								Active
							</text>
						</svg>
						<svg x="1%" y="60%">
							<circle cy="5%" r="10" fill="var(--pending-yellow)" cx="5%"></circle>
							<text x="5%" y="1.7%" class="center" fill="var(--theme-body-background)" style="font-size:90%;">
								<xsl:value-of select="count($listingsTotalPending)" />
							</text>
							<text x="13%" y="1.4%" fill="var(--theme-body-background)" style="font-size:100%;">
								Pending
							</text>
						</svg>
						<svg x="1%" y="74%">
							<circle cy="5%" r="10" fill="var(--sold-red)" cx="5%"></circle>
							<text x="5%" y="1.7%" class="center" fill="var(--theme-body-background)" style="font-size:90%;">
								<xsl:value-of select="count($listingsTotalSold)" />
							</text>
							<text x="13%" y="1.4%" fill="var(--theme-body-background)" style="font-size:100%;">
								Sold
							</text>
						</svg>
					</svg>
				</div>

				<div style="position:fixed;top:85%;left:0;z-index: 9991;height:12%;width:50%;">
					<svg width="100%" height="100%">
						<rect x="0" y="0%" width="100%" height="100%" fill="var(--theme-sub-heading-color)" />

						<text x="50%" y="10%" class="center upper bold" fill="var(--theme-body-background)" style="font-size:160%;font-weight:600;" data-max-width="45%">
							<tspan class="capitalize">
								<xsl:call-template name="editable">
									<xsl:with-param name="default" select="concat( 'Be the ', //area/name, '&#160;genius' )" />
								</xsl:call-template>
							</tspan>
							<tspan x="50%" dy="40%" class="center capitalize">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'agentwebsite'" />
									<xsl:with-param name="default" select="//agent[1]/website" />
								</xsl:call-template>
							</tspan>
						</text>
					</svg>
				</div>
			</div>
		</foreignObject>
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<g style="transform:translateX(50%)">
			<text x="25%" y="2%" class="center" style="font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'information'" />
					<xsl:with-param name="default" select="'This information is presented by:'" />
				</xsl:call-template>
			</text>

			<g style="transform: translate(8.6%, -3.2%);">
				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
					<circle r=".4700" cx="0.45" cy="0.3" />
				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="0%" y="10%" width="14%" height="24%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>

				<g style="transform: translate(2%, 0);">
					<text class="h1" x="11%" y="10%" style="font-size:140%;">
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

					<text x="11%" y="15%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'innovatorrealtor'" />
							<xsl:with-param name="default" select="'Innovator REALTOR'" />
						</xsl:call-template>
					</text>
					<text x="11%" y="19%" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
					<text x="11%" y="22%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:150%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>
					<text x="11%" y="28%" style="font-size:120%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</text>
				</g>
			</g>

			<image x="18%" y="31%" width="14%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<text x="25%" y="46%" class="center" style="font-size:100%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanames'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
			</text>
			<text x="25%" y="50%" class="center" style="font-size:100%;">
				<xsl:call-template name="listing-address-line-one" />
			</text>
			<text x="25%" y="54%" class="center" style="font-size:100%;">
				<xsl:call-template name="listing-address-line-two" />
			</text>
			<text x="25%" y="58%" class="center" style="font-size:100%;text-transform: capitalize;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="concat( 'become your neighborhood genius at ', //agent[1]/website )" />
				</xsl:call-template>
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>