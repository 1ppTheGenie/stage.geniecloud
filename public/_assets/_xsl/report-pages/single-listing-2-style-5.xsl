<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing No.1
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

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
				font-size: 75%;
			}
			
			.icon-stat tspan:first-child {
				font-size: 125%;
			}
			g#listing-room-details {
			    transform: translate(5%, 59.5%);
			}'" />
		</style>

		<image x="40%" y="2%" width="58%" height="94%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<image x="90%" y="0" width="5.5%" height="12.5%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/active-tag.png' )" />
			</xsl:attribute>
		</image>
		<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" width="98%" height="96%" x="1%" y="1%"/>
		<g style="transform: translate(65%,76%);">
			<svg width="33%" height="17.5%">
				<rect width="100%" height="100%" fill="var(--theme-body-background)" fill-opacity="70%"/>
				<use x="18.6%" y="16%" width="10%" height="10%" fill="var(--theme-sub-heading-color)" style="transform: rotate(95deg) translate(-15.4%, -144.5%);">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#phone-icon' )" />
				</use>
				<use x="28%" y="50%" fill="var(--theme-sub-heading-color)" width="10%" height="10%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
				</use>
				<use x="28%" y="65%" fill="var(--theme-sub-heading-color)" width="10%" height="10%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
				</use>
				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
					<circle r=".3500" cx=".5" cy=".5"/>
				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="-2%" y="-10.5%" width="35%" height="120%" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>
				<text x="31.5%" y="7%" font-size="145%" fill="var(--theme-body-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="//agent[1]/marketingName" />
					</xsl:call-template>
				</text>

				<text x="37%" y="32%" fill="var(--theme-sub-heading-color)" style="font-size:90%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>

				<text x="37%" y="47%" fill="var(--theme-sub-heading-color)" style="font-size:90%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>

				<text x="37%" y="63%" fill="var(--theme-sub-heading-color)" style="font-size:90%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</text>
			</svg>
		</g>

		<g style="transform:translate(1%,2%)">
			<text x="1%" y="0" class="super-large bold" fill="var(--theme-sub-heading-color)">
				<tspan class="upper narrow">Just</tspan>
				<xsl:text>&#160;</xsl:text>
				<tspan class="upper bold">
					<xsl:value-of select="$soldListed"/>
				</tspan>
			</text>
			<text x="1%" y="12%">
				<xsl:value-of select="concat( ' in the ', //single/address/city, ' area' )" />
			</text>

			<text x="1%" y="16%" class="medium bold" fill="var(--theme-sub-heading-color)">
				<xsl:call-template name="listing-address-line-one"/>
			</text>

			<text x="1%" y="21%" class="medium" fill="var(--theme-sub-heading-color)">
				<xsl:call-template name="listing-address-line-two"/>
			</text>

			<text x="1%" y="27%" class="medium upper bold" fill="var(--theme-sub-heading-color)">
				<xsl:call-template name="soldListedPrice" />
			</text>
			<text x="1%" y="32%" fill="var(--theme-sub-heading-color)">
				<tspan>Type:  </tspan>
				<tspan>
					<xsl:value-of select="$singularPropertyType"/>
				</tspan>
			</text>

			<foreignObject x="1%" y="34%" width="35%" height="24%">
				<p style="color:var(--theme-body-color);-webkit-line-clamp:6; text-align: justify;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singledescription'" />
						<xsl:with-param name="default" select="//single/description" />
					</xsl:call-template>
				</p>
			</foreignObject>

			<!-- single listing room details -->
			<g id="listing-room-details">
				<svg viewBox="0 0 100 100" x="-4%">
					<circle cx="-38" cy="5%" r="4.5" fill="var(--theme-sub-heading-color)"></circle>
					<use x="-50.2%" y="2.8%" width="25%" height="4" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text x="-32%" y="3%" style="font-size: 17%;">
						<tspan fill="var(--theme-sub-heading-color)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlebedroomscount'" />
								<xsl:with-param name="default" select="//single/bedrooms/@count" />
							</xsl:call-template>
						</tspan>
						<tspan fill="var(--theme-sub-heading-color)" dx="1%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'beds'" />
								<xsl:with-param name="default" select="'Beds'" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg viewBox="0 0 100 100" x="-4%">
					<circle cx="-38" cy="15%" r="4.5" fill="var(--theme-sub-heading-color)"></circle>
					<use x="-50.2%" y="12.8%" width="25%" height="4" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text x="-32%" y="13%" style="font-size: 17%;">
						<tspan fill="var(--theme-sub-heading-color)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlebathrooms'" />
								<xsl:with-param name="default" select="$listingTotalBathrooms" />
							</xsl:call-template>
						</tspan>
						<tspan fill="var(--theme-sub-heading-color)" dx="1%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'baths'" />
								<xsl:with-param name="default" select="'Baths'" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg viewBox="0 0 100 100" x="-4%">
					<circle cx="-38" cy="25%" r="4.5" fill="var(--theme-sub-heading-color)"></circle>
					<use x="-50.4%" y="22.9%" width="25%" height="4" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-dom-icon' )" />
					</use>
					<text x="-32%" y="24%" style="font-size: 17%;">
						<tspan fill="var(--theme-sub-heading-color)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'daysOnMarket'" />
								<xsl:with-param name="default" select="//single/daysOnMarket" />
							</xsl:call-template>
						</tspan>
						<tspan fill="var(--theme-sub-heading-color)" dx="1%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'daysmarket'" />
								<xsl:with-param name="default" select="'DOM'" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg x="-6%" viewBox="0 0 100 100">
					<circle cx="0" cy="5%" r="4.5" fill="var(--theme-sub-heading-color)"></circle>
					<use x="-12%" y="2.5%" width="25%" height="4" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#size-icon' )" />
					</use>
					<text x="6%" y="3%" style="font-size: 17%;">
						<tspan fill="var(--theme-sub-heading-color)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlesquareFeet'" />
								<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
							</xsl:call-template>
						</tspan>
						<tspan fill="var(--theme-sub-heading-color)" dx="1%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'SqFt'" />
								<xsl:with-param name="default" select="'Sq.Ft.'" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg x="-6%" viewBox="0 0 100 100">
					<circle cx="-0" cy="15%" r="4.5" fill="var(--theme-sub-heading-color)"></circle>
					<use x="-12.2%" y="13.2%" width="25%" height="4" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
					</use>
					<text x="6%" y="12%" style="font-size: 17%;">
						<tspan data-name="square-foot-price" data-default="My default string" fill="var(--theme-sub-heading-color)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricesinglesquareFeet'" />
								<xsl:with-param name="default" select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
							</xsl:call-template>
						</tspan>
						<tspan x="5.5%" y="15%" data-name="sqf-caption-1" data-default=" Price per Sq.Ft." fill="var(--theme-sub-heading-color)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricepersqft'" />
								<xsl:with-param name="default" select="'Price per Sq.Ft'" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg x="-6%" viewBox="0 0 100 100">
					<circle cx="-0" cy="25%" r="4.5" fill="var(--theme-sub-heading-color)"></circle>
					<use x="-12.3%" y="22.7%" width="25%" height="4" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
					</use>
					<text x="6%" y="22%" style="font-size: 17%;">
						<tspan fill="var(--theme-sub-heading-color)">
							<xsl:choose>
								<xsl:when test="//single/soldDate!=''">
									<xsl:call-template name="editable">
										<xsl:with-param name="id" select="'soldon'" />
										<xsl:with-param name="default" select="'Sold On'" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="editable">
										<xsl:with-param name="id" select="'lsitedon'" />
										<xsl:with-param name="default" select="'Listed On'" />
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</tspan>
						<tspan x="5.5%" y="25%" fill="var(--theme-sub-heading-color)">
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
				</svg>
			</g>
			<text class="heading upper" x="23%" y="90%" style="font-size:90%">
				<xsl:value-of select="//agent[1]/marketingLicense" />
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>