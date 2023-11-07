<?xml version="1.0"?>
<!--
    Asset Name: ED Kaminsky Postcard 2022 3
    Tags:       Direct Mail
    Sizes:      Postcard
Supports:   Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">

		<rect x="0" y="0" width="50%" height="100%" fill="#ffffff"></rect>
		<image x="0%" y="0" width="50%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/dollar.jpg' )" />
			</xsl:attribute>
		</image>
		<svg xmlns="http://www.w3.org/2000/svg" width="50%" height="100%">
			<defs>
				<linearGradient id="lgrad" x1="0%" y1="52%" x2="100%" y2="48%">

					<stop offset="0%" style="stop-color:#0e1232;stop-opacity:0.81" />
					<stop offset="37%" style="stop-color:#0e1232;stop-opacity:0.85" />
					<stop offset="85%" style="stop-color:#0e1232;stop-opacity:0.96" />
					<stop offset="87%" style="stop-color:#0e1232;stop-opacity:0.97" />
					<stop offset="90%" style="stop-color:#0e1232;stop-opacity:0.99" />
					<stop offset="93%" style="stop-color:#0e1232;stop-opacity:1.00" />
					<stop offset="100%" style="stop-color:#0e1232;stop-opacity:1.00" />
				</linearGradient>
			</defs>
			<rect x="0" y="0" width="100%" height="100%" fill="url(#lgrad)" />

		</svg>
		<image x="39.5%" y="73.2%" width="13.5%" height="26.8%" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		<image x="50%" y="0" width="50%" height="100%" preserveAspectRatio="xMidYMid slice" style="filter:blur(3px) brightness(0.9);">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<line xmlns="" stroke="#ffffff" stroke-width="0.4%" x1="50%" x2="50%" y1="0" y2="100%"></line>
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/smooch.css')" />

		</link>

		<g>

			<text x="4%" y="26%" class="bold middle" fill="#ffffff" style="font-family:'futura';letter-spacing: 1px;font-size:290%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'oneofyour'" />
						<xsl:with-param name="default" select="'One of your'" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'neighborsis'" />
						<xsl:with-param name="default" select="'neighbors is'" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'sellingtheir'" />
						<xsl:with-param name="default" select="'selling their'" />
					</xsl:call-template>
				</tspan>
				<tspan x="4%" dy="8%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'home'" />

						<xsl:with-param name="default" select="lower-case( $singularPropertyType )" />
					</xsl:call-template>
				</tspan>
				<tspan fill="#b2934e">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'soon'" />
						<xsl:with-param name="default" select="' soon.'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="4%" y="85%" class="bold" style="font-size:115%;font-family:'futura';" fill="#ffffff">
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
			<text x="4%" y="88.6%" style="font-size:75%;font-weight:500;font-family:'futura';" fill="#ffffff">
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

			<text x="17.5%" y="87.5%" fill="#ffffff">
				<tspan dy="0.5%" class="bold" fill="#b2934e" style="font-size:100%;font-family:'futura';">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'e'" />
						<xsl:with-param name="default" select="'e'" />
					</xsl:call-template>
				</tspan>
				<tspan x="19.2%" dy="1%" fill="#ffffff" style="font-weight:400; font-size:55%;font-family:'futura';">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="32%" y="83%" font-size="210%" font-weight="900" fill="#b2934e" font-family="Smooch" font-style="italic" data-max-width="10%" style="transform: rotate(353deg) translate(-95px, 50px);">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingName" />
				</xsl:call-template>
			</text>

			<text class="upper bold" fill="#ffffff" style=" font-family:'futura';letter-spacing: 1px;font-weight:800;">
				<tspan x="70%" y="30%" style="font-size:240%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scanto'" />
						<xsl:with-param name="default" select="'SCAN TO'" />
					</xsl:call-template>
				</tspan>
				<tspan x="70%" y="35.5%" style="font-size:180%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'becomean'" />
						<xsl:with-param name="default" select="'BECOME AN'" />
					</xsl:call-template>
				</tspan>
				<tspan x="70%" y="39.1%" style="font-size:272%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'insider'" />
						<xsl:with-param name="default" select="'INSIDER'" />
					</xsl:call-template>
				</tspan>
			</text>

			<svg width="7%" height="11%" x="61.3%" y="33%" viewBox="0 0 398.62 113.47" fill="#ffffff">
				<polygon class="cls-1" points="61.38 113.47 75.03 98.82 29.37 56.41 75.63 14.65 61.99 0 0 56.41 61.38 113.47" />
				<rect class="cls-1" x="28.81" y="46.73" width="369.82" height="20" />
			</svg>

			<image x="69%" y="84%" width="19%" height="10%" class="center" id="logo" preserveAspectRatio="xMinYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-direct-mail-logo-1.png' )" />
				</xsl:attribute>
			</image>
			<image x="90%" y="85.8%" width="7%" height="6%" class="center" id="logo" preserveAspectRatio="xMinYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/cush-direct-mail-logo-2.png' )" />
				</xsl:attribute>
			</image>
		</g>

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
			</xsl:call-template>
		</g>
	</xsl:template>
</xsl:stylesheet>