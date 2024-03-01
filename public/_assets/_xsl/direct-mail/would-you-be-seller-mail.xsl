<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending Postage Light 2
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<svg x="20%" y="10%">
			<text x="32%" y="8%" width="50%" height="40%" class="center" fill="var(--theme-sub-heading-color)" style="font-size:320%;" font-family="var(--theme-body-font)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'at-what-price'" />
						<xsl:with-param name="default" select="'AT'" />
					</xsl:call-template>
				</tspan>
				<tspan class="bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'at-what-price'" />
						<xsl:with-param name="default" select="' WHAT PRICE'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="32%" y="18%" width="50%" height="40%" class="center" fill="var(--theme-sub-heading-color)" style="font-weight:500;font-size:320%;" font-family="var(--theme-body-font)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'at-what-price'" />
					<xsl:with-param name="default" select="'WOULD YOU BE A'" />
				</xsl:call-template>
			</text>
			<text x="32%" y="28%" width="50%" height="40%" class="center bold" fill="var(--theme-sub-heading-color)" style="font-size:500%;" font-family="var(--theme-body-font)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'at-what-price'" />
					<xsl:with-param name="default" select="'SELLER?'" />
				</xsl:call-template>
			</text>
			<image x="22%" y="48%" width="20%" height="20%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</svg>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>