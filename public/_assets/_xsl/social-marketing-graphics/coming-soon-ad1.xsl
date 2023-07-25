<?xml version="1.0"?>
<!--
	Asset Name:	Coming Soon Ad1
	Tags:		Social Marketing Ad
	Sizes:		Instagram-Square
	Supports:	Listing
	Access:		ASP_ID
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<g>
			<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="image-1" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<svg width="100%" viewBox="0 0 100 350" preserveAspectRatio="none" opacity="0.8" style="fill:var(--theme-body-background); stroke-width:1; stroke:var(--theme-body-color)">
				<polygon x="0" y="0" points="0,0 0,50 50,100 100,50 100,0"></polygon>
			</svg>
			<text x="50%" y="5%" class="super-large bold center upper" fill="var(--theme-sub-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Coming Soon Properties'" />
					<xsl:with-param name="default" select="'Coming Soon Properties'" />
				</xsl:call-template>
			</text>

			<g style="transform: skew(0deg, -29deg) translate(0, 70%);">
				<rect fill-opacity="0.7" fill="var(--theme-sub-heading-color)" y="0" class="" x="0" height="12%" width="100%"/>
			</g>
			<g style="transform: rotate(-29deg) translate(0, 54.5%);">
				<text style="font-weight:600; font-size:450%;" fill="var(--theme-body-background)" fill-opacity="0.8" class="center upper" y="8%" x="23%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'firstknow'" />
						<xsl:with-param name="default" select="'Be the First To Know'" />
					</xsl:call-template>
				</text>
			</g>
			<g style="transform: translate(0%, 82%);">
				<rect width="100%" height="150" fill="var(--theme-body-background)" fill-opacity="70%"/>
				<text x="50%" y="1%" class="center" style="font-size: 340%;" fill="var(--theme-body-color)">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'getonthe'" />
							<xsl:with-param name="default" select="'Get on the'" />
						</xsl:call-template>
					</tspan>
					<tspan x="50%" dy="6%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'propertyinsider'" />
							<xsl:with-param name="default" select="'HOT PROPERTY INSIDER list'" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>