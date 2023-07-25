<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
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

				<text x="0" y="26.5%" class="center large" fill="var(--theme-body-color)" style=" font-weight:600;" data-max-width="70%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</text>
				<text x="0" y="37%" class="center" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singleaddressstreet'" />
						<xsl:with-param name="default" select="//single/address/street" />
					</xsl:call-template>
				</text>
				<text x="0" y="41.5%" class="center" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singleaddresscity'" />
						<xsl:with-param name="default" select="concat( //single/address/city, '&#160; ', //single/address/zip )" />
					</xsl:call-template>
				</text>
			</g>
			<g style="transform: translate(6%, 33%);">
				<foreignObject y="0" x="0" width="88%" height="20%">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:4; line-height:160%; text-align:center; font-size:110%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singledescription'" />
							<xsl:with-param name="default" select="//single/description" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</g>
			<g style="transform: translate(50%, 43%);">
				<text class="center" x="0" y="11%" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentName'" />
						<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'' )" />
					</xsl:call-template>
				</text>

				<text x="0" y="15.6%" class="center upper" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
					</xsl:call-template>
				</text>
				<text x="0" y="20.6%" class="center" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>
				<text x="0" y="25.6%" class="center" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</text>
			</g>
		</g>
		<g style="transform: translate(4%, 64%);">
			<rect x="1.7%" y="12%" width="88.5%" height="1.2%" fill="var(--theme-body-color)"/>
			<image x="39%" y="16.5%" width="14%" height="9%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>
	</xsl:template>
</xsl:stylesheet>