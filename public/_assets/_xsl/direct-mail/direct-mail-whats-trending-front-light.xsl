<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending Front Light
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area, QRCode
	Approved: 	True
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<image x="0" y="0%" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
<rect x="0%" y="0%" width="100%" height="100%" fill-opacity="0.8" fill="var(--theme-body-background)" />


		<use x="-8%" y="0" width="30%" height="30%" fill="var(--theme-sub-heading-color)">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#rectangle-icon' )" />
		</use>
		<text class="center upper" fill="var(--theme-body-background)" style="font-weight: 500;font-size: 150%;letter-spacing: 2px;transform: rotate(-48deg) translate(18.5%, 30.5%);transform-origin: 0;">
			<xsl:choose>
				<xsl:when test="number(//single/statusTypeID) = 2">
					<xsl:text>Sold</xsl:text>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID) = 1">
					<xsl:text> Active </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> Pending </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</text>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<text x="50%" y="6%" class="center" style="font-weight:600;font-size:150%;">
<xsl:call-template name="listing-address-line-one" />

			<xsl:text>, </xsl:text>
<xsl:call-template name="listing-address-line-two" />

		</text>

		<g style="transform: translate(50%, 12.5%);">
			<text class="center" style="font-size:120%">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebedroomscount'" />
						<xsl:with-param name="default" select="//single/bedrooms/@count" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'beds'" />
						<xsl:with-param name="default" select="'Beds, '" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebathrooms'" />
						<xsl:with-param name="default" select="$listingTotalBathrooms" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'baths'" />
						<xsl:with-param name="default" select="'Baths, '" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlesquareFeet'" />
						<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'SqFt'" />
<xsl:with-param name="default" select="'Sq.Ft. &#124; '" />

					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:call-template name="soldListedPrice" />
				</tspan>
			</text>
		</g>

<rect x="14.5%" y="23%" width="24%" height="26.5%" fill="#fff" />

		<image x="15.2%" y="24.1%" width="22.5%" height="24%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

<rect x="14.5%" y="51.2%" width="24%" height="26.5%" fill="#fff" />

		<image x="15.2%" y="52.3%" width="22.5%" height="24%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>

<rect x="61.5%" y="23%" width="24%" height="26.5%" fill="#fff" />

		<image x="62.2%" y="24.1%" width="22.5%" height="24%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>

<rect x="61.5%" y="51.2%" width="24%" height="26.5%" fill="#fff" />

		<image x="62.2%" y="52.3%" width="22.5%" height="24%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="5" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(31%, 23%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'38%'" />
				<xsl:with-param name="height" select="'38.1%'" />
			</xsl:call-template>
		</g>

		<g style="transform: translate(49%, 63.2%);">
			<use x="0" y="0" width="16%" height="16%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/qr.svg#qr-code' )" />
			</use>
			<text x="1.2%" y="7.5%" fill="var(--theme-body-color)" style="font-size:50%">
				<tspan x="3.5%">Scan the</tspan>
				<tspan x="3.5%" dy="1.2%">QR Code</tspan>
				<tspan x="3.5%" dy="1.2%">with your</tspan>
				<tspan x="3.5%" dy="1.2%">camera</tspan>
			</text>
		</g>
		<image x="39.5%" y="63.2%" width="11%" height="16%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<text x="50%" y="83%" class="center" style="font-size:140%">
		Presented by
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'')" />
				</xsl:call-template>
			</tspan>
		</text>

		<foreignObject x="0" y="88.2%" width="100%" height="8%" class="center">
			<span class="banner" style="background-color:var(--theme-sub-heading-color);color:var(--theme-body-background);font-size: 100%;padding: 0.5% 5%;">
				<use >
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#rectangle-icon' )" />
				</use>
			</span>

			<xsl:choose>
				<xsl:when test="website!=''">
					<xsl:value-of select="//agent[1]/website" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//agent[1]/website" />
				</xsl:otherwise>
			</xsl:choose>
		</foreignObject>
	</xsl:template>
</xsl:stylesheet>