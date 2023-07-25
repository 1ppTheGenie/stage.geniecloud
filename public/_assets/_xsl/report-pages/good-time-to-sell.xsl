<?xml version="1.0"?>
<!--
	Asset Name:	Is now a good time to sell?
	Tags:		Text
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<rect x="10%" y="20%" width="80%" height="60%" fill-opacity="0" stroke="var(--theme-body-color)" />

		<rect x="11.5%" y="22.5%" width="77%" height="55%" fill="var(--theme-heading-color)" />

		<text x="50%" y="42.5%" class="h3 center" style="font-size:185%;fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'NGT1'" />
				<xsl:with-param name="default" select="'Is now a good time to'" />
			</xsl:call-template>
		</text>

		<text x="50%" y="52%" class="heading center bold upper" style="font-size:265%;fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'NGT2'" />

				<xsl:with-param name="default" select="concat( 'Sell Your ' , ' ', lower-case($singularPropertyType),'?')" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>