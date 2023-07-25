<?xml version="1.0"?>
<!--
	Asset Name:	Agent Quote
	Tags:		Text
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<g style="transform: translate(0%, 0%);">
			<text x="50%" y="42%" class="large center heading">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'AgentQuote1'" />
					<xsl:with-param name="default" select="'Simply the Best!'" />
				</xsl:call-template>
			</text>

			<rect x="47%" y="51%" width="50" height="10" stroke-width="2" style="fill:#000;"/>

			<text x="50%" y="55%" class="medium center">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'AgentQuote2'" />
					<xsl:with-param name="default" select="'Lucia Patrignani, Seller'" />
				</xsl:call-template>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>