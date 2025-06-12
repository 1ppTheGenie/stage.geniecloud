<?xml version="1.0"?>
<!--
	Asset Name: KRG Postage Side
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
				#footer text tspan, #footer text {	
					fill: #94949D !important;
					font-size: 9px;
				}
				g#footer text a tspan{
					fill: #337ab7 !important;
				}
			'" />
		</style>
		<rect x="0" y="0" width="51%" height="100%" fill="#fff"></rect>
		<line xmlns="" stroke="#fff" stroke-width="0.8%" x1="51%" x2="51%" y1="0" y2="100%"></line>
		<rect x="50%" y="0" width="50%" height="100%" fill="var(--theme-heading-color)"></rect>

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
		<rect x="0" y="0" width="51%" height="100%" fill="url(#lgrad)" />

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform:translate(45.2%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'11.5%'" />
			</xsl:call-template>
		</g>

		<image x="4%" y="5%" width="16%" height="13%" id="logo" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:choose>
					<xsl:when test="//output/@themeHue = 'light'">
						<xsl:value-of select="$personalLogo" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$personalLogoInverse" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</image>

		<text x="4%" y="62%" class="bold middle upper" fill="var(--theme-heading-color)" style=" letter-spacing: 1px; font-size:115%;word-spacing:-2px;">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'knowledge'" />
					<xsl:with-param name="default" select="'KNOWLEDGE IS '" />
				</xsl:call-template>
			</tspan>
			<tspan fill="var(--theme-sub-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'power'" />
					<xsl:with-param name="default" select="'POWER.'" />
				</xsl:call-template>
			</tspan>
		</text>

		<svg x="-0.8%" y="42%" width="50%" height="48%" viewBox="0 0 1289 757" style="enable-background:new 0 0 1289 757;" xml:space="preserve">
			<rect fill="var(--theme-sub-heading-color)" x="47.7" y="367.12" class="st0" width="1169.3" height="7.88" />
			<polygon fill="var(--theme-sub-heading-color)" points="1199.21,346 1194.02,351.93 1215.49,370.71 1194.5,390 1199.83,395.81 1227.3,370.57 " />

		</svg>

		<text x="4%" y="68.2%" class="middle" fill="var(--theme-body-color)" font-family="var(--theme-body-font)" font-size="96%" font-weight="500">
			<tspan class="bold">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'scannow'" />
					<xsl:with-param name="default" select="'Scan now '" />
				</xsl:call-template>
			</tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'lattestneighborhood'" />
					<xsl:with-param name="default" select="'for the latest neighborhood, community, buyer'" />
				</xsl:call-template>
			</tspan>
			<tspan x="4%" dy="3.5%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'multiyear'" />
					<xsl:with-param name="default" select="'and multi-year trends. How does your home compare?'" />
				</xsl:call-template>
			</tspan>
		</text>

		<g style="transform: translateY(-1.5%);">
			<clipPath id="clipCircle">
				<circle r="3.7%" cx="6.5%" cy="87.4%"></circle>
			</clipPath>
			<circle r="3.7%" cx="6.5%" cy="87.4%" fill="var(--theme-heading-color)"></circle>
			<image x="3.5%" y="82%" width="11%" height="14%" clip-path="url(#clipCircle)" preserveAspectRatio="xMinYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>

			<text x="11%" y="80.5%" class="bold" style="font-size:130%; font-family: var(--theme-body-font);" data-max-width="30%" fill="var(--theme-heading-color)">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentName'" />
						<xsl:with-param name="default" select="//agent[1]/marketingName" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="11%" y="84.7%" style="font-size:65%;font-weight:500;font-family: var(--theme-body-font);" data-max-width="32%" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</text>

			<text x="11%" y="87.5%" style="font-size:100%;font-family: var(--theme-body-font);" data-max-width="32%" fill="var(--theme-body-background)">
				<tspan fill="var(--theme-sub-heading-color)" class="bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'m'" />
						<xsl:with-param name="default" select="'m'" />
					</xsl:call-template>
				</tspan>
				<tspan x="12.9%" fill="var(--theme-heading-color)" style="font-weight:500;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select=" //agent[1]/mobile" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="11%" y="90%" fill="var(--theme-heading-color)" data-max-width="32%" style="font-family: var(--theme-body-font);font-size:100%;">
				<tspan dy="0.2%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'e'" />
						<xsl:with-param name="default" select="'e'" />
					</xsl:call-template>
				</tspan>
				<tspan x="12.9%" dy="0.5%" fill="var(--theme-heading-color)" style="font-weight:400; font-size:85%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g style="transform: translate(54%, 5%);">
			<text fill="var(--theme-body-background)" style="font-family:var(--theme-body-font);font-size:100%;font-weight:500;">
				<tspan>
					<xsl:value-of select="//agent[1]/address/street" />
				</tspan>
				<tspan x="0%" dy="3%">
					<xsl:value-of select="//agent[1]/address/city" />

					<xsl:text>, </xsl:text>
					<xsl:value-of select="//agent[1]/address/state" />

					<xsl:text>&#160;</xsl:text>
					<xsl:value-of select="//agent[1]/address/zip" />
				</tspan>
			</text>
		</g>

		<foreignObject class="upper" width="44%" height="5%" x="4%" y="93%">
			<p style="margin: 0;font-size: 6.5px;text-align:justify;font-weight: 300;font-family:var(--theme-body-font);color:var(--theme-body-color);">
				<xsl:call-template name="solicitation-disclaimer" />
			</p>
		</foreignObject>

		<foreignObject x="4%" y="25%" class="bold middle" width="38%" height="20%">

			<xsl:choose>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<p style="margin: 0;color:var(--theme-heading-color);font-family:var(--theme-heading-font);font-size:170%; line-height:110%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborplaning'" />
							<xsl:with-param name="default" select="concat( 'Your neighbors are planning to take the money and run.', '' )" />
						</xsl:call-template>
					</p>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=2">
					<p style="margin: 0;color:var(--theme-heading-color);font-family:var(--theme-heading-font);font-size:170%; line-height:110%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'hungrybuyers'" />
							<xsl:with-param name="default" select="concat( 'Hungry buyers are zeroing in on your neighborhood.', '' )" />
						</xsl:call-template>
					</p>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=14">
					<p style="margin: 0;color:var(--theme-heading-color);font-family:var(--theme-heading-font);font-size:170%; line-height:110%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborplaning'" />
							<xsl:with-param name="default" select="concat( 'Your neighbors are planning to take the money and run.', '' )" />
						</xsl:call-template>
					</p>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=1">
					<p style="margin: 0;color:var(--theme-heading-color);font-family:var(--theme-heading-font);font-size:180%; line-height:110%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighbor'" />
							<xsl:with-param name="default" select="concat( 'Your neighbor’s ' , ' ', lower-case($singularPropertyType),' ', 'is suddenly for sale.')" />
						</xsl:call-template>
					</p>
				</xsl:when>
				<xsl:otherwise>
					<p style="margin: 0;color:var(--theme-heading-color);font-family:var(--theme-heading-font);font-size:170%; line-height:110%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'recentsales'" />
							<xsl:with-param name="default" select="concat(format-number(//statistics/@soldPropertyTypeCount, '###,###'), ' recent sales means there’s a definite trend in your area.')" />
						</xsl:call-template>
					</p>
				</xsl:otherwise>
			</xsl:choose>
		</foreignObject>
		<foreignObject x="4%" y="41%" class="bold middle" width="38%" height="20%">

			<xsl:choose>
				<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
					<p style="margin: 0;color:var(--theme-sub-heading-color);font-family:var(--theme-heading-font); font-size:180%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborplaning'" />
							<xsl:with-param name="default" select="concat( 'What do they know that you don’t?', '' )" />
						</xsl:call-template>
					</p>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=2">
					<p style="margin: 0;color:var(--theme-sub-heading-color);font-family:var(--theme-heading-font); font-size:180%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'hungrybuyers'" />
							<xsl:with-param name="default" select="concat( 'So what does your neighbor’s recent sale mean for you?', '' )" />
						</xsl:call-template>
					</p>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=14">
					<p style="margin: 0;color:var(--theme-sub-heading-color);font-family:var(--theme-heading-font); font-size:180%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborplaning'" />
							<xsl:with-param name="default" select="concat( 'What do they know that you don’t?', '' )" />
						</xsl:call-template>
					</p>
				</xsl:when>
				<xsl:when test="number(//single/statusTypeID)=1">
					<p style="margin: 0;color:var(--theme-sub-heading-color);font-family:var(--theme-heading-font); font-size:185%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighbor'" />
							<xsl:with-param name="default" select="concat( 'Do they know something that you don’t?', '' )" />
						</xsl:call-template>
					</p>
				</xsl:when>
				<xsl:otherwise>
					<p style="margin: 0;color:var(--theme-sub-heading-color);font-family:var(--theme-heading-font); font-size:180%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'recentsales'" />
							<xsl:with-param name="default" select="concat( 'But where’s it going? Will you be left behind?' , '')" />
						</xsl:call-template>
					</p>
				</xsl:otherwise>
			</xsl:choose>
		</foreignObject>
		<image x="32%" y="80%" width="12%" height="9%" id="logo" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:choose>
					<xsl:when test="//output/@themeHue = 'light'">
						<xsl:value-of select="$companyLogo" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$companyLogoInverse" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</image>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>