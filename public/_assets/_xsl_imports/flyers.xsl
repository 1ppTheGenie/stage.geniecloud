<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

	<xsl:template name="flyer-footer">
		<rect x="0" y="87%" width="100%" height="9.9%" fill="var(--theme-heading-color)" />

		<g style="transform:translate(0%,87.9%)">
			<text x="2%" y="0.6%" class="schedule" font-family="var(--theme-heading-font)" font-size="140%" font-weight="300" fill="var(--theme-body-background)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Schedule'" />
					<xsl:with-param name="default" select="'Schedule a private showing:'" />
				</xsl:call-template>
			</text>

			<xsl:choose>
				<xsl:when test="//output/@stylesheet='single-rear-01'">
					<!-- when stylesheet is single rear -->
					<text x="2%" y="1.45%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" font-size="200%" font-weight="700" data-max-width="20%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="concat( 'CALL or TEXT ' , upper-case(//agent[1]/firstName), ':')" />
						</xsl:call-template>
					</text>
					<text x="2%" y="4%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" font-size="200%" font-weight="700">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>
				</xsl:when>
				<xsl:otherwise>
					<text x="2%" y="3.1%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" font-size="200%" font-weight="700" data-max-width="20%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="concat( 'CALL or TEXT ' , upper-case(//agent[1]/firstName), ':')" />

						</xsl:call-template>
					</text>
					<text x="2%" y="5.5%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" font-size="200%" font-weight="700">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>
				</xsl:otherwise>
			</xsl:choose>
	
			<image x="22%" y="1%" width="14%" height="8%">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>

			<text x="98%" y="0.7%" class="align-right right" font-family="var(--theme-heading-font)" font-size="125%" font-weight="100"  fill="var(--theme-body-background)">
				<tspan x="98%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</tspan>
				<tspan x="98%" dy="1.7%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="98%" y="4%" class="align-right right" font-family="var(--theme-heading-font)" font-size="125%" font-weight="100" fill="var(--theme-body-background)">
				<tspan>
					<xsl:value-of select="//agent[1]/address/street" />
				</tspan>
				<tspan x="98%" dy="1.4%">
					<xsl:value-of select="//agent[1]/address/city" />

					<xsl:text>, </xsl:text>
					<xsl:value-of select="//agent[1]/address/state" />

					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="//agent[1]/address/zip" />
				</tspan>
			</text>
	
			<text x="98%" y="7.1%" class="align-right right" font-size="80%" font-family="var(--theme-heading-font)" font-weight="100"  fill="var(--theme-body-background)">
				<xsl:value-of select="//agent[1]/marketingLicense" />
			</text>

			<text x="51.5%" y="0.8%" class="center" font-family="var(--theme-heading-font)" font-size="130%" font-weight="300" fill="var(--theme-body-background)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'presented'" />
					<xsl:with-param name="default" select="'Presented by:'" />
				</xsl:call-template>
			</text>

			<xsl:choose>
				<xsl:when test="$companyLogo='' or $personalLogo=''">
					<image x="40%" y="3.4%" width="25%" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="$personalLogo=''">
									<xsl:value-of select="$companyLogoInverse" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$personalLogoInverse" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</image>
				</xsl:when>
				<xsl:otherwise>
					<image x="39%" y="3.4%" width="24%" height="5%" class="center" preserveAspectRatio="xMinYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="$personalLogoInverse" />
						</xsl:attribute>
					</image>
					<image x="66%" y="4%" width="6%" height="3.5%" class="center" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="$companyLogoInverse" />
						</xsl:attribute>
					</image>
				</xsl:otherwise>
			</xsl:choose>
		</g>
	</xsl:template>
</xsl:stylesheet>