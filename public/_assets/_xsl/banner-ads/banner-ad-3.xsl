<?xml version="1.0"?>
<!--
	Asset Name:	Banner Ad No.3
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<g>
<rect stroke="var(--theme-emphasis-color)" stroke-width="6" fill-opacity="0" x="2.5%" y="4.5%" width="95%" height="90%" />


			<rect x="34%" y="2%" width="32%" height="3%" fill="var(--theme-body-background)" fill-opacity="1" />
			<text class="bold medium center" x="50%" y="2.5%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Headline-Change-1'" />
					<xsl:with-param name="default" select="'HOME PRICES are SHIFTING'" />
				</xsl:call-template>
			</text>

			<text x="50%" y="7%" class="heading upper center" style="font-size: 250%; font-weight: 600;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
			</text>

			<image x="25%" y="15%" width="50%" height="69%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="1" />
					<xsl:with-param name="preferArea" select="'true'" />
					<xsl:with-param name="default" select="concat( //output/@siteUrl, '_assets/_img/lightning.jpg' )" />
				</xsl:call-template>
			</image>

			<text x="50%" y="85%" class="heading bold large align-center upper">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'DownloadReport'" />
					<xsl:with-param name="default" select="'Download free report'" />
				</xsl:call-template>
			</text>

			<g style="transform: translate(0%, 92.75%);">
				<filter x="-0.1" y="-0.1" width="1.2" height="1.2" id="solid">
<feFlood flood-color="var(--theme-body-background)" />

					<feComposite in="SourceGraphic" operator="xor" />
				</filter>
				<text x="50%" y="0" class="center" fill="var(--theme-body-color);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>
				<text x="50%" y="0" filter="url(#solid)" class="center">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>