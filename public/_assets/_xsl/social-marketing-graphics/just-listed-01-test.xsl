<?xml version="1.0"?>
<!--
	Asset Name:	Test
	Tags:		Social Marketing Ad
	Sizes:		Instagram-Square
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-heading-color)" />

		<rect width="100%" height="17%" fill="var(--printers-marks)" fill-opacity="0.7" />
		<g transform="translate(0 0)">

			<text x="50%" y="1%" class="upper center" style="font-family:var(--theme-heading-font); font-size:350%;font-weight:500;" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="' MARKET INSIDER REPORT'" />
					<xsl:with-param name="default" select="'i have an all cash buyer'" />
				</xsl:call-template>
			</text>
			<text x="50%" y="6%" class="upper center" style="font-family:var(--theme-heading-font); font-size:350%;font-weight:500;" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="' MARKET INSIDER REPORT'" />
					<xsl:with-param name="default" select="'looking for a home in'" />
				</xsl:call-template>
			</text>
			<text x="50%" y="10.8%" class="upper center" data-max-width="95%" style="font-family:var(--theme-heading-font); font-size:370%;font-weight:500;" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="' MARKET INSIDER REPORT'" />
					<xsl:with-param name="default" select="'carmel valley up to $2.7 million'" />
				</xsl:call-template>
			</text>
		</g>
		<image x="0" y="17%" width="100%" height="50%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<rect x="-0.1%" y="67%" width="75%" height="25%" fill="var(--theme-heading-color)" />
		<g style="transform: translate(5%, 68%);">
			<text x="6%" y="0%" width="65%" height="4%" font-size="150%" fill="var(--printers-marks)" data-max-width="55%" style="font-family:var(--theme-body-font);">
				<tspan class="upper" style="font-size:148%;line-height:20px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Download this '" />
						<xsl:with-param name="default" select="'when you area ready to sell '" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>
		<rect x="-0.1%" y="73%" width="75%" height="8%" fill="#c2c2c2" />
		<text x="10%" y="74%" class="upper" style="font-family:var(--theme-heading-font); font-size:300%;font-weight:700;" fill="#000">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="' MARKET INSIDER REPORT'" />
<xsl:with-param name="default" select="' call sally  sells &#124; (888) 425-2300'" />

			</xsl:call-template>
		</text>

		<text x="28%" y="82%" class="upper bold " style="font-family:var(--theme-heading-font); font-size:350%;font-weight:300; font-weight:bold;" fill="#ff0000">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="' MARKET INSIDER REPORT'" />
				<xsl:with-param name="default" select="' your  logo'" />
			</xsl:call-template>
		</text>

		<text x="31%" y="88%" class="upper bold " style="font-family:var(--theme-heading-font); font-size:125%;font-weight:300; font-weight:bold;" fill="#000">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="' MARKET INSIDER REPORT'" />
				<xsl:with-param name="default" select="'CA BRE #: 12365478'" />
			</xsl:call-template>
		</text>

		<rect xmlns="" x="75%" y="64%" width="25%" height="28%" fill="#cdcdcd"></rect>
		<image x="75%" y="64%" width="25%" height="28%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
<rect xmlns="" x="85%" y="21%" width="15%" height="7%" fill="red" />


		<text x="92.5%" y="22%" style="font-size:300%; font-family:var(--theme-body-font);" fill="var(--theme-heading-color)" class="upper bold" data-max-width="65%">
			<tspan class='center upper'>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname '" />
					<xsl:with-param name="default" select="'SOLD'" />
				</xsl:call-template>
			</tspan>
		</text>

<rect xmlns="" x="0%" y="92%" width="100%" height="8%" fill="var(--printers-marks)" />

		<text x="50%" y="93%" style="font-size:300%; font-family:var(--theme-body-font);" fill="var(--theme-heading-color)" class="upper bold" data-max-width="65%">
			<tspan class='center upper'>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname '" />
					<xsl:with-param name="default" select="'#1 beverly hills agent'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="50%" y="98.1%" style="font-size:50%; font-family:var(--theme-body-font);" fill="var(--theme-heading-color)" class="upper bold" data-max-width="65%">
			<tspan class='center'>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname '" />
					<xsl:with-param name="default" select="'hello world hdgfkj nuih jh di'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="9%" y="98.1%" style="font-size:50%; font-family:var(--theme-body-font);" fill="var(--theme-heading-color)" class="upper bold" data-max-width="65%">
			<tspan class='center'>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname '" />
					<xsl:with-param name="default" select="'hello world iughuiwh yugheiagr '" />
				</xsl:call-template>
			</tspan>
		</text>

		<g id="footer">
			<text fill="var(--theme-heading-color)">Recipients to verify all information.</text>
		</g>
	</xsl:template>
</xsl:stylesheet>