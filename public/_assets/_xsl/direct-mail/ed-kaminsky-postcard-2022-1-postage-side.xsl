<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Postcard 2022 1 Postage Side
	Tags: 		Direct Mail
Sizes:		Postcard, QRCode
	Supports:	Area, Print, Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<rect x="0" y="0" width="51%" height="100%" fill="#fff"></rect>
		<line xmlns="" stroke="#fff" stroke-width="0.8%" x1="51%" x2="51%" y1="0" y2="100%"></line>
		<rect x="50%" y="0" width="50%" height="100%" fill="#fff"></rect>
		<image x="0%" y="0" width="51%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/dollar.jpg' )" />
			</xsl:attribute>
		</image>

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
		<rect x="0" y="0" width="51%" height="100%" fill="url(#lgrad)" />

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />
		</link>
		<link rel="stylesheet" type="text/css">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/smooch.css')" />
		</link>

		<g style="transform:translate(45.2%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'11.5%'" />
			</xsl:call-template>
		</g>

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

		<text x="4%" y="62%" class="bold middle upper" fill="#fff" font-family="var(--theme-body-font)" style="letter-spacing: 1px; font-size:115%;word-spacing:-2px;">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'knowledge'" />
					<xsl:with-param name="default" select="'KNOWLEDGE IS '" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#b2934e">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'power'" />
					<xsl:with-param name="default" select="'POWER.'" />
				</xsl:call-template>
			</tspan>
		</text>

		<svg x="-0.8%" y="42%" width="50%" height="48%" viewBox="0 0 1289 757" style="enable-background:new 0 0 1289 757;" xml:space="preserve">
			<rect fill="#b2934e" x="47.7" y="367.12" class="st0" width="1169.3" height="7.88" />
			<polygon fill="#b2934e" points="1199.21,346 1194.02,351.93 1215.49,370.71 1194.5,390 1199.83,395.81 1227.3,370.57 " />
		</svg>

		<text x="4%" y="68.2%" class="middle" fill="#fff" font-family="var(--theme-heading-font)" style="font-size:96%;font-weight:500;">
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
				<circle r="3.5%" cx="7%" cy="84.4%"></circle>
			</clipPath>
			<image x="3.5%" y="79%" width="7%" height="11%" clip-path="url(#clipCircle)" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>

			<text x="10%" y="81%" class="bold" font-size="100%" font-family="var(--theme-body-font)" fill="#fff">
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
			<text x="10%" y="84.2%" style="font-size:68%;font-weight:500;" font-family="var(--theme-body-font)" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</text>

			<rect x="21.5%" y="81.5%" width="0.13%" height="5.6%" fill="#b2934e"></rect>

			<text x="23%" y="81.5%" style="font-size:75%;" font-family="var(--theme-body-font)" fill="var(--theme-body-background)">
				<tspan fill="#b2934e" class="bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'m'" />
						<xsl:with-param name="default" select="'m'" />
					</xsl:call-template>
				</tspan>
				<tspan x="25%" fill="#fff" style="font-weight:500;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select=" //agent[1]/mobile" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="23%" y="83.8%" fill="#fff" style="" font-family="var(--theme-body-font)">
				<tspan dy="0.2%" class="bold" fill="#b2934e" style="font-size:85%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'e'" />
						<xsl:with-param name="default" select="'e'" />
					</xsl:call-template>
				</tspan>
				<tspan x="25%" dy="0.8%" fill="#fff" style="font-weight:400; font-size:55%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmarketingEmail'" />
						<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="35%" y="80.5%" font-size="210%" font-weight="900" fill="#b2934e" font-family="Smooch" font-style="italic" data-max-width="13%" style="transform: rotate(353deg) translate(-95px, 50px);">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingName" />
				</xsl:call-template>
			</text>
		</g>

		<g style="transform: translate(54%, 5%);">
			<text fill="#5c5c5c" font-family= "var(--theme-body-font)" font-size="100%" font-weight="500">
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
		<foreignObject class="upper" width="44%" height="10%" x="4%" y="90%" font-family="var(--theme-body-font)">
			<p style="margin: 0;font-size: 6.5px;text-align:justify;opacity:0.5;font-weight: 300;color:#fff;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'discription'" />
					<xsl:with-param name="default" select="'ED KAMINSKY DRE #00958114 &#124; EXP REALTY OF CALIFORNIA, INC. DRE #01878277. THE INFORMATION CONTAINED IN THIS DOCUMENT, INCLUDING, BUT
					NOT LIMITED TO, SQUARE FOOTAGE AND/OR ACREAGE, HAS BEEN PROVIDED BY VARIOUS SOURCES WHICH MAY INCLUDE THE SELLER, PUBLIC RECORDS,
					THE MULTIPLE LISTING SERVICE OR OTHER SOURCES. BROKER HAS NOT AND WILL NOT INVESTIGATE OR VERIFY THE ACCURACY OF THIS INFORMATION.'" />
				</xsl:call-template>
			</p>
		</foreignObject>

		<foreignObject x="4%" y="25.5%" class="bold middle" width="40%" fill="#fff" height="20%" font-family="var(--theme-heading-font)" style="letter-spacing: 0.5px; font-size:174%;word-spacing:-5px;">
			<p style="margin: 0;color:#fff">
				<xsl:choose>
					<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborplaning'" />
							<xsl:with-param name="default" select="concat( 'Your neighbors are planning to take the money and run.', '' )" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=2">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'hungrybuyers'" />
							<xsl:with-param name="default" select="concat( 'Hungry buyers are zeroing in on your neighborhood.', '' )" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=14">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborplaning'" />
							<xsl:with-param name="default" select="concat( 'Your neighbors are planning to take the money and run.', '' )" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=1">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighbor'" />
							<xsl:with-param name="default" select="concat( 'Your neighbor’s ' , ' ', lower-case($singularPropertyType),' ', 'is suddenly for sale.')" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'recentsales'" />
							<xsl:with-param name="default" select="concat(format-number(//statistics/@soldPropertyTypeCount, '###,###'), ' recent sales means there’s a definite trend in your area.')" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</p>
		</foreignObject>

		<foreignObject x="4%" y="41%" class="bold middle" width="40%" fill="#b2934e" height="20%" font-family="var(--theme-heading-font)" style="letter-spacing: 0.5px; font-size:174%;word-spacing:-5px;">
			<p style="margin: 0;color:#b2934e;">

				<xsl:choose>
					<xsl:when test="(number(//single/statusTypeID)=3) or (number(//single/statusTypeID)=4) or (number(//single/statusTypeID)=12)">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborplaning'" />
							<xsl:with-param name="default" select="concat( 'What do they know that you don’t?', '' )" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=2">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'hungrybuyers'" />
							<xsl:with-param name="default" select="concat( 'So what does your neighbor’s recent sale mean for you?', '' )" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=14">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighborplaning'" />
							<xsl:with-param name="default" select="concat( 'What do they know that you don’t?', '' )" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="number(//single/statusTypeID)=1">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'yourneighbor'" />
							<xsl:with-param name="default" select="concat( 'Do they know something that you don’t?', '' )" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'recentsales'" />
							<xsl:with-param name="default" select="concat( 'But where’s it going? Will you be left behind?' , '')" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</p>
		</foreignObject>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>