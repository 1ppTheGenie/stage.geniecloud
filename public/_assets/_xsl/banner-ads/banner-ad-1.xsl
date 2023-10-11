<?xml version="1.0"?>
<!--
	Asset Name:	Banner Ad No.1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<g>
<rect stroke="var(--theme-emphasis-color)" stroke-width="6" fill-opacity="0" x="2.5%" y="4%" width="95%" height="90%" />


			<g class="align-center" style="transform: translate(10.2%,27%);">
				<text x="16%" y="6%" width="25%" height="20%" class="heading upper" style="font-size:250%; font-weight:600;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areaname'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</text>
				<text x="16%" y="15%" class="medium bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'homepriceshifting'" />
						<xsl:with-param name="default" select="'HOME PRICES are SHIFTING'" />
					</xsl:call-template>
				</text>
				<text x="16%" y="32%" class="heading bold medium upper">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'downloadfreereport'" />
						<xsl:with-param name="default" select="'Download free report'" />
					</xsl:call-template>
				</text>
				<text x="16%" y="38%" class="bold medium upper">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>
			</g>

			<image x="49%" y="20%" width="45%" height="62%" preserveAspectRatio="xMidYMid">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/laptop.png' )" />
			</image>

			<image x="54.83%" y="30.3%" width="33.4%" height="38%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'Lightning'" />
					<xsl:with-param name="default" select="concat( //output/@siteUrl, '_assets/_img/lightning.jpg' )" />
				</xsl:call-template>
			</image>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>