<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing 2 Style 2
	Tags:		Report Pages
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<style>
			<xsl:value-of select="'
			svg#agent {
				transform: translate(3%, 68.5%);
			}
			g#agent {
				transform:translate( 3%, 68.5% );
			}
			g#details {
				transform:translate( 59%, 18% );
			}
			text.listing-address-two-line tspan.h1{
				fill: var(--theme-body-background)!important;
				font-size: 150%!important;
				font-weight: bold!important;
			}

			text.listing-address-two-line tspan:last-child {
				transform: translateY(2%);
			}'" />
		</style>

		<rect x="1%" y="1%" width="98%" height="95%" fill="#0000" stroke-width="2" stroke="var(--theme-emphasis-color)" />
		<image x="2%" y="3%" width="55%" height="91%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(2%, 75%)">
			<svg width="33%" height="17.5%" class="heading">
				<rect width="100%" height="100%" fill="var(--theme-body-background)" fill-opacity="70%" />

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
					<circle r=".3500" cx=".5" cy=".35" />

				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="-2%" y="5%" width="35%" height="120%" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>
				<text x="31.5%" y="7%" font-size="145%" fill="var(--theme-body-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( //agent[1]/firstName, '&#160;', //agent[1]/lastName )" />
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

				<text x="37%" y="78%" style="font-size:80%" fill="var(--theme-sub-heading-color)">
					<xsl:value-of select="//agent[1]/marketingLicense" />
				</text>
			</svg>
		</g>

		<text fill="var(--theme-sub-heading-color)" font-weight="bold" font-size="375%" style="text-transform:uppercase;transform:translate(58.5%,5%)">
			<xsl:value-of select="concat('JUST ', $soldListed)" />

		</text>

		<g id="details" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
			<text>
				<tspan>in </tspan>
				<tspan>
					<xsl:value-of select="//single/address/city" />
				</tspan>
			</text>
			<text x="0" y="5.5%" fill="var(--theme-sub-heading-color)">
				<tspan class="bold">Type:  </tspan>
				<tspan class="narrow">
					<xsl:value-of select="$singularPropertyType" />
				</tspan>
			</text>

			<text x="0" y="11.5%" class="bold" fill="var(--theme-sub-heading-color)">
				<tspan class="bold">Beds: </tspan>
				<tspan class="narrow">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebedroomscount'" />
						<xsl:with-param name="default" select="//single/bedrooms/@count" />
					</xsl:call-template>
				</tspan>
				<tspan dx="2%" class="bold">Baths: </tspan>
				<tspan class="narrow">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebathrooms'" />
						<xsl:with-param name="default" select="//single/bathrooms/@full+//single/bathrooms/@half" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="0" y="17%" class="bold" fill="var(--theme-sub-heading-color)">
				<tspan class="bold">Price per Sq.Ft.: </tspan>
				<tspan class="narrow">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'pricesinglesquareFeet'" />
						<xsl:with-param name="default" select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform:translate(45%,50%);fill:var(--theme-body-background);">
			<rect width="54%" height="35%" fill="var(--theme-sub-heading-color)" fill-opacity="70%" />

			<g style="transform:translate(2%,2%);">
				<text x="0" y="0" class="h2 large" style="fill:var(--theme-body-background);">
					<tspan>
						<xsl:call-template name="soldListedPrice" />
					</tspan>
					<tspan style="font-size:50%;font-style:italic;" dx="1%" dy="1.5%">
						Active
					</tspan>
				</text>

				<text x="0" y="7%" class="medium">
					<xsl:call-template name="listing-address-line-one" />
				</text>

				<text x="0" y="12%" class="medium">
					<xsl:call-template name="listing-address-line-two" />
				</text>
				<foreignObject y="16%" width="50%" height="16%">
					<p style="color:var(--theme-body-background);">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singledescription'" />
							<xsl:with-param name="default" select="//single/description" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>