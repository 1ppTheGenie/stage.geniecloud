<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing, Print
	Permission:	Direct Mail
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<g>
			<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<g transform="translate(47 47)">
				<rect width="92%" height="535" fill="var(--theme-body-background)" fill-opacity="0.7" />
				<rect x="1.7%" y="12%" width="88.5%" height="1.2%" fill="var(--theme-body-color)"/>
			</g>
			<g style="transform: translate(50%, -14%);">

				<text x="0" y="26.5%" class="center large" fill="var(--theme-body-color)" style=" font-weight:600;">
					<xsl:value-of select="//areas/area[1]/name" />
				</text>
				<text x="0" y="37%" class="center" style="font-size:120%;">
					<xsl:value-of select="//single/address/street" />
				</text>
				<text x="0" y="41.5%" class="center" style="font-size:120%;">
					<tspan>
						<xsl:value-of select="//single/address/city" />
					</tspan>
					<xsl:text disable-output-escaping="yes">&#160;</xsl:text>
					<xsl:value-of select="//single/address/zip" />
				</text>
			</g>
			<g style="transform: translate(6%, 33%);">
				<foreignObject y="0" x="0" width="88%" height="17%">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:10; line-height:160%; text-align:center; font-size:110%;">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
							quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
							cillum dolore eu fugiat nulla pariatur.
					</p>
				</foreignObject>
			</g>
			<g style="transform: translate(50%, 43%);">
				<text class="center" x="0" y="11%" style="font-size:120%;">
					<tspan>
						<xsl:value-of select="//agent[1]/marketingName" />
					</tspan>
				</text>

				<text x="0" y="15.6%" class="center upper" style="font-size:120%;">
					<xsl:value-of select="//agent[1]/marketingLicense" />
				</text>
				<text x="0" y="20.6%" class="center" style="font-size:120%;">
					<xsl:value-of select="//agent[1]/mobile" />
				</text>
				<text x="0" y="25.6%" class="center" style="font-size:120%;">
					<xsl:value-of select="//agent[1]/marketingEmail" />
				</text>
			</g>
		</g>
		<g style="transform: translate(4%, 64%);">
			<rect x="1.7%" y="12%" width="88.5%" height="1.2%" fill="var(--theme-body-color)"/>
			<image x="0%" y="14.5%" width="92%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>