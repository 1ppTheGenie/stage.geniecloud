<?xml version="1.0"?>
<!--
	Asset Name:	LC-PROP-POST-06-VIP
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:import href="lc-social-media.xsl" />
	<xsl:import href="lc-prop-posts.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
				#footer text tspan, #footer text {	
					fill: var(--theme-body-background) !important;
					font-size: 9px;
				}
				g#footer text a tspan{
					fill: #337ab7 !important;
				}
				g#agent-contact{
					transform: translate(0, 8px) !important;
				}				
                g#footer text:first-child {
                    transform: translate(3.6%);
                }
				g#footer text:last-child {
                    transform: translate(91.2%);
                }
			'" />
		</style>
		<xsl:call-template name="lc-prop-vip-common" />
	</xsl:template>

	<xsl:template name="agentAd1-NumberAndLogo">
		<xsl:param name="readyX" />
		<xsl:param name="ready2X" />
		<xsl:param name="boxWidth" />
		<xsl:param name="agentX" />
		<xsl:param name="logoWidth" />

		<rect fill-opacity="0.1" x="0%" y="70.7%" width="100%" height="5.35%" fill="var(--theme-body-color)">
			<xsl:attribute name="width">
				<xsl:value-of select="$boxWidth" />
			</xsl:attribute>
		</rect>

		<text class="upper center middle" fill="var(--theme-body-color)" y="73.2%" font-weight="700" font-size="250%" font-family="var(--theme-body-font)">
			<xsl:attribute name="x">
				<xsl:value-of select="$agentX" />
			</xsl:attribute>
			<xsl:attribute name="data-max-width">
				<xsl:value-of select="$logoWidth" />
			</xsl:attribute>

			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat( 'Call ', //agent[1]/marketingName ,' &#160;&#160;&#124;&#160;&#160; ', //agent[1]/mobile )" />
			</xsl:call-template>
		</text>

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="13.4%" y="78.7%" width="30%" height="7.4%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:choose>
									<xsl:when test="//output/@themeHue = 'light'">
										<xsl:value-of select="$companyLogo" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$companyLogoInverse" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="//output/@themeHue = 'light'">
										<xsl:value-of select="$personalLogo" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$personalLogoInverse" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="13.4%" y="78.7%" width="30%" height="7.4%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="//output/@themeHue = 'light'">
								<xsl:value-of select="$personalLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogoInverse" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
				<image x="45.9%" y="78.7%" width="27%" height="7.4%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="//output/@themeHue = 'light'">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$companyLogoInverse" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<image x="76.5%" y="58.5%" width="28%" height="35%" preserveAspectRatio="xMaxYMax meet">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<text x="3.2%" y="88.2%" font-size="88%" font-weight="300" font-family="var(--theme-body-font)" fill="var(--theme-body-color)" data-max-width="90%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>