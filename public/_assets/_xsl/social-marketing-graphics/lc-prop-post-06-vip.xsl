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
		<xsl:call-template name="lc-prop-vip-common" />
	</xsl:template>

	<xsl:template name="agentAd1-NumberAndLogo">
<xsl:param name="readyX" />
<xsl:param name="ready2X" />
<xsl:param name="boxWidth" />
<xsl:param name="agentX" />
<xsl:param name="logoWidth" />


		<rect fill-opacity="0.1" x="0%" y="73%" width="100%" height="6%" fill="var(--theme-body-color)">
			<xsl:attribute name="width">
				<xsl:value-of select="$boxWidth" />
			</xsl:attribute>
		</rect>

		<text class="upper center middle" fill="var(--theme-body-color)" y="76%" font-weight="700" font-size="130%" font-family="var(--theme-body-font)">
			<xsl:attribute name="x">
				<xsl:value-of select="$agentX" />
			</xsl:attribute>
			<xsl:attribute name="data-max-width">
				<xsl:value-of select="$logoWidth" />
			</xsl:attribute>

			<xsl:call-template name="editable">
<xsl:with-param name="default" select="concat( 'Call ', //agent[1]/marketingName ,' &#124; ', //agent[1]/mobile )" />

			</xsl:call-template>
		</text>

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="3%" y="79.5%" width="50%" height="11%" preserveAspectRatio="xMinYMid meet">
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
				<!-- <text font-size="60%" font-family="var(theme-heading-font)" fill="var(theme-heading-color)" x="20%" y="81.5%" height="10%" width="31%">Presented By:</text> -->
				<image x="3%" y="79.8%" height="10%" width="40%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
				<image x="45%" y="85%" height="5%" width="10%" preserveAspectRatio="xMinYMax meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<image x="70%" y="64%" width="30%" height="30%" preserveAspectRatio="xMaxYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<text x="3%" y="90.3%" font-size="40%" font-family="var(--theme-sub-heading-font)" fill="var(--theme-sub-heading-color)" data-max-width="90%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>