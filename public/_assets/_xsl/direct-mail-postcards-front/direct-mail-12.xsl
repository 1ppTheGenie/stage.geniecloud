<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail - No.12
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House, Print
	Permission:	Direct Mail
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<image y="23%" height="77%" width="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect y="23%" width="100%" height="77%" fill="var(--theme-body-background)" fill-opacity="0.8"/>
		<g>
			<rect x="0" y="0" width="100%" height="23%" fill="var(--theme-sub-heading-color)"/>

			<image x="5%" y="5%" width="10%" height="15%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>

			<svg height="60" width="4%" x="19%" y="6%">
				<line x1="0" y1="0" x2="00" y2="70" style="stroke:var(--vivid-end-5);stroke-width:10"></line>
			</svg>
			<text x="20%" y="8%" class="capitalize" fill="var(--theme-body-background)" style="text-anchor:start;font-size:170%;">
The<xsl:value-of select="//agent[1]/marketingName" />

			
 Team
				&#x2022; 
			<tspan>september featured listing</tspan>
		</text>
	</g>

	<g>
		<svg x="2.5%" y="15%" width="40%" height="80%">
			<image x="9%" y="15%" width="90%" height="55%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<rect stroke="var(--theme-body-color)" stroke-width="4" fill-opacity="0" x="9%" y="15%" width="90%" height="55%"/>

			<text class="center" x="50%" y="73%" fill="var(--theme-body-color)" style="font-size:120%; font-weight: 600;">
				<xsl:call-template name="listing-address-line-one" />
			</text>
			<text class="center upper" x="50%" y="79%" fill="var(--theme-body-color)" style="font-size:120%">
				<xsl:value-of select="//single/bedrooms/@count"/>
 BR <tspan class="bold">&#8226;&#160;</tspan>
				<xsl:value-of select="(//single/bathrooms/@full+//single/bathrooms/@half)"/>
 BA <tspan class="bold">&#8226;&#160;</tspan>
				<xsl:value-of select="format-number( //single/squareFeet, '###,###' )"/>
 ESF
			</text>
			<text class="upper center" x="50%" y="85%" fill="var(--theme-body-color)" style="font-size:120%;">
				<tspan class="bold">&#8226;&#160;</tspan> ESF LOMAS VERDES ESTATES 					
			</text>
			<text class="upper center" x="50%" y="91%" fill="var(--theme-body-color)" style="font-size:120%; font-weight: 600;">
				<tspan class="bold">&#8226;&#160;</tspan>
				<xsl:choose>
					<xsl:when test="//single/soldDate!=''">
						<tspan>Sold For </tspan>
						<xsl:value-of select="format-number( //single/salePrice, '$###,###')"/>
					</xsl:when>
					<xsl:otherwise>
						<tspan>Asking </tspan>
						<xsl:value-of select="format-number( //single/price, '$###,###')"/>
					</xsl:otherwise>
				</xsl:choose>
			</text>
			<g style="transform:translate(4%,22%)">
				<filter x="-0.1" y="-0.3" width="1.2" height="1.7" id="solid">
					<feFlood flood-color="var(--theme-sub-heading-color)"/>
					<feComposite in="SourceGraphic" operator="xor" />
				</filter>
				<text y="0" filter="url(#solid)" class="upper" style="fill:var(--theme-body-background); font-size: 135%;">
							Just <xsl:value-of select="$soldListed"/>
				</text>
				<text y="0" fill="#fff" class="upper" style="fill:var(--theme-body-background); font-size: 135%;">
							Just <xsl:value-of select="$soldListed"/>
				</text>
			</g>
		</svg>
		<image x="44%" y="27%" width="20%" height="20%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="4" fill-opacity="0" x="44%" y="27%" width="20%" height="20%"/>
		<image x="44%" y="50%" width="20%" height="20%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="4" fill-opacity="0" x="44%" y="50%" width="20%" height="20%"/>
		<image x="44%" y="73%" width="20%" height="20%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="4" fill-opacity="0" x="44%" y="73%" width="20%" height="20%"/>

		<svg height="67%" width="4%" x="67%" y="27%">
			<line x1="0" y1="0" x2="00" y2="100%" style="stroke:var(--theme-body-color);stroke-width:9"></line>
		</svg>
	</g>

	<g style="transform: translate(73%, 28%);">
		<text x="10%" class="capitalize medium center" fill="var(--theme-sub-heading-color)" style="font-weight: 600;">
			<xsl:value-of select="//agent[1]/marketingName" />

&#160;
		</text>
		<text x="10%" y="6%" class="capitalize center" fill="var(--theme-sub-heading-color)">
realtor |<xsl:value-of select="//agent[1]/marketingLicense" />
		</text>
		<text x="10%" y="10%" class="capitalize center medium" fill="var(--theme-sub-heading-color)" style="font-weight:600;">
			<xsl:value-of select="//agent[1]/mobile" />
		</text>
		<text x="10%" y="15%" class="capitalize center" fill="var(--theme-sub-heading-color)" style="font-size:130%">
			<xsl:value-of select="//agent[1]/marketingEmail" />
		</text>
		<text x="10%" y="20%" class="capitalize center" fill="var(--theme-sub-heading-color)" style="font-size:130%; font-weight:600;">
			<xsl:value-of select="//agency/website" />
		</text>
		<svg height="80" width="300" y="21%">
			<g fill="none" stroke="var(--theme-body-color)" stroke-width="4">
				<path stroke-dasharray="5,5" d="M5 20 l240 0" />
			</g>
		</svg>
		<text x="10%" y="28%" class="center upper" fill="var(--theme-sub-heading-color)" style="font-size: 130%;">
			<tspan>you only get one</tspan>
			<tspan x="10%" dy="5%">chance to make a</tspan>
			<tspan x="10%" dy="5%">first impression!</tspan>
		</text>
		<image y="43%" width="20%" height="23%">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
	</g>

	<xsl:call-template name="copyright">
		<xsl:with-param name="disclaimer" select="'direct-mail'" />
	</xsl:call-template>
</xsl:template>
</xsl:stylesheet>