<?xml version="1.0"?>
<!--
	Asset Name: Single Listing Flyer - No.3
	Tags:		Report, Direct Mail
	Sizes:		Letter
	Supports:	Listing, QRCode
	Pages:		flyers/single-listing-03, flyers/single-rear-01
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
				.h1 { font-size: 150%; }
				foreignObject#description {--description-line-limit:10;}'" />
		</style>

		<image x="1%" y="1%" width="63.7%" height="25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<image x="1%" y="26.6%" width="63.7%" height="25%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>
		<image x="65.5%" y="1%" width="33.5%" height="16.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-3'" />
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>
		<image x="65.5%" y="18.1%" width="33.5%" height="16.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-4'" />
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>
		<image x="65.5%" y="35.2%" width="33.5%" height="16.5%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-5'" />
				<xsl:with-param name="idx" select="5" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(3%,53%)">
			<g style="fill:var(--theme-heading-color);">
				<text x="0" y="0" class="sub-heading bold" style="font-size:270%;">
					<tspan>
						<xsl:value-of select="$listingAddressLine1" />
					</tspan>
					<tspan x="0" y="3%">
						<xsl:value-of select="$listingAddressLine2" />
					</tspan>
				</text>
			</g>

			<foreignObject id="description" y="5%" width="50%" height="19%" style="font-size: 180%;">
				<p>
					<text>
						<xsl:call-template name="listing-description" />
					</text>
				</p>
			</foreignObject>
		</g>

		<g style="transform:translate(60%,53.5%)">
			<text>
				<tspan class="h1 sub-heading bold" style="font-size: 250%;">
					<xsl:choose>
						<xsl:when test="//single/soldDate!=''">
							<tspan class="">Sold For </tspan>
<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />

						</xsl:when>
						<xsl:otherwise>
							<tspan class="">Asking </tspan>
<xsl:value-of select="format-number( //single/price, '$###,###')" />

						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>
			<g style="fill: var(--theme-body-color);transform: translate(-1%,4%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="#000">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<text x="5%" y="1%">
					<tspan style="font-size: 240%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bedroomscount'" />
							<xsl:with-param name="default" select="concat( ' Beds: ', //single/bedrooms/@count)" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
			<g style="fill: var(--theme-body-color);transform: translate(-1%,7.3%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="#000">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<text x="5%" y="1%">
					<tspan style="font-size: 240%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'baths'" />
							<xsl:with-param name="default" select="concat( 'Baths: ', $listingTotalBathrooms)" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
			<g style="fill: var(--theme-body-color);transform: translate(-1%,10.3%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="#000">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<text x="5%" y="1%">
					<tspan style="font-size: 240%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'squareFeet'" />
							<xsl:with-param name="default" select="concat( 'Sq. Ft.: ', //single/squareFeet)" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
			<g style="fill: var(--theme-body-color);transform: translate(-1%,13.3%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="#000">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<text x="5%" y="1%">
					<tspan style="font-size: 240%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'pricepersquareFeet'" />
							<xsl:with-param name="default" select="concat( 'Price Per Sq. Ft.: ', format-number( //single/price div //single/squareFeet, '$###,###' ))" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>

			<g style="fill: var(--theme-body-color);transform: translate(-1%,16.3%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="#000">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<xsl:if test="//single/mlsNumber!=''">
					<text x="5%" y="1%">
						<tspan style="font-size: 240%;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'bedroomscount'" />
								<xsl:with-param name="default" select="concat( ' MLS #: ', //single/mlsNumber)" />
							</xsl:call-template>
						</tspan>
					</text>
				</xsl:if>
			</g>
		</g>
		<g style="transform:translate(0%, 81.5%">
			<svg width="100%" height="100%">
				<image x="0" y="0" width="17%" height="13%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
				<g style="transform: translate(4%, 0px);">
					<use x="16.5%" y="4.5%" style="transform: rotate(95deg) translate(-13.5%, -19.5%);" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#phone-icon' )" />
					</use>
					<use x="16.5%" y="6.2%" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
					</use>
					<use x="16.5%" y="9.3%" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
					</use>

					<text x="16.5%" y="0" class="bold" fill="var(--theme-sub-heading-color)" style="font-size: 250%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;' )" />
						</xsl:call-template>
					</text>

					<text x="20%" y="3%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size: 220%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>

					<text x="20%" y="7.3%" class="bold central" fill="var(--theme-sub-heading-color)" style="font-size: 220%;dominant-baseline: middle;" data-max-width="25%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentwebsite'" />
							<xsl:with-param name="default" select="//agent[1]/website" />
						</xsl:call-template>
					</text>

					<text x="20%" y="10.5%" class="bold central" fill="var(--theme-sub-heading-color)" style="font-size: 220%;dominant-baseline: middle;" data-max-width="16%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingemail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</text>
					<text x="20%" y="12.3%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size: 220%;" data-max-width="20%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
				</g>
			</svg>
			<image x="60%" y="1%" width="35%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>