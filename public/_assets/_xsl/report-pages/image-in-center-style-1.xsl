<?xml version="1.0"?>
<!--
	Asset Name:	image In Center Style 1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


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

		<image x="3%" y="18%" width="94%" height="72%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
<xsl:with-param name="id" select="'placeholder'" />
<xsl:with-param name="default" select="'https://place-hold.it/1100x400/.png'" />

			</xsl:call-template>
		</image>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>