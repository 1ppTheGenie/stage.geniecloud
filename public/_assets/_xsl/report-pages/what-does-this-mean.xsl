<?xml version="1.0"?>
<!--
	Asset Name:	What does this mean to you?
	Tags:		Text
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<rect x="7%" y="30%" width="85%" height="40%" fill-opacity="0" stroke="var(--theme-sub-heading-color)" />
		<rect x="10%" y="35%" width="79%" height="30%" fill="var(--theme-body-color)" />
		<text x="50%" y="43%" class="h3 center" data-max-width="50%" style="font-size:250%;fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Whatdoes'" />
				<xsl:with-param name="default" select="'What does this'" />
			</xsl:call-template>
		</text>
		<text x="50%" y="50%" class="h3 center" data-max-width="50%" style="font-size:250%;fill:var(--theme-body-background);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Whatdoes1'" />
				<xsl:with-param name="default" select="'mean for you?'" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>