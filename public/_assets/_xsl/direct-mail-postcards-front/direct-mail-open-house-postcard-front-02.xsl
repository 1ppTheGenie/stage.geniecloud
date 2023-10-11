<?xml version="1.0"?>
<!--
	Asset Name: Open House Postcard front 02
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House, Print
	Permission:	Direct Mail
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<image x="0" y="0" width="57%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
<rect x="0" width="57%" height="100%" fill-opacity="0.8" fill="var(--theme-sub-heading-color)" />


		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<text x="28.5%" y="10.5%" class="upper center narrow" fill="var(--theme-body-background)" style="font-size:150%;">
<xsl:call-template name="listing-address-line-one" />

			<xsl:text>, </xsl:text>
<xsl:call-template name="listing-address-line-two" />

		</text>

<rect stroke="var(--theme-body-background)" stroke-width="2" fill-opacity="0" x="4%" y="19%" width="49%" height="47%" />


		<image x="4.12%" y="19.2%" width="48.8%" height="46.7%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<text x="28.5%" y="70%" class="center narrow" fill="var(--theme-body-background)" style="font-size:160%;">
			<tspan class="center">
<xsl:value-of select="$singularPropertyType" />

			</tspan>
		</text>

		<g style="transform:translate(7%,80%)">
			<svg viewBox="0 0 100 100">
				<circle cx="-34" cy="6%" r="5.3" fill="var(--theme-body-background)"></circle>
				<use x="-46.2%" y="3.8%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
				</use>
				<text x="-28.5%" y="2.3%" class="center" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
					<tspan x="-23%" dy="0%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singlebedroomscount'" />
							<xsl:with-param name="default" select="//single/bedrooms/@count" />
						</xsl:call-template>
					</tspan>
					<tspan x="-23%" dy="4%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'beds'" />
							<xsl:with-param name="default" select="'Beds'" />
						</xsl:call-template>
					</tspan>
				</text>
			</svg>
			<svg viewBox="0 0 100 100" x="13%">
				<circle cx="-31" cy="6%" r="5.3" fill="var(--theme-body-background)"></circle>
				<use x="-43.5%" y="3.8%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
				</use>
				<text x="-28.5%" y="2.3%" class="center" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
					<tspan x="-20%" dy="0%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singlebathrooms'" />
							<xsl:with-param name="default" select="$listingTotalBathrooms" />
						</xsl:call-template>
					</tspan>
					<tspan x="-20%" dy="4%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'baths'" />
							<xsl:with-param name="default" select="'Baths'" />
						</xsl:call-template>
					</tspan>
				</text>
			</svg>
			<svg viewBox="0 0 100 100" x="6%">
				<circle cx="10" cy="6%" r="5.3" fill="var(--theme-body-background)"></circle>
				<use x="-2%" y="3.5%" width="25%" height="4" fill="var(--theme-sub-heading-color)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#size-icon' )" />
				</use>
				<text x="9%" y="2.5%" class="center" style="font-size: 17%;font-weight:600;" fill="var(--theme-body-background)">
					<tspan x="20.5%" dy="0%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singlesquareFeet'" />
							<xsl:with-param name="default" select="format-number( //single/squareFeet, '###,###' )" />
						</xsl:call-template>
					</tspan>
					<tspan x="20.5%" dy="4%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'sq.ft'" />
							<xsl:with-param name="default" select="'Sq.Ft.'" />
						</xsl:call-template>
					</tspan>
				</text>
			</svg>
		</g>

		<g style="transform:translateX(53%)">
			<text x="27%" y="3%" class="center" style="font-size:130%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'information'" />
					<xsl:with-param name="default" select="'This information is presented by:'" />
				</xsl:call-template>
			</text>

			<g style="transform: translate(8.6%, -2%);">
				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
<circle r=".3500" cx=".5" cy=".5" />

				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="0%" y="10%" width="14%" height="24%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>

				<g style="transform: translate(2%, 0);">
					<text class="h1" x="11%" y="10%" style="font-size:150%;">

						<tspan >
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentname'" />
								<xsl:with-param name="default" select="//agent[1]/marketingName" />
							</xsl:call-template>
						</tspan>
					</text>

					<text x="11%" y="15%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'innovatorrealtor'" />
							<xsl:with-param name="default" select="'Innovator REALTOR'" />
						</xsl:call-template>
					</text>
					<text x="11%" y="19%" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
					<text x="11%" y="23%" fill="var(--theme-sub-heading-color)" style="font-size:150%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>
					<text x="11%" y="28%" style="font-size:120%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</text>
				</g>
			</g>

			<image x="19.8%" y="33%" width="14%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<text x="27%" y="47%" class="center" style="font-size:120%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentaddress'" />
						<xsl:with-param name="default" select="//agent[1]/address/street" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="27%" y="51%" class="center" style="font-size:120%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentaddress'" />
						<xsl:with-param name="default" select="//agent[1]/address/city" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentaddress'" />
						<xsl:with-param name="default" select="//agent[1]/address/state" />
					</xsl:call-template>
				</tspan>
				<tspan></tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentaddress'" />
						<xsl:with-param name="default" select="//agent[1]/address/zip" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="27%" y="88%" class="center" style="font-size:120%;text-transform:capitalize;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="'become your neighborhood genius at'" />
				</xsl:call-template>
			</text>
			<text x="27%" y="92%" class="center bold" style="font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
		</g>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>