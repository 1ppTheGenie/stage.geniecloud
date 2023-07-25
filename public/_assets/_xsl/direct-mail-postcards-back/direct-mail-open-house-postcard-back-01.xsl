<?xml version="1.0"?>
<!--
	Asset Name: Open House Postcard
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<rect x="25%" width="75%" height="100%" fill="var(--theme-sub-heading-color)"/>

		<image x="2%" y="2%" width="50%" height="96%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g>

			<text x="75%" y="10%" class="center" fill="var(--theme-body-background)" style="font-size:100%;font-weight:600;">
				<xsl:call-template name="listing-address" />
			</text>
			<text x="75%" y="15%" class="center upper" fill="var(--theme-body-background)" style="font-size: 450%;font-weight: 550;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'youare'" />
						<xsl:with-param name="default" select="'you are'" />
					</xsl:call-template>
				</tspan>
				<tspan x="75%" dy="14%" class="center">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'invited'" />
						<xsl:with-param name="default" select="'invited'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="75%" y="47%" class="center upper" fill="var(--theme-body-background)" style="font-size: 120%;font-weight:600;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'singleopenHouse'" />
					<xsl:with-param name="default" select="//single/openHouse" />
				</xsl:call-template>
			</text>

			<g style="transform:translate(59%,60%)">
				<svg x="0%" viewBox="0 0 100 100">
					<circle cx="-35" cy="5%" r="4.5" fill="var(--theme-body-background)"></circle>
					<use x="-47.4%" y="2.8%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text x="-29%" y="1%" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'beds'" />
								<xsl:with-param name="default" select="'Beds'" />
							</xsl:call-template>
						</tspan>
						<tspan x="-29%" dy="4%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlebedroomscount'" />
								<xsl:with-param name="default" select="//single/bedrooms/@count" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg viewBox="0 0 100 100" y="2%">
					<circle cx="-35" cy="15%" r="4.5" fill="var(--theme-body-background)"></circle>
					<use x="-47.4%" y="12.8%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text x="-29%" y="11%" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'baths'" />
								<xsl:with-param name="default" select="'Baths'" />
							</xsl:call-template>
						</tspan>
						<tspan x="-29%" dy="4%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlebathrooms'" />
								<xsl:with-param name="default" select="$listingTotalBathrooms" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg viewBox="0 0 100 100" y="4%">
					<circle cx="-35" cy="25%" r="4.5" fill="var(--theme-body-background)"></circle>
					<use x="-47.4%" y="22.9%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#avg-dom-icon' )" />
					</use>
					<text x="-29%" y="21%" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'dom'" />
								<xsl:with-param name="default" select="'DOM'" />
							</xsl:call-template>
						</tspan>
						<tspan x="-29%" dy="4%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricesinglesquareFeet'" />
								<xsl:with-param name="default" select="//single/daysOnMarket" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg x="-2%" viewBox="0 0 100 100">
					<circle cx="0" cy="5%" r="4.5" fill="var(--theme-body-background)"></circle>
					<use x="-12%" y="2.5%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#size-icon' )" />
					</use>
					<text x="6.5%" y="1%" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'Sq.Ft'" />
								<xsl:with-param name="default" select="'Sq.Ft.'" />
							</xsl:call-template>
						</tspan>
						<tspan x="6.5%" dy="4%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'singlesquareFeet'" />
								<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg x="-2%" y="2%" viewBox="0 0 100 100">
					<circle cx="-0" cy="15%" r="4.5" fill="var(--theme-body-background)"></circle>
					<use x="-12.2%" y="13.2%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
					</use>
					<text x="6.5%" y="12%" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
						<tspan x="6.5%" y="11%" data-name="sqf-caption-1" data-default=" Price per Sq.Ft.">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricepersqft'" />
								<xsl:with-param name="default" select="'Price per Sq.Ft'" />
							</xsl:call-template>
						</tspan>
						<tspan x="6.5%" y="15%" data-name="square-foot-price" data-default="My default string">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'pricesinglesquareFeet'" />
								<xsl:with-param name="default" select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg x="-2%" y="4%" viewBox="0 0 100 100">
					<circle cx="-0" cy="25%" r="4.5" fill="var(--theme-body-background)"></circle>
					<use x="-12.3%" y="22.7%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
					</use>
					<text x="6.5%" y="21.5%" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
						<tspan>
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
						<tspan x="6.5%" y="25.5%">
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
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>