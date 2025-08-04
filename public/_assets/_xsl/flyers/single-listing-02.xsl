<?xml version="1.0"?>
<!--
	Asset Name: Single Listing Flyer - No.2
	Tags:		Direct Mail, Flyer
	Sizes:		Letter
	Supports:	Listing, QRCode
	Pages:		flyers/single-listing-02,flyers/single-rear-01
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			foreignObject#description p {--description-line-limit:12}
			font-weight-normal{font-weight: 600} g#footer text, g#footer text tspan{fill: #94949D;} 
			'" />
		</style>

		<image x="1%" y="1%" width="98%" height="26%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<image x="1%" y="28%" width="32%" height="21%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>
		<image x="34%" y="28%" width="32%" height="21%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-3'" />
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>
		<image x="67%" y="28%" width="32%" height="21%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-4'" />
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>

		<svg width="100%" height="177" x="0.4%" y="40.1%" fill="var(--theme-body-background)">
			<path d="M1800 220 L1800 220 7 110 7 227 Z"></path>
		</svg>
		<svg height="120" width="100%" x="66.5%" y="44%" fill="var(--theme-body-background)">
			<path d="M475 5 L5 100 L475 100 Z"></path>
		</svg>
		<!-- <image x="66%" y="37%" width="33%" height="17%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="5" />
				</xsl:call-template>
		</image> -->

		<g style="transform:translate(3%,51%)">
			<text x="0" y="0" class="" style="fill: var(--theme-sub-heading-color);">
				<tspan class="bold" style="font-size: 300%;">
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

			<g style="fill: var(--theme-sub-heading-color);">
				<text x="0" y="5%" class="sub-heading bold" style="font-size:270%;">
					<tspan>
						<xsl:value-of select="$listingAddressLine1" />
					</tspan>
					<tspan x="0" y="8%">
						<xsl:value-of select="$listingAddressLine2" />
					</tspan>
				</text>
			</g>

			<foreignObject x="0" y="11%" width="50%" height="15%" style="color:var(--theme-body-color);-webkit-line-clamp:6; font-size: 180%; line-height: 160%;">
				<xsl:call-template name="listing-description" />
			</foreignObject>
		</g>

		<g style="fill: var(--theme-body-color);transform: translate(58%,55%);">
			<text >
				<tspan class="bold sub-heading" style="font-size: 250%;">
					<xsl:value-of select="$singularPropertyType" />
				</tspan>
			</text>

			<g style="fill: var(--theme-body-color);transform: translate(-1%,4.5%);">
				<use x="1%" y="0.5%" width="2%" height="2%" fill="var(--theme-body-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<text class="" x="4%" y="0.5%" style="font-size:180%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bedroomscount'" />
							<xsl:with-param name="default" select="concat( ' Beds: ', //single/bedrooms/@count)" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
			<g style="fill: var(--theme-body-color);transform: translate(-1%,6.5%);">
				<use x="1%" y="0.5%" width="2%" height="2%" fill="var(--theme-body-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<text class="" x="4%" y="0.5%" style="font-size:180%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bedroomscount'" />
							<xsl:with-param name="default" select="concat( ' Baths: ', $listingTotalBathrooms)" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
			<g style="fill: var(--theme-body-color);transform: translate(-1%,8.5%);">
				<use x="1%" y="0.5%" width="2%" height="2%" fill="var(--theme-body-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<text class="" x="4%" y="0.5%" style="font-size:180%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bedroomscount'" />
							<xsl:with-param name="default" select="concat( ' Sq. Ft.: ', format-number( //single/squareFeet, '###,###' ) )" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
			<g style="fill: var(--theme-body-color);transform: translate(-1%,10.5%);">
				<use x="1%" y="0.5%" width="2%" height="2%" fill="var(--theme-body-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<text class="" x="4%" y="0.5%" style="font-size:180%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bedroomscount'" />
							<xsl:with-param name="default" select="concat( '  Price Per Sq. Ft.: ', format-number( //single/price div //single/squareFeet, '$###,###' ))" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>

			<g style="fill: var(--theme-body-color);transform: translate(-1%,12.5%);">
				<use x="1%" y="0.5%" width="2%" height="2%" fill="var(--theme-body-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-right-icon' )" />
				</use>
				<xsl:if test="//single/mlsNumber!=''">
					<text class="" x="4%" y="0.5%" style="font-size:180%;">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'bedroomscount'" />
								<xsl:with-param name="default" select="concat( ' MLS #: ', //single/mlsNumber)" />
							</xsl:call-template>
						</tspan>
					</text>
				</xsl:if>
			</g>
		</g>

		<g style="transform:translate(0%,81.5%)">
			<svg width="100%" height="100%">
				<image x="0" y="0" width="17%" height="13%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
				<g style="transform: translate(4%, 0px);">
					<use x="16.5%" style="transform: rotate(95deg) translate(-13.5%, -19.5%);" y="4.5%" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#phone-icon' )" />
					</use>
					<use x="16.5%" y="6.2%" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
					</use>
					<use x="16.5%" y="8.8%" fill="var(--theme-sub-heading-color)" width="2%" height="2%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
					</use>

					<text x="16.5%" y="0" class="bold" fill="var(--theme-sub-heading-color)" style="font-size: 250%;" data-max-width="20%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;')" />
						</xsl:call-template>
					</text>

					<text x="20%" y="3%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size: 220%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>

					<text x="20%" y="7.1%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size: 220%;dominant-baseline: middle;" data-max-width="25%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentwebsite'" />
							<xsl:with-param name="default" select="//agent[1]/website" />
						</xsl:call-template>
					</text>
					<text x="20%" y="10%" class="bold central" fill="var(--theme-sub-heading-color)" style="font-size: 220%;dominant-baseline: middle;" data-max-width="16%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingemail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</text>
					<text x="20%" y="11.5%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size: 220%;" data-max-width="20%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
				</g>
			</svg>
			<image x="60%" y="1%" width="35%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="//output/@themeHue = 'dark'">
							<xsl:value-of select="$companyLogoInverse" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$companyLogo" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</image>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>