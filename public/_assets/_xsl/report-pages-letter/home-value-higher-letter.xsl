<?xml version="1.0"?>
<!--
	Asset Name:	Home value higher than you think letter
	Tags:		Text
	Supports:	Area
	Sizes:		US Letter
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<rect x="7%" y="25%" width="85%" height="40%" fill-opacity="0" stroke="var(--theme-sub-heading-color)" />
		<rect x="10%" y="30%" width="79%" height="30%" fill="var(--theme-body-color)" />

		<text x="50%" y="41%" class="h3 center" font-size="210%" style="fill:var(--theme-body-background);" data-max-width="80%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Yourhome'" />
				<xsl:with-param name="default" select="concat( 'Your ' , ' ', lower-case($singularPropertyType),' ', 'VALUE may be much higher than')" />
			</xsl:call-template>
		</text>
		<text x="50%" y="45.5%" class="h3 center" font-size="210%" style="fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Thankyou'" />
				<xsl:with-param name="default" select="'you thought!'" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>