<?xml version="1.0"?>
<!--
	Asset Name:	Open House - No.2
	Tags: 		Open House
	Sizes:		Facebook, Instagram
	Supports:	Open House, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="social-ad-name">
		<xsl:value-of select="concat( 'OH', genie:format-date( //output/@reportDate, '[MNn]' ), ' ', //single/address/street )" />
	</xsl:template>

	<xsl:template name="svg-body">
		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="5" fill-opacity="0" x="3.2%" y="5%" width="93%" height="87%"/>
		<g style="transform:translateY(35%)">
			<rect width="100%" height="27%" fill="var(--theme-body-background)" fill-opacity="0.7" />
			<text x="50%" y="1%" class="large medium sub-heading upper center" style="font-size: 300%; font-weight:600;">
				<xsl:call-template name="listing-address-line-one"/>
			</text>
			<text x="50%" y="11%" class="large medium sub-heading upper center" style="font-size: 300%; font-weight:600;">
				<xsl:call-template name="listing-address-line-two"/>
			</text>

			<!-- Open House Example -->
			<text x="50%" y="21%" class="sub-heading capitalize center bold" style="font-size:130%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'open-date-02'" />
					<xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ', ', //openHouse/session[1]/@starts, ' - ',//openHouse/session[1]/@ends)" />
				</xsl:call-template>
			</text>
		</g>

		<image x="42.5%" y="70%" width="15%" height="15%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<filter x="-0.35" y="-0.7" width="1.7" height="2.4" id="solid">
			<feFlood flood-color="var(--theme-body-background)"/>
			<feComposite in="SourceGraphic" operator="xor" />
		</filter>

		<text x="50%" y="90%" class="upper narrow center" style="font-size:130%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'openhouse'" />
				<xsl:with-param name="default" select="'Open House'" />
			</xsl:call-template>
		</text>
		<text x="50%" y="90%" fill="var(--theme-body-color)" filter="url(#solid)" class="upper narrow center" style="font-size:130%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'openhouse1'" />
				<xsl:with-param name="default" select="'Open House'" />
			</xsl:call-template>
		</text>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>