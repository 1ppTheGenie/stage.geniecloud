<?xml version="1.0"?>
<!--
	Asset Name: NC-Frisco v2
	Tags:		NC, Social Marketing Ad
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Area
	Approved: 	True
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<xsl:call-template name="mixed-listings">
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'text {dominant-baseline: middle;}.leaflet-interactive {fill:#3388ff;stroke:#3388ff;fill-opacity:0.2;}'" />

		</style>

		<rect xmlns="" x="0%" y="0%" width="100%" height="16%" fill="var(--theme-body-background)"></rect>
		<g>
			<text x="50%" y="5.5%" class="upper super-bold center" style="font-family:var(--theme-heading-font); font-size:260%;" data-max-width="94%" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="concat(//area/name, ' ' , $propertyType)" />
				</xsl:call-template>
			</text>
			<text x="50%" y="12.5%" class="upper center" style="font-family:var(--theme-heading-font); font-size:250%;font-weight:300;" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="' MARKET INSIDER REPORT'" />
					<xsl:with-param name="default" select="' MARKET INSIDER REPORT'" />
				</xsl:call-template>
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

		<g xmlns="" style="transform: translate(69%, -17%);">

			<svg x="2%" y="36%" width="10%" height="9%" viewBox="0 0 313 348" fill="none"
				xmlns="http://www.w3.org/2000/svg">
<rect x="15.5" y="71.0069" width="259" height="261" style="stroke: var(--theme-sub-heading-color); opacity: 0.3;" stroke-width="31" />
<path d="M256.222 8.50694C217.822 30.5069 161.555 133.34 138.222 182.007C127.422 167.607 111.722 156.34 105.222 152.507C89.7221 143.366 72.7221 155.007 62.7222 164.507C52.7222 175.007 57.8888 187.174 62.7222 192.507C77.5222 208.907 94.5555 232.84 101.722 243.007C111.222 257.507 117.222 259.507 121.722 260.507C133.722 262.507 146.556 260.507 152.222 259.507C165.022 257.507 169.722 241.007 173.222 233.507C208.022 139.507 273.055 59.0069 301.222 30.5069C313.722 19.5069 312.722 16.5069 312.222 8.50694C308.222 -6.49306 268.44 1.50695 256.222 8.50694Z" fill="#c23434" />

			</svg>
			<text class="upper bold" fill="var(--theme-heading-color)" style="font-family:var(--theme-body-font); font-size:100%;">
				<tspan x="13%" y="38%">AVERAGE</tspan>
				<tspan x="13%" dy="3%">Sales</tspan>
				<tspan x="13%" dy="3%">Prices</tspan>
			</text>
		</g>

		<g xmlns="" style="transform: translate(69%, -4.6%);">

			<svg x="2%" y="36%" width="10%" height="9%" viewBox="0 0 313 348" fill="none"
				xmlns="http://www.w3.org/2000/svg">
<rect x="15.5" y="71.0069" width="259" height="261" style="stroke: var(--theme-sub-heading-color); opacity: 0.3;" stroke-width="31" />
<path d="M256.222 8.50694C217.822 30.5069 161.555 133.34 138.222 182.007C127.422 167.607 111.722 156.34 105.222 152.507C89.7221 143.366 72.7221 155.007 62.7222 164.507C52.7222 175.007 57.8888 187.174 62.7222 192.507C77.5222 208.907 94.5555 232.84 101.722 243.007C111.222 257.507 117.222 259.507 121.722 260.507C133.722 262.507 146.556 260.507 152.222 259.507C165.022 257.507 169.722 241.007 173.222 233.507C208.022 139.507 273.055 59.0069 301.222 30.5069C313.722 19.5069 312.722 16.5069 312.222 8.50694C308.222 -6.49306 268.44 1.50695 256.222 8.50694Z" fill="#c23434" />

			</svg>
			<text class="upper bold" fill="var(--theme-heading-color)" style="font-family:var(--theme-body-font);font-size:100%;">
				<tspan x="13%" y="38%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'homecondo'" />
						<xsl:with-param name="default" select="$singularPropertyType" />
					</xsl:call-template>
				</tspan>
				<tspan x="13%" dy="3%">Value</tspan>
				<tspan x="13%" dy="3%">Changes</tspan>
			</text>
		</g>

		<g xmlns="" style="transform: translate(69%, 8%);">

			<svg x="2%" y="36%" width="10%" height="9%" viewBox="0 0 313 348" fill="none"
				xmlns="http://www.w3.org/2000/svg">
