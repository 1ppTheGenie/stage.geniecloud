<?xml version="1.0"?>
<!--
	Asset Name:	Under Contract
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Instagram, LinkedIn
	Supports:	Under Contract
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<text x="2%" y="8%" class="upper" fill="var(--theme-heading-color)" style="font-size: 350%;letter-spacing: 2%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'active'" />
				<xsl:with-param name="default" select="'active'" />
			</xsl:call-template>
		</text>

<rect width="36%" height="0.5%" fill="var(--theme-body-color)" fill-opacity="100%" y="20%" x="2%" />


		<text x="2%" y="25%" class="large">
<xsl:call-template name="listing-address-line-one" />

		</text>

		<text x="2%" y="32%" class="large">
<xsl:call-template name="listing-address-line-two" />

		</text>

		<image x="50%" y="3%" width="48%" height="52%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(0%,55%);">
			<image x="2%" y="0" width="48%" height="41%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>
			<image x="48%" y="10%" width="53%" height="20%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>