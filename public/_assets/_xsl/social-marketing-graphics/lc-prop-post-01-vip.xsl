<?xml version="1.0"?>
<!--
	Asset Name:	LC-PROP-POST-01-VIP
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:import href="lc-social-media.xsl" />

	<xsl:template name="svg-body">
	 <style>
			<xsl:value-of select="'
				g#agent-contact{
					transform: translate(2.5%, 97.8%);
				}
				g#agent-contact text{
					font-size: 11px;
					fill: #94949D;
				}
				g#agent-contact text a tspan{
					fill: #337ab7;
				}
                g#footer {
                    transform: translate(3.8%, 96.8%);
                }
                g#footer text:last-child {
                    transform: translate(93.4%);
                }
                g#footer text:nth-child(2) {
                    transform: translate(45.5%);
                }
			'"/>
		</style>
		<image x="17%" y="23.8%" width="83%" height="58%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform-origin: 0; transform: rotate(-90deg) translate(-35%, 54%);">
			<text x="3%" y="-0.7%" style="font-family:var(--theme-sub-heading-font); fill:var(--theme-heading-color)" font-weight="700" font-size="325%" data-max-width="80%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="$listingAddressLine1" />
				</xsl:call-template>
			</text>

			<text x="3%" y="7.7%" font-size="250%" fill="var(--theme-sub-heading-color)" font-weight="500" font-family="var(--theme-body-font)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebedroomscount'" />
						<xsl:with-param name="default" select="//single/bedrooms/@count" />
					</xsl:call-template>
				</tspan>
				<tspan dx="0%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'beds'" />
						<xsl:with-param name="default" select="'Beds &#124; '" />
					</xsl:call-template>
				</tspan>
				<tspan dx="0%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlebathrooms'" />
						<xsl:with-param name="default" select="$listingTotalBathrooms" />
					</xsl:call-template>
				</tspan>
				<tspan dx="0%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'baths'" />
						<xsl:with-param name="default" select="'Baths &#124; '" />
					</xsl:call-template>
				</tspan>
				<tspan dx="0%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'singlesquareFeet'" />
						<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
					</xsl:call-template>
				</tspan>
				<tspan dx="0%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'SF'" />
						<xsl:with-param name="default" select="'SF'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<text x="17%" y="4.7%" style="font-size: 488%; font-weight:600; font-family:var(--theme-sub-heading-font)" data-max-width="45%">
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
					<xsl:value-of select="'For Sale!'" />
				</xsl:otherwise>
			</xsl:choose>
		</text>

		<text x="17%" y="15.9%" data-max-width="60%" fill="var(--theme-sub-heading-color)" font-weight="600" font-size="294%" font-family="var(--theme-body-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat( genie:indefinite-article( string(//area/name) ), ' ', //area/name, ' Gem')" />
			</xsl:call-template>
		</text>

		<text x="60.7%" y="5.7%" class="left" font-size="27" font-weight="400" font-family="var(--theme-sub-heading-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Presented by:'" />
				<xsl:with-param name="default" select="'Presented by:'" />
			</xsl:call-template>
		</text>

		<text x="60.7%" y="8.3%" class="left" font-size="238%" font-weight="400" fill="var(--theme-heading-color)" font-family="var(--theme-sub-heading-font)" data-max-width="25%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'marketingName'" />
				<xsl:with-param name="default" select="//agent[1]/marketingName" />
			</xsl:call-template>
		</text>

		<text x="60.7%" y="12.3%" class="left" font-size="206%" font-weight="400" fill="var(--theme-sub-heading-color)" font-family="var(--theme-sub-heading-font)" data-max-width="20%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'mobile'" />
				<xsl:with-param name="default" select="translate(//agent[1]/mobile, '-', '.')" />
			</xsl:call-template>
		</text>

		<text x="4.3%" y="1%" font-size="17" font-weight="600" font-family="var(--theme-sub-heading-font)" fill="var(--theme-body-color)" data-max-width="25%" class="left align-left upper">
			<xsl:value-of select="//agent[1]/marketingLicense" />
		</text>

		<image x="82.3%" y="7.8%" width="13%" height="16%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<!-- <xsl:choose>
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
		</xsl:choose> -->
		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="55.5%" y="87.7%" width="26.5%" id="logo" preserveAspectRatio="xMidYMin meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:choose>
									<xsl:when test="//output/@themeHue = 'light'">
										<xsl:value-of select="$companyLogo" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$companyLogoInverse" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="//output/@themeHue = 'light'">
										<xsl:value-of select="$personalLogo" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$personalLogoInverse" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="55.5%" y="87.4%" width="26.5%" id="logo" preserveAspectRatio="xMidYMin meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="//output/@themeHue = 'light'">
								<xsl:value-of select="$personalLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogoInverse" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
				<image x="89%" y="88.5%" width="7.8%" id="logo" preserveAspectRatio="xMidYMin meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="//output/@themeHue = 'light'">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$companyLogoInverse" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>
		<g id="agent-contact" style="transform: translateX(0%);">
			<xsl:call-template name="copyright" />
		</g>
	</xsl:template>
</xsl:stylesheet>