<?xml version="1.0"?>
<!--
	Asset Name: LC-PROP-POST-05-TSE
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Open House, Listing
	Approved: 	False
	Roles:		vip
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'text { dominant-baseline: middle;}'" />

		</style>

		<rect xmlns="" x="0%" y="0%" width="100%" height="100%" fill="#fff">
		</rect>
		<rect xmlns="" x="0%" y="0%" width="100%" height="13%" fill="var(--theme-heading-color)">
		</rect>
		<g>
			<text x="50%" y="7%" width="100%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" data-max-width="80%" height="10%" class="upper center" font-size="260%">

				<xsl:choose>
					<xsl:when test="//single/sale-price!=''">
						<tspan class="bold">Sold for  </tspan>
<xsl:value-of select="format-number( //single/sale-price, '$###,###')" />

					</xsl:when>
					<xsl:otherwise>
						<tspan class="bold">Just Listed </tspan>
						<tspan>
<xsl:value-of select="format-number( //single/price , '$###,###')" />

						</tspan>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>
		<rect xmlns="" x="0%" y="13%" width="20%" height="53%" fill="var(--theme-sub-heading-color)">
		</rect>
		<g style="transform-origin: 0; transform: rotate(-90deg) translate(0%, 56.8%);">
			<foreignObject height="10%" width="55%" class=" align-right" x="-20%" y="-2.5%">
				<div style="margin: 0 auto; font-size:120%;font-weight:600; text-overflow: ellipsis; overflow: hidden; width: 100%; white-space: nowrap; color:var(--theme-heading-color);" font-family="var(--theme-body-font)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'streetaddress'" />
						<xsl:with-param name="default" select="$listingAddressLine1" />
					</xsl:call-template>
				</div>
			</foreignObject>
			<text x="35%" y="6%" class=" align-right upper" fill="var(--theme-body-background)" font-family="var(--theme-body-font)" font-size="90%">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebedroomscount'" />
						<xsl:with-param name="default" select="//single/bedrooms/@count" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bed'" />
<xsl:with-param name="default" select="'Bed &#160;  &#124; '" />

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
<xsl:with-param name="default" select="'Bath &#160; &#124; '" />

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

		<image x="20%" y="13%" width="80%" height="53%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<rect xmlns="" x="0%" y="66%" width="100%" height="11%" fill="var(--theme-body-background)" />
		<g style="transform:translate(67%, 68%);">
			<text x="2%" y="4%" class=" upper align-right" fill="var(--theme-heading-color)" font-family="(--theme-body-font)" font-size="150%" style="line-height:125%;" data-max-width="100%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Download this Free Report '" />
					<xsl:with-param name="default" select="'Download this Free Report '" />
				</xsl:call-template>
			</text>
		</g>
<rect xmlns="" x="0%" y="77%" width="100%" height="12%" fill="var(--theme-sub-heading-color)" />


		<!-- logos condition wise -->
		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="15%" y="78%" width="12%" height="8%" id="logo" preserveAspectRatio="xMinYMid meet">

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
				<text x="21.5%" y="87%" fill="var(--theme-heading-color)" class="center" font-size="48%" font-family="var(--theme-sub-heading-font)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentlicencesNumber'" />
						<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
					</xsl:call-template>
				</text>
			</xsl:when>
			<xsl:otherwise>
				<image x="1.8%" y="84%" width="10%" height="4%" class=" " preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogoInverse" />
					</xsl:attribute>
				</image>
				<image x="2%" y="77.5%" width="26%" height="6.5%" class="center" preserveAspectRatio="xMaxYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogoInverse" />
					</xsl:attribute>
				</image>

				<text x="28%" y="85%" fill="var(--theme-heading-color)" class="right" font-size="48%" font-family="var(--theme-sub-heading-font)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentlicencesNumber'" />
						<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
					</xsl:call-template>
				</text>
			</xsl:otherwise>
		</xsl:choose>

		<text x="69%" y="80.8%" font-size="140%" class=" upper align-right" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" data-max-width="30%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentname'" />
				<xsl:with-param name="default" select="concat( //agent[1]/firstName, '&#160;', //agent[1]/lastName )" />
			</xsl:call-template>
		</text>
		<text x="69%" y="85.5%" fill="var(--theme-body-background)" font-family="var(--theme-body-font)" font-size="150%" class=" bold align-right">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentmobile'" />
				<xsl:with-param name="default" select="//agent[1]/mobile" />
			</xsl:call-template>
		</text>
		<image x="72%" y="60.5%" width="28%" height="30%" preserveAspectRatio="xMaxYMax meet">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		<rect xmlns="" x="0%" y="90.5%" width="100%" height="10%" fill="var(--theme-sub-heading-color)" fill-opacity="0.2" />
		<text x="50%" y="95.5%" font-size="125%" fill=" var(--theme-sub-heading-color)" font-family="(--theme-body-font)" class=" upper center bold" data-max-width="90%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areaname'" />
				<xsl:with-param name="default" select="concat('Your ', //area/name, ' specialist' )" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>
