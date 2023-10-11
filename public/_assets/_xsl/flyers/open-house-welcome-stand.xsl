<?xml version="1.0"?>
<!--
	Asset Name: Open House Welcome Stand
	Tags:		Direct Mail
	Sizes:		Letter
	Supports:	Listing, Multi-Listing, QRCode
	Pages:		flyers/open-house-welcome-stand
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<rect x="0%" y="0%" width="100%" height="100%" fill="var(--theme-sub-heading-color)" />
		<rect x="7%" y="5%" width="86%" height="90%" fill="var(--theme-body-background)" />

		<text class="center heading bold upper" x="50%" y="10%" font-size="700%" style="letter-spacing:2px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'welcometo'" />
				<xsl:with-param name="default" select="'Welcome To'" />
			</xsl:call-template>
		</text>

		<text class="center sub-heading" x="50%" y="16.2%" font-size="240%">
			<tspan class="sub-heading" x="50%" dy="3%">
<xsl:call-template name="listing-address-line-one" />

			</tspan>
			<tspan class="sub-heading" x="50%" dy="3.5%">
<xsl:call-template name="listing-address-line-two" />

			</tspan>
		</text>

		<text class="center" x="50%" y="24.5%">
			<tspan class="heading" x="50%" dy="3%" font-size="225%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'pleasescan'" />
					<xsl:with-param name="default" select="'Please scan our'" />
				</xsl:call-template>
			</tspan>
			<tspan class="bold heading" x="50%" dy="3.2%" font-size="500%" style="letter-spacing:2px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'touchless'" />
					<xsl:with-param name="default" select="'TOUCHLESS GUEST BOOK'" />
				</xsl:call-template>
			</tspan>
			<tspan class="sub-heading" x="50%" dy="8%" font-size="220%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'signin'" />
					<xsl:with-param name="default" select="'Sign in'" />
				</xsl:call-template>
			</tspan>
		</text>

		<g style="transform:translate(31.4%, 37.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'37%'" />
				<xsl:with-param name="height" select="'37%'" />
			</xsl:call-template>
		</g>

		<text class="center heading" x="50%" y="77%" font-size="240%">
			<tspan >
				Presented by
			</tspan>
			<tspan>
				<xsl:value-of select="//agent[1]/marketingName" />
			</tspan>
		</text>

		<image x="0" y="81%" width="100%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>