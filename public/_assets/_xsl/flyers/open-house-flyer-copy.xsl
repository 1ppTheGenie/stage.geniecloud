<?xml version="1.0"?>
<!--
	Asset Name: Open House Flyer
	Tags:		Direct Mail
	Sizes:		Letter
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<g>
			<image x="0" y="0" width="100%" height="45%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>

			<rect x="0" y="45%" fill="var(--theme-sub-heading-color)" width="100%" height="2%" />

			<g style="transform:translate(0%,43%)">
				<rect x="13%" y="-3%" fill="var(--theme-sub-heading-color)" width="75%" height="13.5%" />

				<text x="50%" y="-2%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" class="center upper" font-size="370%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'openhouse'" />
						<xsl:with-param name="default" select="'you’re invited'" />
					</xsl:call-template>
				</text>
				<text x="50%" y="0%" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" class="center upper" font-size="700%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'openhouse'" />
						<xsl:with-param name="default" select="'Open House'" />
					</xsl:call-template>
				</text>

				<xsl:if test="count(//openHouse/session) &gt; 0">
					<text x="50%" y="7.5%" class="center middle bold" fill="var(--theme-body-background)" font-family="var(--theme-heading-font)" text-anchor="middle" font-size="340%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'LC-OH-INVITE-01'" />
							<xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date, ' - ', //openHouse/session[1]/@starts, ' to ',//openHouse/session[1]/@ends)" />
						</xsl:call-template>
					</text>
				</xsl:if>
			</g>

			<g style="transform:translate(0%,57.5%)">
				<foreignObject x="0" width="100%" height="25%">
					<p class="center upper" style="font-size:440%;padding: 0 190px;margin:0;color:var(--theme-sub-heading-color);line-height:110%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourdreamhome'" />
							<xsl:with-param name="default" select="concat( 'Your New ' , //area/name , ' ', $singularPropertyType, ' is waiting for&#160;you!')" />
						</xsl:call-template>
					</p>
				</foreignObject>

				<text x="50%" y="14%" class="center upper" style="font-size:350%; letter-spacing:2px">
					<tspan x="50%">
						<xsl:value-of select="$listingAddressLine1" />
					</tspan>
					<tspan x="50%" dy="4%">
						<xsl:value-of select="$listingAddressLine2" />
					</tspan>
				</text>
			</g>

			<g style="transform:translate(0%,83%)">
				<rect fill="var(--theme-body-color)" width="100%" height="5%" />

				<g class="icon-stat" style="transform:translate(16%, -0.4%)">
					<use x="1%" y="1.4%" width="2%" height="3%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
					</use>
					<text class="medium" x="4%" y="2%" style=" fill:var(--theme-body-background)">
						<xsl:value-of select="concat(' Listed at ', format-number( //single/price, '$###,###') )" />
					</text>
				</g>
				<g class="icon-stat" style="transform:translate(44.5%, -0.4%)">
					<use x="0" y="1%" width="3%" height="4%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text class="medium" x="4%" y="2%" style=" fill:var(--theme-body-background)">
						<xsl:value-of select="concat( //single/bedrooms/@count, '&#32;Bedrooms')" />
					</text>
				</g>

				<g class="icon-stat" style="transform:translate(68%, -0.4%)">
					<use x="0" y="1%" width="3%" height="3%" fill="var(--theme-body-background)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text class="medium" x="4%" y="2%" style=" fill:var(--theme-body-background)">
						<xsl:value-of select="concat( $listingTotalBathrooms, '&#32;Bathrooms')" />
					</text>
				</g>
			</g>

			<g style="transform:translate(0%,88%)">
				<rect fill="var(--theme-sub-heading-color)" width="100%" height="12%" />

				<g style="transform:translatex(2%)">
					<image x="0" y="1%" width="12%" height="8%">
						<xsl:attribute name="href">
							<xsl:value-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
					<text x="13%" y="3.5%" fill="var(--theme-body-background)" style="font-size: 180%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentname'" />
							<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;' )" />
						</xsl:call-template>
					</text>
					<text x="13%" y="5.5%" fill="var(--theme-body-background)" style="font-size: 180%;" data-max-width="32%">
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
					<text x="13%" y="7.5%" fill="var(--theme-body-background)" style="font-size: 180%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
				</g>
				<image x="78%" y="2%" width="20%" height="7%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</g>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>