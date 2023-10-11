<?xml version="1.0"?>
<!--
	Asset Name:	About Us Letter
	Tags:		Text
	Sizes:		US Letter
	Approved:	True
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
<xsl:value-of select="'text {dominant-baseline: auto;}'" />


		<g style="transform: translate(0%, 30%);">
			<text x="50%" y="8%" class="large upper center" font-size="" font-family="var(--theme-heading-font)" style="font-size:50px; fill: var(--theme-heading-color);">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'AboutUs'" />
					<xsl:with-param name="default" select="'About Us'" />
				</xsl:call-template>
			</text>

			<foreignObject x="6%" y="12%" height="70%" width="88%">
				<div style="line-height:1.7;font-size:100%;font-family:var(--theme-body-font);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'html-about-us'" />
						<xsl:with-param name="default">
							<xsl:choose>
								<xsl:when test="//agent[1]/marketingAbout!=''">
									<xsl:value-of select="//agent[1]/marketingAbout" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'Some content about your firm.'" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="data-element" select="'p'" />
					</xsl:call-template>
				</div>
			</foreignObject>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>