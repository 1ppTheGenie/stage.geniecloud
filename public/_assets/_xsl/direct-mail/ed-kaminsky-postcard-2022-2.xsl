<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Postcard 2022 2
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<defs>
			<linearGradient id="lgrad">
				<stop offset="0%" style="stop-color:#0e1232;stop-opacity:0.81" />
				<stop offset="37%" style="stop-color:#0e1232;stop-opacity:0.85" />
				<stop offset="85%" style="stop-color:#0e1232;stop-opacity:0.96" />
				<stop offset="87%" style="stop-color:#0e1232;stop-opacity:0.97" />
				<stop offset="90%" style="stop-color:#0e1232;stop-opacity:0.99" />
				<stop offset="93%" style="stop-color:#0e1232;stop-opacity:1.00" />
				<stop offset="100%" style="stop-color:#0e1232;stop-opacity:1.00" />
			</linearGradient>
		</defs>

		<image x="0" y="0" width="50%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/dollar.jpg' )" />
			</xsl:attribute>
		</image>

		<rect x="0" y="0" width="50%" height="100%" fill="url(#lgrad)" />


		<image x="39.5%" y="73.2%" width="13.5%" height="26.8%" preserveAspectRatio="xMidYMax meet">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<image x="50%" y="0%" width="50%" height="50%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<image x="50%" y="50%" width="50%" height="50%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<xsl:call-template name="cropped-container" />

		<line stroke="#fff" stroke-width="0.3%" x1="50%" x2="50%" y1="0" y2="100%" />

		<line stroke="#fff" stroke-width="0.3%" x1="50%" x2="100%" y1="50%" y2="50%" />

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
				<xsl:with-param name="height" select="'35%'" />
			</xsl:call-template>
		</g>
	</xsl:template>

	<xsl:template name="cropped-content">
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/smooch.css')" />

		</link>

		<image x="4%" y="6%" width="19%" height="10%" id="logo" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-direct-mail-logo-1.png' )" />
			</xsl:attribute>
		</image>
		<image x="24%" y="7.5%" width="7%" height="7%" class="center" id="logo" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-direct-mail-logo-2.png' )" />
			</xsl:attribute>
		</image>

		<g>
			<xsl:variable name="status-caption">
				<xsl:choose>
					<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<xsl:value-of select="'In Escrow..'" />
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=2">
						<xsl:value-of select="'Just Sold...'" />
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=14">
						<xsl:value-of select="'Coming Soon...'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Just Listed...'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<text x="4%" y="25.5%" class="bold middle" fill="#ffffff" style="font-family:'futura';font-size:320%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'justlisted'" />
						<xsl:with-param name="default" select="$status-caption" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'buthowdoes'" />
						<xsl:with-param name="default" select="'but how does'" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%" fill="#b2934e">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'youhomes'" />

						<xsl:with-param name="default" select="concat('your ', lower-case( $singularPropertyType ) )" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'compare'" />
						<xsl:with-param name="default" select="'compare?'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="4%" y="58.7%" class="bold" fill="#ffffff" style="font-family:'futura'; font-size:124%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scan'" />
						<xsl:with-param name="default" select="'SCAN TO FIND OUT '" />
					</xsl:call-template>
				</tspan>
				<tspan fill="#b2934e">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'instantly'" />
						<xsl:with-param name="default" select="'INSTANTLY.'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<text x="4%" y="85%" class="bold" style="font-size:115%;font-family:'futura';" fill="#ffffff" data-max-width="11%">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentfirstName'" />
					<xsl:with-param name="default" select="//agent[1]/firstName" />
				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:text>&#160;</xsl:text>
			</tspan>
			<tspan fill="#b2934e">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentlastname'" />
					<xsl:with-param name="default" select="//agent[1]/lastName" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="4%" y="88.6%" style="font-size:75%;font-weight:500;font-family:'futura';" fill="#ffffff" data-max-width="11%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<rect x="16%" y="85.5%" width="0.13%" height="5.6%" fill="#b2934e"></rect>

		<text x="17.5%" y="85.5%" style="font-size:90%;font-family:'futura';" fill="#0e1232">
			<tspan fill="#b2934e" class="bold">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'m'" />
					<xsl:with-param name="default" select="'m'" />
				</xsl:call-template>
			</tspan>
			<tspan x="19.2%" fill="#ffffff" style="font-weight:500;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select=" //agent[1]/mobile" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="17.5%" y="87.5%" fill="#ffffff" data-max-width="13%">
			<tspan dy="0.2%" class="bold" fill="#b2934e" style="font-size:100%;font-family:'futura';">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'e'" />
					<xsl:with-param name="default" select="'e'" />
				</xsl:call-template>
			</tspan>
			<tspan x="19.2%" dy="0.5%" fill="#ffffff" style="font-weight:400; font-size:75%;font-family:'futura';">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmarketingEmail'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="75%" y="88%" data-max-width="30%" class="center upper" fill="#ffffff" style="font-family:'futura';font-size:135%;font-weight:600;text-shadow: 1px 1px 2px #0e1232;">
			<tspan>
				<xsl:value-of select="//single/address/street" />
				<xsl:text> &#8226; </xsl:text>
				<xsl:value-of select="//single/address/city" />
			</tspan>
		</text>

		<text x="32%" y="83%" font-size="210%" font-weight="900" fill="#b2934e" font-family="Smooch" font-style="italic" data-max-width="10%" style="transform: rotate(353deg) translate(-95px, 50px);">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingName" />
			</xsl:call-template>
		</text>

		<svg class="scan-svg-icon"  x="0.8%" y="47%" width="41%" height="22%" viewBox="0 0 2000 452">
			<path fill="#eeac27" d="M1757.79,75.26c-58.07,0-105.31,47.24-105.31,105.31v117.14c0,42.23-34.36,76.59-76.59,76.59H136.91v11.53 h1438.98c48.59,0,88.12-39.53,88.12-88.12V180.57c0-51.71,42.07-93.78,93.78-93.78h114.2V75.26H1757.79z" />
			<polygon fill="#eeac27" points="1841.9,44.98 1834.31,53.66 1865.73,81.13 1835.02,109.35 1842.82,117.84 1883,80.92" />
		</svg>
	</xsl:template>
</xsl:stylesheet>