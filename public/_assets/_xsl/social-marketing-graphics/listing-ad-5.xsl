<?xml version="1.0"?>
<!--
	Asset Name:	Listing Ad 05
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<text x="50%" y="3%" class="sub-heading large center bold">
			<xsl:choose>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<xsl:value-of select="'In Escrow'" />
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=2">
					<xsl:value-of select="'Just Sold'" />
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=14">
					<xsl:value-of select="'Coming Soon'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'Just Listed'" />
				</xsl:otherwise>
			</xsl:choose>
		</text>

		<image x="4%" y="12%" width="92%" height="32%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="6" fill-opacity="0" x="4%" y="12%" width="92%" height="32%"/>

		<image x="40%" y="42%" width="52%" height="36%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="6" fill-opacity="0" x="40%" y="42%" width="52%" height="36%"/>

		<image x="9%" y="39%" width="35%" height="30%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-3'" />
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="6" fill-opacity="0" x="9%" y="39%" width="35%" height="30%"/>

		<g style="transform: translate(9%, 64%);">
			<text x="0%" y="7%" style="font-size:90%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singleaddressstreet'" />
						<xsl:with-param name="default" select="//single/address/street" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="0%" y="10%" style="font-size:90%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singleaddresscity'" />
						<xsl:with-param name="default" select="//single/address/city" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:text>, </xsl:text>
				</tspan>
			</text>
			<text x="0%" y="13%" style="font-size:90%;">
				<tspan >
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singleaddressstate'" />
						<xsl:with-param name="default" select="//single/address/state" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:text></xsl:text>
				</tspan>
				<tspan >
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singleaddresszip'" />
						<xsl:with-param name="default" select="//single/address/zip" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>
		<image x="3%" y="83%" width="23%" height="13%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$personalLogo" />
			</xsl:attribute>
		</image>
		<g style="transform: translate(40%, 81%);">
			<text x="0%" y="7%" style="font-size:160%;">

				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="//agent[1]/marketingName" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>
		<g style="transform: translate(40%, 86%);">
			<text x="0%" y="7%" style="font-size:93%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</text>
		</g>

		<image x="73%" y="83%" width="23%" height="13%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>
	</xsl:template>
</xsl:stylesheet>