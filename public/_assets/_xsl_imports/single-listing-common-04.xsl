<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="single-listing-common-04">
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
 			.stat-icon svg {
				 fill:var(--theme-body-background);
}'" />
		</style>

		<image x="1%" y="2%" width="60%" height="70%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:call-template name="listing-image">
					<xsl:with-param name="index" select="number(1)" />
					<xsl:with-param name="preferPrimary" select="'true'" />
				</xsl:call-template>
			</xsl:attribute>
		</image>

		<xsl:choose>
			<xsl:when test="number(//single/statusTypeID) = 2">
				<image x="-2.7%" y="1.8%" width="15%" height="15%" preserveAspectRatio="xMidYMid meet" style="transform: scale(1.1);">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/sold-strip.png')" />
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:when test="number(//single/statusTypeID) = 1">
				<image x="-2.7%" y="1.8%" width="15%" height="15%" preserveAspectRatio="xMidYMid meet" style="transform: scale(1.1);">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/active-strip.png')" />
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="-2.7%" y="1.8%" width="15%" height="15%" preserveAspectRatio="xMidYMid meet" style="transform: scale(1.1);">
					<xsl:attribute name="href">
						<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/pending-strip.png')" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<image x="1%" y="74%" width="60%" height="20%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:call-template name="listing-image">
					<xsl:with-param name="index" select="number(2)" />
				</xsl:call-template>
			</xsl:attribute>
		</image>

		<g style="transform:translate(62%,2%)">
			<text x="1%" y="0" class="heading super-large bold">
				<tspan class="upper narrow">Just</tspan>
				<xsl:text>&#160;</xsl:text>
				<tspan class="upper bold">
<xsl:call-template name="soldListed" />

				</tspan>
			</text>
			<text x="1%" y="12%">
				<xsl:text> in the </xsl:text>
				<xsl:value-of select="//single/address/city" />
				<xsl:text> area</xsl:text>
			</text>
			<text x="1%" y="16%" class="large heading" data-max-width="35%">
<xsl:call-template name="listing-address-line-one" />

			</text>
			<text x="1%" y="21%" class="large heading" data-max-width="35%">
<xsl:call-template name="listing-address-line-two" />

			</text>
			<text x="1%" y="31%" class="medium bold" style="dominant-baseline: auto;">
<xsl:call-template name="soldListedPrice" />

			</text>
			<text x="1%" y="34%" class="heading">
				<tspan>Type:  </tspan>
				<tspan>
<xsl:value-of select="//single/type" />

				</tspan>
			</text>

			<foreignObject x="1%" y="36%" width="35%" height="35%">
				<p style="color:var(--theme-body-color);-webkit-line-clamp:9; text-align: justify;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singledescription'" />
						<xsl:with-param name="default" select="//single/description" />
					</xsl:call-template>
				</p>
			</foreignObject>

			<g style="transform:translateY(74%)">
				<svg width="35%" height="17.5%">
<use href="#phone-icon" x="17.6%" y="16%" width="10%" height="10%" fill="var(--theme-sub-heading-color)" style="transform: rotate(95deg) translate(-14.3%, -116.5%);" />

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
							<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'') " />

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
		</g>

		<g style="transform:translate(1%,74%);">
			<rect width="60%" height="20%" fill="var(--theme-heading-color)" fill-opacity="60%" />

			<g class="icon-stat" style="transform:translateX(0)">
				<rect stroke="var(--theme-body-background)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10%" height="20%" />

				<use x="3.5%" y="4%" width="3%" height="5%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
				</use>
				<text class="align-center" fill="var(--theme-body-background)">
					<tspan x="5%" y="10%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singlebedroomscount'" />
							<xsl:with-param name="default" select="//single/bedrooms/@count" />
						</xsl:call-template>
					</tspan>
					<tspan x="5%" y="14.5%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'beds'" />
							<xsl:with-param name="default" select="'Beds'" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>

			<g class="icon-stat" style="transform:translateX(10%)">
				<rect stroke="var(--theme-body-background)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10%" height="20%" />

				<use x="3.5%" y="3%" width="3%" height="5%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
				</use>
				<text class="align-center" fill="var(--theme-body-background)">
					<tspan x="5%" y="10%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singlebathrooms'" />
							<xsl:with-param name="default" select="$listingTotalBathrooms" />
						</xsl:call-template>
					</tspan>
					<tspan x="5%" y="14.5%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'baths'" />
							<xsl:with-param name="default" select="'Baths'" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>

			<g class="icon-stat" style="transform:translateX(20%)">
				<rect stroke="var(--theme-body-background)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10%" height="20%" />

				<use x="3.5%" y="3%" width="3%" height="5%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-dom-icon' )" />
				</use>
				<text class="align-center" fill="var(--theme-body-background)">
					<tspan x="5%" y="10%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'daysOnMarket'" />
							<xsl:with-param name="default" select="//single/daysOnMarket" />
						</xsl:call-template>
					</tspan>
					<tspan x="5%" y="14.5%" style="font-size: 60%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'daysmarket'" />
							<xsl:with-param name="default" select="'Days on Market'" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>

			<g class="icon-stat" style="transform:translateX(30%)">
				<rect stroke="var(--theme-body-background)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10%" height="20%" />

				<use x="3.5%" y="3%" width="3%" height="5%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
				</use>
				<text class="align-center" fill="var(--theme-body-background)">
					<tspan x="5%" y="9%" data-name="square-foot-price" data-default="My default string">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'pricesinglesquareFeet'" />
							<xsl:with-param name="default" select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
						</xsl:call-template>
					</tspan>
					<tspan x="5%" y="13.5%" data-name="sqf-caption-1" data-default=" Price per">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'priceper'" />
							<xsl:with-param name="default" select="'Price per'" />
						</xsl:call-template>
					</tspan>
					<tspan x="5%" y="15.5%" data-name="sqf-caption-2" data-default=" Sq.Ft.">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'pricepersqft'" />
							<xsl:with-param name="default" select="'Sq.Ft.'" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>

			<g class="icon-stat" style="transform:translateX(40%)">
				<rect stroke="var(--theme-body-background)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10%" height="20%" />

				<use x="3.5%" y="3%" width="3%" height="5%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
				</use>
				<text class="align-center" fill="var(--theme-body-background)">
					<tspan x="5%" y="10%" style="font-size:75%!important;">
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
					<tspan x="5%" y="12.5%" style="font-size:75%!important;">
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

			<g class="icon-stat" style="transform:translateX(50%)">
				<rect stroke="var(--theme-body-background)" stroke-width="1" fill-opacity="0" x="0" y="0" width="10%" height="20%" />

				<use x="3.5%" y="3%" width="3%" height="5%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#size-icon' )" />
				</use>
				<text class="align-center" fill="var(--theme-body-background)">
					<tspan x="5%" y="10%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singlesquareFeet'" />
							<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
						</xsl:call-template>
					</tspan>
					<tspan x="5%" y="14.5%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'Sqft'" />
							<xsl:with-param name="default" select="'Sq.Ft.'" />
						</xsl:call-template>
					</tspan>
				</text>
			</g>
		</g>

	</xsl:template>
</xsl:stylesheet>