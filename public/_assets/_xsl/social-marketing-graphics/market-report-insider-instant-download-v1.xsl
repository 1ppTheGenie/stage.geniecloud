<?xml version="1.0"?>
<!--
	Asset Name:	Market Report Insider Instant Download V1?
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
		<rect x="0" y="0" width="100%" height="80%" fill="var(--theme-body-background)"></rect>
		<use class="center" x="42%" y="30%" width="12%" height="12%" fill="var(--active-green)">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#circle-up-arrow' )" />
		</use>
		<g style="transform: translate(33%, 4%);">
			<text x="16%" y="0" class="upper bold center medium" fill="var(--theme-heading-color)" data-max-width="60%">
				<tspan>
					<xsl:value-of select="concat( //area/name,' ', $singularPropertyType , ' Values' )" />
				</tspan>
			</text>
			<g style="transform: translate(2%, 10%);">
				<rect x="0" y="0" stroke="var(--theme-heading-color)" stroke-width="0.3" fill-opacity="1" width="12%" height="1" fill="var(--theme-heading-color)">
				</rect>

				<rect x="0" y="0.7%" stroke="var(--theme-heading-color)" stroke-width="0.3" fill-opacity="1" width="12%" height="1" fill="var(--theme-heading-color)"></rect>
			</g>

			<text class="center upper bold medium" fill="var(--theme-heading-color)">
				<tspan dx="17%" y="5%"> Have Risen an Average of:</tspan>
			</text>
		</g>
		<image x="5%" y="17%" opacity="0.3" width="90%" height="58%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bar-graph.png' )" />
			</xsl:attribute>
		</image>
		<g style="transform: translate(0, 14%);">
			<text x="50%" y="39.5%" class="center upper" style="fill:var(--theme-heading-color);font-weight:600">
				<tspan class="super-large" style="font-weight: 500;">$</tspan>
				<tspan style="font-size:550%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="'632,805'" />
					</xsl:call-template>
				</tspan>
				<tspan dx="-25%" dy="17%" style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="default" select="'in the last 12 months'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<rect x="0" y="80%" width="100%" height="20%" fill="var(--theme-heading-color)"></rect>
		<g style="transform: translate(28%, 91%);">
			<use class="center" x="0" y="0" width="3.5%" height="3.5%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#double-arrow-down' )" />
			</use>

			<use class="center" x="10%" y="0" width="3.5%" height="3.5%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#double-arrow-down' )" />
			</use>

			<use class="center" x="20%" y="0" width="3.5%" height="3.5%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#double-arrow-down' )" />
			</use>

			<use class="center" x="30%" y="0" width="3.5%" height="3.5%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#double-arrow-down' )" />
			</use>

			<use class="center" x="40%" y="0" width="3.5%" height="3.5%" fill="var(--theme-body-background)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#double-arrow-down' )" />
			</use>
		</g>
		<g style="transform: translate(0, 83%);">
			<text x="50%" y="0" class="center upper" font-size="160%" fill="var(--theme-body-background)">
				<xsl:call-template name="editable">
					<xsl:with-param name="default" select="'find out your home value!'" />
				</xsl:call-template>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>