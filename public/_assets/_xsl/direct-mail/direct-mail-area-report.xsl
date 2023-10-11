<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Area Report
	Tags:		Text
Supports:	Area, QRCode
	Sizes:		Postcard
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<g>

			<rect x="3%" y="5%" width="94%" height="90%" stroke-width="2" fill-opacity="0" stroke="var(--theme-body-color)" class="no-events" />

			<rect x="5%" y="8%" width="90%" height="83%" stroke-width="2" fill-opacity="0" stroke="var(--theme-body-color)" class="no-events" />

			<text x="50%" y="45%" class="sub-heading super-large center upper bold" style="font-size:220%;">
				<xsl:value-of select="//agent[1]/website" />
			</text>

			<g style="transform:translate(41%, 71.6%)">
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'19.5%'" />
					<xsl:with-param name="height" select="'19.5%'" />
				</xsl:call-template>
			</g>
		</g>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>