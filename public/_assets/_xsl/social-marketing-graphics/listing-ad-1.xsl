<?xml version="1.0"?>
<!--
	Asset Name:	Listing Ad 01
	Tags:		Social Marketing Ad
	Sizes:		Letter
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-scripts">
	</xsl:template>

	<xsl:template name="svg-body">
		<g>
			<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
		</g>
		<g style="transform: translate(12.5%, 10%);">
			<svg viewBox="0 0 100 100" preserveAspectRatio="none" height="80%" width="75%">
				<path d="M 0,0 100,0" stroke="var(--theme-body-background)" stroke-width="2" />
				<path d="M 0,0 0,70" stroke="var(--theme-body-background)" stroke-width="2" />
				<path d="M 100,0 100,100" stroke="var(--theme-body-background)" stroke-width="2" />
				<path d="M 0,85 0,100" stroke="var(--theme-body-background)" stroke-width="2" />
			</svg>
			<text x="0" y="58%" class="center" fill="var(--theme-body-background)" style="font-family:'Marck Script',cursive;font-size:700%; font-weight:600;" data-max-width="15%">
				<xsl:choose>
					<xsl:when test="number(//single/statusTypeID) = 2">
						<xsl:text>Sold</xsl:text>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID) = 1">
						<xsl:text> Active </xsl:text>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID) = 14">
						<xsl:text> Coming Soon </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text> Escrow </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>
		<text x="50%" y="88%" class="center upper" fill="var(--theme-body-background)" style="font-weight:600; font-size: 250%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'AgentWebsite'" />
				<xsl:with-param name="default" select="//agent[1]/website" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>