<rect x="15.5" y="71.0069" width="259" height="261" style="stroke: var(--theme-sub-heading-color); opacity: 0.3;" stroke-width="31" />
<path d="M256.222 8.50694C217.822 30.5069 161.555 133.34 138.222 182.007C127.422 167.607 111.722 156.34 105.222 152.507C89.7221 143.366 72.7221 155.007 62.7222 164.507C52.7222 175.007 57.8888 187.174 62.7222 192.507C77.5222 208.907 94.5555 232.84 101.722 243.007C111.222 257.507 117.222 259.507 121.722 260.507C133.722 262.507 146.556 260.507 152.222 259.507C165.022 257.507 169.722 241.007 173.222 233.507C208.022 139.507 273.055 59.0069 301.222 30.5069C313.722 19.5069 312.722 16.5069 312.222 8.50694C308.222 -6.49306 268.44 1.50695 256.222 8.50694Z" fill="#c23434" />

			</svg>

			<text class="upper bold" fill="var(--theme-heading-color)" style="font-family:var(--theme-body-font);font-size:100%;">
				<tspan x="13%" y="38%">Homes</tspan>
				<tspan x="13%" dy="3%">Currently</tspan>
				<tspan x="13%" dy="3%">Listed</tspan>
			</text>
		</g>

		<g style="transform: translate(80%, 20%);">
			<text x="6%" y="38%" width="26%" height="8%" fill="var(--theme-heading-color)" class="center" font-family="var(--theme-body-font)">
				<tspan class="upper  bold" style="font-size:120%;line-height:20px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'And Much '" />
						<xsl:with-param name="default" select="'And Much '" />
					</xsl:call-template>
				</tspan>
				<tspan x="6%" dy="4%" class="upper bold" style="font-size:170%;line-height:21px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'More...'" />
						<xsl:with-param name="default" select="'More...'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform: translate(0%, 72%);">
			<text x="2.5%" y="3.5%" width="65%" height="4%" fill="var(--theme-heading-color)" data-max-width="55%" font-family="var(--theme-body-font)">
				<tspan class="upper" style="font-size:148%;line-height:20px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Download this '" />
						<xsl:with-param name="default" select="'Download this '" />
					</xsl:call-template>
				</tspan>
				<tspan class="upper super-bold" style="font-size:148%;line-height:21px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Free '" />
						<xsl:with-param name="default" select="'Free '" />
					</xsl:call-template>
				</tspan>
				<tspan class="upper" style="font-size:148%;line-height:20px;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Report '" />
						<xsl:with-param name="default" select="'Report '" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

<rect xmlns="" x="0%" y="79%" width="100%" height="12%" fill="var(--theme-body-background)" />


		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<image x="2.5%" y="81%" width="34%" height="8%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="$personalLogo=''">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$personalLogo" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="2.5%" y="79.5%" width="30%" height="6.5%" class="center" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
				<image x="8%" y="86%" width="17%" height="4%" class="center" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>
		<text x="70%" y="82%" font-size="130%" font-family="var(--theme-body-font)" class="upper align-right" fill="var(--theme-heading-color)" data-max-width="40%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentname'" />
				<xsl:with-param name="default" select="concat( //agent[1]/firstName, '&#160;', //agent[1]/lastName )" />
			</xsl:call-template>
		</text>
		<text x="70%" y="86%" font-size="130%" fill="var(--theme-heading-color)" font-family="var(--theme-body-font)" class="bold align-right">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentmobile'" />
				<xsl:with-param name="default" select="//agent[1]/mobile" />
			</xsl:call-template>
		</text>
		<text x="70%" y="89.5%" fill="var(--theme-heading-color)" fill-opacity="50%" font-size="50%" font-family="var(--theme-sub-heading-font)" class="align-right" data-max-width="30%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentlicencesNumber'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<image x="75%" y="64%" width="25%" height="28%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

<rect xmlns="" x="0%" y="92%" width="100%" height="8%" fill="var(--theme-sub-heading-color)" fill-opacity="0.8" />

		<text x="50%" y="96.5%" font-size="120%" font-family="var(--theme-body-font)" fill="var(--theme-heading-color)" class="upper bold center" data-max-width="65%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areaname '" />
				<xsl:with-param name="default" select="concat( 'Your ', //area/name, ' specialist' )" />
			</xsl:call-template>
		</text>
	</xsl:template>
</xsl:stylesheet>

