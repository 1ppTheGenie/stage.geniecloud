<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing No.2
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
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

		<rect x="1%" y="1%" width="98%" height="95%" fill="#0000" stroke-width="2" stroke="#94949d" />
		<image x="2%" y="3%" width="55%" height="91%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(2%, 70%)">
			<svg width="33%" height="21.5%" class="heading">
				<rect width="80%" height="100%" fill="var(--theme-body-background)" fill-opacity="80%" />

				<use x="28%" y="35%" width="10%" height="10%" fill="var(--theme-heading-color)" style="transform:rotate(93.8deg) translate(-20.4%, -140.5%);">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#phone-icon' )" />
				</use>
				<use x="28%" y="53%" fill="var(--theme-heading-color)" width="10%" height="10%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
				</use>
				<use x="28%" y="67.5%" fill="var(--theme-heading-color)" width="10%" height="10%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
				</use>
				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
					<circle r=".3500" cx=".5" cy=".5" />

				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="2%" y="5.5%" width="27%" height="90%" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>

				<text x="31.5%" y="17%" font-size="145%" class="sub-heading bold" data-max-width="16%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentname'" />
						<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'' )" />
					</xsl:call-template>
				</text>

				<text x="37%" y="37%" class="heading" style="font-size:90%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="//agent[1]/mobile" />
					</xsl:call-template>
				</text>

				<text x="37%" y="51%" class="heading" style="font-size:90%;" data-max-width="13%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>

				<text x="37%" y="65%" class="heading" style="font-size:90%;" data-max-width="13%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</text>

				<text x="37%" y="79%" style="font-size:80%" class="heading">
					<xsl:value-of select="//agent[1]/marketingLicense" />
				</text>
			</svg>
		</g>

		<xsl:choose>
			<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
				<text style="fill:var(--theme-body-background);text-shadow: 2px 3px 0px rgba(0,0,0);text-transform: uppercase;text-anchor:end;font-weight:500;font-size:375%;transform:translate(55%,5%)">In</text>
				<text fill="var(--theme-heading-color)" style="font-weight:500;font-size:375%;text-transform:uppercase;transform:translate(58.5%,5%)">Escrow
				</text>
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=2">
				<text style="fill:var(--theme-body-background);text-shadow: 2px 3px 0px rgba(0,0,0);text-transform: uppercase;text-anchor:end;font-weight:500;font-size:375%;transform:translate(55%,5%)">Just</text>
				<text fill="var(--theme-heading-color)" style="font-weight:500;font-size:375%;text-transform:uppercase;transform:translate(58.5%,5%)">Sold
				</text>
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID)=14">
				<text style="fill:var(--theme-body-background);text-shadow: 2px 3px 0px rgba(0,0,0);text-transform: uppercase;text-anchor:end;font-weight:500;font-size:375%;transform:translate(55%,5%)">Coming</text>
				<text fill="var(--theme-heading-color)" style="font-weight:500;font-size:375%;text-transform:uppercase;transform:translate(58.5%,5%)">Soon
				</text>
			</xsl:when>
			<xsl:otherwise>
				<text style="fill:var(--theme-body-background);text-shadow: 2px 3px 0px rgba(0,0,0);text-transform: uppercase;text-anchor:end;font-weight:500;font-size:375%;transform:translate(55%,5%)">Just</text>
				<text fill="var(--theme-heading-color)" style="font-weight:500;font-size:375%;text-transform:uppercase;transform:translate(58.5%,5%)">Listed
				</text>
			</xsl:otherwise>
		</xsl:choose>

		<g id="details" fill="var(--theme-heading-color)" style="font-size:120%;">
			<text>
				<tspan>in </tspan>
				<tspan>
					<xsl:value-of select="//single/address/city" />
				</tspan>
			</text>
			<text x="0" y="5.5%" fill="var(--theme-heading-color)">
				<tspan class="bold">Type:  </tspan>
				<tspan>
					<xsl:value-of select="$singularPropertyType" />
				</tspan>
			</text>

			<text x="0" y="11.5%" fill="var(--theme-heading-color)">
				<tspan class="bold">Beds: </tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebedroomscount'" />
						<xsl:with-param name="default" select="//single/bedrooms/@count" />
					</xsl:call-template>
				</tspan>
				<tspan dx="2%" class="bold">Baths: </tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebathrooms'" />
						<xsl:with-param name="default" select="$listingTotalBathrooms" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="0" y="17%" fill="var(--theme-heading-color)">
				<tspan class="bold">Price Per Sq.Ft.: </tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'pricesinglesquareFeet'" />
						<xsl:with-param name="default" select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="0" y="24%" style="font-size:90%" fill="var(--theme-heading-color)">
				<xsl:choose>
					<xsl:when test="//single/soldDate!=''">
						<tspan class="bold">Sold on: </tspan>
						<tspan class="narrow">
							<xsl:value-of select="//single/soldDate" />

						</tspan>
					</xsl:when>
					<xsl:otherwise>
						<tspan class="bold">Listed on: </tspan>
						<tspan>
							<xsl:value-of select="//single/listed" />

						</tspan>
					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<g style="transform:translate(45%,50%);fill:var(--theme-body-background);">
			<rect width="54%" height="35%" fill="var(--theme-heading-color)" fill-opacity="90%" />

			<g style="transform:translate(2%,2%);">
				<text x="0" y="0" class="h2 large" style="fill:var(--theme-body-background);">
					<xsl:call-template name="soldListedPrice" />
				</text>

				<text x="27%" y="1.5%" class="center normal" fill="#3f8b27" style="font-weight:600;font-style: italic;">
					<xsl:choose>
						<xsl:when test="number(//single/statusTypeID) = 2">
							<xsl:text>Sold</xsl:text>
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID) = 1">
							<xsl:text> Active </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text> Pending </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</text>

				<text x="0" y="7%" class="medium">
					<xsl:call-template name="listing-address-line-one" />

				</text>

				<text x="0" y="12%" class="medium">
					<xsl:call-template name="listing-address-line-two" />

				</text>
				<foreignObject y="16%" width="50%" height="15%">
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