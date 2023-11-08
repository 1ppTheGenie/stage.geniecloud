<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing No.3
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			text.listing-address-two-line tspan.heading {
				font-weight: bold!important;
				font-size: 200%!important;
			}
			text.listing-address-two-line tspan:last-child {
				transform: translateY(6%);
				font-size: 150%!important;
			}

			.icon-stat tspan {
				font-weight: var(--theme-bold);
				font-size: 75%;
			}
			.icon-stat tspan:first-child {
				font-size: 125%;
			}'" />
		</style>

		<image x="1%" y="2%" width="31%" height="35%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:call-template name="listing-image">
					<xsl:with-param name="index" select="number(1)" />
					<xsl:with-param name="preferPrimary" select="'true'" />
				</xsl:call-template>
			</xsl:attribute>
		</image>

		<image x="34.5%" y="2%" width="31%" height="35%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:call-template name="listing-image">
					<xsl:with-param name="index" select="number(2)" />
				</xsl:call-template>
			</xsl:attribute>
		</image>

		<image x="68%" y="2%" width="31%" height="35%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:call-template name="listing-image">
					<xsl:with-param name="index" select="number(3)" />
				</xsl:call-template>
			</xsl:attribute>
		</image>

		<g style="transform: translate(0%,4%);">
			<!-- <use x="1%" y="37%" width="7%" height="10%">
				<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="//single/soldDate!=''">
							<xsl:value-of select="'#sold-icon'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'#active-icon'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</use> -->

			<image x="0" y="33%" width="8%" height="18%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg' )" />
				</xsl:attribute>
			</image>

			<g style="transform:translate(8.5%,36%)">
				<text class="sub-heading large bold">
					<tspan class="upper" tabindex="1">Just <xsl:value-of select="$soldListed" />
				</text>

				<text y="7%" class="upper medium">
					<xsl:call-template name="listing-address" />
				</text>
			</g>
		</g>

		<foreignObject x="1%" y="53%" width="62%" height="25%">
			<p style="color:var(--theme-body-color);-webkit-line-clamp:6; text-align: justify;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'singledescription'" />
					<xsl:with-param name="default" select="//single/description" />
				</xsl:call-template>
			</p>
		</foreignObject>

		<g style="transform:translate(1%,79%)">
			<svg width="35%" height="17.5%">
				<use x="17.6%" y="16%" width="10%" height="10%" fill="var(--theme-sub-heading-color)" style="transform: rotate(95deg) translate(-14.3%, -116.5%);">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#phone-icon' )" />
				</use>
				<use x="19%" y="50%" fill="var(--theme-sub-heading-color)" width="10%" height="10%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
				</use>
				<use x="19%" y="65%" fill="var(--theme-sub-heading-color)" width="10%" height="10%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
				</use>
				<image x="0" y="0" width="20%" height="80%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>

				<text x="23%" y="7%" font-size="145%" fill="var(--theme-body-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="//agent[1]/marketingName" />
					</xsl:call-template>
				</text>

				<text x="27%" y="32%" fill="var(--theme-sub-heading-color)" style="font-size:90%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>

				<text x="27%" y="47%" fill="var(--theme-sub-heading-color)" style="font-size:90%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>

				<text x="27%" y="63%" fill="var(--theme-sub-heading-color)" style="font-size:90%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</text>
			</svg>
		</g>

		<g style="transform:translate(67%,42%);">
			<text x="16%" y="0" class="sub-heading medium bold align-center">
				<tspan>
					<xsl:call-template name="soldListedPrice" />
				</tspan>
			</text>

			<text x="16%" y="5%" class="sub-heading align-center">
				<tspan class="bold">Type:  </tspan>
				<tspan class="narrow">
