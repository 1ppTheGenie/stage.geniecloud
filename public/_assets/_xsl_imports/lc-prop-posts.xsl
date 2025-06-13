<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="lc-prop-vip-common">
		<xsl:param name="status" select="'true'" />

		<rect fill="var(--theme-sub-heading-color)" stroke-width="0" fill-opacity="1" x="0" y="0" width="100%" height="16.6%" />

		<text class="upper center" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" x="50%" y="1.1%" font-size="406.5%" data-max-width="90%" font-weight="400" style="letter-spacing: 0.4px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="'When you are ready to sell'" />
			</xsl:call-template>
		</text>

		<text class="upper center" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" x="50%" y="8.5%" font-size="344%" data-max-width="90%" font-weight="700" style="letter-spacing: 0.4px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat('Your ', //area/name ,' ', $propertyType ) " />
			</xsl:call-template>
		</text>

		<image x="0" y="16.6%" width="100%" height="54.15%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<xsl:if test="$status = 'true'">
			<rect x="78.2%" y="20.8%" width="22%" height="6%">
				<xsl:attribute name="fill">
					<xsl:value-of select="$listingStatusColor" />
				</xsl:attribute>
			</rect>

			<text class="center upper" x="89.1%" y="21.5%" font-family="var(--theme-body-font)" fill="#fff" font-weight="700" font-size="40">
				<xsl:value-of select="$listingStatusCaption" />
			</text>
		
		</xsl:if>

		<xsl:choose>
			<xsl:when test="//agent[1]/photo">
				<xsl:call-template name="agentAd1-NumberAndLogo">
					<xsl:with-param name="readyX" select="'50%'" />
					<xsl:with-param name="boxWidth" select="'100%'" />
					<xsl:with-param name="agentX" select="'40.9%'" />
					<xsl:with-param name="logoWidth" select="'70%'" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="agentAd1-NumberAndLogo">
					<xsl:with-param name="readyX" select="'50%'" />
					<xsl:with-param name="boxWidth" select="'100%'" />
					<xsl:with-param name="agentX" select="'50%'" />
					<xsl:with-param name="logoWidth" select="'98%'" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>

		<rect fill="var(--theme-sub-heading-color)" stroke-width="0" fill-opacity="1" x="0%" y="91.9%" width="100%" height="10%" />

		<text class="upper center" x="50%" y="92.8%" fill="var(--theme-body-background)" font-weight="600" font-size="250%" data-max-width="80%" font-family="var(--theme-body-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat('Your ', //area/name, ' specialist' )" />
			</xsl:call-template>
		</text>

		<style>
			<xsl:value-of select="'#footer tspan {fill:var(--theme-body-background)!important;}'" />
		</style>

		<g id="agent-contact" style="transform: translateX(-31.5%);">
			<xsl:call-template name="copyright" />
		</g>
	</xsl:template>

	<xsl:template name="agentAd1-NumberAndLogo">
		<xsl:param name="readyX" />
		<xsl:param name="boxWidth" />
		<xsl:param name="agentX" />
		<xsl:param name="logoWidth" />

		<rect fill="var(--theme-body-color)" stroke="var(--theme-body-color)" stroke-width="0" x="0%" y="72.9%" width="100%" height="6.68%">
			<xsl:attribute name="width">
				<xsl:value-of select="$boxWidth" />
			</xsl:attribute>
		</rect>

		<text class="upper center middle" fill="var(--theme-body-background)" y="76%" font-weight="700" font-size="219%" font-family="var(--theme-body-font)">
			<xsl:attribute name="x">
				<xsl:value-of select="$agentX" />
			</xsl:attribute>
			<xsl:attribute name="data-max-width">
				<xsl:value-of select="$logoWidth" />
			</xsl:attribute>

			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat( 'Call ', //agent[1]/firstName ,'   &#124;  ', //agent[1]/mobile ) " />
			</xsl:call-template>
		</text>

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<text font-size="100%" font-family="var(--theme-sub-heading-font)" font-weight="600" fill="var(--theme-heading-color)" x="17.2%" y="81.85%" height="10%" width="31%">Presented By:</text>
				<image x="16.8%" y="84.4%" width="30%" height="7.5%" id="logo" preserveAspectRatio="xMinYMid meet">
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
				<text font-size="100%" font-family="var(--theme-sub-heading-font)" font-weight="600" fill="var(--theme-heading-color)" x="17.2%" y="81.85%" height="10%" width="31%">Presented By:</text>
				<image x="16.8%" y="83.3%" height="8%" width="27.8%" id="logo" preserveAspectRatio="xMinYMid meet">
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
				<image x="46%" y="84%" height="7.1%" width="21%" id="logo" preserveAspectRatio="xMinYMid meet">
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

		<xsl:if test="//agent[1]/photo">
			<image x="67.5%" y="60.8%" width="35%" height="37%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
		</xsl:if>

		<text x="95.6%" y="89.3%" font-size="88.8%" font-weight="700" font-family="var(--theme-sub-heading-font)" fill="var(--theme-heading-color)" data-max-width="95%" class="right align-right">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>