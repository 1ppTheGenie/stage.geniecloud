<?xml version="1.0"?>
<!--
	Asset Name: Single Listing Flyer - No.7
	Tags:		Report, Direct Mail
	Sizes:		Letter
	Supports:	Listing
	Pages:		flyers/single-listing-07,flyers/single-rear-01
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			.h1 { font-size: 150%; }
			font-weight-normal{ font-weight: 600; }'" />
		</style>

		<g>
			<image x="0" y="0" width="100%" height="28%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<rect x="0" y="0" width="100%" height="28%" style="fill:var(--theme-body-color);" fill-opacity="0.01" />

			<text x="50%" y="1.5%" class="upper center sub-heading" style="font-size: 220%;font-weight: 600;" data-max-width="40%">
				<xsl:variable name="customListingStatus">
					<xsl:choose>
						<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
							<xsl:value-of select="'In Escrow'" />
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID)=2">
							<xsl:value-of select="'Just Sold'" />
						</xsl:when>
						<xsl:when test="number(//single/statusTypeID)=14">
							<xsl:value-of select="'Coming Soon'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'Just Listed'" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:value-of select="concat( $customListingStatus, ' in &#160;', //area[1]/name )" />
			</text>
		</g>

		<g style="transform: translate(0%,28%);">
			<rect x="0" y="0" width="100%" height="9%" style="fill:var(--theme-sub-heading-color);" />

			<text x="35%" y="1.5%" class="normal" style="font-weight: 600;" fill="var(--theme-body-background)">
				<tspan dy="0" style="font-size:300%">
					<xsl:call-template name="listing-address-line-one" />
				</tspan>
				<tspan x="35%" dy="3.5%" style="font-size:230%">
					<xsl:call-template name="listing-address-line-two" />
				</tspan>
			</text>
		</g>

		<g style="transform: translate(5.5%,37%);">
			<image x="0" y="1%" width="23%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<text x="12%" y="13%" class="center bold" fill="var(--theme-body-color)" style="font-size:240%" data-max-width="20%">
				<tspan x="12%" dy="0">
					<xsl:call-template name="listing-address-line-one" />
				</tspan>
				<tspan x="12%" dy="2.5%">
					<xsl:call-template name="listing-address-line-two" />
				</tspan>
			</text>
			<text x="12%" y="19%" class="center" fill="var(--theme-sub-heading-color)" style="font-size:240%" data-max-width="11%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmarketingEmail'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</text>
			<text x="12%" y="22%" class="center bold" fill="var(--theme-body-color)" style="font-size:240%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select="//agent[1]/mobile" />
				</xsl:call-template>
			</text>
		</g>

		<g style="transform: translate(34%,37%);">
			<rect x="0" y="0" width="66%" height="28%" style="fill:var(--theme-body-color);" />

			<g style="transform: translate(2%,1%);">
				<text class="center" x="6%" y="3%" fill="var(--theme-body-background)" style="font-size:230%">
					<xsl:value-of select="format-number( //single/price, '$###,###')" />
				</text>
				<rect x="0" y="6%" width="15%" height="3%" style="fill:var(--theme-body-background);" />

				<text x="1%" y="7%" class="sub-heading" style="font-size:110%; text-transform: uppercase">
					<xsl:value-of select="//single/listingStatus" />
				</text>
				<rect x="0" y="10%" width="15%" height="3%" style="fill:var(--theme-body-background);" />

				<text x="1%" y="11%" class="sub-heading" style="font-size:110%">
					<xsl:value-of select="concat( format-number( //single/squareFeet, '###,###' ), ' SQ.FT',  )" />
				</text>
				<rect x="0" y="14%" width="15%" height="3%" style="fill:var(--theme-body-background);" />

				<text x="1%" y="15%" class="sub-heading" style="font-size:110%">
					<xls:value-of select="concat( //single/bedrooms/@count, ' BEDROOMS' )" />
				</text>
				<rect x="0" y="18%" width="15%" height="3%" style="fill:var(--theme-body-background);" />

				<text x="1%" y="19%" class="sub-heading" style="font-size:110%">
					<xls:value-of select="concat( //single/bathrooms/@full, ' BATHROOMS' )" />
				</text>
			</g>
			<foreignObject x="22%" y="2%" width="40%" height="25%">
				<p style="-webkit-line-clamp:13; line-height: 1.7rem; font-size:140%; color:var(--theme-body-background)">
					<xsl:call-template name="listing-description" />
				</p>
			</foreignObject>
		</g>

		<g style="transform: translate(0, 66%)">
			<image x="0" y="0" width="32.2%" height="18%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<image x="33.8%" y="0" width="32.2%" height="18%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-2'" />
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>
			<image x="67.7%" y="0" width="32.2%" height="18%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-3'" />
					<xsl:with-param name="idx" select="3" />
				</xsl:call-template>
			</image>
		</g>

		<g style="transform: translate(0, 85%)">
			<rect x="0" y="0" width="100%" height="15%" fill="var(--theme-sub-heading-color)" />

			<clipPath id="clipCircle">
				<circle r="6%" cx="12%" cy="7.5%"></circle>
			</clipPath>
			<image x="3.5%" y="1%" width="17%" height="13%" clip-path="url(#clipCircle)" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
			<text x="24%" y="1%" fill="var(--theme-body-background)" style="font-size: 260%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentname'" />
					<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;' )" />
				</xsl:call-template>
			</text>
			<text x="24%" y="4%" fill="var(--theme-body-background)" style="font-size: 140%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'innovatorrealto'" />
					<xsl:with-param name="default" select="'Innovator REALTOR'" />
				</xsl:call-template>
			</text>
			<text x="24%" y="6.5%" fill="var(--theme-body-background)" style="font-size: 140%;">
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
			<foreignObject x="24%" y="8%" width="70%" height="10%" style='font-size: 140%;'>
				<p style="color:var(--theme-body-background);-webkit-line-clamp:3; line-height:150%">
					<xsl:value-of select="concat( 'The information contained herein has been obtained through sources deemed reliable by ',//agent[1]/marketingName, ', but cannot be guaranteed for its accuracy. We recommend to the buyer that any information, which is of special interest, should be obtained through independent verification. ALL MEASUREMENTS ARE APPROXIMATE.')"/>
				</p>
			</foreignObject>
		</g>

		<g style="fill: var(--theme-body-background);">
			<xsl:call-template name="copyright" />
		</g>
	</xsl:template>
</xsl:stylesheet>
