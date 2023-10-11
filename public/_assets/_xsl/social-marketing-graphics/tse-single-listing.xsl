<?xml version="1.0"?>
<!--
	Asset Name:	Tse Single Listing
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing
	Roles:		steve-hundley-2
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			g#footer {
			    font-size: 6px;
			    padding-top: 30px; 
			    transform: translate(2.5%, 98.3%);
			}'"/>
		</style>

		<rect xmlns="" x="0%" y="0%" width="100%" height="13%" fill="var(--theme-sub-heading-color)"/>

		<image x="25%" y="13%" width="75%" height="53%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<text class="upper center" x="50%" y="7%" font-size="250%" font-family="var(--theme-heading-font)" fill="#fff" data-max-width="95%">
			<tspan font-weight="700" dominant-baseline="middle">
				<xsl:choose>
					<xsl:when test="number(//single/statusTypeID)=2">
						<xsl:text>Just Sold </xsl:text>
					</xsl:when>
					<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<xsl:text>In Escrow </xsl:text>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=14">
						<xsl:text>Coming Soon </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Just Listed </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</tspan>
			<tspan dominant-baseline="middle">
				<xsl:value-of select="concat(' in ', //area/name)"/>
			</tspan>
		</text>

		<rect xmlns="" x="0%" y="13%" width="25%" height="53%" fill="var(--theme-heading-color)"/>

		<g style="transform-origin: 0; transform: rotate(-90deg) translate(34%, 58%)">
			<text font-size="120%" font-weight="600" class="align-right sub-heading" data-max-height="40%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="$listingAddressLine1" />
				</xsl:call-template>
			</text>

			<text x="0" y="5%" class="align-right upper" font-size="17px" fill="var(--theme-body-background)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebedroomscount'" />
						<xsl:with-param name="default" select="//single/bedrooms/@count" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bed'" />
<xsl:with-param name="default" select="'Bed &#124; '" />

					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebathrooms'" />
						<xsl:with-param name="default" select="$listingTotalBathrooms" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bath'" />
<xsl:with-param name="default" select="'Bath &#124; '" />

					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlesquareFeet'" />
						<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'SF'" />
						<xsl:with-param name="default" select="'SF'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform: translate(0%, 65.5%);">
			<text x="4%" y="7.5%" class="upper" data-max-width="70%" font-size="155%" font-weight="700" fill="var(--theme-sub-heading-color)">
				<tspan style="line-height:20px;" dominant-baseline="middle">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Click Learn'" />
						<xsl:with-param name="default" select="'Click Learn More Below'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<rect xmlns="" x="0%" y="79%" width="100%" height="12%" fill="var(--theme-heading-color)"/>

		<xsl:choose>
			<xsl:when test="$companyLogo!=''">
				<image x="2.5%" y="80.5%" width="32%" height="6%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogoInverse" />
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="2.5%" y="80.5%" width="32%" height="6%" class="center" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogoInverse" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<text x="18.5%" y="87.5%" fill="var(--theme-sub-heading-color)" font-size="43%" font-family="var(--theme-sub-heading-font)">
			<tspan class="center">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentlicencesNumber'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="68%" y="80%" class="upper align-right" font-size="135%" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" data-max-width="45%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentname'" />
				<xsl:with-param name="default" select="concat( //agent[1]/firstName, '&#160;', //agent[1]/lastName )" />
			</xsl:call-template>
		</text>
		<text x="68%" y="85%" font-size="135%" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" class="bold align-right">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentmobile'" />
				<xsl:with-param name="default" select="//agent[1]/mobile" />
			</xsl:call-template>
		</text>

		<image x="70%" y="60%" width="30%" height="31%" preserveAspectRatio="xMidYMax">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<rect xmlns="" x="0%" y="91%" width="100%" height="9%" fill="var(--theme-sub-heading-color)" fill-opacity="0.8"/>
		<text x="50%" y="93.6%" font-size="120%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)" class="upper bold center" data-max-width="65%" dominant-baseline="middle">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areaname '" />
				<xsl:with-param name="default" select="concat( 'Your ' , //area/name, ' specialist' )" />
			</xsl:call-template>
		</text>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>