<?xml version="1.0"?>
<!--
	Asset Name:	LC-OH-POST-01
	Tags: 		Social Marketing Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Open House, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<image preserveAspectRatio="xMidYMid slice" width="100%" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(0%,20%);fill:var(--theme-body-background);">
<rect width="40%" height="61%" y="11%" fill="var(--theme-body-background)" fill-opacity="80%" />

			<g style="transform:translate(2.5%,0%);">
				<text x="0" y="13.5%" class="heading upper" font-size="110%" font-weight="700" style="letter-spacing:1px;" data-max-width="50%">
					<tspan>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singleaddressstreet'" />
							<xsl:with-param name="default" select="$listingAddressLine1" />
						</xsl:call-template>
					</tspan>
				</text>
				<text x="0" y="17.5%" class="heading" font-size="110%" font-weight="700" style="letter-spacing:1px;" data-max-width="50%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'yourneighbor'" />
						<xsl:with-param name="default" select="concat( 'in ',  upper-case( //area/name ) )" />
					</xsl:call-template>
				</text>

				<g style="transform: translatey(0.3%);">
					<foreignObject x="0%" y="22%" height="40%" width="50%" fill="#0000">
						<div style="padding:5px 15px;border:2px solid var(--theme-sub-heading-color);display:inline-block;font-family:var(--theme-heading-font);font-weight:400;font-size:380%;color:var(--theme-heading-color);margin: 0 0;line-height:120%;">
							<p class="upper" style="display:block;margin: 0 0;">
                            	Open
							</p>
							<p class="upper" style="display:block;margin-top:-15px;margin-bottom: 0;">
                            	house
							</p>
						</div>
					</foreignObject>
				</g>

				<g style="transform: translate(0, 51.8%);">
					<text x="0" y="0" class="heading" font-size="120%" font-weight="700" style="letter-spacing:1px;">

						<!-- Open House Example -->
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'oh-line-1'" />
							<xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date )" />
						</xsl:call-template>
					</text>
					<text x="0" y="4%" class="heading" font-size="100%" font-weight="700" style="letter-spacing:1px;">
						<!-- Open House Example -->
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'oh-line-2'" />
							<xsl:with-param name="default" select="concat( //openHouse/session[1]/@starts, ' - ', //openHouse/session[1]/@ends)" />
						</xsl:call-template>
					</text>
				</g>

				<text x="0%" y="60%" class="align-left heading" font-size="100%" font-weight="300">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Presented by:'" />
						<xsl:with-param name="default" select="concat('Presented by: ',//agent[1]/marketingName )" />
					</xsl:call-template>
				</text>

				<xsl:choose>
					<xsl:when test="$companyLogo='' or $personalLogo=''">
						<xsl:choose>
							<xsl:when test="$companyLogo=''">
								<image x="0%" y="63%" width="8%" height="8%" preserveAspectRatio="xMinYMid meet">
									<xsl:attribute name="href">
										<xsl:value-of select="$companyLogo" />
									</xsl:attribute>
								</image>
							</xsl:when>
							<xsl:otherwise>
								<image x="0%" y="63%" width="18%" height="8%" preserveAspectRatio="xMinYMid meet">
									<xsl:attribute name="href">
										<xsl:value-of select="$personalLogo" />
									</xsl:attribute>
								</image>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<image x="0%" y="63%" width="18%" height="8%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="$personalLogo" />
							</xsl:attribute>
						</image>
						<image x="20%" y="63%" width="8%" height="8%" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="$companyLogo" />
							</xsl:attribute>
						</image>
					</xsl:otherwise>
				</xsl:choose>
			</g>
		</g>

		<g id="footer" style="transform: translate(57.5%, 97.5%);">
			<text fill="var(--theme-heading-color)" style="transform: none;">Recipients to verify all information.</text>
		</g>
	</xsl:template>
</xsl:stylesheet>
