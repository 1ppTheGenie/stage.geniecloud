<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Postage Side - No.8
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House
	Permission:	Direct Mail
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<rect x="0" width="50%" height="75%" fill="var(--theme-sub-heading-color)" />
		<rect x="0" y="84%" width="50%" height="16%" fill="var(--theme-body-color)" />
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<text x="2.5%" y="5%" class="bold upper" fill="var(--theme-body-background)" style="font-size:100%;font-weight:600;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'dm-heading-1'" />
				<xsl:with-param name="default" select="'lorem ipsum dolor sit amet consectetur'" />
			</xsl:call-template>
		</text>
		<text x="2.5%" y="9%" class="bold upper" fill="var(--theme-body-background)" style="font-size:100%; font-weight:800;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'dm-heading-1'" />
				<xsl:with-param name="default" select="'lorem ipsum dolor siam'" />
			</xsl:call-template>
		</text>
		<foreignObject x="2.5%" y="14%" width="45%" height="22%">
			<p style="color: var(--theme-body-background);-webkit-line-clamp: 7;font-weight:600;line-height: 1.4;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanameloremadipiscing'" />
					<xsl:with-param name="default" select="'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.'" />
				</xsl:call-template>
			</p>
		</foreignObject>

		<svg x="2.5%" y="38%" width="21.5%" height="30%" viewBox="0 0 600 200">
			<rect width="100%" height="50%" fill="var(--theme-body-background)" rx="45" ry="100"/>
			<use x="1%" y="15%" width="25%" height="18%" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#house-icon' )" />
			</use>
			<text class="bold medium" dx="25%" dy="15%">
				<xsl:value-of select="concat( //statistics/@soldPropertyTypeCount,' ', lower-case( $propertyType ),' ', ' sold' )" />
			</text>
		</svg>

		<svg x="25%" y="38%" width="21.5%" height="30%" viewBox="0 0 600 200">
			<rect width="100%" height="50%" fill="var(--theme-body-background)" rx="45" ry="100"/>
			<use x="1%" y="15%" width="25%" height="18%" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#map-pin-icon' )" />
			</use>
			<text class="bold medium" dx="25%" dy="15%">
				<xsl:value-of select="concat( //statistics/@activePropertyTypeCount, ' ', lower-case( $propertyType ),' ', ' active' )" />
			</text>
		</svg>

		<svg x="2.5%" y="48%" width="21.5%" height="30%" viewBox="0 0 600 200">
			<rect width="100%" height="50%" fill="var(--theme-body-background)" rx="45" ry="100"/>
			<use x="1%" y="15%" width="25%" height="18%" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#dollar-icon' )" />
			</use>
			<text class="bold medium" dx="25%" dy="12%">
				<tspan>
					<xsl:value-of select="format-number( //statistics/@averageSalePrice, '$###,###')" />
				</tspan>
				<tspan x="25%" y="28%">Average Sales Price</tspan>
			</text>
		</svg>

		<svg x="25%" y="48%" width="21.5%" height="30%" viewBox="0 0 600 200">
			<rect width="100%" height="50%" fill="var(--theme-body-background)" rx="45" ry="100"/>
			<use x="1%" y="15%" width="25%" height="18%" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
			</use>
			<text class="bold medium" dx="25%" dy="15%">
				<xsl:value-of select="concat( format-number( //statistics/@avgPricePerSqFtSold, '$###,###'), ' / SqFt' )" />
			</text>
		</svg>

		<svg x="2.5%" y="58%" width="21.5%" height="30%" viewBox="0 0 600 200">
			<rect width="100%" height="50%" fill="var(--theme-body-background)" rx="45" ry="100"/>
			<use x="1%" y="15%" width="25%" height="18%" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
			</use>
			<text class="bold medium" dx="25%" dy="12%">
				<tspan>
					<xsl:value-of select="concat( //statistics/@averageDaysOnMarket, ' Average Days' )" />
				</tspan>
				<tspan x="25%" y="28%">on Market</tspan>
			</text>
		</svg>
		<svg x="25%" y="58%" width="21.5%" height="30%" viewBox="0 0 600 200">
			<rect width="100%" height="50%" fill="var(--theme-body-background)" rx="45" ry="100"/>
			<use x="1%" y="15%" width="25%" height="18%" fill="var(--theme-sub-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#barchart-icon' )" />
			</use>
			<text class="bold medium" dx="25%" dy="11%">
				<tspan>
					<xsl:value-of select="format-number(//statistics/@turnOver, '#.0%')"/>
				</tspan>
				<tspan x="25%" y="26%">Turn Over Rate</tspan>
			</text>
		</svg>

		<text x="25%" y="76.5%" class="center bold" fill="var(--theme-body-color)" style="font-weight:600; font-size:100%;">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'neighborhoodgenius'" />
					<xsl:with-param name="default" select="'become your neighborhood genius at'" />
				</xsl:call-template>
			</tspan>
			<tspan x="25%" dy="3%" class="center">

				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</tspan>
		</text>

		<use x="9%" y="91%" width="9%" height="4%" fill="var(--theme-body-background)">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#smartphone-icon' )" />
		</use>
		<text x="25%" y="87.5%" class="center bold" fill="var(--theme-body-background)" style="font-weight:600;">
			<tspan class="upper" style="font-size:150%;">call us for more info: </tspan>
			<tspan x="25%" dy="3%" class="center medium" style="font-size:250%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select="//agent[1]/mobile" />
				</xsl:call-template>
			</tspan>
		</text>

		<g style="transform:translateX(50%)">
			<text x="25%" y="5%" class="center">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'information'" />
					<xsl:with-param name="default" select="'This information is presented by:'" />
				</xsl:call-template>
			</text>

			<g style="transform: translate(5%, 0);">
				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
					<circle r=".3500" cx=".5" cy=".35"/>
				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="0%" y="15%" width="14%" height="24%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>

				<g style="transform: translate(2%, 0);">
					<text class="h1" x="11%" y="16%" style="font-size:200%; dominant-baseline: auto;">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentfirstName'" />
								<xsl:with-param name="default" select="//agent[1]/firstName" />
							</xsl:call-template>
						</tspan>
						<tspan>
							<xsl:text>&#160;</xsl:text>
						</tspan>
						<tspan class="bold">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentlastname'" />
								<xsl:with-param name="default" select="//agent[1]/lastName" />
							</xsl:call-template>
						</tspan>
					</text>

					<text x="11%" y="17%" fill="var(--theme-sub-heading-color)" style="font-size:125%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'innovatorrealtor'" />
							<xsl:with-param name="default" select="'Innovator REALTOR'" />
						</xsl:call-template>
					</text>
					<text x="11%" y="21%" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
					<text x="11%" y="24%" fill="var(--theme-sub-heading-color)" style="font-size:170%;font-weight:bold">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile1'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>
					<text x="11%" y="29.5%" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</text>
				</g>
			</g>

			<image x="18%" y="35%" width="14%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>

			<text x="25%" y="48%" class="center" style="font-size:145%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanames'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
			</text>

			<text x="25%" y="52%" class="center" style="font-size:145%;">
				<xsl:call-template name="listing-address-line-one"/>
			</text>

			<text x="25%" y="56.5%" class="center" style="font-size:145%;">
				<xsl:call-template name="listing-address-line-two"/>
			</text>

			<text x="25%" y="69%" class="center" style="font-size:118%;font-weight:600;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="concat( 'become your neighborhood genius at ', //agent[1]/website )" />
				</xsl:call-template>
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>