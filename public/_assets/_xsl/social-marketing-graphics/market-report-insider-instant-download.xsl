<?xml version="1.0"?>
<!--
	Asset Name:	Market Report Insider Instant Download?
	Tags:		Social Marketing Ad
	Supports:	Facebook Post, Listing, Area
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-body-background)"></rect>

		<g style="transform: translate(0, 3%);">
			<use x="46%" y="17%" width="9%" height="9%" fill="var(--active-green)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#circle-up-arrow' )" />
			</use>
			<g style="transform: translate(33%, 30%);">
				<text dx="18%" dy="0" class="upper bold center" fill="var(--theme-heading-color)" style="font-size:135%" data-max-width="80%">
					<xsl:value-of select="concat( //area/name ,' ', $singularPropertyType , ' Values Have Risen an ' )" />
				</text>
				<g style="transform: translate(31%, 5%);">
					<rect x="0" y="0" stroke="var(--theme-heading-color)" stroke-width="0.3" fill-opacity="1" width="12%" height="1" fill="var(--theme-heading-color)">
					</rect>

					<rect x="0" y="0.7%" stroke="var(--theme-heading-color)" stroke-width="0.3" fill-opacity="1" width="12%" height="1" fill="var(--theme-heading-color)"></rect>
				</g>

				<text class="center upper bold" fill="var(--theme-heading-color)" style="font-size:135%">
					<tspan dx="17%" y="5%">Average of:</tspan>
				</text>
			</g>
			<g style="transform: translate(28%, 0px);">
				<text x="50%" y="40.5%" class="center" style="fill:var(--theme-heading-color);">
					<tspan x="19%" style="font-weight: 500;font-size:300%;">$</tspan>
					<tspan style="font-size:450%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="default" select="'632,805'" />
						</xsl:call-template>
					</tspan>
					<tspan dx="-26%" dy="16%" style="font-size:100%;fill:var(--theme-heading-color);font-weight:500">
						<xsl:call-template name="editable">
							<xsl:with-param name="default" select="'in the last 12 months'" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
			<svg class="" x="25.5%" y="56.8%" width="50%" height="30%" viewBox="0 0 800 200">
				<rect width="100%" height="140" opacity="0.4" fill="#000" x="0%" y="7%" rx="70" ry="100"></rect>
			</svg>
			<svg class="" x="25%" y="57%" width="50%" height="30%" viewBox="0 0 800 200">
				<rect width="100%" height="140" fill="var(--theme-heading-color)" rx="70" ry="100"></rect>
				<g style="transform: translate(23%, 0);">
					<use class="theme-body center" x="32%" y="22%" width="48%" height="26%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#right-arrow' )" />
					</use>
					<text class="bold theme-body center" dx="24%" dy="20%" style="font-size: 300%;">Download My Report </text>
				</g>
			</svg>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>