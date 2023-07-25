<?xml version="1.0"?>
<!--
	Asset Name: Open House Postcard Back - No.8
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<g transform="translate(0 -20)">
			<svg y="0" x="59.5%">
				<polygon points="75,20 310,20 238,140, 0,140" fill="var(--theme-body-color)"></polygon>
			</svg>
			<svg y="0" x="69.2%">
				<polygon points="105,20 1039,20 1039,205 0,205" fill="var(--theme-sub-heading-color)"></polygon>
			</svg>
		</g>
		<svg x="43%" y="75%">
			<polygon points="0,0  160,0  56,141" fill="var(--theme-sub-heading-color)"></polygon>
		</svg>

		<svg x="29.4%" y="71.8%">
			<polygon points="0,20 156,20 208,160 55,160" fill="var(--theme-body-color)"></polygon>
		</svg>

		<image x="0" y="10%" width="100%" height="65%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<use x="1.5%" y="4.2%" width="3%" height="3%">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#globe-icon' )" />
		</use>
		<use x="17%" y="4%" width="3%" height="3%">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#email-icon' )" />
		</use>

		<g transform="translate(55 0)">
			<text x="0.5%" y="4%" style="font-size:100%;">

				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
			<text x="19%" y="4%" style="font-size:100%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmarketingEmail'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</text>
		</g>
		<svg y="54%" width="100%" height="22%">
			<polygon points="0,20 1800,20 1560,395 0,395" fill-opacity="0.7" fill="var(--theme-sub-heading-color)"></polygon>
		</svg>

		<text x="2%" y="58.5%" class="upper bold" fill="var(--theme-body-background)" style="font-size:300%;">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'dolorsimet'" />
					<xsl:with-param name="default" select="' dolor simet'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="2%" y="67.5%" class="upper" fill="var(--theme-body-background)" style="font-size:200%;">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'eturadipisicing'" />
					<xsl:with-param name="default" select="'consect etur adipisicing elit'" />
				</xsl:call-template>
			</tspan>
		</text>

		<rect x="0" y="75%" width="40%" height="1%" fill="var(--theme-body-color)"/>

		<image x="0" y="78%" width="14%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<text x="2%" y="89%" style="font-size:100%;">
			<xsl:call-template name="listing-address-line-one"/>
		</text>

		<text x="2%" y="92%" style="font-size:100%;">
			<xsl:call-template name="listing-address-line-two"/>
		</text>

		<g style="transform:translate(58%, 22%);">

			<text x="40%" y="52.5%" class="align-right upper bold" fill="var(--theme-body-color)" style="font-size:250%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'ipsumdolor'" />
						<xsl:with-param name="default" select="'lorem ipsum dolor'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="40%" y="60.7%" class="align-right upper" fill="var(--theme-sub-heading-color)" style="font-size:180%; font-weight:700;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'homeretailer'" />
						<xsl:with-param name="default" select="'your dream home retailer'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="40%" y="66.3%" class="align-right upper" fill="var(--theme-sub-heading-color)" style="font-size:160%; font-weight:600;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'dolorsitamet'" />
						<xsl:with-param name="default" select="'lorem ipsum dolor sit amet'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
