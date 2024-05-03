<?xml version="1.0"?>
<!--
	Asset Name:	About Us
	Tags:		Text
	Sizes:		Facebook
	Approved:	True
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text {dominant-baseline: auto;}'" />
		</style>

		<g style="transform: translate(0%, 25%);">
			<text x="50%" y="5.5%" class="large upper center" font-family="var(--theme-heading-font)" style="font-size:50px; fill: var(--theme-heading-color);">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'AboutUs'" />
					<xsl:with-param name="default" select="concat('About ',$agentMeUs)" />
				</xsl:call-template>
			</text>

			<foreignObject x="6%" y="12%" height="70%" width="88%">
				<div style="font-family:var(--theme-body-font);">
					<xsl:choose>
						<xsl:when test="//agent[1]/marketingAbout!=''">
							<xsl:variable name="marketingAboutLength" select="string-length(//agent[1]/marketingAbout)" />
							<xsl:choose>
								<xsl:when test="$marketingAboutLength &lt;= 1000">
									<div style="line-height:1.7;font-size:120%;">
										<xsl:value-of select="//agent[1]/marketingAbout" disable-output-escaping="yes" />
									</div>
								</xsl:when>
								<xsl:when test="$marketingAboutLength &lt;= 1250">
									<div style="line-height:1.6;font-size:100%;">
										<xsl:value-of select="//agent[1]/marketingAbout" disable-output-escaping="yes" />
									</div>
								</xsl:when>
								<xsl:when test="$marketingAboutLength &lt;= 1700">
									<div style="line-height:1.5;font-size:90%;">
										<xsl:value-of select="//agent[1]/marketingAbout" disable-output-escaping="yes" />
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div style="line-height:1.5;font-size:80%;">
										<xsl:value-of select="//agent[1]/marketingAbout" disable-output-escaping="yes" />
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<div style="line-height:1.7;font-size:120%;">
								<xsl:call-template name="default-bio" />
							</div>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</foreignObject>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>