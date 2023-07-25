<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Vip Entry 4
	Tags:		Map, Listings, Infographic
	Sizes:		Door Hanger
	Supports:	Area, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-condensed.css')"/>
		</link>
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/caslon.css')"/>
		</link>

		<rect x="0" y="0" width="100%" height="100%" fill="#0d0f30" style="background: #0d0f30;"></rect>

		<image x="20%" y="3.7%" width="41%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
			</xsl:attribute>
		</image>

		<image x="64.2%" y="3.7%" width="13.2%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/exp-white.png' )" />
			</xsl:attribute>
		</image>

		<svg height="100%" width="100%">
			<circle cx="50%" cy="20.5%" r="12%" fill="#282843" />
		</svg>
		<line xmlns="" x1="0%" y1="20.6%" x2="50%" y2="20.6%" stroke="#282843" stroke-width="0.3%"/>

		<text x="50%" y="38.1%" class="futura-text center" fill="#fff" font-size="420%" font-weight="700" style="letter-spacing:1.5px;">
		    Want the inside scoop
		</text>
		<text x="50%" y="40.7%" class="futura-text center" fill="#fff" font-size="420%" font-weight="700" style="letter-spacing:1.5px;">
		    on your neighborhood’s
		</text>
		<text x="50%" y="43.2%" class="futura-text center" font-size="420%" font-weight="700" fill="#fff" style="letter-spacing:1.5px;">
		    real estate trends
		</text>
		<text x="50%" y="45.8%" class="futura-text center" fill="#b0934c" font-size="420%" font-weight="700" style="letter-spacing:2px;">
		    before they happen?
		</text>

		<image x="35.5% " y="54.9%" width="29.2%" height="11.2%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download.png' )" />
			</xsl:attribute>
		</image>

		<text x="50%" y="67.7%" class="futura-text center" font-size="350%" font-weight="600" fill="#fff">
		    Become a KRG Market Insider.
		</text>

		<!-- text between line -->
		<line xmlns="" x1="10%" y1="73.7%" x2="90%" y2="73.7%" stroke="#b0934c" stroke-width="0.1%">
		</line>
		<text x="13%" y="74%" class="futura-text " font-weight="400" font-size="260%" style="text-anchor: inherit;">
			<tspan x="50%" dy="1.2%" class="center" fill="#fff">ALL-DIGITAL
				<tspan fill="#a18d4c">•</tspan> THE UP-TO-DATE INFO YOU NEED</tspan>
			<tspan x="50%" dy="1.8%" class="center" fill="#fff">YOUR HOME’S CURRENT VALUE IN JUST SECONDS</tspan>
			<tspan x="50%" dy="1.8%" class="center" fill="#fff">NO ADS <tspan fill="#a18d4c">•</tspan> NO POSTCARDS<tspan fill="#a18d4c"> •</tspan> 100% FREE FOREVER</tspan>
		</text>
		<line xmlns="" x1="10%" y1="82%" x2="90%" y2="82%" stroke="#b0934c" stroke-width="0.1%">
		</line>
		<!-- End -->

		<image x="10% " y="86%" width="18.5%" height="8.8%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		<text x="%" y="84.9%" class="futura-text" font-size="290%" font-weight="800" style="letter-spacing:2px">
			<tspan x="31%" dy="1.5%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketingFirstName'" />
					<xsl:with-param name="default" select="//agent[1]/firstName" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#b0934c" class="futura-text" sytle="font-weight:800">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketingLastName'" />
					<xsl:with-param name="default" select="concat(' ',//agent[1]/lastName)" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="31%" y="88.1%" class="futura-text" font-size="200%" font-weight="300%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<text x="%" y="89.2%" class="futura-text" font-size="235%" font-weight="300%">
			<tspan x="31%" dy="1.3%" fill="#b0934c">m</tspan>
			<tspan x="35%" dy="%" fill="#fff" class="futura-text">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select="translate(//agent[1]/mobile,'-','.')" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="%" y="90.4%" class="futura-text" font-size="235%" font-weight="300%" data-max-width="70%">
			<tspan x="31%" dy="1.7%" fill="#b0934c">e</tspan>
			<tspan x="35%" dy="%" fill="#fff" class="futura-text">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="%" y="92%" class="futura-text" font-size="235%" font-weight="300%">
			<tspan x="31%" dy="1.7%" fill="#b0934c">w</tspan>
			<tspan x="35%" dy="%" fill="#fff" class="futura-text">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="75%" y="91.5%" class="Futura Condensed" fill="#8494a0" style="letter-spacing:0.5px;">
			<tspan x="70%" dy="0.6%" fill="#8494a0" font-size="80%" style="word-spacing:17px;">EXP REALTY OF CALIFORNIA, INC</tspan>
			<tspan x="70%" dy="0.6%" font-size="80%">
				<xsl:text>LICENSE </xsl:text>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
				<xsl:text>. INFORMATION</xsl:text>
			</tspan>
			<tspan x="70%" dy="0.6%" font-size="80%" fill="#8494a0" style="word-spacing:21px;">IS DEEMED RELIABLE, BUT NOT</tspan>
			<tspan x="70%" dy="0.6%" font-size="80%" fill="#8494a0" style="word-spacing:9.5px;">GUARANTEED. BROKER HAS NOT AND</tspan>
			<tspan x="70%" dy="0.6%" font-size="80%" fill="#8494a0" style="word-spacing:6px;">WILL NOT INVESTIGATE OR VERIFY THE</tspan>
			<tspan x="70%" dy="0.6%" font-size="80%" fill="#8494a0" style="word-spacing:17.5px;">ACCURACY OF THIS INFORMATION.</tspan>
		</text>
	</xsl:template>
</xsl:stylesheet>