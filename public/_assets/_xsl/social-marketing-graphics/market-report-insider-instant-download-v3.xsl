<?xml version="1.0"?>
<!--
	Asset Name:	Market Report Insider Instant Download V3?
	Tags:		Social Marketing Ad
	Supports:	Facebook Post, Listing, Area
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<image x="0" y="-10%" width="100%" height="100%" preserveAspectRatio="xMidYMid meet" style="transform: scaleY(1.2);">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/overlay.png' )" />
			</xsl:attribute>
		</image>
		<g style="transform: translateY(11%);">
			<g style="transform: translate(20%, 5%);">
				<clipPath id="clipCircle">
					<circle r="18%" cx="31.5%" cy="24%"></circle>
				</clipPath>
				<rect x="13.5%" y="7%" rx="50%" ry="50%" width="37%" height="35.5%" fill="#000" opacity="0.1"></rect>
				<image x="0" y="4%" width="63%" height="40%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
			</g>
			<g style="transform: translate(50%, 50%);">
				<text x="0" y="0" class="bold center medium" fill="var(--theme-heading-color)" data-max-width="60%">
					<xsl:value-of select="concat( //area/name, ' Market Insider Report courtesy of' )" />
				</text>
				<text x="0" y="5%" class="bold center capitalize medium" fill="var(--theme-heading-color)">

					<tspan>
						<xsl:value-of select="//agent[1]/marketingName" />
					</tspan>
				</text>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>