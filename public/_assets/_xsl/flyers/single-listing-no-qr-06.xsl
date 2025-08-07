<?xml version="1.0"?>
<!--
	Asset Name: Single Listing Flyer - No.6
	Tags:		Report, Direct Mail
	Sizes:		Letter
	Supports:	Listing, QRCode
	Pages:		flyers/single-listing-06,flyers/single-rear-no-qr-01
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			.icon-stat tspan { font-weight: 600 }
			g#footer {transform: translate(2.5%, 98.3%);}'" />
		</style>

		<g>
			<g>
				<rect fill="var(--theme-body-color)" width="100%" height="7%" />

				<image x="2%" y="1%" width="10%" height="5%" class="center" preserveAspectRatio="xMinYMid meet">
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

				<image x="85.5%" y="1%" width="12%" height="5%" id="logo" preserveAspectRatio="xMaxYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="//output/@themeHue = 'dark'">
								<xsl:value-of select="$personalLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogoInverse" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</g>

			<image x="0" y="7%" width="100%" height="41%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>

			<g style="transform:translate(2.5%,11%)">
				<filter x="-0.12" y="-0.3" width="1.2" height="1.8" id="solid">
					<feFlood flood-color="var(--theme-sub-heading-color)" />

					<feComposite in="SourceGraphic" operator="xor" />
				</filter>
				<text x="0" y="0" filter="url(#solid)" style="fill:var(--theme-body-background); font-size: 230%;">
					<xsl:call-template name="soldListedPrice" />

				</text>
				<text x="0" y="0" fill="#fff" style="fill:var(--theme-body-background); font-size: 230%;">
					<xsl:call-template name="soldListedPrice" />
				</text>
			</g>

			<g style="transform:translate(0%,49%)">
				<rect fill="var(--theme-sub-heading-color)" width="100%" height="9%" />

				<text x="2%" y="1.5%" class="upper" fill="var(--theme-body-background)" style="font-size:250%;">
					<xsl:call-template name="listing-address-line-one" />

				</text>
				<text x="2%" y="4.5%" class="upper" fill="var(--theme-body-background)" style="font-size:250%;">
					<xsl:call-template name="listing-address-line-two" />

				</text>
				<text x="50%" y="3%" fill="var(--theme-body-background)" style="font-size:310%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singletype'" />
							<xsl:with-param name="default" select="$propertyType" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>

			<foreignObject x="2%" y="61%" width="44%" height="21%" style="color:var(--theme-body-color);-webkit-line-clamp:6; line-height: 2.5rem; font-size: 180%;">
				<xsl:call-template name="listing-description" />
			</foreignObject>

			<g style="transform:translate(50%,58%)">
				<g class="icon-stat" style="transform:translatey(2%)">
					<use x="0" y="0" width="4%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text style="font-size: 180%">
						<tspan x="5%" y="1.3%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'bedroomscount'" />
								<xsl:with-param name="default" select="concat( 'Beds: ', //single/bedrooms/@count)" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
				<g class="icon-stat" style="transform:translatey(6.5%)">
					<use x="0" y="0" width="4%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text style="font-size: 180%">
						<tspan x="5%" y="1.3%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'baths'" />
								<xsl:with-param name="default" select="concat( 'Baths: ', $listingTotalBathrooms)" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
				<g class="icon-stat" style="transform:translatey(11.5%)">
					<use x="0" y="0" width="4%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#size-icon' )" />
					</use>
					<text style="font-size: 180%;">
						<tspan x="5%" y="1.3%" style="font-weight: 600">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'squareFeet'" />
								<xsl:with-param name="default" select="concat( 'Sq. Ft.: ', //single/squareFeet)" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
				<g class="icon-stat" style="transform:translatey(16.5%)">
					<use x="0" y="0" width="4%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
					</use>
					<text style="font-size: 180%;">
						<tspan x="5%" y="1.3%" tabindex="3" data-name="sqf-caption-1" data-default=" Price per" style="font-weight: 600">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricepersquareFeet'" />
								<xsl:with-param name="default" select="concat( 'Price Per Sq. Ft.: ', format-number((//single/price div //single/squareFeet)  , '###,###'))" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
				<g style="transform:translatey(21.5%)">
					<xsl:if test="//single/mlsNumber!=''">
						<text x="50%" y="0" fill="var(var(--theme-sub-heading-color)" style="font-size:180%; font-weight:600;">
							<tspan x="5%" y="0" style="font-size:125%">
									MLS #: <xsl:value-of select="//single/mlsNumber" />
							</tspan>
						</text>
					</xsl:if>
				</g>
			</g>

			<g style="transform: translate(0%, 88%);">
				<rect x="0" y="0" width="100%" height="12%" style="fill:var(--theme-sub-heading-color);" />

				<image x="16%" y="1%" width="12%" height="9%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
				<text x="30%" y="2%" fill="var(--theme-body-background)" style="font-size: 180%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;')" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="30%" y="4.5%" fill="var(--theme-body-background)" style="font-size: 180%;" data-max-width="60%">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</tspan>
					<tspan> &#124; </tspan>
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</tspan>
					<tspan> &#124; </tspan>
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentwebsite'" />
							<xsl:with-param name="default" select="//agent[1]/website" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="30%" y="7%" fill="var(--theme-body-background)" style="font-size: 180%;">
					<tspan>

						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>