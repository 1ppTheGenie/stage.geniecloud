<?xml version="1.0"?>
<!--
	Asset Name: Cush Postage Side
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports:	Area, Print, Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">

		<rect x="0" y="0" width="51%" height="100%" fill="#fff"></rect>
		<line xmlns="" stroke="#fff" stroke-width="0.8%" x1="51%" x2="51%" y1="0" y2="100%"></line>
		<rect x="50%" y="0" width="50%" height="100%" fill="#fff"></rect>
		<image x="0%" y="0" width="51%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/Diamondback_lg.jpg' )" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/gotham-embedded.css')"/>
		</link>

		<g style="transform:translate(45.2%, 55.5%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'11.5%'" />
				<xsl:with-param name="height" select="'19.5%'" />
			</xsl:call-template>
		</g>
		<image x="4%" y="6%" width="25%" height="10%" id="logo" preserveAspectRatio="xMinYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<text x="4%" y="62%" class="middle upper" fill="#fff" style="font-family:'Gotham'; letter-spacing: 1px; font-size:115%;word-spacing:-2px; font-weight:500">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'knowledge'" />
					<xsl:with-param name="default" select="'KNOWLEDGE IS '" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#eeac27">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'power'" />
					<xsl:with-param name="default" select="'POWER.'" />
				</xsl:call-template>
			</tspan>
		</text>

		<svg x="-0.8%" y="42%" width="50%" height="48%" viewBox="0 0 1289 757" style="enable-background:new 0 0 1289 757;" xml:space="preserve">
			<rect fill="#eeac27" x="47.7" y="367.12" class="st0" width="1169.3" height="7.88"/>
			<polygon fill="#eeac27" points="1199.21,346 1194.02,351.93 1215.49,370.71 1194.5,390 1199.83,395.81 1227.3,370.57 "/>
		</svg>

		<text x="4%" y="68.2%" class="middle" fill="#fff" style="font-family:'Gotham';font-size:96%;word-spacing:-2px;">

			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'lattestneighborhood'" />
					<xsl:with-param name="default" select="'Scan now for the latest neighborhood, community, buyer'" />
				</xsl:call-template>
			</tspan>
			<tspan x="4%" dy="3.5%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'multiyear'" />
					<xsl:with-param name="default" select="'and multi-year trends. How does your home compare?'" />
				</xsl:call-template>
			</tspan>
		</text>

		<g style="transform: translateY(-5.2%);">

			<text x="4%" y="85%" style="font-size:115%;font-family:'Gotham';" data-max-width="15%" fill="#ffffff">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentfirstName'" />
						<xsl:with-param name="default" select="//agent[1]/firstName" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:text>&#160;</xsl:text>
				</tspan>
				<tspan fill="#eeac27">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentlastname'" />
						<xsl:with-param name="default" select="//agent[1]/lastName" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'team'" />
						<xsl:with-param name="default" select="' Team'" />
					</xsl:call-template>
				</tspan>
			</text>
			<text x="4%" y="92.6%" class="upper" style="font-size:100%;font-family:'Gotham';font-weight:500;" data-max-width="25%" fill="#eeac27">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
			<text x="4%" y="89%" style="font-size:75%;font-family:'Gotham';" data-max-width="15%" fill="#ffffff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</text>
			<text x="22.5%" y="85.5%" style="font-size:90%;font-family:'Gotham';" fill="#ffffff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select=" //agent[1]/mobile" />
				</xsl:call-template>
			</text>
			<text x="22.5%" y="88.5%" fill="#ffffff" data-max-width="15%" style="font-size:90%;font-family:'Gotham';">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmarketingEmail'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</text>

			<image x="39.5%" y="86.2%" width="11.5%" height="19%" id="logo" preserveAspectRatio="xMaxYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
		</g>

		<g style="transform: translate(54%, 5%);">

			<foreignObject width="36%" height="11%" x="12%" y="28%" style="font-family: 'Gotham';font-size:160%;">
				<p style="margin:0;color:#eeac27">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'helpingtext'" />
						<xsl:with-param name="default" select="'HELPING HOME SELLERS ACHIEVE YOUR GOALS'" />
					</xsl:call-template>
				</p>
			</foreignObject>

			<foreignObject width="11%" height="9%" x="0" y="25.5%" class="center bold" style="font-family:'Gotham';font-size:80%;font-weight:500;">
				<p style="margin:0;color:#2a2e3d">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'top'" />
						<xsl:with-param name="default" select="'TOP PERFORMER IN BAY AREA REAL ESTATE'" />
					</xsl:call-template>
				</p>
			</foreignObject>

			<image x="1%" y="36%" width="11%" height="4%" id="logo" preserveAspectRatio="xMinYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/5-stars_unsaturated.png' )" />
				</xsl:attribute>
			</image>

			<text x="0" y="41.6%" class="bold upper" style="font-size:90%;font-family:'Gotham';" data-max-width="25%" fill="#2a2e3d">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketingName'" />
					<xsl:with-param name="default" select="//agent[1]/marketingName" />
				</xsl:call-template>
			</text>

			<text x="0%" y="45.6%" class="upper" style="font-size:80%;font-family:'Gotham';font-weight: 500;" data-max-width="25%" fill="#2a2e3d">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketingName'" />
					<xsl:with-param name="default" select="'CUSH REAL ESTATE'" />
				</xsl:call-template>
			</text>
		</g>

		<foreignObject x="4%" y="25.5%" class="bold middle" width="40%" fill="#fff" height="20%" style="font-family:'Gotham'; letter-spacing: 0.5px; font-size:174%;">
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

		<foreignObject x="4%" y="43%" class="bold middle" width="40%" fill="#eeac27" height="20%" style="font-family:'Gotham'; letter-spacing: 0.5px; font-size:174%;">
			<p style="margin: 0;color:#eeac27;">

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

		<foreignObject class="upper" width="33%" height="4%" x="4%" y="95%" style="font-family:'futura';">
			<p style="margin: 0;font-size: 6.5px;text-align:justify;opacity:0.5;font-weight: 300;font-family:'futura';color:#fff;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'discription'" />
					<xsl:with-param name="default" select="'NEIGHBORHOOD MARKET TRENDS INFORMATION PROVIDED BY THIRD-PARTY SOURCES IS DEEMED RELIABLE, BUT NOT GUARANTEED. IF YOUR HOME IS CURRENTLY LISTED FOR SALE, THIS IS NOT INTENDED TO BE A SOLICITATION. © 2021'" />
				</xsl:call-template>
			</p>
		</foreignObject>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>