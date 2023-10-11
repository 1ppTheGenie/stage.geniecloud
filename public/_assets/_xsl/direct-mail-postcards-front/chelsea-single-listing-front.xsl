<?xml version="1.0"?>
<!--
	Asset Name:	Chelsea Single Listing Front
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area
	Approved: 	True
	Access:		d817681d-3527-445d-b053-79f933fb03fc
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="chelsea-checkbox">
<xsl:param name="line1" />
<xsl:param name="line2" />


		<svg height="20%" width="20%">
			<use x="15%" y="20%" width="60%" height="60%">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#check-icon' )" />
			</use>
		</svg>

		<g style="transform:translate(13%,6%);">
			<text y="0" class="upper" font-family="Futura Condensed">
				<tspan fill="#333" font-size="160%" font-weight="500">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="$line1" />
						<xsl:with-param name="default" select="$line1" />
					</xsl:call-template>
				</tspan>
			</text>
			<text y="5%" class="upper" font-family="Futura Condensed">
				<tspan fill="#333" font-size="160%" font-weight="500">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="$line2" />
						<xsl:with-param name="default" select="$line2" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>
	</xsl:template>

	<xsl:template name="svg-body">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-condensed.css')" />

		</link>

		<defs>
			<linearGradient id="bottomShadow" gradientTransform="rotate(90)">
<stop offset="80%" stop-color="#000" stop-opacity="0" />
<stop offset="100%" stop-color="#000" stop-opacity="10%" />

			</linearGradient>

			<linearGradient id="topBottomShadow" gradientTransform="rotate(90)">
<stop offset="0" stop-color="#000" stop-opacity="10%" />
<stop offset="20%" stop-color="#000" stop-opacity="0" />


<stop offset="80%" stop-color="#000" stop-opacity="0" />
<stop offset="100%" stop-color="#000" stop-opacity="10%" />

			</linearGradient>
		</defs>

		<rect width="100%" height="20%" x="0" y="0" fill="url(#bottomShadow)"></rect>

		<image x="0%" y="20%" width="34%" height="53%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/beach-ing.jpg' )" />
			</xsl:attribute>
		</image>

		<rect x="34%" y="20%" width="32%" height="53%" fill="url(#topBottomShadow)"></rect>

		<image x="66%" y="20%" width="34%" height="53%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/beach-ing.jpg' )" />
			</xsl:attribute>
		</image>

		<rect x="0" y="73%" width="100%" height="17%" fill="url(#topBottomShadow)"></rect>

		<xsl:call-template name="cropped-container" />

		<image x="20%" y="73%" width="12%" height="16%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/chelsea-name.png' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="81.5%" class="center middle" style="font-size:180%; font-weight:500" fill="#000" data-max-width="30%" font-family="Futura Condensed">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentname'" />
<xsl:with-param name="default" select="concat( //agent[1]/mobile, '&#160;&#124;&#160;', //agent[1]/website )" />

			</xsl:call-template>
		</text>

		<image x="73%" y="72%" width="25%" height="18%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/seacliff.png' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="91%" class="center" font-family="Futura Condensed" fill="#444" style="font-size:90%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agent-ownership'" />
<xsl:with-param name="default" select="'Owned by a subsidiary of NRT LLC. &#124; CalDRE #: 01416035'" />

			</xsl:call-template>
		</text>

		<image x="3.5%" y="66%" width="15.5%" height="35%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/chelsea-roger.jpg' )" />
			</xsl:attribute>
		</image>

		<rect x="3.5%" y="66%" width="15.5%" height="35%" stroke="#fff" stroke-width="2" fill="none" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<image x="2%" y="0" width="16%" height="20%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/chelsea-name.png' )" />
			</xsl:attribute>
		</image>

		<g style="transform:translate(20%,6%)">
			<text fill="#000" style="font-size:257%;letter-spacing:2.5px;font-family:Futura Condensed;">
				<tspan >
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'is excited to share your neighborhood’s '" />
						<xsl:with-param name="default" select="'is excited to share your neighborhood’s '" />
					</xsl:call-template>
				</tspan>

				<tspan class="bold">
					<xsl:choose>
						<xsl:when test="//single/soldDate!=''">
							<xsl:value-of select="'newest sale!'" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'newest listing!'" />
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>
		</g>

<use href="#barcode-hand" fill="#b31f24" x="61%" y="51%" width="5%" height="9%" />


		<g style="transform:translate(1%,22%)">
			<xsl:call-template name="chelsea-checkbox">
				<xsl:with-param name="line1" select="'Community'" />
				<xsl:with-param name="line2" select="'Trends'" />
			</xsl:call-template>
		</g>

		<g style="transform:translate(1%,40%)">
			<xsl:call-template name="chelsea-checkbox">
				<xsl:with-param name="line1" select="'Multi-Year'" />
				<xsl:with-param name="line2" select="'Trends'" />
			</xsl:call-template>
		</g>

		<g style="transform:translate(66%,22%)">
			<xsl:call-template name="chelsea-checkbox">
				<xsl:with-param name="line1" select="'Neighborhood'" />
				<xsl:with-param name="line2" select="'Trends'" />
			</xsl:call-template>
		</g>

		<g style="transform:translate(66%,40%)">
			<xsl:call-template name="chelsea-checkbox">
				<xsl:with-param name="line1" select="'Buyer'" />
				<xsl:with-param name="line2" select="'Trends'" />
			</xsl:call-template>
		</g>

		<text class="center" fill="#000" font-size="88%" font-family="Futura Condensed" style="opacity: 0.7;">
			<tspan x="50%" y="63%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'Scan the QR Code with your camera'" />
					<xsl:with-param name="default" select="'Scan the QR Code with your camera'" />
				</xsl:call-template>
			</tspan>

			<tspan x="50%" y="65.5%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'to see exclusive community information!'" />
					<xsl:with-param name="default" select="'to see exclusive community information!'" />
				</xsl:call-template>
			</tspan>
		</text>
	</xsl:template>
</xsl:stylesheet>