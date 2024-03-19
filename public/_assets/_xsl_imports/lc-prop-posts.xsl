<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="lc-prop-vip-common">
		<xsl:param name="status" select="'true'" />

		<rect fill="var(--theme-sub-heading-color)" stroke-width="0" fill-opacity="1" x="0" y="0" width="100%" height="18%" />

		<text class="upper center" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" x="50%" y="2.5%" font-size="200%" data-max-width="90%" font-weight="300">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="'When you are ready to sell'" />
			</xsl:call-template>
		</text>

		<text class="upper center" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" x="50%" y="9%" font-size="220%" data-max-width="90%" font-weight="500">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat('Your ', //area/name ,' ', $propertyType ) " />
			</xsl:call-template>
		</text>

		<image x="0" y="18%" width="100%" height="54.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<xsl:if test="$status = 'true'">
			<rect x="80%" y="22%" width="20%" height="5.5%">
				<xsl:attribute name="fill">
					<xsl:value-of select="$listingStatusColor" />
				</xsl:attribute>
			</rect>

			<foreignObject width="125" height="34" x="78%" y="22.1%" class="upper middle center" style="-webkit-box-orient: vertical;">
				<p style="font-weight:700;-webkit-box-orient: vertical;margin:0;color:#ffffff;line-height:160%; font-size:120%;" class="middle center" font-family="var(--theme-heading-font)">
					<xsl:value-of select="$listingStatusCaption" />
				</p>
			</foreignObject>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="//agent[1]/photo">
				<xsl:call-template name="agentAd1-NumberAndLogo">
					<xsl:with-param name="readyX" select="'50%'" />
					<xsl:with-param name="boxWidth" select="'100%'" />
					<xsl:with-param name="agentX" select="'38%'" />
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

		<rect fill="var(--theme-sub-heading-color)" stroke-width="0" fill-opacity="1" x="0%" y="92%" width="100%" height="10%" />

		<text class="upper center" x="50%" y="92.5%" fill="var(--theme-body-background)" font-weight="600" font-size="130%" data-max-width="80%" font-family="var(--theme-body-font)">
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

		<rect stroke="var(--theme-body-color)" stroke-width="0" fill-opacity="1" x="0%" y="73%" width="100%" height="6%">
			<xsl:attribute name="width">
				<xsl:value-of select="$boxWidth" />
			</xsl:attribute>
		</rect>

		<text class="upper center middle" fill="var(--theme-body-background)" y="76%" font-weight="400" font-size="120%" font-family="var(--theme-body-font)">
			<xsl:attribute name="x">
				<xsl:value-of select="$agentX" />
			</xsl:attribute>
			<xsl:attribute name="data-max-width">
				<xsl:value-of select="$logoWidth" />
			</xsl:attribute>

			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat( 'Call ', //agent[1]/firstName ,' &#124; ', //agent[1]/mobile ) " />
			</xsl:call-template>
		</text>

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<text font-size="60%" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" x="38%" y="80.5%" height="10%" width="31%" class="center">Presented By:</text>
				<image x="23%" y="82.5%" width="30%" height="8%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogo" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<text font-size="60%" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" x="20%" y="81.5%" height="10%" width="31%">Presented By:</text>
				<image x="20%" y="82.2%" height="8%" width="26%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
				<image x="46.5%" y="84.5%" height="5%" width="10%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="//agent[1]/photo">
			<image x="72%" y="57%" width="28%" height="37%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
		</xsl:if>

		<text x="98%" y="88.3%" font-size="63%" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)" data-max-width="95%" class="right align-right">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>