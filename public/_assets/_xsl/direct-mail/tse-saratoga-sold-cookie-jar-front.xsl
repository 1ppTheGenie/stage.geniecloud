<?xml version="1.0"?>
<!--
	Asset Name: TSE Saratoga SOLD Cookie Jar
	Tags: 		Direct Mail
	Sizes:		Postcard
	Supports:	Area, Print
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/tse-saratoga-sold-cookie-jar-front.png' )" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800" />
		<style>
<xsl:value-of select="'.open-sans{ font-family: &quot;Open Sans&quot;, sans-serif !important; }'" />

		</style>

		<image x="2%" y="90%" width="14%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/tse-trans-logo.png' )" />
			</xsl:attribute>
		</image>

		<text x="97%" y="3%" fill="#fdb913" style="font-size:500%;letter-spacing: 0.5px;font-weight: 800;" class="upper align-right open-sans">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'ahead'" />
				<xsl:with-param name="default" select="concat( 'GO AHEAD...', '' )" />
			</xsl:call-template>
		</text>
		<text x="97%" y="18%" fill="#fdb913" style="font-size:250%;font-weight: 800;" class="upper align-right open-sans">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'cookies'" />
				<xsl:with-param name="default" select="concat( 'THEY’RE YOUR COOKIES!', '' )" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>
