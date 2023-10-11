<?xml version="1.0"?>
<!--
    Asset Name: KRG Coming Soon Content Side
    Tags:       Direct Mail
    Sizes:      Postcard
Supports:   Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">

		<defs>
			<linearGradient id="lgrad" x1="0%" y1="52%" x2="100%" y2="48%">
				<stop offset="0%" style="stop-color:var(--theme-body-background);stop-opacity:0.81" />
				<stop offset="37%" style="stop-color:var(--theme-body-background);stop-opacity:0.85" />
				<stop offset="85%" style="stop-color:var(--theme-body-background);stop-opacity:0.96" />
				<stop offset="87%" style="stop-color:var(--theme-body-background);stop-opacity:0.97" />
				<stop offset="90%" style="stop-color:var(--theme-body-background);stop-opacity:0.99" />
				<stop offset="93%" style="stop-color:var(--theme-body-background);stop-opacity:1.00" />
				<stop offset="100%" style="stop-color:var(--theme-body-background);stop-opacity:1.00" />
			</linearGradient>
		</defs>
<rect x="0" y="0" width="50%" height="100%" fill="var(--theme-heading-color)" />

		<image x="0%" y="0%" width="50%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/krg-single-listing.jpg' )" />
			</xsl:attribute>
		</image>
<rect x="0" y="0" width="50%" height="100%" fill="url(#lgrad)" />


		<image x="36.5%" y="75%" width="13.5%" height="28.1%" preserveAspectRatio="xMinYMid meet">
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
		<line xmlns="" stroke="var(--theme-heading-color)" stroke-width="0.4%" x1="50%" x2="50%" y1="0" y2="100%"></line>
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">

		<g>
			<text x="4%" y="26%" class="bold middle" fill="var(--theme-heading-color)" style="letter-spacing: 1px;font-size:290%;font-family:var(--theme-heading-font)">
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
				<tspan fill="var(--theme-sub-heading-color)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'soon'" />
						<xsl:with-param name="default" select="' soon.'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="4%" y="80%" class="bold" style="font-size:150%; font-family: var(--theme-body-font);" data-max-width="30%" fill="var(--theme-heading-color)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentName'" />
						<xsl:with-param name="default" select="//agent[1]/marketingName" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="4%" y="84.9%" style="font-size:90%;font-weight:500;font-family: var(--theme-body-font);" data-max-width="32%" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</text>
			<text x="4%" y="89%" style="font-size:120%;font-family: var(--theme-body-font);" data-max-width="32%" fill="var(--theme-body-background)">
				<tspan fill="var(--theme-sub-heading-color)" class="bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'m'" />
						<xsl:with-param name="default" select="'m'" />
					</xsl:call-template>
				</tspan>
				<tspan x="6%" fill="var(--theme-heading-color)" style="font-weight:500;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select=" //agent[1]/mobile" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="4%" y="92%" fill="var(--theme-heading-color)" data-max-width="32%" style="font-family: var(--theme-body-font);font-size:120%;">
				<tspan dy="0.2%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'e'" />
						<xsl:with-param name="default" select="'e'" />
					</xsl:call-template>
				</tspan>
				<tspan x="6%" dy="0.5%" fill="var(--theme-heading-color)" style="font-weight:400; font-size:85%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</tspan>
			</text>
			<text class="upper bold" x="70%" y="30%" fill="var(--theme-heading-color)" style="letter-spacing: 1px;font-weight:800; font-family: var(--theme-body-font);">
				<tspan style="font-size:240%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'scanto'" />
						<xsl:with-param name="default" select="'SCAN TO'" />
					</xsl:call-template>
				</tspan>
				<tspan x="70%" dy="7%" style="font-size:180%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'becomean'" />
						<xsl:with-param name="default" select="'BECOME AN'" />
					</xsl:call-template>
				</tspan>
				<tspan x="70%" dy="5%" style="font-size:272%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'insider'" />
						<xsl:with-param name="default" select="'INSIDER'" />
					</xsl:call-template>
				</tspan>
			</text>

			<svg id="Layer_1" width="7%" height="11%" x="61.3%" y="33%" data-name="Layer 1"
				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 398.62 113.47" fill="var(--theme-heading-color)">
				<defs></defs>
				<title>arrow 3</title>
<polygon class="cls-1" points="61.38 113.47 75.03 98.82 29.37 56.41 75.63 14.65 61.99 0 0 56.41 61.38 113.47" />
<rect class="cls-1" x="28.81" y="46.73" width="369.82" height="20" />

			</svg>
		</g>

		<g style="transform:translate(35%, 21%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'30%'" />
				<xsl:with-param name="height" select="'35%'" />
			</xsl:call-template>
		</g>
	</xsl:template>
</xsl:stylesheet>