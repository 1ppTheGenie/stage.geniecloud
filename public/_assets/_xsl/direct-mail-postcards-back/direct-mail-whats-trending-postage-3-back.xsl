<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending Postage 3 Back 
	Tags:		Social Marketing Ad
	Sizes:		Postcard
Supports:	Area, QRCode
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<rect x="63.5%" y="0%" width="36.5%" height="100%" fill="#fff" />

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform: translate(0%, 51.5%);">
			<rect fill-opacity="1" width="28%" height="38%" class="heading"/>
		</g>
		<g style="transform: translate(14%, 72%);">
			<text class="center bold sub-heading" style="font-size:90%;">
				<tspan fill="var(--theme-body-background)">
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
			</text>

			<text y="3.5%" class="center sub-heading bold" style="font-size:90%;">
				<tspan fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Find Out At'" />
						<xsl:with-param name="default" select="'Find Out At : '" />
					</xsl:call-template>
				</tspan>
				<tspan class="sub-heading" style="color:var(--theme-sub-heading-color);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</tspan>
			</text>

			<text y="6.9%" class="center sub-heading bold" style="font-size:90%;">
				<tspan fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Find Out At'" />
						<xsl:with-param name="default" select="'Find Out At : '" />
					</xsl:call-template>
				</tspan>
				<tspan class="sub-heading" style="color:var(--theme-sub-heading-color);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform: translate(28%, 51.5%);">
			<rect fill-opacity="1" width="35.5%" height="38%" fill="var(--theme-body-color)"/>
		</g>

		<foreignObject y="57%" x="30%" width="15%" height="28%" style="font-size:125%;color:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'scan qr'" />
				<xsl:with-param name="default" select="'Scan the QR Code to get details on this and other properties in this area and see how your home compared. '" />
			</xsl:call-template>
		</foreignObject>

		<image x="0%" y="0%" width="63.5%" height="51.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect x="0%" y="0%" fill-opacity="1" width="63.5%" height="51.5%" opacity="0.5" fill="var(--theme-heading-color)"/>

		<g style="transform:translate(3%,18%)">
			<svg width="50%" height="28%" style="font-size:110%;">
				<text class="upper " fill="var(--theme-body-background)" style="font-size:280%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'your neighbors house'" />
						<xsl:with-param name="default" select="'YOUR NEIGHBORS HOUSE '" />
					</xsl:call-template>
				</text>
				<text x="" y="35%" class="upper sub-heading bold" style="font-size:280%;color:var(--theme-sub-heading-color);" tabindex="1">Just 
					<xsl:value-of select="$soldListed"/>
				</text>
			</svg>
			<svg y="22%" width="50%" height="5%">
				<text fill="var(--theme-body-background)" style="font-size:80%;">
					<tspan>
						<!--					A home at -->
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborhood'" />
							<xsl:with-param name="default" select="concat( 'A' , ' ', lower-case($singularPropertyType),' ', 'at ')" />
						</xsl:call-template>
					</tspan>
					<tspan>
						<xsl:call-template name="listing-address-line-one"/>
					</tspan>
					<tspan>
					was just listed.
					</tspan>
				</text>
			</svg>
		</g>

		<g style="transform:translate(41.58%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'19.5%'" />
				<xsl:with-param name="height" select="'19.5%'" />
			</xsl:call-template>
		</g>

		<image x="7%" y="55.5%" width="14%" height="14%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<rect x="0%" y="89%" fill-opacity="1" width="63.5%" height="11%" opacity="0.2" fill="var(--theme-body-color)"/>
		<g style="transform:translate(3%,86%)">
			<svg width="35%" height="17.5%">
				<image x="0" y="0" width="20%" height="80%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
			</svg>
			<text y="6.5%" x="10%" width="50%" height="6%" style="font-size:150%;">
				<tspan class="upper bold" fill="var(--theme-sub-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'listing alert'" />
						<xsl:with-param name="default" select="'listing alert '" />
					</xsl:call-template>
				</tspan>
				<tspan fill="var(--theme-body-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( 'By ', //agent[1]/marketingName, '&#160;' )" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>