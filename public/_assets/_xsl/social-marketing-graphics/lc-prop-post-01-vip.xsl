<?xml version="1.0"?>
<!--
	Asset Name:	LC-PROP-POST-01-VIP
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="lc-social-media.xsl"/>

	<xsl:template name="svg-body">
		<image x="15%" y="27%" width="85%" height="58%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform-origin: 0; transform: rotate(-90deg) translate(-35%, 54%);">
			<!--
                   <foreignObject x="0" y="-5%" width="75%" height="9%">
                       <p style="font-weight:600; font-size:150%; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 1; overflow: hidden; text-overflow: ellipsis;" class="heading">
                            <xsl:call-template name="editable">
                    <xsl:with-param name="id" select="'yourneighborhood'" />
<xsl:with-param name="default" select="concat( $singularPropertyType,' &#124; ', //area/name)" />

                </xsl:call-template> 
                       </p>
            </foreignObject>
-->
			<text x="0%" y="-1%" style="letter-spacing:0.5px;" font-weight="600" font-size="150%" class="heading" data-max-width="80%">

				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="$listingAddressLine1" />
				</xsl:call-template>
			</text>

			<text x="0" y="5%" font-size="150%" fill="var(--theme-sub-heading-color)" font-family="var(--theme-heading-font)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebedroomscount'" />
						<xsl:with-param name="default" select="//single/bedrooms/@count" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'beds'" />
<xsl:with-param name="default" select="'Beds &#124; '" />

					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebathrooms'" />
						<xsl:with-param name="default" select="$listingTotalBathrooms" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'baths'" />
<xsl:with-param name="default" select="'Baths &#124; '" />

					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlesquareFeet'" />
						<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
					</xsl:call-template>
				</tspan>
				<tspan dx="1%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'SF'" />
						<xsl:with-param name="default" select="'SF'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<text x="15%" y="6.5%" class="heading large bold" style="font-size: 395%;" data-max-width="45%">
			<xsl:choose>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<xsl:value-of select="'In Escrow!'" />
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=2">
					<xsl:value-of select="'Just Sold!'" />
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=14">
					<xsl:value-of select="'Coming Soon!'" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'Just Listed!'" />
				</xsl:otherwise>
			</xsl:choose>
		</text>

		<text x="15%" y="20%" data-max-width="60%" fill="var(--theme-sub-heading-color)" font-weight="600" font-size="140%" font-family="var(--theme-sub-heading-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat( genie:indefinite-article( string(//area/name) ), ' ', //area/name, ' Gem')" />
			</xsl:call-template>
		</text>

		<text x="65%" y="8.5%" class="left" font-size="70%" font-family="var(--theme-heading-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Presented by:'" />
				<xsl:with-param name="default" select="'Presented by:'" />
			</xsl:call-template>
		</text>

		<text x="65%" y="11%" class="left" font-size="110%" font-weight="300" style="letter-spacing: 0.5px;" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" data-max-width="25%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'marketingName'" />
				<xsl:with-param name="default" select="//agent[1]/marketingName" />
			</xsl:call-template>
		</text>

		<text x="65%" y="14.7%" class="left" font-size="125%" font-weight="300" fill="var(--theme-sub-heading-color)" font-family="var(--theme-heading-font)" data-max-width="20%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'mobile'" />
				<xsl:with-param name="default" select="translate(//agent[1]/mobile, '-', '.')" />
			</xsl:call-template>
		</text>

<text x="65%" y="19%" font-size="63%" font-family="var(--theme-heading-font)" fill="var(--theme-body-color)" data-max-width="25%" class="left align-left upper">
	<xsl:value-of select="//agent[1]/marketingLicense" />
</text>

		<image x="83%" y="11%" width="14%" height="16%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="65%" y="87%" width="30%" height="9%" id="logo" preserveAspectRatio="xMaxYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogo" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="55%" y="87%" width="29%" height="10.5%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
				<image x="87%" y="87%" width="10.5%" height="10.5%" preserveAspectRatio="xMaxYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<!-- <text x="74%" y="86.4%" class="center" font-size="85%" font-family="var(theme-heading-font)" data-max-width="25%">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'click'" />
					<xsl:with-param name="default" select="'Click'" />
				</xsl:call-template>
			</tspan>
			<tspan dx="1%" class="upper bold" style="letter-spacing:1px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Learn More'" />
					<xsl:with-param name="default" select="'LEARN MORE'" />
				</xsl:call-template>
			</tspan>
			<tspan dx="1%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'for'" />
					<xsl:with-param name="default" select="'for:'" />
				</xsl:call-template>
			</tspan>
		</text> -->

		<!-- <image x="71%" y="90.5%" width="7%" height="7%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Arrow.svg' )" />
			</xsl:attribute>
		</image> -->

		<!-- <text x="88%" y="85.7%" class="bold" font-size="70%" style="letter-spacing:1px;" font-family="var(theme-heading-font)" data-max-width="12%">
			<tspan x="87%" dy="1%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'3DTours'" />
					<xsl:with-param name="default" select="'- 3D Tours'" />
				</xsl:call-template>
			</tspan>
			<tspan x="87%" dy="3%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'pricing'" />
					<xsl:with-param name="default" select="'- Pricing'" />
				</xsl:call-template>
			</tspan>
			<tspan x="87%" dy="3%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'floorPlans'" />
					<xsl:with-param name="default" select="'- Floor Plans'" />
				</xsl:call-template>
			</tspan>
			<tspan x="87%" dy="3%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'More'" />
					<xsl:with-param name="default" select="'- More'" />
				</xsl:call-template>
			</tspan>
		</text> -->

		<g id="agent-contact" style="transform: translateX(-32%);">
			<xsl:call-template name="copyright" />
		</g>
	</xsl:template>
</xsl:stylesheet>