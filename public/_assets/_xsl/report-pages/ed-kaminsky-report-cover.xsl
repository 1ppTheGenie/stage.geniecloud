<?xml version="1.0"?>
<!--
	Asset Name:	Ed Kaminsky Report Cover
	Tags:		Text
	Supports:	Area, Map, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<svg class="background-shape">
			<clipPath id="myPolygon">
				<polygon points="0,0 540,0 840,630 0,630" fill="#12142d"/>
			</clipPath>

			<image x="0" y="0" width="100%" height="100%" clip-path="url(#myPolygon)" preserveAspectRatio="xMidYMin slice">
				<xsl:attribute name="href">
					<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/blue-back-image.jpg' )" />
				</xsl:attribute>
			</image>

			<rect style="transform: rotate(334deg);" x="40%" y="35%" width=".5%" height="117%" fill="#fff"></rect>
		</svg>

		<!-- without use of polygon -->
		<!-- <image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<image x="0" y="0" width="70%" height="100%" preserveAspectRatio="xMidYMin slice">
            <xsl:attribute name="href">
                <xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/left-bg-6.png' )" />
            </xsl:attribute>
        </image> -->

		<image x="4.5%" y="15%" width="27%" height="13%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
			</xsl:attribute>
		</image>

		<text x="5%" y="46%" class="futura-text" font-size="165%" fill="#b0934c">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'FOR YOUR EYES ONLY:'" />
				<xsl:with-param name="default" select="'FOR YOUR EYES ONLY:'" />
			</xsl:call-template>
		</text>

		<text x="5%" y="51%" class="futura-text super-bold" font-size="280%" fill="#b0934c" style="word-spacing:-12px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'12 Month Insider Report:'" />
				<xsl:with-param name="default" select="'12 Month Insider Report:'" />
			</xsl:call-template>
		</text>

		<text x="5%" y="60.7%" class="super-bold futura-text" fill="#fff" font-size="280%" data-max-width="50%" style="word-spacing:-12px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat(//area/name ,' ', $singularPropertyType,'s')" />
			</xsl:call-template>
		</text>

		<image x="0.1%" y="78%" width="11.5%" height="22%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<text x="12%" y="83.3%" class="bold futura-text" font-size="105%" fill="#b0934c">
			<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn] [D], [Y0001]')" />
		</text>

		<rect xmlns="" x="28.6%" y="88.2%" width="7%" height="4%" fill="#d1232a" style="transform: translate(-25px, 15px) rotate(-3deg);-webkit-transform: translate(-15px, 15px) rotate(-3deg);width: 7%;height: 4%;"></rect>

		<text xmlns="" x="12%" y="87.3%" class="futura-text" font-size="103%" fill="#fff">
			<tspan>Confidentially prepared for </tspan>
		</text>
		<text xmlns="" x="29.5%" y="88%" class="futura-text" font-size="95%" fill="#fff" style=" transform: translate(-25px, 15px) rotate(-3deg);-webkit-transform: translate(-32px, 22px) rotate(-3deg); ">
			<tspan dx="1.5%" class="bold" font-size="85%">REDACTED </tspan>
		</text>

		<text xmlns="" x="37%" y="87.3%" class="futura-text" font-size="103%" fill="#fff">
			<tspan dx="0.5%">by </tspan>
			<tspan fill="#b0934c" class="bold">Ed Kaminsky</tspan>
		</text>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>