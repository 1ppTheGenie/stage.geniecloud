<?xml version="1.0"?>
<!--
	Asset Name:	LC-PROP-POST-06
	Tags:		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
    <xsl:import href="common.xsl" />
    <xsl:import href="lc-social-media.xsl" />
    <xsl:import href="lc-prop-posts.xsl" />
    <xsl:template name="svg-body">
    <style>
			<xsl:value-of select="'
				g#agent-contact{
					transform: translate(2.5%, 98.3%);
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
        <clipPath id="polyClip1">
            <polygon points="1080,0 1080,762 800,787 0,730 0,0" />
        </clipPath>

        <image preserveAspectRatio="xMidYMid slice" width="100%" height="74%" clip-path="url(#polyClip1)">
            <xsl:call-template name="switch-image">
                <xsl:with-param name="idx" select="1" />
                <xsl:with-param name="preferPrimary" select="'true'" />
            </xsl:call-template>
        </image>

        <filter x="-0.1" y="-0.4" width="1.2" height="1.8" id="solid">
            <feFlood flood-color="var(--theme-sub-heading-color)" />
            <feComposite in="SourceGraphic" operator="xor" />
        </filter>

        <text x="3.8%" y="74.4%" font-weight="600" class="upper" font-size="45" font-family="var(--theme-sub-heading-font)" fill="var(--theme-sub-heading-color)">
            <xsl:choose>
                <xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12) or number(//single/statusTypeID)=14">
                    <xsl:value-of select="'NOW PENDING!'" />
                </xsl:when>
                <xsl:when test="number(//single/statusTypeID)=2">
                    <xsl:value-of select="'Just Sold!'" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'For Sale!'" />
                </xsl:otherwise>
            </xsl:choose>
        </text>

        <text x="3.8%" y="79.5%" font-weight="700" data-max-width="60%" font-size= "45" font-family="var(--theme-sub-heading-font)" fill="var(--theme-heading-color)" >
            <xsl:value-of select="$singularPropertyType" />
        </text>

        <text x="3.8%" y="86%" class="" font-family="var(--theme-sub-heading-font)" font-size="18" font-weight="400" fill="var(--theme-heading-color)">
            <xsl:call-template name="editable">
                <xsl:with-param name="id" select="'Presented By:'" />
                <xsl:with-param name="default" select="'Presented By:'" />
            </xsl:call-template>
        </text>

        <image x="66.5%" y="51.6%" width="28.1%" height="34.2%" preserveAspectRatio="xMidYMax">
            <xsl:attribute name="href">
                <xsl:value-of select="//agent[1]/photo" />
            </xsl:attribute>
        </image>

        <text x="80.8%" y="86.4%" class=" center" font-family="var(--theme-sub-heading-font)" font-size="40" font-weight="300" fill="var(--theme-heading-color)">
            <xsl:call-template name="editable">
                <xsl:with-param name="id" select="'marketingName'" />
                <xsl:with-param name="default" select="//agent[1]/marketingName" />
            </xsl:call-template>
        </text>

        <text x="80.6%" y="90.8%" class=" center" font-family="var(--theme-sub-heading-font)" font-size="40" font-weight="300" fill="var(--theme-sub-heading-color)">
            <xsl:call-template name="editable">
                <xsl:with-param name="id" select="'marketingmobile'" />
                <xsl:with-param name="default" select="translate(//agent[1]/mobile, '-', '.')" />
            </xsl:call-template>
        </text>

        <text x="80.6%" y="95.2%" class=" center" font-family="var(--theme-heading-font)" font-size="65%" font-weight="100" fill="var(--theme-sub-heading-color)">
            <xsl:value-of select="//agent[1]/marketingLicense" />
        </text>

        <!-- <xsl:choose>
            <xsl:when test="$companyLogo='' or $personalLogo=''">
                <image x="3.8%" y="91%" width="20%" height="7%" id="logo" preserveAspectRatio="xMinYMid meet">
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
                <image x="3.8%" y="91%" width="30%" class="" preserveAspectRatio="xMinYMin meet">
                    <xsl:attribute name="href">
                        <xsl:value-of select="$personalLogo" />
                    </xsl:attribute>
                </image>
                <image x="36%" y="90%" width="11%" class="" preserveAspectRatio="xMidYMin meet">
                    <xsl:attribute name="href">
                        <xsl:value-of select="$companyLogo" />
                    </xsl:attribute>
                </image>
            </xsl:otherwise>
        </xsl:choose> -->
        <!-- <image x="3.8%" y="88%" width="21.5%" class="" preserveAspectRatio="xMinYMin meet" preserveAspectRatio="xMidYMid meet">
			<xsl:choose>
				<xsl:when test="//output/@themeHue='dark'">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoDark" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoLight" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</image>
        <image x="32.5%" y="88.6%" width="7%" class="" preserveAspectRatio="xMidYMin meet">
			<xsl:choose>
				<xsl:when test="//output/@themeHue='dark'">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/companyLogoDark" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/companyLogoLight" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</image> -->
        <xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="3.8%" y="88%" width="21.5%" preserveAspectRatio="xMinYMid meet">
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
				<image x="3.8%" y="88.3%" width="21.5%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="//output/@themeHue='dark'">
								<xsl:value-of select="$personalLogoInverse" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogo" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
				<image x="32.5%" y="88.6%" width="7%" class="" preserveAspectRatio="xMidYMin meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="//output/@themeHue='dark'">
								<xsl:value-of select="$companyLogoInverse" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$companyLogo" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>    
        <g id="agent-contact" style="transform: translate( 0%, 0.6%);">
            <xsl:call-template name="copyright" />
        </g>
    </xsl:template>
</xsl:stylesheet>