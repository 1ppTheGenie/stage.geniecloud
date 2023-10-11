<?xml version="1.0"?>
<!--
	Asset Name: Qr code postcard 2022 2
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">

		<image x="61%" y="0" width="39%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
				<xsl:with-param name="height" select="'35%'" />
			</xsl:call-template>
		</g>

		<g id="qr-code-2022-content-part-2" style="transform: translate(1.8%, 4%);">
			<text x="18%" y="10%" class="center upper" fill="var(--theme-body-color)" style="font-size: 150%; font-family:var(--theme-sub-heading-font);letter-spacing: 1px;font-weight:700;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="'ONE OF YOUR NEIGHBORS'" />
				</xsl:call-template>
			</text>

			<text x="18%" y="15.5%" class="center upper" fill="var(--theme-body-color)" style="font-size:200%;font-weight: 800;font-family:var(--theme-sub-heading-font);letter-spacing:2px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="'IS GETTING READY'" />
				</xsl:call-template>
			</text>

			<text x="18%" y="23%" class="center upper" fill="var(--theme-body-color)" style="font-size: 200%;font-weight:800;font-family:var(--theme-sub-heading-font); letter-spacing: 2px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'tosell'" />
					<xsl:with-param name="default" select="'TO SELL THEIR'" />
				</xsl:call-template>
			</text>
			<text x="18%" y="36.8%" class="center upper bold" style="font-size: 280%;font-family:var(--theme-heading-font); letter-spacing: 1px;dominant-baseline: auto;">
				<tspan fill="var(--theme-sub-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'home'" />
						<xsl:with-param name="default" select="'HOME'" />
					</xsl:call-template>
				</tspan>
				<tspan fill="var(--theme-body-color)">!</tspan>
			</text>

			<text x="18%" y="40.8%" class="center upper" fill="var(--theme-body-color)" style="font-size: 160%;font-weight:700;font-family:var(--theme-heading-font); letter-spacing: 1px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'scanqr'" />
					<xsl:with-param name="default" select="'SCAN THE QR CODE'" />
				</xsl:call-template>
			</text>

			<text x="18%" y="49%" class="center upper" fill="var(--theme-body-color)" style="font-size:160%;font-weight:700;font-family:var(--theme-sub-heading-font);">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'tobecome'" />
					<xsl:with-param name="default" select="'TO BECOME AN'" />
				</xsl:call-template>
			</text>
			<foreignObject x="0%" y="53.5%" class="center upper" width="36.5%" height="15%">
				<p class="center upper" style="margin:0;font-size:290%;font-family:var(--theme-sub-heading-font);color:var(--theme-sub-heading-color);display: inline-block;border-bottom: 3px solid;border-color: var(--theme-sub-heading-color);font-weight:800;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'insider'" />
						<xsl:with-param name="default" select="'INSIDER'" />
					</xsl:call-template>
				</p>
			</foreignObject>

			<text x="18%" y="68%" class="center upper" fill="var(--theme-body-color)" style="font-size:120%;font-weight:500;font-family:var(--theme-sub-heading-font);letter-spacing:1px;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'getearly'" />
					<xsl:with-param name="default" select="'AND GET EARLY ACCESS FOR A '" />
				</xsl:call-template>
			</text>
			<text x="18%" y="73%" class="center upper bold" fill="var(--theme-sub-heading-color)" style="font-size:300%;font-family:var(--theme-heading-font);letter-spacing:2px;font-weight:900;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'sneakpeek'" />
					<xsl:with-param name="default" select="'SNEAK PEEK'" />
				</xsl:call-template>
			</text>
		</g>
	</xsl:template>
</xsl:stylesheet>