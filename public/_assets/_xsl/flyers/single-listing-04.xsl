<?xml version="1.0"?>
<!--
	Asset Name: Single Listing Flyer - No.4
	Tags:		Report, Direct Mail
	Sizes:		Letter
	Supports:	Listing
	Pages:		flyers/single-listing-04,flyers/single-rear-01
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'.icon-stat tspan {font-weight: 600;}'" />
		</style>

		<g>
			<g>
				<rect fill="var(--theme-body-color)" width="100%" height="9%" />

				<image x="43%" y="0" class="center" width="16%" height="8.7%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</g>

			<g style="transform:translate(50%,9%)">
				<text x="3%" y="0.5%" class="center">
					<tspan class="sub-heading bold upper" style="font-size:500%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singletype'" />
							<xsl:with-param name="default" select="$propertyType" />

						</xsl:call-template>
					</tspan>
				</text>
			</g>
			<g style="transform:translate(0%,21%)">
				<rect fill="var(--theme-body-color)" width="100%" height="5%" />

				<g class="icon-stat" style="transform:translate(16%, -0.2%)">
					<use x="0.5%" y="1.4%" width="2%" height="3%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
					</use>
					<text class="medium">
						<tspan x="4%" y="1.9%" style=" fill:var(--theme-body-background); font-weight: 200;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'listedat'" />
								<xsl:with-param name="default" select="' Listed at $1,399,000'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
				<g class="icon-stat" style="transform:translate(44%, -0.2%)">
					<use x="0" y="1%" width="3%" height="4%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text class="medium">
						<tspan x="4%" y="1.9%" style=" fill:var(--theme-body-background); font-weight: 200;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'bedroomscount'" />
								<xsl:with-param name="default" select="concat( //single/bedrooms/@count, '&#160; Bedrooms ')" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
				<g class="icon-stat" style="transform:translate(68%, -0.2%)">
					<use x="0" y="1%" width="3%" height="3%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text class="medium">
						<tspan x="4%" y="1.9%" style=" fill:var(--theme-body-background);  font-weight: 200;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'bathroomscount'" />
								<xsl:with-param name="default" select="concat( $listingTotalBathrooms, '&#160; Bathrooms ')" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
			</g>
			<g style="fill: var(--theme-body-color);transform: translate(35.4%, 9.5%);">

				<text x="0" y="5%" class="sub-heading bold" style="font-size:270%;">
					<tspan x="2.5%" y="5.3%">
						<xsl:value-of select="//single/address/street" />
					</tspan>
					<tspan x="0" y="8%">
						<xsl:value-of select="//single/address/city" />
						<xsl:text>, </xsl:text>
						<xsl:value-of select="//single/address/state" />
						<xsl:text>&#32;</xsl:text>
						<xsl:value-of select="//single/address/zip" />
					</tspan>
				</text>
			</g>

			<image x="0" y="26%" width="100%" height="28%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>

			<g style="fill: var(--theme-sub-heading-color); transform:translate(68%,55%)">
				<text x="3%" y="0.5%" style="fill: var(--theme-sub-heading-color);">
					<tspan class="upper bold" style="font-size:250%;">Key facts</tspan>
				</text>

				<rect x="3%" y="4%" stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="1" width="25%" height="2" fill="var(--theme-body-background)" />


				<g style="fill: var(--theme-body-color);transform: translate(3%,1%);">

					<g style="fill: var(--theme-body-color);transform: translate(-1%,4.5%);">
						<use x="1%" y="0.5%" width="2%" height="2%" fill="#000">
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
					<g style="fill: var(--theme-body-color);transform: translate(-1%,6.7%);">
						<use x="1%" y="0.5%" width="2%" height="2%" fill="#000">
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
					<g style="fill: var(--theme-body-color);transform: translate(-1%,8.7%);">
						<use x="1%" y="0.5%" width="2%" height="2%" fill="#000">
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
					<g style="fill: var(--theme-body-color);transform: translate(-1%,10.9%);">
						<use x="1%" y="0.5%" width="2%" height="2%" fill="#000">
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

					<g style="fill: var(--theme-body-color);transform: translate(-1%,13.1%);">
						<use x="1%" y="0.5%" width="2%" height="2%" fill="#000">
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
			</g>

			<text x="3%" y="55.5%" style="fill: var(--theme-sub-heading-color);">
				<tspan class="upper bold" style="font-size:250%;">The property</tspan>
			</text>

			<rect x="3%" y="59%" stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="1" width="25%" height="2" fill="var(--theme-body-background)" />


			<foreignObject x="3%" y="61%" width="28%" height="25%" style="color:var(--theme-body-color);-webkit-line-clamp:6; line-height: 2.5rem; font-size: 180%;">
				<xsl:call-template name="listing-description" />

			</foreignObject>

			<image x="33.33%" y="54%" width="33.33%" height="17.5%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-2'" />
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>
			<image x="33.33%" y="71.5%" width="33.33%" height="17.5%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-3'" />
					<xsl:with-param name="idx" select="3" />
				</xsl:call-template>
			</image>

			<g style="transform: translate(0%, 89%);">
				<rect x="0" y="0" width="100%" height="11%" fill="var(--theme-sub-heading-color)" />

				<image x="16%" y="1%" width="12%" height="9%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
				<text x="30%" y="2.5%" fill="var(--theme-body-background)" style="font-size: 180%;">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;' )" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="30%" y="4.6%" fill="var(--theme-body-background)" style="font-size: 180%;" data-max-width="40%">
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
				</text>
				<text x="30%" y="6.5%" fill="var(--theme-body-background)" style="font-size: 180%;" data-max-width="35%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>
				<text x="30%" y="8.5%" fill="var(--theme-body-background)" style="font-size: 180%;">
					<tspan >
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</tspan>
				</text>
				<image x="74%" y="2%" width="11%" height="8%" preserveAspectRatio="xMaxYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>