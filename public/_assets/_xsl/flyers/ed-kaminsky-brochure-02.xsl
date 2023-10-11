<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Brochure 02
	Tags:		Direct Mail
	Sizes:		Ipad Landscape
	Supports:	Listing, Multi-Listing
	Pages:		flyers/ed-kaminsky-brochure-01,flyers/ed-kaminsky-brochure-02
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-condensed.css')"/>
		</link>

		<xsl:value-of select="'
			foreignObject:not(.editing) p:first-child {
    			margin-top: 20px;
			}
			
			foreignObject:not(.editing) p {
    			line-height: 118%;
				margin-top: 0px;
    			margin-bottom: 14px;
			}'"/>

		<rect x="0%" y="0%" width="100%" height="100%" fill="#ffffff" />
		<rect x="2%" y="2.5%" width="96%" height="97.5%" fill="#13182f" />

		<image x="-33.8%" y="8%" width="27.7%" height="9.3%" id="logo" preserveAspectRatio="xMidYMid meet" style="transform: rotate(270deg); -webkit-transform: rotate(270deg);">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-logo01.png' )" />
			</xsl:attribute>
		</image>

		<text x="9.5%" y="48.3%" class="center futura-text">
			<tspan x="9.5%" dy="1%" font-size="250%" class="bold" fill="#e1e1e1">
				<xsl:value-of select="//single/bedrooms/@count" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" class="center futura-text" fill="#b0934c" font-size="160%">
				<xsl:value-of select="'beds'" />
			</tspan>
		</text>

		<text x="9.5%" y="56.3%" class="center futura-text">
			<tspan x="9.5%" dy="1%" font-size="250%" class="bold" fill="#e1e1e1">
				<xsl:value-of select="//single/bathrooms/@full" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" fill="#b0934c" font-size="160%">
				<xsl:value-of select="'baths'" />
			</tspan>
		</text>

		<text x="9.5%" y="64.3%" class="center futura-text">
			<tspan x="9.5%" dy="1%" font-size="250%" class="bold" fill="#e1e1e1">
				<xsl:value-of select="format-number(//single/squareFeet, '###,###')" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" fill="#b0934c" font-size="160%">
				<xsl:value-of select="'sq ft (btv)'" />
			</tspan>
		</text>

		<text x="9.5%" y="72.3%" class="center futura-text">
			<tspan x="9.5%" dy="1%" font-size="250%" class="bold" fill="#e1e1e1">
				<xsl:call-template name="lot-size" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" fill="#b0934c" font-size="160%">
				<xsl:value-of select="'sq ft lot'" />
			</tspan>
		</text>

		<text x="9.5%" y="80.5%" class="center futura-text">
			<tspan x="9.5%" dy="1%" font-size="250%" class="bold" fill="#e1e1e1">
				<xsl:value-of select="//single/built" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" fill="#b0934c" font-size="160%">
				<xsl:value-of select="'year built'" />
			</tspan>
		</text>

		<text x="9.5%" y="88.6%" class="center futura-text">
			<tspan x="9.5%" dy="1%" font-size="250%" class="bold" fill="#e1e1e1">$1,599,000</tspan>
			<tspan x="9.5%" dy="3.3%" fill="#b0934c" font-size="160%">
				<xsl:value-of select="'Just Sold'" />
			</tspan>
		</text>

		<rect x="17%" y="2.5%" width="83%" height="98%" fill="#fff" />
		<image x="17.3%" y="2.5%" width="54.6%" height="44.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<text x="20%" y="51%" fill="#13182f" class="futura-text bold" font-size="230%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="concat(//single/address/street,', ', //area/name)" />
			</xsl:call-template>
		</text>

		<foreignObject width="50%" height="50%" x="20%" y="53.5%" class="futura-text" style="color:#3e3e3f;font-size:21px; line-height:120%; height:40%;">
			<xsl:variable name="paras" select="genie:split-to-paras( string(//single/description) )"/>
			<xsl:copy-of select="$paras/root" />
		</foreignObject>

		<image x="20%" y="92.5%" width="5.1%" height="5.1%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/360-icon.png' )" />
			</xsl:attribute>
		</image>
		<a href="https://www.itzsold.com/">
			<text x="25.8%" y="93.1%" fill="#b0934c" class="futura-text super-bold" font-size="220%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
		</a>
		<rect x="72.2%" y="2.5%" width="26%" height="98%" fill="#fff" />
		<image x="72.2%" y="2.5%" width="26%" height="22.2%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>
		<image x="72.2%" y="25.2%" width="26%" height="22.2%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-3'" />
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>
		<image x="72.2%" y="47.8%" width="26%" height="24.9%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-4'" />
				<xsl:with-param name="idx" select="5" />
			</xsl:call-template>
		</image>

		<rect x="72.2%" y="73.2%" width="26%" height="24%" fill="#13182f" />
		<image x="72%" y="73.6%" width="10%" height="13%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>
		<text x="81.8%" y="74.2%" class="futura-text super-bold" font-size="220%">
			<tspan x="81.8%" y="74.2%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketingFirstName'" />
					<xsl:with-param name="default" select="//agent[1]/firstName" />
				</xsl:call-template>
			</tspan>
			<tspan fill="#b0934c" class="futura-text">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketingLastName'" />
					<xsl:with-param name="default" select="concat(' ',//agent[1]/lastName)" />
				</xsl:call-template>
			</tspan>
		</text>
		<text x="81.8%" y="77.2%" fill="#fff" class="futura-text" font-size="140%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>
		<line xmlns="" x1="82%" y1="80.5%" x2="96%" y2="80.5%" style="stroke:#b0934c;stroke-width:3.5"></line>
		<text x="81.8%" y="82.6%" class="futura-text" font-size="140%">
			<tspan dx="0%" fill="#b0934c">c</tspan>
			<tspan dx=".3%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmobile'" />
					<xsl:with-param name="default" select="translate(//agent[1]/mobile,'-','.')" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="81.8%" y="84.7%" class="futura-text" font-size="140%">
			<tspan dx="0%" fill="#b0934c ">e</tspan>
			<tspan dx="0.3%" fill="#fff">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentmarketingEmail'" />
					<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="73.5%" y="88.8%" fill="#fff" class="futura-text" font-size="110%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'listedbytext'" />
				<xsl:with-param name="default" select="concat('Presented by ',//agent[1]/marketingName,' • ',//agent[1]/marketingLicense )" />
			</xsl:call-template>
		</text>

		<text x="73.5%" y="89.4%" fill="#a3a3a3" class="futura-condensed" font-size="120%">
			<tspan x="73.5%" dy="1%">
				<xsl:value-of select="concat('EXP REALTY OF CALIFORNIA, INC LICENSE ',//agent[1]/marketingLicense,'. INFORMATION IS DEEMED' )" />
			</tspan>
			<tspan x="73.5%" dy="1.4%">
				<xsl:value-of select="'RELIABLE, BUT NOT GUARANTEED. BROKER HAS NOT AND WILL NOT INVESTIGATE OR VERIFY'" />
			</tspan>
			<tspan x="73.5%" dy="1.4%">
				<xsl:value-of select="'THE ACCURACY OF THIS INFORMATION'" />
			</tspan>
		</text>
	</xsl:template>
</xsl:stylesheet>