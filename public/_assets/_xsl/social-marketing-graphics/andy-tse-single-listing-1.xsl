<?xml version="1.0"?>
<!--
	Asset Name: Andy Tse Single Listing 1
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Open House, Listing
	Approved: 	True
	Roles:		andy-tse
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800" />

		<style>
			<xsl:value-of select="'
			text { dominant-baseline: middle; }
			.open-sans{ font-family: &quot;Open Sans&quot;, sans-serif !important; }
'" />
		</style>

		<rect xmlns="" x="0%" y="0%" width="100%" height="100%" fill="#fff">
		</rect>
		<rect xmlns="" x="0%" y="0%" width="100%" height="13%" fill="#fdb913">
		</rect>
		<g>
			<text x="50%" y="7%" width="100%" fill="#fff" height="10%" class="upper open-sans center" style="font-size:260%;">
				<tspan>
					<xsl:choose>
						<xsl:when test="//single/sale-price!=''">
							<tspan class="bold">Sold for  </tspan>
<xsl:value-of select="format-number( //single/sale-price, '$###,###')" />

						</xsl:when>
						<xsl:otherwise>
							<tspan class="bold">Asking </tspan>
<xsl:value-of select="format-number( //single/price , '$###,###')" />

						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>
		</g>
		<rect xmlns="" x="0%" y="13%" width="20%" height="53%" fill="#2c3740">
		</rect>
		<g style="transform-origin: 0; transform: rotate(-90deg) translate(0%, 56.8%);">
			<foreignObject height="10%" width="55%" class="open-sans align-right" fill="#fdb913" style="font-size:120%;font-weight:600;color:#fdb913;text-align:left;" x="-20%" y="-2.5%">
				<div style="margin: 0 auto;text-align: right;text-overflow: ellipsis;overflow: hidden;width: 100%;white-space: nowrap;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'streetaddress'" />
						<xsl:with-param name="default" select="$listingAddressLine1" />
					</xsl:call-template>
				</div>
			</foreignObject>
			<text x="35%" y="6%" class="open-sans align-right upper" fill="#fff" style="font-size:90%;">
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

		<image x="20%" y="13%" width="80%" height="53%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(67%, 68%);">
			<text x="2%" y="2%" class="open-sans upper align-right" fill="#fdb913" style="font-size:150%;line-height:125%;" data-max-width="100%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Download this Free Report '" />
					<xsl:with-param name="default" select="'Download this Free Report '" />
				</xsl:call-template>
			</text>
			<text class="open-sans upper bold align-right" x="2%" y="6.5%" fill="#fdb913" style="font-size:130%;line-height:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentname'" />
					<xsl:with-param name="default" select="concat( 'Call ', //agent[1]/firstName )" />
				</xsl:call-template>
			</text>
		</g>
<rect xmlns="" x="0%" y="77%" width="100%" height="12%" fill="#2c3740" />

		<image x="2%" y="78%" width="27%" height="6%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/tgs-logo.png' )" />
			</xsl:attribute>
		</image>
		<image x="2%" y="84.5%" width="8%" height="2.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/intro-logo.png' )" />
			</xsl:attribute>
		</image>
		<text x="22.5%" y="85.5%" fill="#fdb913" class="open-sans" font-size="48%" font-family="var(--theme-sub-heading-font)">
			<tspan class="center">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentlicencesNumber'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="72%" y="80.8%" style="font-size:140%;" class="open-sans upper align-right" fill="#fff" data-max-width="30%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentname'" />
				<xsl:with-param name="default" select="concat( //agent[1]/firstName, '&#160;', //agent[1]/lastName )" />
			</xsl:call-template>
		</text>
		<text x="72%" y="85.5%" fill="#fff" style="font-size:150%;" class="open-sans bold align-right">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentmobile'" />
				<xsl:with-param name="default" select="//agent[1]/mobile" />
			</xsl:call-template>
		</text>
		<image x="72%" y="61%" width="28%" height="30%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/andy-tse.png' )" />
			</xsl:attribute>
		</image>
<rect xmlns="" x="0%" y="90.5%" width="100%" height="10%" fill="#2c3740" stroke="#2c3740" />

		<text x="50%" y="95.5%" style="font-size:110%;" fill="#fff" class="open-sans upper bold center" data-max-width="95%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areaname'" />
				<xsl:with-param name="default" select="concat('Highest Ranked ', //area/name, ' Team' )" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>
