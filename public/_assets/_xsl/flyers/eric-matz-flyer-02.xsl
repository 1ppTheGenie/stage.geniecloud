<?xml version="1.0"?>
<!--
	Asset Name: Eric Matz Flyer 2 Style 1
	Tags:		Direct Mail
	Sizes:		Letter
	Supports:	Listing
	Pages:		flyers/eric-matz-flyer-02,flyers/single-rear-01
	Roles:		eric-matz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<g>
			<text x="3%" y="3%" class="upper" font-size="220%">
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn]' )" />
				<xsl:text>’S FEATURED LISTING  </xsl:text>
			</text>
			<image x="82%" y="1%" width="14%" height="8%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
<rect x="2%" y="9.5%" width="96%" height="4" stroke-width="4" fill-opacity="1" fill="var(--theme-body-color)" />


			<g style="transform: translate(0%, 11%);">
				<image x="3%" y="0" width="94%" height="28%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:call-template name="listing-image">
							<xsl:with-param name="index" select="number(1)" />
							<xsl:with-param name="preferPrimary" select="'true'" />
						</xsl:call-template>
					</xsl:attribute>
				</image>

				<g style="transform:translate(4%,3%)" fill="#fff">
					<filter x="-0.25" y="-0.25" width="1.5" height="1.35" id="solid">
<feFlood flood-color="var(--theme-sub-heading-color)" />

						<feComposite in="SourceGraphic" operator="xor" />
					</filter>
					<text x="0" y="0" fill="var(--theme-body-background)" class="upper" style="font-size: 90%;" filter="url(#solid)">
<xsl:value-of select="$soldListed" />

					</text>
					<text x="0" y="0" fill="var(--theme-body-background)" class="upper" style="font-size: 90%;">
<xsl:value-of select="$soldListed" />

					</text>
				</g>

				<rect stroke="var(--theme-body-color)" stroke-width="4" fill-opacity="0" x="3%" y="0" width="94%" height="28%" />
			</g>

			<g style="transform: translate(0%, 40%);">
				<text class="center large bold sub-heading" x="50%" y="0" fill="var(--theme-body-color)">
					<xsl:call-template name="listing-address-line-one" />
				</text>
				<text x="50%" y="5%" class="center bold medium sub-heading">
					<tspan>
<xsl:value-of select="//single/bedrooms/@count" />

						<xsl:text>BR</xsl:text>
					</tspan>
<tspan dx="1%">&#124;</tspan>
					<tspan dx="1%">
<xsl:value-of select="$listingTotalBathrooms" />

						<xsl:text>BA</xsl:text>
					</tspan>
<tspan dx="1%">&#124;</tspan>
					<tspan dx="1%">
<xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />

					</tspan>
<tspan dx="1%">&#124;</tspan>
					<xsl:choose>
						<xsl:when test="//single/soldDate!=''">
							<tspan dx="1%">Sold For </tspan>
<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />

						</xsl:when>
						<xsl:otherwise>
							<tspan dx="1%">Asking </tspan>
<xsl:value-of select="format-number( //single/price, '$###,###')" />

						</xsl:otherwise>
					</xsl:choose>
				</text>
			</g>
			<g style="transform: translate(0%, 50%);">
				<image x="3%" y="0" width="46%" height="18%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:call-template name="listing-image">
							<xsl:with-param name="index" select="number(2)" />
						</xsl:call-template>
					</xsl:attribute>
				</image>
<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="2.8%" y="0" width="46%" height="18%" />

				<image x="51%" y="0" width="46%" height="18%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:call-template name="listing-image">
							<xsl:with-param name="index" select="number(3)" />
						</xsl:call-template>
					</xsl:attribute>
				</image>
<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="50.8%" y="0" width="46%" height="18%" />
<rect x="2%" y="19%" width="96%" height="4" stroke-width="4" fill-opacity="1" fill="var(--theme-body-color)" />

			</g>
			<g style="transform: translate(0%, 70.5%);">
				<svg x="3%" y="0" width="30%" height="50%">
					<image x="0" y="0" width="100%" height="25%" preserveAspectRatio="xMidYMid slice">
						<xsl:attribute name="href">
							<xsl:call-template name="listing-image">
								<xsl:with-param name="index" select="number(4)" />
							</xsl:call-template>
						</xsl:attribute>
					</image>
