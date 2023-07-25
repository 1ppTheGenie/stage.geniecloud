<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Accept Mission
	Tags: 		Infographic
	Sizes:		Facebook, Facebook Ad, Facebook Post
	Supports:	Area, Multi-Listing, ListingStatus
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<link rel="stylesheet">
			<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')"/>
		</link>

		<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/intel-white-bg-01.jpg' )" />
			</xsl:attribute>
		</image>

		<line xmlns="" stroke="#b2934e" stroke-width="0.5%" y2="70" x2="63" y1="295" x1="63"/>

		<text x="8%" y="10%" fill="#0e1232" class=" futura-text super-bold upper" style="font-size:335%">YOUR MISSION:</text>
		<text x="8%" y="19%" fill="#0e1232" class=" futura-text super-bold upper" style="font-size:335%">GET YOUR HOME’S</text>
		<text x="8%" y="28%" fill="#0e1232" class=" futura-text super-bold upper" style="font-size:335%">UP-TO-THE-MINUTE VALUE</text>
		<text x="8%" y="37%" fill="#b0934c" class=" futura-text super-bold upper" style="font-size:335%">BY ANY MEANS POSSIBLE.</text>

		<text x="5.4%" y="56%" fill="#0e1232" class=" futura-text super-bold" style="font-size:160%">
            No James Bond gadgets required.*
		</text>
		<line x1="5.4%" y1="62.5%" x2="14%" y2="62.5%" style="stroke:#b0934c;stroke-width:2.5"/>

		<text x="5.4%" y="65%" fill="#0e1232" class="futura-text" style="font-size:130%">
			<tspan x="5.4%" y="65%">Click</tspan>
			<tspan x="10%" y="65%" class="bold">Accept Mission</tspan>
			<tspan x="23%" y="65%">or visit</tspan>
			<tspan x="29%" y="65%" class="bold">itzsold.com/evaluation</tspan>
			<tspan x="49%" y="65%">for</tspan>
		</text>

		<text x="5.4%" y="69%" fill="#0e1232" class="futura-text" style="font-size:130%">
            a personalized, nearly-instant (under 7 seconds) home valuation.
		</text>

		<text x="5.4%" y="73%" fill="#0e1232" class="futura-text" style="font-size:130%">
            Arm yourself with knowledge that could save you thousands... or more.
		</text>

		<text x="5.4%" y="82%" fill="#0e1232" class=" futura-text" style="font-size:130%">
            * We’re disappointed, too.
		</text>

		<a href="https://www.itzsold.com/evaluation">
			<image x="65%" y="50%" width="32%" height="32%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/accept-mission-02.png' )"/>
			</image>
		</a>
	</xsl:template>
</xsl:stylesheet>