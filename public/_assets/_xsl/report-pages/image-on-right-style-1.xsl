<?xml version="1.0"?>
<!--
	Asset Name:	image On Right style 1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<text x="3%" y="5%" class="large upper" fill="var(--theme-sub-heading-color)">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'h1'" />
					<xsl:with-param name="default" select="'title goes here...'" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="3%" y="12%" class="" fill="var(--theme-body-color)">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'h2'" />
					<xsl:with-param name="default" select="'Subtitle goes here...'" />
				</xsl:call-template>
			</tspan>
		</text>

		<image x="49%" y="18%" width="48%" height="77%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'placeholder'"/>
				<xsl:with-param name="default" select="'https://place-hold.it/600x420/.png'"/>
			</xsl:call-template>
		</image>

		<text x="3%" y="18%" class="upper medium" fill="var(--theme-sub-heading-color)">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'h3'" />
					<xsl:with-param name="default" select="'heading goes here...'" />
				</xsl:call-template>
			</tspan>
		</text>
		<g style="transform: translate(3%, 22%);">
			<foreignObject y="0" x="0" width="44%" height="22%">
				<p style="color:var(--theme-body-color);line-height:180%; font-size:110%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'free-text-para'" />
						<xsl:with-param name="default" select="'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur.'" />
					</xsl:call-template>
				</p>
			</foreignObject>
			<foreignObject y="23%" x="0" width="44%" height="22%">
				<p style="color:var(--theme-body-color); line-height:180%; font-size:110%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'free-text-para1'" />
						<xsl:with-param name="default" select="'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur.'" />
					</xsl:call-template>
				</p>
			</foreignObject>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>