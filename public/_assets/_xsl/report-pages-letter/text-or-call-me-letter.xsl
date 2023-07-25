<?xml version="1.0"?>
<!--
	Asset Name:	Text or Call Me Letter
	Tags:		Text
	Sizes:		US Letter
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<rect x="7%" y="30%" width="85%" height="40%" fill-opacity="0" stroke="var(--theme-sub-heading-color)" />
		<rect x="10%" y="35%" width="79%" height="30%" fill="var(--theme-body-color)" />

		<text x="50%" y="45%" class="center upper bold" font-size="250%" font-weight="900" style="fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'TextorCall1'" />
				<xsl:with-param name="default" select="'text or call me'" />
			</xsl:call-template>
		</text>

		<text x="50%" y="50%" class="capitalize center" data-max-width="50%" font-size="230%" style="fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'TextOrCall'" />
				<xsl:with-param name="default" select="concat( 'for your custom ' , ' ',$singularPropertyType,' ', 'value analysis')" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>

