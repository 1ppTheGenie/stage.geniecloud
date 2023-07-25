<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="single-listing-common-01">
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
			}'"/>
		</style>

		<xsl:choose>
			<xsl:when test="number(//single/statusTypeID) = 2">
				<image x="-3%" y="0.7%" width="14%" height="14%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-sold.svg')" />
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID) = 1">
				<image x="-3%" y="0.7%" width="14%" height="14%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-active.svg')" />
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="-3%" y="0.7%" width="14%" height="14%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/sv-pending.svg')" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<text class="large bold" style="transform:translate(8%,2%)" fill="var(--theme-sub-heading-color)">
			<xsl:value-of select="$listingStatusCaption" />
		</text>
		<text x="8%" y="8%" class="medium bold" fill="var(--theme-sub-heading-color)">
			<tspan>in </tspan>
			<tspan>
				<xsl:value-of select="//single/address/city" />
			</tspan>
		</text>

		<image x="1%" y="15%" width="48%" height="81%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(1%,75%)">
			<svg width="33%" height="17.5%">
				<rect width="100%" height="100%" fill="var(--theme-body-background)" fill-opacity="70%"/>
				<use href="#phone-icon" x="18.6%" y="16%" width="10%" height="10%" fill="var(--theme-sub-heading-color)" style="transform: rotate(95deg) translate(-15.4%, -144.5%);"/>
				<use x="28%" y="50%" fill="var(--theme-sub-heading-color)" width="10%" height="10%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
				</use>
				<use x="28%" y="65%" fill="var(--theme-sub-heading-color)" width="10%" height="10%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
				</use>

				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
					<circle r=".3500" cx=".5" cy=".35"/>
				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="-2%" y="0.2%" width="35%" height="120%" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>

				<text x="31.5%" y="7%" font-size="145%" fill="var(--theme-body-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'') " />
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

		<g style="transform:translate(51%,3%);">
			<xsl:call-template name="listing-address-two-line" />

			<text x="0" y="12%" class="bold" style="font-size:110%;">
				<tspan>
					<xsl:call-template name="soldListedPrice"/>
				</tspan>
			</text>

			<g style="transform:translate(0,20%)">
				<g class="icon-stat" style="transform:translateX(0)">
					<rect stroke="var(--theme-sub-heading-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="12%" height="15%" />
					<use fill="var(--theme-sub-heading-color)" x="1%" y="5%" width="3%" height="5%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text x="0" y="20%" class="bold align-center" fill="var(--theme-sub-heading-color)">
						<tspan x="8%" y="3%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlebedroomscount'" />
								<xsl:with-param name="default" select="//single/bedrooms/@count" />
							</xsl:call-template>
						</tspan>
						<tspan x="8%" y="8%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'beds'" />
								<xsl:with-param name="default" select="'Beds'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>

				<g class="icon-stat" style="transform:translateX(12%)">
					<rect stroke="var(--theme-sub-heading-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="12%" height="15%" />
					<use fill="var(--theme-sub-heading-color)" x="1%" y="5%" width="3%" height="5%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text x="0" y="20%" class="bold align-center" fill="var(--theme-sub-heading-color)">
						<tspan x="8%" y="3%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlebathrooms'" />
								<xsl:with-param name="default" select="$listingTotalBathrooms" />
							</xsl:call-template>
						</tspan>
						<tspan x="8%" y="8%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'baths'" />
								<xsl:with-param name="default" select="'Baths'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>

				<g class="icon-stat" style="transform:translateX(24%)">
					<rect stroke="var(--theme-sub-heading-color)" stroke-width="1" fill-opacity="0" x="0" y="0" width="19%" height="15%" />
					<use fill="var(--theme-sub-heading-color)" x="1%" y="5%" width="3%" height="5%">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#size-icon' )" />
					</use>
					<text x="0" y="20%" class="bold align-center" fill="var(--theme-sub-heading-color)">
						<tspan x="8%" y="3%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricesinglesquareFeet'" />
								<xsl:with-param name="default" select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
							</xsl:call-template>
						</tspan>
						<tspan dx="1%" y="3%" style="font-size:125%;">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricepersqft'" />
								<xsl:with-param name="default" select="'Sq.Ft.'" />
							</xsl:call-template>
						</tspan>
						<tspan dx="-2%" y="8%" class="align-right">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'priceper'" />
								<xsl:with-param name="default" select="'Price per'" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
			</g>

			<text x="0" y="38%">
				<tspan class="bold" fill="var(--theme-sub-heading-color)">Type:  </tspan>
				<tspan class="narrow" fill="var(--theme-sub-heading-color)">
					<xsl:value-of select="//single/type"/>
				</tspan>
			</text>

			<foreignObject y="39.5%" width="48%" height="40%">
				<p style="color:var(--theme-body-color);-webkit-line-clamp:10;line-height:150%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singledescription'" />
						<xsl:with-param name="default" select="//single/description" />
					</xsl:call-template>
				</p>
			</foreignObject>
			<text y="90%" style="font-size:80%" fill="var(--theme-sub-heading-color)">
				<xsl:value-of select="//agent[1]/marketingLicense" />
			</text>
		</g>
	</xsl:template>
</xsl:stylesheet>