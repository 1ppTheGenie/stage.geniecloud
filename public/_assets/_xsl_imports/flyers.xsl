<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

	<xsl:template name="flyer-footer">
		<rect x="0" y="88.1%" width="100%" height="9.05%" fill="var(--theme-heading-color)" />

		<g style="transform:translate(0%,88.5%)">
			<text x="1.4%" y="0.6%" class="schedule" font-family="var(--theme-sub-heading-font)" font-size="130%" font-weight="300" fill="var(--theme-body-background)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Schedule'" />
					<xsl:with-param name="default" select="'Schedule a private showing:'" />
				</xsl:call-template>
			</text>

			<xsl:choose>
				<xsl:when test="$hasMultipleAgents">
					<text x="1.4%" y="2%" fill="var(--theme-body-background)" font-family="var(--theme-sub-heading-font)" font-size="180%" font-weight="500" data-max-width="20%">
						<tspan x="1.4%" dy="0">
							CALL or TEXT
						</tspan>							
						
						<tspan x="1.4%" dy="1.5%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentname'" />
								<xsl:with-param name="default" select="concat(upper-case(//agent[1]/firstName), ' &amp; ', upper-case(//agent[2]/firstName)), ':'" />
							</xsl:call-template>
						</tspan>			
						
					</text>
					<text x="1.4%" y="5.3%" fill="var(--theme-body-background)" font-family="var(--theme-sub-heading-font)" font-size="16" font-weight="700">
						<tspan x="1.4%" dy="0">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentname'" />
								<xsl:with-param name="default" select="//agent[1]/mobile" />
							</xsl:call-template>
						</tspan>
						<tspan x="1.4%" dy="1.3%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentname'" />
								<xsl:with-param name="default" select="//agent[2]/mobile" />
							</xsl:call-template>
						</tspan>	
					</text>
					
				</xsl:when>
				<xsl:otherwise>
					<text x="1.4%" y="2.3%" fill="var(--theme-body-background)" font-family="var(--theme-sub-heading-font)" font-size="190%" font-weight="700" data-max-width="20%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="concat( 'CALL or TEXT ' , upper-case(//agent[1]/firstName), ':')" />
						</xsl:call-template>
					</text>
					<text x="1.4%" y="4.2%" fill="var(--theme-body-background)" font-family="var(--theme-sub-heading-font)" font-size="190%" font-weight="700">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>					
				</xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="$hasMultipleAgents">
					<defs>
						<clipPath id="circleClip1">
							<circle cx="19%" cy="3.5%" r="3.5%" />
						</clipPath>
						<clipPath id="circleClip2">
							<circle cx="28.5%" cy="3.5%" r="3.5%" />
						</clipPath>
					</defs>

					<g>
						<!-- background circle behind image 1 -->
						<circle cx="19%" cy="3.5%" r="3.5%" fill="#69657a" />

						<!-- Circular image 1 -->
						<image x="12%" y="0.5%" width="14.5%" height="6.5%" clip-path="url(#circleClip1)">
							<xsl:attribute name="href">
								<xsl:value-of select="//agent[1]/photo" />
							</xsl:attribute>
						</image>

						<!-- background circle behind image 2 -->
						<circle cx="28.5%" cy="3.5%" r="3.5%" fill="#69657a" />

						<!-- Circular image 2 -->
						<image x="21.5%" y="0.5%" width="14.5%" height="6.5%" clip-path="url(#circleClip2)">
							<xsl:attribute name="href">
								<xsl:value-of select="//agent[2]/photo" />
							</xsl:attribute>
						</image>
					</g>					
				</xsl:when>
				<xsl:otherwise>
					<g>
						<image x="15%" y="0.85%" width="22%" height="7.8%">
							<xsl:attribute name="href">
								<xsl:value-of select="//agent[1]/photo" />
							</xsl:attribute>
						</image>
					</g>
				</xsl:otherwise>
			</xsl:choose>

			<text x="98%" y="0.6%" class="align-right right" font-family="var(--theme-sub-heading-font)" font-size="125%" font-weight="100"  fill="var(--theme-body-background)">
				<tspan x="98%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</tspan>
				<tspan x="98%" dy="1.55%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="98%" y="3.7%" class="align-right right" font-family="var(--theme-sub-heading-font)" font-size="125%" font-weight="100" fill="var(--theme-body-background)">
				<tspan>
					<xsl:value-of select="//agent[1]/address/street" />
				</tspan>
				<tspan x="98%" dy="1.2%">
					<xsl:value-of select="//agent[1]/address/city" />

					<xsl:text>, </xsl:text>
					<xsl:value-of select="//agent[1]/address/state" />

					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="//agent[1]/address/zip" />
				</tspan>
			</text>
	
			<text x="98%" y="6.5%" class="align-right right" font-size="70%" font-family="var(--theme-sub-heading-font)" font-weight="100"  fill="var(--theme-body-background)">
				<xsl:value-of select="//agent[1]/marketingLicense" />
			</text>

			<text x="51.5%" y="0.6%" class="center" font-family="var(--theme-sub-heading-font)" font-size="130%" font-weight="300" fill="var(--theme-body-background)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'presented'" />
					<xsl:with-param name="default" select="'Presented by:'" />
				</xsl:call-template>
			</text>

			<xsl:choose>
				<xsl:when test="$companyLogo='' or $personalLogo=''">
					<image x="36%" y="2%" width="27%" height="6%" id="logo" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="$personalLogo = ''">
									<xsl:choose>
										<xsl:when test="//output/@themeHue = 'dark'">
											<xsl:value-of select="$companyLogo" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$companyLogoInverse" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="//output/@themeHue = 'dark'">
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
					<image x="36%" y="2%" width="27%" height="6%" class="center" preserveAspectRatio="xMinYMid meet">
						<xsl:choose>
							<xsl:when test="//output/@themeHue='dark'">
								<xsl:attribute name="href">
									<xsl:value-of select="$personalLogo" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="href">
									<xsl:value-of select="$personalLogoInverse" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						
					</image>
					<image x="68%" y="4%" width="6%" height="2.8%" class="center" preserveAspectRatio="xMidYMid meet">
						<xsl:choose>
							<xsl:when test="//output/@themeHue='dark'">
								<xsl:attribute name="href">
									<xsl:value-of select="$companyLogo" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="href">
									<xsl:value-of select="$companyLogoInverse" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</image>
				</xsl:otherwise>
			</xsl:choose>
		</g>
	</xsl:template>
</xsl:stylesheet>