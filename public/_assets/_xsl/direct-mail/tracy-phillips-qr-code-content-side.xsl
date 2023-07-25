<?xml version="1.0"?>
<!--
	Asset Name: Tracy Phillips Qr Code Content Side
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/compass-sans.css')"/>
		</link>
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/compass-serif.css')"/>
		</link>

		<style>
			<xsl:value-of select="'text { dominant-baseline: central; }'"/>
		</style>

		<rect x="0" y="0" width="100%" height="100%" fill="#fff"/>

		<rect x="0" y="0" width="50%" height="20%" fill="#000"/>

		<rect x="0" y="90%" width="50%" height="10%" fill="#000"/>

		<rect x="0.8%" y="63%" width="49%" height="8%" fill="#f2f3f4"/>

		<rect x="0.8%" y="80%" width="49%" height="8%" fill="#f2f3f4"/>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
				<xsl:with-param name="height" select="'35%'" />
			</xsl:call-template>
		</g>

		<text x="25%" y="6%" class="center bold serif central" style="fill:white">
			<tspan style="font-size: 220%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Tracy’s'" />
					<xsl:with-param name="default" select="'Tracy’s Concierge'" />
				</xsl:call-template>
			</tspan>
			<tspan x="25%" dy="7%" style="font-size: 255%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Selling'" />
					<xsl:with-param name="default" select="'Selling Approach'" />
				</xsl:call-template>
			</tspan>
		</text>

		<foreignObject width="34%" height="100" x="4%" y="25%">
			<span style="margin:0;color:#000;font-size:127%;font-weight:900;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Partner'" />
					<xsl:with-param name="default" select="'We Partner &amp; Invest WITH YOU to	bring our resources to your&#160;table.'" />
				</xsl:call-template>
			</span>
		</foreignObject>

		<foreignObject width="34%" height="130" x="4%" y="40%" class="bold">
			<span style="color:#ab191d;font-size:112%;line-height:140%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'From '" />
					<xsl:with-param name="default" select="'From minor repairs to emodels, we invest OUR CASH into your home &amp; handle everything from start to finish. You collect a massive check when we close escrow. It’s that&#160;simple.'" />
				</xsl:call-template>
			</span>
		</foreignObject>

		<text x="4%" y="67.5%" fill="#000" style="font-size:125%;font-weight:600;" class="sans">
			<tspan >&#8226;</tspan>
			<tspan dx="1%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'better'" />
					<xsl:with-param name="default" select="'You sell a better home at a higher price'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="4%" y="76%" fill="#000" style="font-size:125%;font-weight:600;" class="sans">
			<tspan >&#8226;</tspan>
			<tspan dx="1%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'MONEY'" />
					<xsl:with-param name="default" select="'You get MORE MONEY in your pocket'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="4%" y="84.5%" fill="#000" style="font-size:125%;font-weight:600;" class="sans">
			<tspan >&#8226;</tspan>
			<tspan dx="1%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="' work'" />
					<xsl:with-param name="default" select="' We do all the work!  It’s a Win,Win!'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="24.5%" y="96.5%" style="font-size:235%;font-weight:600;fill:white" class="center serif">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Win'" />
				<xsl:with-param name="default" select="' It’s a Win,Win!'" />
			</xsl:call-template>
		</text>

		<foreignObject width="20%" height="45%" x="53%" y="45%">
			<p style="margin:0;color:#000;font-size:148%;font-weight:900;" class="serif">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'recent '" />
					<xsl:with-param name="default" select="concat( 'Our recent project on  ', //area/name, '&#160;View...')" />
				</xsl:call-template>
			</p>
		</foreignObject>

		<foreignObject width="20%" height="45%" x="53%" y="55%">
			<p style="margin:0;color:#000;font-size:148%;font-weight:900;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'recent '" />
					<xsl:with-param name="default" select="'Our recent project on Ridge&#160;View...'" />
				</xsl:call-template>
			</p>
			<p style="margin:0;color:#ab191d;font-size:104%; line-height:140%;-webkit-line-clamp: unset;" class="bold sans;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'seller'" />
					<xsl:with-param name="default" select="'Seller could’ve sold as is,
					instead we invested our	cash to remodel the kitchen. Seller made an aditional
					$50,000 on the sale. It’s that&#160;easy.'" />
				</xsl:call-template>
			</p>
		</foreignObject>

		<image x="60%" y="5%" width="25%" height="35%" preserveAspectRatio="xMidYMid slice" style=" filter: drop-shadow(5px 5px 6px rgba(191, 188, 170, 0.98));">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<text x="62%" y="9%" style="font-size: 130%; text-shadow: 1px 1px #0000004d;" class="upper bold sans" fill="#fff">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Before'" />
				<xsl:with-param name="default" select="' before'" />
			</xsl:call-template>
		</text>
		<image x="62%" y="37%" width="5%" height="8%" preserveAspectRatio="xMinYMid meet" style="filter:drop-shadow(1px 0px 0.8px #0000009e);">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/red_arrow_up.svg' )" />
			</xsl:attribute>
		</image>

		<image x="76%" y="30%" width="22%" height="55%" preserveAspectRatio="xMidYMid slice" style="filter: drop-shadow(5px 5px 6px rgba(191, 188, 170, 0.98)); ">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<text x="91%" y="81.5%" style="font-size: 130%; text-shadow: 1px 1px #0000004d;" class="upper bold sans" fill="#fff">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'Win'" />
				<xsl:with-param name="default" select="' after'" />
			</xsl:call-template>
		</text>

		<image x="72%" y="75%" width="7%" height="13%" preserveAspectRatio="xMinYMid meet" style="filter:drop-shadow(2px 1px 1.5px #0000009e);">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/icons/red_arrow.svg' )" />
			</xsl:attribute>
		</image>

		<image x="73%" y="89.5%" width="18%" height="9%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/phillips_group.png' )" />
			</xsl:attribute>
		</image>

		<image x="88%" y="88.5%" width="10%" height="10%" id="logo" preserveAspectRatio="xMaxYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/tracy_logo.png' )" />
			</xsl:attribute>
		</image>

		<line stroke="#ab191d" stroke-width="0.2%" x1="4%" x2="35%" y1="40%" y2="40%" height="50%" />
	</xsl:template>
</xsl:stylesheet>