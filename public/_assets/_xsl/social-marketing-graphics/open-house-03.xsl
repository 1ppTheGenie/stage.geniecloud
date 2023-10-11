<?xml version="1.0"?>
<!--
	Asset Name:	Open House - No.3
	Tags: 		Open House
	Sizes:		Facebook, Instagram
	Supports:	Open House, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<g>
			<image x="2%" y="2%" width="70%" height="35%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<g style="transform: translate(2%,37%);">
				<rect width="70%" height="35%" fill="var(--theme-body-background)" fill-opacity="1" />
				<text x="35%" y="2%" class="heading center" style="font-size: 170%;">
					<tspan>
<xsl:value-of select="$singularPropertyType" />

					</tspan>
				</text>
				<text x="35%" y="8.5%" class="upper heading center" style="font-size: 270%">
					<xsl:call-template name="soldListedPrice" />
				</text>
				<g style="transform: translate(35%, 18%);">
					<!-- Open House Example -->
					<text x="0" y="0" class="heading normal" text-anchor="middle">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'oh-line-1'" />
							<xsl:with-param name="default" select="concat( //openHouse/session[1]/@dow, ', ', //openHouse/session[1]/@month, ' ', //openHouse/session[1]/@date )" />
						</xsl:call-template>
					</text>
					<text x="0" y="3%" class="heading normal" text-anchor="middle">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'oh-line-2'" />
							<xsl:with-param name="default" select="concat( //openHouse/session[1]/@starts, ' - ', //openHouse/session[1]/@ends)" />
						</xsl:call-template>
					</text>
				</g>

				<text x="35%" y="26%" class="heading normal center">
					<tspan>
						<xsl:value-of select="$listingAddressLine1" />
					</tspan>
					<tspan x="35%" dy="3%">
						<xsl:value-of select="$listingAddressLine2" />
					</tspan>
				</text>
			</g>

			<g style="transform: translate(2%,72%);">
				<image x="0" y="0" width="32%" height="25%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-2'" />
						<xsl:with-param name="idx" select="2" />
					</xsl:call-template>
				</image>
				<image x="32%" y="0" width="32%" height="25%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-3'" />
						<xsl:with-param name="idx" select="3" />
					</xsl:call-template>
				</image>
				<image x="64%" y="0" width="32%" height="25%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-4'" />
						<xsl:with-param name="idx" select="4" />
					</xsl:call-template>
				</image>
			</g>

			<image x="73%" y="17%" width="25%" height="20%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>

			<g style="transform: translate(74%,40%);">
				<text x="13%" y="0" class="heading center">
					<tspan style="font-size:150%; font-weight:bold;">

						<xsl:value-of select="//agent[1]/marketingName" />
					</tspan>
				</text>
				<text x="13%" y="5%" class="center bold heading">
					<tspan>
						<xsl:value-of select="//agent[1]/marketingEmail" />
					</tspan>
				</text>
				<text x="13%" y="9%" class="center heading bold">
					<xsl:value-of select="//agent[1]/mobile" />
				</text>
				<text x="13%" y="13%" class="center heading bold">
					<xsl:value-of select="//agent[1]/marketingLicense" />
				</text>
			</g>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>