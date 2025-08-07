<?xml version="1.0"?>
<!--
	Asset Name: Single Listing Flyer - No.5
	Tags:		Report, Direct Mail
	Sizes:		Letter
	Supports:	Listing, QRCode
	Pages:		flyers/single-listing-no-qr-05,flyers/single-rear-no-qr-01
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			.h1 {
				font-size: 150%;
			}

			foreignObject#description p {
				--description-line-limit:12;
			}

			font-weight-normal{
				font-weight: 600;
			} 
			g#footer {transform: translate(2.5%, 98.6%);}
			g#footer text, g#footer text tspan{fill: #94949D;}'" />
		</style>

		<g>
			<rect x="0" y="0" width="100%" height="7%" style="fill:var(--theme-body-color);" />

			<text x="3%" y="2.5%" fill="var(--theme-body-background)" style="font-size:230%;" data-max-width="80%">
				<tspan class="bold upper">
					<xsl:value-of select="concat(//agent/address/company, ' ', //area[1]/name )" />
				</tspan>
			</text>
			<image x="88%" y="1%" width="11%" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="//output/@themeHue = 'dark'">
							<xsl:value-of select="$companyLogo" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$companyLogoInverse" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>	
			</image>
		</g>

		<image x="0" y="7%" width="100%" height="38%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(0%,46%)">
			<text x="3%" y="0.5%" class="">
				<tspan class="sub-heading bold upper" style="font-size: 300%;" y="1%">
					<xsl:value-of select="$singularPropertyType" />
				</tspan>
				<tspan x="3%" y="4.5%" class="theme-invert-body" style="font-size: 275%;">
					<xsl:call-template name="soldListedPrice" />
				</tspan>
			</text>
		</g>

		<g style="transform:translate(0%,56.7%)">
			<rect x="0" y="0" width="60%" height="21%" class="sub-heading" />

			<foreignObject x="3%" y="1.7%" width="52.5%" height="17%" style="color:var(--theme-body-background);-webkit-line-clamp:6; line-height: 2.5rem; font-size: 180%;">
				<xsl:call-template name="listing-description" />
			</foreignObject>
		</g>

		<rect x="0" y="77.7%" width="60%" height="22.5%" style="fill:var(--theme-heading-color);" />

		<g style="transform:translate(0%,79.7%)">
			<svg width="100%" height="100%">
				<use x="16.5%" y="4.5%" width="2%" height="2%" fill="var(--theme-body-background)" style="transform: rotate(95deg) translate(-8%, -22.4%);">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#phone-icon' )" />
				</use>
				<use x="20%" y="10.8%" fill="var(--theme-body-background)" width="2%" height="2%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
				</use>
				<use x="20%" y="13.8%" fill="var(--theme-body-background)" width="2%" height="2%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
				</use>
				<text x="3%" y="0.5%" fill="var(--theme-body-background)">
					<tspan class="upper" style="font-size: 270%;font-weight: 600;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="' privateViewing'" />
							<xsl:with-param name="default" select="'Schedule a Private Viewing'" />
						</xsl:call-template>
					</tspan>
				</text>
				<image x="3%" y="5%" width="15%" height="13%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
				<text x="20%" y="4.8%" font-size="250%" fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;' )" />
					</xsl:call-template>
				</text>

				<text x="23.5%" y="8%" fill="var(--theme-body-background)" style="font-size:210%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>

				<text x="23.5%" y="11.6%" fill="var(--theme-body-background)" style="font-size:210%; dominant-baseline: middle;" class="central" data-max-width="25%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</text>

				<text x="23.5%" y="14.1%" fill="var(--theme-body-background)" style="font-size:210%; dominant-baseline: middle;" class="central" data-max-width="25%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>

				<text x="23.5%" y="15.4%" fill="var(--theme-body-background)" style="font-size:210%;" data-max-width="17%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'licenseno'" />
						<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
					</xsl:call-template>
				</text>
			</svg>
		</g>

		<g style="transform:translate(59.9%,45.2%)">
			<rect x="0" y="0" width="40.2%" height="100%" style="fill:var(--theme-body-color);" />

			<g class="upper sub-heading bold" style="font-size: 212%;transform: translate(3%,1.2%);">
				<text x="0" y="0" data-max-width="42%" fill="var(--theme-body-background)">
					<tspan>
						<xsl:value-of select="$listingAddressLine1" />
					</tspan>
					<tspan x="0" y="3%">
						<xsl:value-of select="$listingAddressLine2" />
					</tspan>
				</text>
			</g>

			<g style="transform: translate(1%,6.5%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-navigation' )" />
				</use>
				<text style="font-size:240%" x="5%" y="1%" fill="var(--theme-body-background)">

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<xsl:with-param name="default" select="concat( 'Beds: ', //single/bedrooms/@count)" />
					</xsl:call-template>

				</text>
			</g>
			<g style="transform: translate(1%,9.2%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-navigation' )" />
				</use>
				<text style="font-size:240%" x="5%" y="1%" fill="var(--theme-body-background)">

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<xsl:with-param name="default" select="concat( ' Baths: ', $listingTotalBathrooms)" />
					</xsl:call-template>

				</text>
			</g>
			<g style="transform: translate(1%,11.9%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-navigation' )" />
				</use>
				<text style="font-size:240%" x="5%" y="1%" fill="var(--theme-body-background)">

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<xsl:with-param name="default" select="concat( ' Sq. Ft.: ', format-number( //single/squareFeet, '###,###' ) )" />
					</xsl:call-template>

				</text>
			</g>
			<g style="transform: translate(1%,14.7%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-navigation' )" />
				</use>
				<text style="font-size:240%" x="5%" y="1%" fill="var(--theme-body-background)">

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'bedroomscount'" />
						<xsl:with-param name="default" select="concat( '  Price Per Sq. Ft.: ', format-number( //single/price div //single/squareFeet, '$###,###' ))" />
					</xsl:call-template>

				</text>
			</g>

			<g style="transform: translate(1%,17.4%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-navigation' )" />
				</use>
				<text style="font-size:240%" x="5%" y="1%" fill="var(--theme-body-background)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'daysOnMarket'" />
						<xsl:with-param name="default" select="concat( ' DOM.: ', //single/daysOnMarket)" />
					</xsl:call-template>
				</text>
			</g>

			<g style="transform: translate(1%,20.1%);">
				<use x="1%" y="0.9%" width="2%" height="2%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#flyer-navigation' )" />
				</use>
				<xsl:if test="//single/mlsNumber!=''">
					<text style="font-size:240%" x="5%" y="1%" fill="var(--theme-body-background)">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bedroomscount'" />
							<xsl:with-param name="default" select="concat( ' MLS #: ', //single/mlsNumber)" />
						</xsl:call-template>
					</text>
				</xsl:if>
			</g>

			<g style="transform:translate(3%,24.8%);">
				<text class="upper bold" style="font-size: 250%;fill: var(--theme-body-background);letter-spacing: 4px;">Features</text>
				<foreignObject x="0" y="3%" width="34%" height="25%" style="font-size:100%;">
					<xsl:for-each select="//features/feature">
						<xsl:if test="position() &lt;= 7">
							<p style="line-height:130%; margin:1.4% 0; font-size:170%;">
								<span class="bold" style="color:var(--theme-body-background)">
									<xsl:value-of select="@category" />
								</span>
								<span style="color:var(--theme-body-background)">
									<xsl:text>: </xsl:text>
									<xsl:value-of select="@description" />
								</span>
							</p>
						</xsl:if>
					</xsl:for-each>
				</foreignObject>
			</g>
		</g>

		<g style="fill: var(--theme-body-background);">
			<xsl:call-template name="copyright" />
		</g>
	</xsl:template>
</xsl:stylesheet>