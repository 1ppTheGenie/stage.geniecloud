<?xml version="1.0"?>
<!--
	Asset Name:	Qr Code Postcard v2 Front 
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">

		<image x="0%" y="0%" width="100%" height="67%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bg-image.jpg' )" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform:translate(50%,4%)">
			<text class="center heading" fill="var(--theme-body-background)" style="font-size:320%;font-style: italic;">
				<tspan fill="var(--theme-heading-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'whats trending with '" />
						<xsl:with-param name="default" select="'Whats Trending With'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text y="10%" class="center" style="font-size:180%;color:var(--theme-body-background);">
				<tspan fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="concat('', //area/name )" />
					</xsl:call-template>
				</tspan>
			</text>

			<rect width="10%" height="0.2%" x="-22%" y="13%" fill="var(--theme-body-background)" />
			<rect width="10%" height="0.2%" x="12%" y="13%" fill="var(--theme-body-background)" />
		</g>

		<g style="transform:translate(1%,57%)">
			<svg height="18%" width="18%" y="1.8%">
				<circle cx="50%" cy="50%" r="30%" opacity="0.5" fill="#000" />
			</svg>
			<svg height="18%" width="18%">
				<circle cx="50%" cy="50%" r="30%" fill="var(--theme-body-background)" />
				<use x="20.2%" y="19.5%" width="60%" height="60%" stroke="var(--theme-sub-heading-color)" fill="none">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-icon' )" />
				</use>
			</svg>
		</g>
		<g style="transform:translate(10%,58%);">
			<text y="21%" class="center sub-heading bold">
				<tspan fill="var(--theme-body-color)" style="font-size:160%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'community'" />
						<xsl:with-param name="default" select="'Community'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text y="27%" class="center upper">
				<tspan fill="var(--theme-body-color)" style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'trends'" />
						<xsl:with-param name="default" select="'TRENDS'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform:translate(17%,57%)">
			<svg height="18%" width="18%" y="1.8%">
				<circle cx="50%" cy="50%" r="30%" opacity="0.5" fill="#000" />
			</svg>
			<svg height="18%" width="18%">
				<circle cx="50%" cy="50%" r="30%" fill="var(--theme-body-background)" />
				<use x="20.2%" y="19.5%" width="60%" height="60%" stroke="var(--theme-sub-heading-color)" fill="none">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-icon' )" />
				</use>
			</svg>
		</g>
		<g style="transform:translate(25.9%,58%);">
			<text y="21%" class="center sub-heading bold">
				<tspan fill="var(--theme-body-color)" style="font-size:160%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'area'" />
						<xsl:with-param name="default" select="'Area'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text y="27%" class="center upper">
				<tspan fill="var(--theme-body-color)" style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'trends'" />
						<xsl:with-param name="default" select="'TRENDS'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform:translate(66%,57%)">
			<svg height="18%" width="18%" y="1.8%">
				<circle cx="50%" cy="50%" r="30%" opacity="0.5" fill="#000" />
			</svg>
			<svg height="18%" width="18%">
				<circle cx="50%" cy="50%" r="30%" fill="var(--theme-body-background)" />
				<use x="20.2%" y="19.5%" width="60%" height="60%" stroke="var(--theme-sub-heading-color)" fill="none">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-icon' )" />
				</use>
			</svg>
		</g>
		<g style="transform:translate(75%,58%);">
			<text y="21%" class="center sub-heading bold">
				<tspan fill="var(--theme-body-color)" style="font-size:160%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'multiyear'" />
						<xsl:with-param name="default" select="'Multi-Year'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text y="27%" class="center upper">
				<tspan fill="var(--theme-body-color)" style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'trends'" />
						<xsl:with-param name="default" select="'TRENDS'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform:translate(82%,57%)">
			<svg height="18%" width="18%" y="1.8%">
				<circle cx="50%" cy="50%" r="30%" opacity="0.5" fill="#000" />
			</svg>
			<svg height="18%" width="18%">
				<circle cx="50%" cy="50%" r="30%" fill="var(--theme-body-background)" />
				<use x="20.2%" y="19.5%" width="60%" height="60%" stroke="var(--theme-sub-heading-color)" fill="none">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-icon' )" />
				</use>
			</svg>
		</g>
		<g style="transform:translate(91%,58%);">
			<text y="21%" class="center sub-heading bold">
				<tspan fill="var(--theme-body-color)" style="font-size:160%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'buyer'" />
						<xsl:with-param name="default" select="'Buyer'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text y="27%" class="center upper">
				<tspan fill="var(--theme-body-color)" style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'trends'" />
						<xsl:with-param name="default" select="'TRENDS'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform:translate(41.3%,62%)">
			<use width="10%" height="20%" stroke="var(--theme-sub-heading-color)" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#arrow-up-bg' )" />
			</use>
			<text class="center" fill="var(--theme-body-color)" style="font-size:100%;">
				<tspan x="13%" y="7%">Scan the QR Code</tspan>
				<tspan x="13%" y="10%">with your camera</tspan>
			</text>
			<text class="center upper" fill="var(--theme-body-color)" style="font-size:120%;">
				<tspan x="10%" y="17%">SEE WHAT ZILLOW</tspan>
				<tspan x="10%" y="21%">CAN’T SHOW YOU</tspan>
			</text>
		</g>
	</xsl:template>
</xsl:stylesheet>