<xsl:value-of select="concat( 'CC ', $singularPropertyType, ' DD')" />

				</tspan>
			</text>

			<g style="transform:translate(0,14%)">
				<g class="icon-stat" style="transform:translateX(0)">
					<rect stroke="var(--theme-emphasis-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10.5%" height="18%" />

					<use x="3.5%" y="3%" width="3%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text class="align-center" style="font-size: 80%;">
						<tspan x="5%" y="8%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlebedroomscount'" />
								<xsl:with-param name="default" select="//single/bedrooms/@count" />
							</xsl:call-template>
						</tspan>
						<tspan x="5%" y="12%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'beds'" />
								<xsl:with-param name="default" select="'Beds'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>

				<g class="icon-stat" style="transform:translateX(11%)">
					<rect stroke="var(--theme-emphasis-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10.5%" height="18%" />

					<use x="3.5%" y="3%" width="3%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text class="align-center" style="font-size: 80%;">
						<tspan x="5%" y="8%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlebathrooms'" />
								<xsl:with-param name="default" select="$listingTotalBathrooms" />
							</xsl:call-template>
						</tspan>
						<tspan x="5%" y="12%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'baths'" />
								<xsl:with-param name="default" select="'Baths'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>

				<g class="icon-stat" style="transform:translateX(22%)">
					<rect stroke="var(--theme-emphasis-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10.5%" height="18%" />

					<use x="3.5%" y="3%" width="3%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-dom-icon' )" />
					</use>
					<text class="align-center" style="font-size: 80%;">
						<tspan x="5%" y="8%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'daysOnMarket'" />
								<xsl:with-param name="default" select="//single/daysOnMarket" />
							</xsl:call-template>
						</tspan>
						<tspan x="5%" y="12%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'daysmarket'" />
								<xsl:with-param name="default" select="'Days on Market'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>

				<g class="icon-stat" style="transform:translate(0,19%)">
					<rect stroke="var(--theme-emphasis-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10.5%" height="18%" />

					<use x="3.5%" y="3%" width="3%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
					</use>
					<text class="align-center" style="font-size: 80%;">
						<tspan x="5%" y="9%" tabindex="3" data-name="square-foot-price" data-default="My default string">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricesinglesquareFeet'" />
								<xsl:with-param name="default" select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
							</xsl:call-template>
						</tspan>
						<tspan x="5%" y="12%" tabindex="3" data-name="sqf-caption-1" data-default=" Price per">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'priceper'" />
								<xsl:with-param name="default" select="'Price per'" />
							</xsl:call-template>
						</tspan>
						<tspan x="5%" y="14%" tabindex="4" data-name="sqf-caption-2" data-default=" Sq.Ft.">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricepersqft'" />
								<xsl:with-param name="default" select="'Sq.Ft.'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>

				<g class="icon-stat" style="transform:translate(11%,19%)">
					<rect stroke="var(--theme-emphasis-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10.5%" height="18%" />

					<use x="3.5%" y="3%" width="3%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
					</use>
					<text class="align-center" tabindex="5">
						<tspan x="5%" y="9%" style="font-size:75%!important;">
							<xsl:choose>
								<xsl:when test="//single/soldDate!=''">
									<xsl:call-template name="editable">
										<xsl:with-param name="id" select="'soldon'" />
										<xsl:with-param name="default" select="'Sold On'" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="editable">
										<xsl:with-param name="id" select="'listedon'" />
										<xsl:with-param name="default" select="'Listed On'" />
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</tspan>
						<tspan x="5%" y="12%" style="font-size:80%!important;">
							<xsl:choose>
								<xsl:when test="//single/soldDate!=''">
									<xsl:call-template name="editable">
										<xsl:with-param name="id" select="'singlesoldDate'" />
										<xsl:with-param name="default" select="//single/soldDate" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="editable">
										<xsl:with-param name="id" select="'singlelisted'" />
										<xsl:with-param name="default" select="//single/listed" />
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</tspan>
					</text>
				</g>

				<g class="icon-stat" style="transform:translate(22%,19%)">
					<rect stroke="var(--theme-emphasis-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10.5%" height="18%" />

					<use x="3.5%" y="3%" width="3%" height="5%" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#size-icon' )" />
					</use>
					<text class="align-center" style="font-size: 80%;">
						<tspan x="5%" y="9%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlesquareFeet'" />
								<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
							</xsl:call-template>
						</tspan>
						<tspan x="5%" y="12%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'sqft'" />
								<xsl:with-param name="default" select="'Sq.Ft.'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>