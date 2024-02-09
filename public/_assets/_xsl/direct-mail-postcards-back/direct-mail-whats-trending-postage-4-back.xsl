<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending Postage 4 Back 
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area, QRCode
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<rect x="63.5%" y="0%" width="36.5%" height="100%" fill="#fff" />
		<g style="transform: translate(0%, 51.5%);">
			<rect fill-opacity="1" width="28%" height="35%" class="heading"/>

			<text x="15%" y="14.5%" class="center bold upper" fill="var(--theme-body-background)" font-family="var(--theme-body-font)" style="font-size:60%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Your Local'" />
					<xsl:with-param name="default" select="'Your Local'" />
				</xsl:call-template>
			</text>

			<text x="15%" y="17.5%" class="center bold upper" fill="var(--theme-body-background)" font-family="var(--theme-body-font)" style="font-size:60%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="concat('', //area/name )" />
				</xsl:call-template>
			</text>

			<text x="15%" y="20.7%" class="center bold upper" fill="var(--theme-body-background)" font-family="var(--theme-body-font)" style="font-size:60%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Real Estate Expert'" />
					<xsl:with-param name="default" select="'Real Estate Expert'" />
				</xsl:call-template>
			</text>

			<!-- <text x="15%" y="23%" class="center bold sub-heading" style="font-size:90%;">
				<tspan fill="var(theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Find Out At'" />
						<xsl:with-param name="default" select="'Find Out At : '" />
					</xsl:call-template>
				</tspan>
				<tspan class="sub-heading">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
							<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</tspan>
			</text> -->

			<text x="15%" y="23.8%" class="center bold" font-family="var(--theme-body-font)" fill="var(--theme-sub-heading-color)" style="font-size:80%;">
				<!-- <tspan fill="var(theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Find Out At'" />
						<xsl:with-param name="default" select="'Find Out At : '" />
					</xsl:call-template>
				</tspan> -->
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="15%" y="27.2%" class="center bold" font-family="var(--theme-body-font)" fill="var(--theme-sub-heading-color)" style="font-size:80%;">
				<!-- <tspan fill="var(theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Find Out At'" />
						<xsl:with-param name="default" select="'Find Out At : '" />
					</xsl:call-template>
				</tspan> -->
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform: translate(28%, 51.5%);">
			<rect fill-opacity="1" width="35.5%" height="35%" fill="var(--theme-body-color)"/>
		</g>

		<foreignObject y="57%" x="30%" width="16%" height="28%" style="font-size:125%;color:var(--theme-body-background);font-family:var(--theme-body-font)">
			<p style="margin:0;">Scan the QR Code</p>
			<p style="opacity:0.7;font-weight:300;font-size: 80%;line-height: 135%;letter-spacing: 1px;margin: 0;text-overflow: unset;overflow: unset;-webkit-box-orient: unset;padding-top: 7px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'scan qr'" />
					<xsl:with-param name="default" select="concat('to get details on this and other properties in ', //area/name, ' and see how your ', $singularPropertyType, ' compares.')" />
				</xsl:call-template>
			</p>
		</foreignObject>

		<image x="0%" y="0%" width="63.5%" height="51.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect x="0%" y="0%" fill-opacity="1" width="63.5%" height="51.5%" opacity="0.5" fill="var(--theme-heading-color)"/>

		<g style="transform:translate(3%,18%)">
			<svg width="50%" height="28%" style="font-size:110%;">
				<text class="upper " font-family="var(--theme-heading-font)" fill="var(--theme-body-background)" style="font-size:200%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'your neighbors house'" />
						<xsl:with-param name="default" select="concat('I&#8217;ve sold many ', $propertyType, ' in')" />
					</xsl:call-template>
				</text>
				<text y="30%" class="upper sub-heading" style="font-size:195%;color:var(--theme-sub-heading-color);letter-spacing:0.5px;" tabindex="1">
					<xsl:text>Your Neighborhood</xsl:text>
				</text>
			</svg>
			<svg y="18%" width="60%" height="10%">
				<text font-family="var=(--theme-body-font)" font-weight="300" fill="var(--theme-body-background)" style="font-size:95%;opacity:0.8;letter-spacing:1px;" data-max-width="58%">
					<tspan y="0%" x="0%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Scan the QR Code'" />
							<xsl:with-param name="default" select="concat('Scan the QR code below to get the details on other properties in ', //area/name, ' and')" />
						</xsl:call-template>
					</tspan>
					<tspan dy="36%" x="0%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'see how YOUR home compares'" />
							<xsl:with-param name="default" select="concat('see how YOUR ', $propertyType, ' compares.')" />
						</xsl:call-template>
					</tspan>
				</text>
			</svg>
		</g>

		<g style="transform:translate(51%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="''" />
				<xsl:with-param name="height" select="'19.5%'" />
			</xsl:call-template>
		</g>

		<image class="center" x="8%" y="55.5%" width="14%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet" href="{$companyLogoInverse}" />

		<rect x="0%" y="86%" fill-opacity="1" width="63.5%" height="14%" opacity="0.2" fill="var(--theme-body-color)"/>

		<image x="3%" y="82.5%" width="9%" height="17.5%" preserveAspectRatio="xMidYMin slice"  href="{//agent[1]/photo}" />

		<text x="13%" y="90.5%" font-family="var(--theme-sub-heading-font)" width="50%" height="6%" style="font-size:150%; letter-spacing:0.5px;" data-max-width="50%">
			<tspan class="upper bold" fill="var(--theme-sub-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'listing alert'" />
					<xsl:with-param name="default" select="'Get Your free Home Valuation '" />
				</xsl:call-template>
			</tspan>
			<tspan fill="var(--theme-body-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentname'" />
					<xsl:with-param name="default" select="concat( 'By ', //agent[1]/marketingName, '&#160;' )" />
				</xsl:call-template>
			</tspan>

			<tspan class="bold upper">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'realtor'" />
					<xsl:with-param name="default" select="' Realtor ®'" />
				</xsl:call-template>
			</tspan>

		</text>

		<rect x="63.5%" y="18%" width="36.4%" height="82%" fill="#fff"/>

		<line x1="63.5%" x2="100%" y1="18%" y2="18%" stroke="var(--theme-heading-color)" stroke-width="0.5"/>

		<line x1="63.5%" x2="63.5%" y1="0%" y2="100%" stroke="var(--theme-heading-color)" stroke-width="0.5" />

		<g font-family="var(--theme-heading-font)" style="transform: translate(45%, 3%);text-transform: capitalize; letter-spacing:0.5px;fill:#252525;font-size:135%;">
			<text x="20%" y="2%" font-size="87.5%" font-weight="600">
				<xsl:value-of select="//agent[1]/address/street"/>
			</text>
			<xsl:if test="$agent2LineAddress='true'">
				<text x="20%" y="4.5%" fill="var(--theme-body-color)" font-size="87.5%" font-weight="600">
					<xsl:value-of select="//agent[1]/address/address2" />
				</text>
			</xsl:if>
			<text x="20%" font-size="87.5%" font-weight="600">
				<xsl:attribute name="y">
					<xsl:choose>
						<xsl:when test="$agent2LineAddress='true'">
							<xsl:value-of select="'7%'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'5.5%'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<xsl:value-of select="concat( //agent[1]/address/city, ', ' )" />

				<tspan style="text-transform: uppercase;">
					<xsl:value-of select="concat( //agent[1]/address/state, ' ', //agent[1]/address/zip )"/>
				</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>