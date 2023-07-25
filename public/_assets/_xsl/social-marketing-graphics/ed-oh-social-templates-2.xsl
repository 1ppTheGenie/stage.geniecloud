<?xml version="1.0"?>
<!--
	Asset Name:	Ed Oh Social Templates 2
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="lc-social-media.xsl"/>

	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>
		<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-body-background)"></rect>

		<image x="26%" y="4.8%" width="70%" height="70%" stroke-width="5" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<foreignObject x="-1%" y="-5%" height="22%" width="54%" style="transform-origin: 0; transform: rotate(-90deg) translate(-7%, 63%)">
			<div>
				<h2 class="upper futura-text" style="color:var(--theme-heading-color); font-weight:500; font-size:25px;">
					<xsl:value-of select="//area/name" />
				</h2>
			</div>
		</foreignObject>

		<rect fill="#e3e3e3" stroke-width="1%" stroke="#fff" fill-opacity="1" x="2%" y="61.5%" width="34%" height="33%"/>

		<image x="2.5%" y="62%" width="33%" height="32%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<text class="futura-text" x="40.8%" y="78.8%" fill="var(--theme-heading-color)" font-weight="800" font-size="160%">
			<xsl:text>Open 1-4pm</xsl:text>
		</text>

		<text class="futura-text" x="40.8%" y="85.5%" fill="var(--theme-heading-color)" font-weight="400" font-size="155%" data-max-width="55%" style="letter-spacing:-1px;">
			<xsl:value-of select="$listingAddressLine1" />
		</text>
	</xsl:template>
</xsl:stylesheet>