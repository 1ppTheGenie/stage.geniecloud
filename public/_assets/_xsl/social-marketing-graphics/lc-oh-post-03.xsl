<?xml version="1.0"?>
<!--
	Asset Name:	LC-OH-POST-03
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Open House, Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="oh-social-media.xsl"/>

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
			<image x="0%" y="0%" width="100%" height="50%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/toplightlayer-light.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<!-- Gradient layer End -->

		<!-- Gradient layer start -->
		<xsl:if test="//output/@themeShade='Dark'">
			<image x="0%" y="70%" width="100%" height="30%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<!-- <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottomlightlayer-dark.png' )" /> -->
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/black-gradient-bottom.png' )" />
				</xsl:attribute>
			</image>
		</xsl:if>
		<xsl:if test="//output/@themeShade='Light'">
			<image x="0%" y="60%" width="100%" height="40%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/bottomlightlayer-light.png' )" />
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
				<image x="29%" y="4%" width="28%" height="10.5%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
				<image x="59%" y="4%" width="12%" height="10.5%" preserveAspectRatio="xMaxYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<text x="50%" y="11%" class="upper center" fill="var(--theme-heading-color)">
			<tspan x="50%" dy="7%" font-family="var(--theme-heading-font)" font-weight="700" font-size="270%">YOU'RE INVITED</tspan>
			<tspan x="50%" dy="9%" font-family="var(--theme-heading-font)" font-weight="700" font-size="270%">OPEN HOUSE</tspan>
		</text>
		<text x="3.8%" y="84%" font-family="var(--theme-heading-font)" font-size="190%" font-weight="700" style="letter-spacing:1px">
			 Open 1-4pm
		</text>
		<text x="3.8%" y="91%" font-family="var(--theme-heading-font)" font-size="105%" font-weight="600" data-max-width="80%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'address'" />
				<xsl:with-param name="default" select="concat(//single/address/street,', ',//area/name)" />
			</xsl:call-template>
		</text>

		<svg x="60%" y="63%">
			<polygon points="222,52 222,250 35,260" fill="var(--theme-heading-color)" />
		</svg>

		<!-- <svg xmlns="" height="100" width="100" x="78%" y="79%">
			<circle cx="50" cy="50" r="42" stroke="gray" stroke-width="3" fill="#fff"></circle>
		</svg> 
		<image x="79%" y="72%" width="17%" height="31%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
			<xsl:attribute name="href">
<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
       -->
		<svg xmlns="" x="77%" y="78.5%" width="180" height="180">
			<circle cx="57" cy="48" r="47" stroke="#fff" stroke-width="3" fill="#f1f3f4"></circle>
		</svg>

		<g style="transform: translateY(0);">
			<clipPath id="clipCircle">
				<circle r="7.8%" cx="87%" cy="87%"></circle>
			</clipPath>
			<image x="79%" y="74%" width="17%" height="31%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
		</g>
	</xsl:template>
</xsl:stylesheet>