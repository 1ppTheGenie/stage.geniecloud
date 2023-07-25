<?xml version="1.0"?>
<!--
	Asset Name:	LC OH Story 01 
	Tags:		Agent Ad, LC
	Sizes:		Instagram Story 
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="lc-social-media.xsl"/>

	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>

		<image x="0%" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<!-- Gradient layer start -->
		<xsl:if test="//output/@themeShade='Dark'">
			<image x="0%" y="0%" width="100%" height="50%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/top-gradient-layer.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<xsl:if test="//output/@themeShade='Light'">
			<image x="0%" y="0%" width="100%" height="40%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/toplightlayer-light.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<!-- Gradient layer End -->

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="65%" y="87%" width="30%" height="9%" id="logo" preserveAspectRatio="xMaxYMid meet">
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
				<image x="25%" y="2%" width="33%" height="10.5%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
				<image x="61%" y="2%" width="15%" height="10.5%" preserveAspectRatio="xMaxYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<text x="50%" y="12%" class="upper center" font-family="var(--theme-subtitle-font)" fill="var(--theme-heading-color)" font-weight="700" font-size="475%">
			<tspan x="50%" dy="5%">YOU'RE INVITED</tspan>
			<tspan x="50%" dy="4.3%" style="font-weight:700;">OPEN HOUSE</tspan>
		</text>

		<rect stroke="#fff" stroke-width="0" x="38%" y="28.8%" width="24%" height="0.2%"/>

		<!-- <text class="capitalize center" x="50%" y="36.3%" font-family="var(theme-subtitle-font)" fill="var(theme-heading-color)" font-weight="700" font-size="400%" style="word-spacing:-7px">			
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="'Twilight Taco Night'" />
			</xsl:call-template>			
		</text> -->

		<text class="upper center" x="50%" y="32.2%" font-family="var(--theme-subtitle-font)" fill="var(--theme-heading-color)" font-weight="400" font-size="325%">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="'SATURDAY, 11.5 • 01:00-4:00PM'" />
			</xsl:call-template>
		</text>

		<text class="upper center" x="50%" y="36.6%" font-family="var(--theme-subtitle-font)" fill="var(--theme-heading-color)" font-weight="400" font-size="325%" data-max-width="80%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'address'" />
				<xsl:with-param name="default" select="concat(//single/address/street,' ')" />
			</xsl:call-template>
		</text>
	</xsl:template>

</xsl:stylesheet>