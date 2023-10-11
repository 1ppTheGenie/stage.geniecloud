<?xml version="1.0"?>
<!--
	Asset Name: Just Sold No.1
	Tags: Social Marketing Ad
	Sizes: Postcard, Print
	Supports: Listing
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<image preserveAspectRatio="xMidYMid slice" width="100%" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
<rect width="100%" height="100%" fill="var(--theme-body-background)" fill-opacity="30%" />


		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g class="upper" style="transform: translateY(30%);">
			<text x="50%" y="1%" class="bold align-center sub-heading" style="font-size:580%">
					Just 
				<tspan text-decoration="line-through">Listed
				</tspan>
			</text>

			<g style="transform:translate(26%,22%);position:absolute;">
				<filter x="-0.05" y="-0.16" width="1.1" height="1.4" id="solid">
<feFlood flood-color="var(--theme-body-background)" />

					<feComposite in="SourceGraphic" operator="xor" />
				</filter>
				<text x="0" y="0%" filter="url(#solid)" class="upper" style="fill:var(--theme-body-color); font-size: 150%;">
					interested
				</text>
				<text x="0" y="0%" fill="#fff" class="upper" style="fill:var(--theme-body-color); font-size: 150%;">
					interested
				</text>
			</g>
			<g style="transform:translate(25%,30%);position:absolute;">
				<filter x="-0.05" y="-0.16" width="1.1" height="1.4" id="solid">
<feFlood flood-color="var(--theme-body-background)" />

					<feComposite in="SourceGraphic" operator="xor" />
				</filter>
				<text x="0" y="0%" filter="url(#solid)" class="upper" style="fill:var(--theme-body-color); font-size: 150%;">
					in selling?
				</text>
				<text x="0" y="0%" fill="#fff" class="upper" style="fill:var(--theme-body-color); font-size: 150%;">
					in selling?
				</text>
			</g>

			<text x="58%" y="16%" class="sub-heading bold align-center" data-max-width="30%" style="font-size:700%;fill: var(--theme-body-color);">
				Sold !
			</text>

			<image x="35%" y="49%" width="30%" height="17%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>