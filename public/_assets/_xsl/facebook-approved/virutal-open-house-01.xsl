<?xml version="1.0"?>
<!--
	Asset Name:	Virtual Open House - No.1
	Tags: 		Open House
	Sizes:		Facebook, Facebook Post, Facebook Ad
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<image preserveAspectRatio="xMidYMid slice" width="100%" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(0%,23%);fill:var(--theme-body-background);">
			<rect width="30%" height="65%" fill="var(--theme-body-background)" fill-opacity="80%"/>

			<g style="transform:translate(2.5%,2%);">
				<text x="0" y="2%" class="sub-heading medium bold" data-max-width="20%">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singleaddressstreet'" />
							<xsl:with-param name="default" select="//single/address/street" />
						</xsl:call-template>
					</tspan>
				</text>

				<text x="0" y="7%" class="sub-heading medium bold" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singleaddressscity'" />
						<xsl:with-param name="default" select="concat( //single/address/city, '&#160; ', //single/address/zip )" />
					</xsl:call-template>
				</text>
				<rect x="0" y="15%" width="25%" height="39%" fill="#0000" stroke-width="4" stroke="var(--theme-emphasis-color)"/>
				<text x="2%" y="21%" class="sub-heading super-large upper bold" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'voh-title'" />
						<xsl:with-param name="default" select="'Open'" />
					</xsl:call-template>
				</text>

				<text x="2%" y="35%" class="sub-heading super-large upper bold" data-max-width="20%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'house'" />
						<xsl:with-param name="default" select="'House'" />
					</xsl:call-template>
				</text>

				<text x="0" y="57%" class="sub-heading bold" style="font-size:120%" data-max-width="25%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singleopenHouse'" />
						<xsl:with-param name="default">
							<xsl:choose>
								<xsl:when test="//single/openHouse">
									<xsl:value-of select="//single/openHouse" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001] [Hwo]:[m1o]')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
					</xsl:call-template>
				</text>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>