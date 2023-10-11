<?xml version="1.0"?>
<!--
	Asset Name: Custom Video Ad
	Tags:		Video, Facebook Ad
	Sizes:		Facebook Video Ad
	Supports:	Facebook Post, Area, PricePercent, Video
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper">
			<xsl:with-param name="nobg" select="'true'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="social-ad-name">
		<xsl:value-of select="concat( genie:format-date( //output/@reportDate, '[MNn]' ), ' ', //area/name, ' Doing something different' )" />
	</xsl:template>

	<xsl:template name="svg-body">
		<foreignObject x="0" y="10%" width="100%" height="100%" style="transform: translate(0%, -10%);">
			<video autoplay="true" width="100%" data-name="fb-video-url">
				<source type="video/mp4">
					<xsl:attribute name="src">
						<xsl:choose>
							<xsl:when test="//overrides/fb-video-url">
<xsl:value-of select="//overrides/fb-video-url" />

							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/sample-video.mp4' )" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</source>

				<xsl:text>Sorry, your browser doesn't support embedded videos.</xsl:text>
			</video>
		</foreignObject>
	</xsl:template>
</xsl:stylesheet>