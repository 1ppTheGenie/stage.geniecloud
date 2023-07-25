<?xml version="1.0"?>
<!--
	Asset Name: Andy Tse Market Insider Report - 1
	Tags:		Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Open House
	Approved: 	True
	Roles:		andy-tse
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />
		<xsl:call-template name="mixed-listings" />
	</xsl:template>

	<xsl:template name="svg-body">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800" />
		<style>
			<xsl:value-of select="'
			text { dominant-baseline: middle; }
			.open-sans{ font-family: &quot;Open Sans&quot;, sans-serif !important; }
			.leaflet-interactive { fill:#3388ff; stroke:#3388ff; fill-opacity:0.2;}
			'"/>
		</style>

		<rect xmlns="" x="0%" y="0%" width="100%" height="16%" fill="var(--theme-heading-color)"></rect>
		<g>
			<text x="50%" y="5.5%" class="open-sans upper bold center" style="font-size:260%;" data-max-width="94%" fill="var(--theme-body-background)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
			</text>
			<text x="50%" y="12.5%" class="open-sans upper center" style="font-size:230%;" fill="var(--theme-body-background)">
				<tspan class="center">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="' MARKET INSIDER REPORT'" />
						<xsl:with-param name="default" select="' MARKET INSIDER REPORT'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<foreignObject x="0%" y="16%" width="70%" height="55%">
			<div data-width="70%" data-height="60%">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="'streets-v11'" />
					<xsl:with-param name="iconType" select="'flag'" />
				</xsl:call-template>
			</div>
		</foreignObject>

		<g xmlns="" style="transform: translate(70%, -17%);">
			<svg x="2%" y="36%" width="10%" height="9%" viewBox="0 0 313 348" fill="none"
				xmlns="http://www.w3.org/2000/svg">
				<rect x="15.5" y="71.0069" width="259" height="261" style="stroke:#c0c3c6;" stroke-width="31"/>
				<path d="M256.222 8.50694C217.822 30.5069 161.555 133.34 138.222 182.007C127.422 167.607 111.722 156.34 105.222 152.507C89.7221 143.366 72.7221 155.007 62.7222 164.507C52.7222 175.007 57.8888 187.174 62.7222 192.507C77.5222 208.907 94.5555 232.84 101.722 243.007C111.222 257.507 117.222 259.507 121.722 260.507C133.722 262.507 146.556 260.507 152.222 259.507C165.022 257.507 169.722 241.007 173.222 233.507C208.022 139.507 273.055 59.0069 301.222 30.5069C313.722 19.5069 312.722 16.5069 312.222 8.50694C308.222 -6.49306 268.44 1.50695 256.222 8.50694Z" fill="#fdb913"/>
			</svg>
			<text class="upper open-sans" fill="#2c3740" style="font-size:100%;font-weight: 700;line-height:18px;">
				<tspan x="11.7%" y="38%">AVERAGE</tspan>
				<tspan x="11.7%" dy="3%">Sale</tspan>
				<tspan x="11.7%" dy="3%">Prices</tspan>
			</text>
		</g>

		<g xmlns="" style="transform: translate(70%, -4.6%);">
			<svg x="2%" y="36%" width="10%" height="9%" viewBox="0 0 313 348" fill="none"
				xmlns="http://www.w3.org/2000/svg">
				<rect x="15.5" y="71.0069" width="259" height="261" style="stroke:#c0c3c6;" stroke-width="31"/>
				<path d="M256.222 8.50694C217.822 30.5069 161.555 133.34 138.222 182.007C127.422 167.607 111.722 156.34 105.222 152.507C89.7221 143.366 72.7221 155.007 62.7222 164.507C52.7222 175.007 57.8888 187.174 62.7222 192.507C77.5222 208.907 94.5555 232.84 101.722 243.007C111.222 257.507 117.222 259.507 121.722 260.507C133.722 262.507 146.556 260.507 152.222 259.507C165.022 257.507 169.722 241.007 173.222 233.507C208.022 139.507 273.055 59.0069 301.222 30.5069C313.722 19.5069 312.722 16.5069 312.222 8.50694C308.222 -6.49306 268.44 1.50695 256.222 8.50694Z" fill="#fdb913"/>
			</svg>
			<text class="upper open-sans" fill="#2c3740" style="font-size:100%;font-weight: 700;line-height:18px;">
				<tspan x="11.7%" y="39%">Value</tspan>
				<tspan x="11.7%" dy="3%">Changes</tspan>
			</text>
		</g>

		<g xmlns="" style="transform: translate(70%, 8%);">
			<svg x="2%" y="36%" width="10%" height="9%" viewBox="0 0 313 348" fill="none"
				xmlns="http://www.w3.org/2000/svg">
				<rect x="15.5" y="71.0069" width="259" height="261" style="stroke:#c0c3c6;" stroke-width="31"/>
				<path d="M256.222 8.50694C217.822 30.5069 161.555 133.34 138.222 182.007C127.422 167.607 111.722 156.34 105.222 152.507C89.7221 143.366 72.7221 155.007 62.7222 164.507C52.7222 175.007 57.8888 187.174 62.7222 192.507C77.5222 208.907 94.5555 232.84 101.722 243.007C111.222 257.507 117.222 259.507 121.722 260.507C133.722 262.507 146.556 260.507 152.222 259.507C165.022 257.507 169.722 241.007 173.222 233.507C208.022 139.507 273.055 59.0069 301.222 30.5069C313.722 19.5069 312.722 16.5069 312.222 8.50694C308.222 -6.49306 268.44 1.50695 256.222 8.50694Z" fill="#fdb913"/>
			</svg>
			<text class="upper open-sans" fill="#2c3740" style="font-size:100%;font-weight: 700;line-height:18px;">
				<tspan x="11.7%" y="38%">Homes</tspan>
				<tspan x="11.7%" dy="3%">Currently</tspan>
				<tspan x="11.7%" dy="3%">Listed</tspan>
			</text>
		</g>

		<g style="transform: translate(80%, 20%);">
			<text x="6%" y="38%" width="26%" height="8%" fill="#2c3740" class="open-sans center">
				<tspan class="upper  bold" style="font-size:120%;line-height:20px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'And Much '" />
						<xsl:with-param name="default" select="'And Much '" />
					</xsl:call-template>
				</tspan>
				<tspan x="6%" dy="4%" class="upper open-sans super-bold" style="font-size:140%;line-height:21px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'More...'" />
						<xsl:with-param name="default" select="'More...'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform: translate(0%, 72%);">
			<text x="35%" y="3.5%" width="65%" height="4%" class="open-sans center" fill="var(--theme-sub-heading-color)" data-max-width="65%">
				<tspan class="upper open-sans" style="font-size:148%;line-height:20px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Download this '" />
						<xsl:with-param name="default" select="'Download this '" />
					</xsl:call-template>
				</tspan>
				<tspan class="upper open-sans super-bold" style="font-size:148%;line-height:21px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Free '" />
						<xsl:with-param name="default" select="'Free '" />
					</xsl:call-template>
				</tspan>
				<tspan class="upper open-sans" style="font-size:148%;line-height:20px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Report '" />
						<xsl:with-param name="default" select="'Report '" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<rect xmlns="" x="0%" y="79%" width="100%" height="12%" fill="var(--theme-sub-heading-color)"/>

		<image x="2%" y="81%" width="27%" height="6%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/tgs-logo.png' )" />
			</xsl:attribute>
		</image>

		<image x="2%" y="87.5%" width="6%" height="1.9%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/intro-logo.png' )" />
			</xsl:attribute>
		</image>

		<text x="17%" y="87%" class="open-sans" fill="#fdb913" style="font-size:48%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentlicencesNumber'" />
				<xsl:with-param name="default" select="//agent[1]/licencesNumber" />
			</xsl:call-template>
		</text>

		<text x="72%" y="82.8%" style="font-size:125%;" class="open-sans upper align-right" fill="var(--theme-body-background)" data-max-width="30%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentname'" />
				<xsl:with-param name="default" select="concat( //agent[1]/firstName, '&#160;', //agent[1]/lastName )" />
			</xsl:call-template>
		</text>

		<text x="72%" y="87.5%" fill="var(--theme-body-background)" style="font-size:150%;" class="open-sans bold align-right">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentmobile'" />
				<xsl:with-param name="default" select="//agent[1]/mobile" />
			</xsl:call-template>
		</text>

		<image x="72%" y="64%" width="28%" height="29%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/andy-tse.png' )" />
			</xsl:attribute>
		</image>

		<rect xmlns="" x="0%" y="92%" width="100%" height="8%" fill="#dbd9d9"/>
		<text x="50%" y="96.5%" style="font-size:140%;" fill="#2c3740" class="upper open-sans bold" data-max-width="90%">
			<tspan class='center'>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname '" />
					<xsl:with-param name="default" select="concat( //area/name, ' #1 agent | 2018 | 2019 | 2020 | 2021 ' )" />
				</xsl:call-template>
			</tspan>
		</text>
	</xsl:template>
</xsl:stylesheet>
