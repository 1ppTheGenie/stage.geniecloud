<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Back Back - No. 4
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Area, Multi-Listing
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
		<foreignObject x="2%" y="0%" width="
			38%" height="100%">
			<div style="height: 466px; width:100%;">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
				</xsl:call-template>
			</div>

			<svg width="100%" height="20%">
				<g style="transform: translate(0%, 0%);">
<rect x="0" y="0%" width="100%" height="25%" fill="var(--theme-sub-heading-color)" />

					<text x="2%" y="8%" class="upper" fill="var(--theme-body-background)" style="font-weight:600;font-size:100%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'becomeyour'" />
							<xsl:with-param name="default" select="'become your neighborhood genius!'" />
						</xsl:call-template>
					</text>
					<text x="48%" y="30%" class="center" fill="var(--theme-sub-heading-color)" style="font-weight:600;font-size:80%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentwebsite'" />
							<xsl:with-param name="default" select="//agent[1]/website" />
						</xsl:call-template>
					</text>
				</g>
			</svg>
			<g style="position:absolute;top:-10px;left:-15px;z-index:999;height:38%;">
				<svg x="0" height="100%" width="900">
					<filter x="-7%" y="-0.5" width="1.6" height="10" id="solid">
<feFlood flood-color="var(--theme-sub-heading-color)" flood-opacity="0.7" />

						<feComposite in="SourceGraphic" operator="xor" />
					</filter>

					<text x="3%" y="6%" class="capitalize" filter="url(#solid)" fill="var(--theme-body-background)" style="font-size:150%;font-weight:600;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'areaname'" />
							<xsl:with-param name="default" select="//area/name" />
						</xsl:call-template>
							 Homes
					</text>
					<text x="3%" y="6%" class="capitalize" fill="var(--theme-body-background)" style="font-size:150%;font-weight:600;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'areanames'" />
							<xsl:with-param name="default" select="//area/name" />
						</xsl:call-template>
							 Homes
					</text>
					<text x="3%" y="18%" class="capitalize" fill="var(--theme-body-background)" style="font-size:80%;">
						<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
					</text>
					<svg x="1%" y="31%">
						<circle cy="6%" r="12" fill="var(--theme-emphasis-color)" cx="3%"></circle>
						<text x="3%" y="2.8%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
							<xsl:value-of select="$listingsTotalNew" />
						</text>
						<text x="6%" y="1%" fill="var(--theme-body-background)" style="font-size:120%;">
								New (Active)
						</text>
					</svg>
					<svg x="1%" y="45%">
						<circle cy="6%" r="12" fill="var(--active-green)" cx="3%"></circle>
						<text x="3%" y="2.8%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
							<xsl:value-of select="$listingsTotalActive" />
						</text>
						<text x="6%" y="1%" fill="var(--theme-body-background)" style="font-size:120%;">
								Active
						</text>
					</svg>
					<svg x="1%" y="59%">
						<circle cy="6%" r="12" fill="var(--pending-yellow)" cx="3%"></circle>
						<text x="3%" y="2.8%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
							<xsl:value-of select="$listingsTotalPending" />
						</text>
						<text x="6%" y="1%" fill="var(--theme-body-background)" style="font-size:120%;">
								Pending
						</text>
					</svg>
					<svg x="1%" y="72.5%">
						<circle cy="6%" r="12" fill="var(--sold-red)" cx="3%"></circle>
						<text x="3%" y="2.8%" class="center" fill="var(--theme-body-background)" style="font-size:80%;">
							<xsl:value-of select="$listingsTotalSold" />
						</text>
						<text x="6%" y="1%" fill="var(--theme-body-background)" style="font-size:120%;">
								Sold
						</text>
					</svg>
				</svg>
			</g>
		</foreignObject>
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<style>
<xsl:value-of select="'foreignObject p {margin:0;}'" />

		</style>

		<svg width="60%" height="100%" x="40%" y="2%"
			xmlns="http://www.w3.org/2000/svg" style="float:right;">
			<g style="transform: translate(0%, 2%);">
				<text class="sub-heading upper bold" style="font-size:150%" x="5%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'does-your-home'" />
						<xsl:with-param name="default" select="'does your home have curb appeal'" />
					</xsl:call-template>
				</text>

				<svg x="5%" y="0%" width="100%" height="22%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="4%" y="40%" width="84%" height="43%" />

					<circle cx="5%" cy="61.5%" r="30" fill="var(--theme-sub-heading-color)"></circle>

					<foreignObject x="10%" y="47%" width="75%" height="30%" style="font-size:80%;">
						<p style="color:var(--theme-body-color);-webkit-line-clamp:2;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'through-eyes'" />
								<xsl:with-param name="default" select="'Look at your home through the eyes of potential buyer'" />
							</xsl:call-template>
						</p>
					</foreignObject>
				</svg>

				<svg x="5%" y="12%" width="100%" height="22%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="4%" y="40%" width="84%" height="43%" />

					<circle cx="5%" cy="61.5%" r="30" fill="var(--theme-sub-heading-color)"></circle>
					<text x="4.8%" y="50%" class="center" fill="var(--theme-body-background)" style="font-size:200%;">
								2
					</text>
					<foreignObject x="10%" y="47%" width="75%" height="30%" style="font-size:80%;">
						<p style="color:var(--theme-body-color);-webkit-line-clamp:2;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'take-care'" />
								<xsl:with-param name="default" select="'Take care of small tasks like weeding, mowing the lawn, or cleaning out the storage closet'" />
							</xsl:call-template>
						</p>
					</foreignObject>
				</svg>
				<svg x="5%" y="24%" width="100%" height="22%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="4%" y="40%" width="84%" height="43%" />

					<circle cx="5%" cy="61.5%" r="30" fill="var(--theme-sub-heading-color)"></circle>
					<text x="4.8%" y="50%" class="center" fill="var(--theme-body-background)" style="font-size:200%;">
								3
					</text>
					<foreignObject x="10%" y="47%" width="75%" height="30%" style="font-size:80%;">
						<p style="color:var(--theme-body-color);-webkit-line-clamp:2;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'startplanning'" />
								<xsl:with-param name="default" select="'Start planning and executing the larger tasks such as painting, remodeling or other aesthetic repairs'" />
							</xsl:call-template>
						</p>
					</foreignObject>
				</svg>

				<svg x="5%" y="36%" width="100%" height="22%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="4%" y="40%" width="84%" height="43%" />

					<circle cx="5%" cy="61.5%" r="30" fill="var(--theme-sub-heading-color)"></circle>
					<text x="4.8%" y="50%" class="center" fill="var(--theme-body-background)" style="font-size:200%;">
								4
					</text>
					<foreignObject x="10%" y="47%" width="75%" height="30%" style="font-size:80%;">
						<p style="color:var(--theme-body-color);-webkit-line-clamp:2;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'ordergarbage'" />
								<xsl:with-param name="default" select="'Order a garbage bin or start making hauls to the local trash repository-moving is one of the best ways to purge the old and start fresh!'" />
							</xsl:call-template>
						</p>
					</foreignObject>
				</svg>

				<svg x="5%" y="48%" width="100%" height="22%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="4%" y="40%" width="84%" height="43%" />

					<circle cx="5%" cy="61.5%" r="30" fill="var(--theme-sub-heading-color)"></circle>
					<text x="4.8%" y="50%" class="center" fill="var(--theme-body-background)" style="font-size:200%;">
								5
					</text>
					<foreignObject x="10%" y="47%" width="75%" height="30%" style="font-size:80%;">
						<p style="color:var(--theme-body-color);-webkit-line-clamp:2;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'planningexecuting'" />
								<xsl:with-param name="default" select="'Start planning and executing the larger tasks such as painting, remodeling or other aesthetic repairs'" />
							</xsl:call-template>
						</p>
					</foreignObject>
				</svg>

				<svg width="100%" height="100%">
					<g style="transform: translate(0%, 73.5%);">
						<image x="0" y="0" width="32%" height="22.2%" preserveAspectRatio="xMidYMid slice">
							<xsl:call-template name="switch-image">
								<xsl:with-param name="idx" select="1" />
							</xsl:call-template>
						</image>
						<image x="33%" y="0" width="32%" height="22.2%" preserveAspectRatio="xMidYMid slice">
							<xsl:call-template name="switch-image">
								<xsl:with-param name="idx" select="2" />
							</xsl:call-template>
						</image>
						<image x="66%" y="0" width="32%" height="22.2%" preserveAspectRatio="xMidYMid slice">
							<xsl:call-template name="switch-image">
								<xsl:with-param name="idx" select="3" />
							</xsl:call-template>
						</image>
					</g>
				</svg>
			</g>
		</svg>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>