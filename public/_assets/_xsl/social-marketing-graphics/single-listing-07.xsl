<?xml version="1.0"?>
<!--
	Asset Name:	Single Listing No.7
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			<!-- #logo {
					width: 30%;
					height:10%;
					transform: translateX(65%);
				} -->

				g#photos {
					transform: translate(2.5%, 14.5%);
				}

				g#photos image:first-of-type {
					width:60%;
					height:80%;
				}
				g#photos image:nth-of-type(2) {
					transform: translate( 61.5%, 0);
	    			width: 34%;
	    			height: 38.75%;
				}
				g#photos image:nth-of-type(3) {
					transform: translate( 61.5%, 41.25%);
					width: 34%;
					height: 38.75%;			
				}
'" />
		</style>
		<rect width="100%" height="100%" fill="var(--theme-body-background)" />

		<text x="2.5%" y="5%" class="h1 heading large bold" data-max-width="60%">
			<xsl:value-of select="//areas/area/name" />
		</text>
		<image x="80%" y="1%" width="18%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<g id="photos">
			<image preserveAspectRatio="xMinYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="image-1" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>

			<image preserveAspectRatio="xMinYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="image-2" />
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>

			<image preserveAspectRatio="xMinYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="image-3" />
					<xsl:with-param name="idx" select="3" />
				</xsl:call-template>
			</image>
		</g>

		<g transform="translate(60 482)">
			<filter x="-0.1" y="-0.3" width="1.2" height="1.6" id="transparent">
<feFlood flood-color="var(--theme-body-background)" flood-opacity="0.6" />

				<feComposite in="SourceGraphic" operator="xor" />
			</filter>
			<text x="0" y="0" filter="url(#transparent)">
				<tspan x="1%" y="2%" class="medium sub-heading">
<xsl:call-template name="listing-address-line-one" />

				</tspan>
				<tspan x="1%" y="7%" class="medium sub-heading">
<xsl:call-template name="listing-address-line-two" />

				</tspan>
			</text>
			<text x="0" y="0">
				<tspan x="1%" y="2%" class="medium sub-heading">
<xsl:call-template name="listing-address-line-one" />

				</tspan>
				<tspan x="1%" y="7%" class="medium sub-heading">
<xsl:call-template name="listing-address-line-two" />

				</tspan>
			</text>
		</g>
		<g style="transform:translate(93%,80%)">
			<filter x="-0.1" y="-0.3" width="1.2" height="1.7" id="solid">
<feFlood flood-color="var(--theme-body-background)" flood-opacity="0.6" />

				<feComposite in="SourceGraphic" operator="xor" />
			</filter>
			<text x="1%" y="3%" filter="url(#solid)" class="medium align-right upper sub-heading">
				<xsl:choose>
					<xsl:when test="//single/soldDate!=''">
						<tspan class="">Sold For </tspan>
<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />

					</xsl:when>
					<xsl:otherwise>
						<tspan class="">Asking </tspan>
<xsl:value-of select="format-number( //single/price, '$###,###')" />

					</xsl:otherwise>
				</xsl:choose>
			</text>
			<text x="1%" y="3%" class="medium align-right upper sub-heading">
				<xsl:choose>
					<xsl:when test="//single/soldDate!=''">
						<tspan class="">Sold For </tspan>
<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />

					</xsl:when>
					<xsl:otherwise>
						<tspan class="">Asking </tspan>
<xsl:value-of select="format-number( //single/price, '$###,###')" />

					</xsl:otherwise>
				</xsl:choose>
			</text>
		</g>

		<g id="footer" style="transform: translate(57.5%, 97.5%);">
			<text fill="var(--theme-heading-color)" style="transform: none;">Recipients to verify all information.</text>
		</g>
	</xsl:template>
</xsl:stylesheet>