<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Vip Entry
	Tags:		Map, Listings, Infographic
	Sizes:		Door Hanger
	Supports:	Area, Multi-Listing, Multi-Agent
	Pages:		report-pages/ed-kaminsky-vip-entry,report-pages/ed-kaminsky-vip-entry-2
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		
		<!-- <rect x="0" y="0" width="100%" height="100%" fill="var(theme-body-color)"></rect> -->

		<image x="20%" y="4.6%" width="41%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:choose>
				<xsl:when test="//output/@themeHue='dark'">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoDark" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoLight" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</image>
		<image x="64.2%" y="4.6%" width="13.2%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:choose>
				<xsl:when test="//output/@themeHue='dark'">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/companyLogoDark" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/companyLogoLight" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</image>

		<svg height="100%" width="100%">
			<circle cx="50%" cy="21.3%" r="12%" fill="#282843" />
		</svg>
		<line x1="0%" y1="21.5%" x2="50%" y2="21.5%" stroke="#282843" stroke-width="0.3%" />

		<text x="50%" y="34%" class="upper center" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-size="1130%" font-weight="800" style="letter-spacing:2px">
		    VIP ENTRY 
		</text>
		<line x1="18%" y1="42.3%" x2="82%" y2="42.3%" stroke="var(--theme-emphasis-color)" stroke-width="0.2%" />

		<rect x="25%" y="41.2%" width="50.2%" height="2%" fill="var(--theme-body-background)" />

		<text x="50%" y="40.9%" class="center" font-family="var(--theme-sub-heading-font)" fill="var(--theme-heading-color)" font-size="400%" font-weight="400" style="letter-spacing:5px;">
		    to your neighbor’s
		</text>
		<text x="50.5%" y="43.5%" class="upper center" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" font-size="856%" font-weight="400" style=" letter-spacing:10px;">
		    OPEN HOUSE 
		</text>

		<image x="0%" y="50.2%" width="49.5%" height="12.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<image x="50.5%" y="50.2%" width="49.5%" height="12.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<text x="50%" y="65.6%" class="center" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="385%" font-weight="800" style="letter-spacing:1px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Open house'" />
				<xsl:with-param name="default" select="concat( 'This ' , //openHouse/session[1]/@dow)" />
				<!-- <xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ',//openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends)" /> -->
			</xsl:call-template>
		</text>
		<text x="50%" y="68%" class="center" fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)" font-size="455%" font-weight="800" style=" letter-spacing:1px;"> 
			<xsl:choose>
				<xsl:when test="count(//openHouse/session) &gt; 0">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="concat(//openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends)" />
					</xsl:call-template>	
				</xsl:when>
				<xsl:otherwise>
					1pm to 4pm
				</xsl:otherwise>
			</xsl:choose>
		</text>
		<line x1="40%" y1="72%" x2="60%" y2="72%" stroke="var(--theme-emphasis-color)" stroke-width="0.2%" />

		<text x="50%" y="73.6%" class="center" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="435%" font-weight="400" style="  letter-spacing:5px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="$listingAddressLine1" />
			</xsl:call-template>
		</text>

		<xsl:choose>
			<xsl:when test="$hasMultipleAgents">
				<text x="50%" y="76.7%" class="center" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="243%" style="word-spacing: 5px;">
					<tspan>Presented by </tspan>
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'marketingName'" />
							<xsl:with-param name="default" select="//agent[1]/marketingName" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'marketingName'" />
							<xsl:with-param name="default" select="concat( ' And ', //agent[2]/marketingName)" />
						</xsl:call-template>
					</tspan>
				</text>
			</xsl:when>
			<xsl:otherwise>
				<text x="50%" y="76.7%" class="center" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="243%" style="word-spacing: 5px;">
					<tspan>Presented by </tspan>
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'marketingName'" />
							<xsl:with-param name="default" select="//agent[1]/marketingName" />
						</xsl:call-template>
					</tspan>
				</text>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="$hasMultipleAgents">
				<!-- Agent One Data -->
				<g style="transform: translate(27%, 83%)">
					<defs>
						<clipPath id="circleClip1">
							<circle r="3.4%" />
						</clipPath>
					</defs>
					<g>
						<!-- background circle behind image -->
						<circle r="3.4%" fill="#69657a" />

						<!-- Circular image -->
						<image x="-7.1%" y="-2.3%" width="180" height="180" clip-path="url(#circleClip1)">
							<xsl:attribute name="href">
								<xsl:value-of select="//agent[1]/photo" />
							</xsl:attribute>
						</image>

					</g>
				</g>	
				
				<text x="0%" y="86.3%" font-family="var(--theme-body-font)" font-size="300%" font-weight="800" style="letter-spacing:2px">
					<tspan x="15.3%" dy="0%" fill="var(--theme-heading-color)">
						<xsl:call-template name="editable">
							<xsl:with-param name="default" select="//agent[1]/firstName" />
						</xsl:call-template>
					</tspan>
					<tspan fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)" font-weight="800">
						<xsl:call-template name="editable">
							<xsl:with-param name="default" select="concat(' ',//agent[1]/lastName)" />
						</xsl:call-template>
					</tspan>					
				</text>
				<!-- license number -->
				<text x="15.3%" y="88.5%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="200%">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="concat(' ',//agent[1]/marketingLicense)" />
					</xsl:call-template>
				</text>
				<line x1="10%" y1="91%" x2="90%" y2="91%" stroke="var(--theme-emphasis-color)" stroke-width="0.2%"></line>
				<!-- contact detail -->
				<g class="center" style="transform: translateX(140px);">
					<text x="15.3%" y="91.9%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="200%">
						<tspan x="15.3%" dy="0%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-weight="400">
							<xsl:call-template name="editable">
								<xsl:with-param name="default" select="concat(' ',//agent[1]/mobile)" />
							</xsl:call-template>
						</tspan>
						<tspan x="15.3%" dy="1.3%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-weight="400">
							<xsl:call-template name="editable">
								<xsl:with-param name="default" select="concat(' ',//agent[1]/marketingEmail)" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>	

				<!-- Agent Second -->
				<g style="transform: translate(74%, 83%)">
					<defs>
						<clipPath id="circleClip2">
							<circle r="3.4%" />
						</clipPath>
					</defs>
					<g>
						<!-- background circle behind image -->
						<circle r="3.4%" fill="#69657a" />

						<!-- Circular image -->
						<image x="-7.1%" y="-2.3%" width="180" height="180" clip-path="url(#circleClip2)">
							<xsl:attribute name="href">
								<xsl:value-of select="//agent[2]/photo" />
							</xsl:attribute>
						</image>

					</g>
				</g>
				<text x="95%" y="86.3%" font-family="var(--theme-body-font)" font-size="300%" font-weight="800" style="letter-spacing:2px">
					<tspan x="62%" dy="0%" fill="var(--theme-heading-color)">
						<xsl:call-template name="editable">
							<xsl:with-param name="default" select="//agent[2]/firstName" />
						</xsl:call-template>
					</tspan>
					<tspan fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)" font-weight="800">
						<xsl:call-template name="editable">
							<xsl:with-param name="default" select="concat(' ',//agent[2]/lastName)" />
						</xsl:call-template>
					</tspan>
				</text>
				<!-- license number -->
				<text x="62.3%" y="88.5%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="200%">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="concat(' ',//agent[2]/marketingLicense)" />
					</xsl:call-template>
				</text>
				<!-- contact detail -->
				<g class="center" style="transform: translateX(109px);">
					<text x="95.3%" y="91.9%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="200%">
						<tspan x="65.3%" dy="0%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-weight="400">
							<xsl:call-template name="editable">
								<xsl:with-param name="default" select="concat(' ',//agent[2]/mobile)" />
							</xsl:call-template>
						</tspan>
						<tspan x="65.3%" dy="1.3%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-weight="400">
							<xsl:call-template name="editable">
								<xsl:with-param name="default" select="concat(' ',//agent[2]/marketingEmail)" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>			
			</xsl:when>

			<xsl:otherwise>
				<xsl:call-template name="custom-agent-details">
					<xsl:with-param name="agent" select="//agent[1]" />
				</xsl:call-template>

				<image x="70.5%" y="82.7%" width="18%" height="6.5%" preserveAspectRatio="xMidYMin slice">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download-new.png' )" />
					</xsl:attribute>
				</image>
				<text x="79.5%" y="89.5%" class="center testing" fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)" font-size="250%" font-weight="600">
					<xsl:text>More Info</xsl:text>
				</text>
			</xsl:otherwise>			
		</xsl:choose>

		<text x="12%" y="95%" font-family="var(--theme-heading-font)" fill="#8494a0" font-size="180%">
			<xsl:text>EXP REALTY OF CALIFORNIA, INC LICENSE #01878277. INFORMATION IS DEEMED RELIABLE, BUT NOT GUARANTEED.</xsl:text>
		</text>
		<text x="12%" y="96.5%" font-family="var(--theme-heading-font)" fill="#8494a0" font-size="180%">
			<xsl:text>BROKER HAS NOT AND WILL NOT INVESTIGATE OR VERIFY THE ACCURACY OF THIS INFORMATION.</xsl:text>
		</text>
	</xsl:template>

	<xsl:template name="custom-agent-details">
		<xsl:param name="agent" />
		<xsl:param name="idx" select="'1'" />


		<image x="12.5% " y="82.1%" width="17.5%" height="8.8%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="$agent/photo" />
			</xsl:attribute>
		</image>

		<text x="%" y="82.4%" font-family="var(--theme-body-font)" font-size="300%" font-weight="800" style="letter-spacing:2px">
			<tspan x="32.3%" dy="0%" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'marketingFirstName-', $idx )" />
					<xsl:with-param name="default" select="$agent/firstName" />
				</xsl:call-template>
			</tspan>
			<tspan fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)" font-weight="800">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'marketingLastName-', $idx )" />
					<xsl:with-param name="default" select="concat(' ',$agent/lastName)" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="32.3%" y="84.2%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="200%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="concat( 'licenseno-', $idx )" />
				<xsl:with-param name="default" select="$agent/marketingLicense" />
			</xsl:call-template>
		</text>

		<text y="86.6%" font-family="var(--theme-body-font)" font-size="240%">
			<tspan x="32.3%" dy="0%" fill="var(--theme-sub-heading-color)">m</tspan>
			<tspan x="36.4%" dy="0%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-weight="400">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'agentmobile-', $idx )" />
					<xsl:with-param name="default" select="translate($agent/mobile,'-','.')" />
				</xsl:call-template>
			</tspan>
		</text>

		<text y="88.2%" font-family="var(--theme-body-font)" font-size="240%" data-max-width="50%">
			<tspan x="32.3%" dy="0%" fill="var(--theme-sub-heading-color)">e</tspan>
			<tspan x="36.4%" dy="0%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-weight="400">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'agentEmail-', $idx )" />
					<xsl:with-param name="default" select="$agent/marketingEmail" />
				</xsl:call-template>
			</tspan>
		</text>

		<text y="89.7%" font-family="var(--theme-body-font)">
			<tspan x="32.3%" dy="0%" fill="var(--theme-sub-heading-color)" font-size="235%">w</tspan>
			<tspan x="36.4%" dy="0%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" font-size="235%" font-weight="400">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'agentwebsite-', $idx )" />
					<xsl:with-param name="default" select="$agent/website" />
				</xsl:call-template>
			</tspan>
		</text>
	</xsl:template>
</xsl:stylesheet>