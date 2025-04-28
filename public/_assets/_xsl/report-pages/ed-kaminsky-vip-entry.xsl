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
		<!-- <link xmlns="http://www.w3.org/1999/xhtml" rel="stylesheet" type="text/css">
			<xsl:attribute name="href">
<xsl:value-of select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css' )" />

			</xsl:attribute>
		</link> -->

		<rect x="0" y="0" width="100%" height="100%" fill="#0d0f30" style="background: #0d0f30;"></rect>

		<image x="20%" y="4.6%" width="41%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
			</xsl:attribute>
		</image>
		<image x="64.2%" y="4.6%" width="13.2%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/exp-white.png' )" />
			</xsl:attribute>
		</image>

		<svg height="100%" width="100%">
			<circle cx="50%" cy="21.3%" r="12%" fill="#282843" />
		</svg>
		<line x1="0%" y1="21.5%" x2="50%" y2="21.5%" stroke="#282843" stroke-width="0.3%" />

		<text x="50%" y="34%" class="futura-text upper center" fill="#fff" font-size="1130%" font-weight="800" style="letter-spacing:2px">
		    VIP ENTRY 
		</text>
		<line x1="18%" y1="42%" x2="82%" y2="42%" stroke="#b0934c" stroke-width="0.2%" />

		<rect x="30%" y="41.2%" width="40.2%" height="2%" fill="#0e1232" />

		<text x="50%" y="40.9%" class="caslon center" fill="#fff" font-size="400%" font-weight="400" style="letter-spacing:5px;">
		    to your neighbor’s
		</text>
		<text x="50.5%" y="43.5%" class="futura-text upper center" fill="#fff" font-size="856%" font-weight="400" style=" letter-spacing:10px;">
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

		<text x="50%" y="65.6%" class="futura-text center" fill="#fff" font-size="385%" font-weight="800" style="letter-spacing:1px;">
		    This Saturday &amp; Sunday
		</text>
		<text x="50%" y="68%" class="futura-text center" fill="#b0934c" font-size="455%" font-weight="800" style=" letter-spacing:1px;">
		    1pm to 4pm
		</text>
		<line x1="40%" y1="72%" x2="60%" y2="72%" stroke="#b0934c" stroke-width="0.2%" />

		<text x="50%" y="73.6%" class="futura-text center" fill="#fff" font-size="435%" font-weight="400" style="  letter-spacing:5px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="$listingAddressLine1" />
			</xsl:call-template>
		</text>

		<!-- <text x="50%" y="76.7%" class="futura-text center" fill="#fff" font-size="243%" style="word-spacing: 5px;">
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
					<xsl:with-param name="default" select="concat( 'And ', //agent[2]/marketingName)" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#b0934c"> • </tspan>
			<tspan >
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</tspan>
		</text> -->

		<xsl:choose>
			<xsl:when test="$hasMultipleAgents">
				<text x="50%" y="76.7%" class="futura-text center" fill="#fff" font-size="243%" style="word-spacing: 5px;">
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
					<!-- <tspan fill="#b0934c"> • </tspan>
					<tspan >
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</tspan> -->
				</text>
			</xsl:when>
			<xsl:otherwise>
				<text x="50%" y="76.7%" class="futura-text center" fill="#fff" font-size="243%" style="word-spacing: 5px;">
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
				<g style="transform: scale(0.65) translateY(12.5%); transform-origin: left;">
					<xsl:call-template name="custom-agent-details">
						<xsl:with-param name="agent" select="//agent[1]" />
						<xsl:with-param name="idx" select="1" />
					</xsl:call-template>
				</g>
				<g style="transform: scale(0.65) translateY(12.5%) translateX(70%); transform-origin: left;">
					<xsl:call-template name="custom-agent-details">
						<xsl:with-param name="agent" select="//agent[2]" />
						<xsl:with-param name="idx" select="2" />
					</xsl:call-template>
				</g>

				<!-- <image x="42%" y="85%" width="16%" height="6%" preserveAspectRatio="xMidYMin slice">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download.png' )" />
					</xsl:attribute>
				</image>
				<text x="50%" y="91%" class="futura-text" fill="#b0934c" font-size="300%" font-weight="600" text-anchor="middle">
					<xsl:text>More Info</xsl:text>
				</text> -->
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="custom-agent-details">
					<xsl:with-param name="agent" select="//agent[1]" />
				</xsl:call-template>

				<image x="70.5%" y="82.7%" width="18%" height="6.5%" preserveAspectRatio="xMidYMin slice">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download.png' )" />
					</xsl:attribute>
				</image>
				<text x="79.5%" y="89.5%" class="futura-text center" fill="#b0934c" font-size="250%" font-weight="600">
					<xsl:text>More Info</xsl:text>
				</text>
			</xsl:otherwise>
		</xsl:choose>

		<text x="12%" y="93%" class="futura-condensed" fill="#8494a0" font-size="240%">
			<xsl:text>EXP REALTY OF CALIFORNIA, INC LICENSE #01878277. INFORMATION IS DEEMED RELIABLE, BUT NOT GUARANTEED.</xsl:text>
		</text>
		<text x="12%" y="95%" class="futura-condensed" fill="#8494a0" font-size="240%">
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

		<text x="%" y="82.4%" class="futura-text" font-size="300%" font-weight="800" style="letter-spacing:2px">
			<tspan x="32.3%" dy="0%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'marketingFirstName-', $idx )" />
					<xsl:with-param name="default" select="$agent/firstName" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#b0934c" class="futura-text" font-weight="800">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'marketingLastName-', $idx )" />
					<xsl:with-param name="default" select="concat(' ',$agent/lastName)" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="32.3%" y="84.2%" fill="#fff" class="futura-text" font-size="200%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="concat( 'licenseno-', $idx )" />
				<xsl:with-param name="default" select="$agent/marketingLicense" />
			</xsl:call-template>
		</text>

		<text y="86.6%" class="futura-text" font-size="240%">
			<tspan x="32.3%" dy="0%" fill="#b0934c">m</tspan>
			<tspan x="36.4%" dy="0%" fill="#fff" class="futura-text" font-weight="400">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'agentmobile-', $idx )" />
					<xsl:with-param name="default" select="translate($agent/mobile,'-','.')" />
				</xsl:call-template>
			</tspan>
		</text>

		<text y="88.2%" class="futura-text" font-size="240%" data-max-width="50%">
			<tspan x="32.3%" dy="0%" fill="#b0934c">e</tspan>
			<tspan x="36.4%" dy="0%" fill="#fff" class="futura-text" font-weight="400">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'agentEmail-', $idx )" />
					<xsl:with-param name="default" select="$agent/marketingEmail" />
				</xsl:call-template>
			</tspan>
		</text>

		<text y="89.7%" class="futura-text">
			<tspan x="32.3%" dy="0%" fill="#b0934c" font-size="235%">w</tspan>
			<tspan x="36.4%" dy="0%" fill="#fff" class="futura-text" font-size="235%" font-weight="400">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="concat( 'agentwebsite-', $idx )" />
					<xsl:with-param name="default" select="$agent/website" />
				</xsl:call-template>
			</tspan>
		</text>
	</xsl:template>
</xsl:stylesheet>