<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="0" y="0" width="100%" height="25%" />

					<polygon points="55,0 85,0 0,85 0,55" fill-opacity="0.75" fill="var(--sold-red)"></polygon>
					<text x="8.35%" y="9%" transform-origin="4% 4%" transform="rotate(-45)" fill="var(--theme-body-background)" class="small align-center">Sold</text>
					<text class="center sub-heading" x="50%" y="26%" fill="var(--theme-body-color)">
						<xsl:call-template name="listing-address-line-one" />
					</text>
					<text class="center upper sub-heading" x="50%" y="31%" fill="var(--theme-body-color)" style="font-size:90%">
<xsl:value-of select="//single/bedrooms/@count" />

						<xsl:text>BR &#8226; </xsl:text>
<xsl:value-of select="$listingTotalBathrooms" />

						<xsl:text>BA &#8226; </xsl:text>
<xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />

						<xsl:text>ESF</xsl:text>
					</text>
				</svg>
				<svg x="35%" y="0" width="30%" height="50%">
					<image x="0" y="0" width="100%" height="25%" preserveAspectRatio="xMidYMid slice">
						<xsl:attribute name="href">
							<xsl:call-template name="listing-image">
								<xsl:with-param name="index" select="number(5)" />
							</xsl:call-template>
						</xsl:attribute>
					</image>
<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="0" y="0" width="100%" height="25%" />

					<polygon points="55,0 85,0 0,85 0,55" fill-opacity="0.75" fill="var(--sold-red)"></polygon>
					<text x="8.35%" y="9%" transform-origin="4% 4%" transform="rotate(-45)" fill="var(--theme-body-background)" class="small align-center">Sold</text>
					<text class="center sub-heading" x="50%" y="26%" fill="var(--theme-body-color)">
						<xsl:call-template name="listing-address-line-one" />
					</text>
					<text class="center upper sub-heading" x="50%" y="31%" fill="var(--theme-body-color)" style="font-size:90%">
<xsl:value-of select="//single/bedrooms/@count" />

						<xsl:text>BR &#8226; </xsl:text>
<xsl:value-of select="$listingTotalBathrooms" />

						<xsl:text>BA &#8226; </xsl:text>
<xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />

						<xsl:text>ESF</xsl:text>
					</text>
				</svg>
				<svg x="67%" y="0" width="30%" height="50%">
					<image x="0" y="0" width="100%" height="25%" preserveAspectRatio="xMidYMid slice">
						<xsl:attribute name="href">
							<xsl:call-template name="listing-image">
								<xsl:with-param name="index" select="number(6)" />
							</xsl:call-template>
						</xsl:attribute>
					</image>
<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="0" y="0" width="100%" height="25%" />

					<polygon points="55,0 85,0 0,85 0,55" fill-opacity="0.75" fill="var(--sold-red)"></polygon>
					<text x="8.35%" y="9%" transform-origin="4% 4%" transform="rotate(-45)" fill="var(--theme-body-background)" class="small align-center">Sold</text>
					<text class="center sub-heading" x="50%" y="26%" fill="var(--theme-body-color)">
						<xsl:call-template name="listing-address-line-one" />
					</text>
					<text class="center upper sub-heading" x="50%" y="31%" fill="var(--theme-body-color)" style="font-size:90%">
<xsl:value-of select="//single/bedrooms/@count" />

						<xsl:text>BR &#8226; </xsl:text>
<xsl:value-of select="$listingTotalBathrooms" />

						<xsl:text>BA &#8226; </xsl:text>
<xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />

						<xsl:text>ESF</xsl:text>
					</text>
				</svg>
			</g>
		</g>

		<g>
<rect x="3%" y="90%" width="94%" height="8%" fill="var(--theme-sub-heading-color)" />

			<text y="91%" class="normal align-center" fill="var(--theme-body-background)">
				<tspan x="50%">If you would like your home professionally featured in my publication,</tspan>
				<tspan x="50%" dy="2%">which is exposed to </tspan>
				<tspan class="bold">thousands of buyers every month</tspan>
				<tspan>,</tspan>
				<tspan x="50%" dy="2%">call me today (888) 425-2300</tspan>
			</text>
		</g>
	</xsl:template>
</xsl:stylesheet>