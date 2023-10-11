<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Vip Entry 3
	Tags:		Map, Listings, Infographic
	Sizes:		Door Hanger
	Supports:	Area, Multi-Listing
	Pages:		report-pages/ed-kaminsky-vip-entry-3,report-pages/ed-kaminsky-vip-entry-4
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<!-- just sold case start -->
	<xsl:template name="just-sold">
		<text x="50%" y="34%" class="futura-text upper center" fill="#fff" font-size="1150%" font-weight="700">
	   		JUST SOLD
		</text>
<line xmlns="" x1="10%" y1="41.8%" x2="22%" y2="41.8%" stroke="#b0934c" stroke-width="0.2%" />


		<text x="50%" y="40.9%" class="caslon-text center" fill="#fff" font-size="420%" font-weight="400">
		    your neighbor’s home at
		</text>

		<line xmlns="" x1="78%" y1="41.8%" x2="91%" y2="41.8%" stroke="#b0934c" stroke-width="0.2%">
		</line>

		<text x="50.5%" y="44.5%" class="futura-text upper center" fill="#fff" font-size="420%" font-weight="500">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="$listingAddressLine1" />
			</xsl:call-template>
		</text>
		<image x="0%" y="50%" width="100%" height="16%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<text x="50%" y="70%" class="futura-text center" fill="#fff" font-weight="700" font-size="470%">
        	What does this sale
		</text>
		<text x="50%" y="72.5%" class="futura-text center" fill="#fff" font-weight="700" font-size="470%">
        	mean for your home?
		</text>
		<text x="50%" y="75%" class="futura-text center" fill="#a18d4c" font-weight="700" font-size="470%">
        	Scan now to compare.
		</text>

		<rect x="0" y="87%" width="100%" height="16%" fill="#fff" style="background: #0d0f30;"></rect>
		<image x="36.5% " y="81%" width="28%" height="10%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download.png' )" />
			</xsl:attribute>
		</image>
		<text x="50%" y="94.5%" class="center futura-condensed" fill="#000" font-weight="100" font-size="290%">
			<xsl:text>Listed by </xsl:text>
			<!-- Listed by -->
			<tspan font-weight="800">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'marketingName'" />
					<xsl:with-param name="default" select="//agent[1]/marketingName" />
				</xsl:call-template>
			</tspan>
			<tspan> - </tspan>
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="concat(' ',//agent[1]/marketingLicense)" />
				</xsl:call-template>
			</tspan>
		</text>
	</xsl:template>
	<!-- just sold case end -->

	<!-- just listed case start -->
	<xsl:template name="just-listed">
		<text x="50%" y="35.5%" class="futura-text  center" fill="#fff" font-size="500%" font-weight="700">
		   Your neighbors are
		</text>

		<text x="50%" y="38.5%" class="futura-text  center" fill="#a18d4c" font-size="500%" font-weight="700">
		  selling their home.
		</text>

		<text x="50.5%" y="43.5%" class="futura-text  center" fill="#fff" font-size="535%" font-weight="700">
		  Do they know
		</text>
		<text x="50.5%" y="46.5%" class="futura-text  center" fill="#fff" font-size="535%" font-weight="700">
		  something that
		</text>
		<text x="50.5%" y="49.5%" class="futura-text  center" fill="#a18d4c" font-size="535%" font-weight="700">
		 you don’t?
		</text>

		<image x="0%" y="56%" width="49%" height="13%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-1'" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<image x="50%" y="56%" width="49%" height="13%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-2'" />
				<xsl:with-param name="idx" select="2" />
			</xsl:call-template>
		</image>

		<text x="50%" y="72%" class="futura-text center upper" fill="#fff" font-weight="400" font-size="500%" style="letter-spacing: 3px;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="$listingAddressLine1" />
			</xsl:call-template>
		</text>

		<text x="50%" y="75.2%" class="futura-text center" fill="#fff" font-weight="400" font-size="240%">
        	Just Listed by 
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'marketingName'" />
				<xsl:with-param name="default" select="//agent[1]/marketingName" />
			</xsl:call-template>

			<tspan fill="#a18d4c"> • </tspan>
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<rect x="0" y="85%" width="100%" height="16%" fill="#fff" style="background: #0d0f30;"></rect>
		<image x="36.5% " y="80%" width="28%" height="10%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download.png' )" />
			</xsl:attribute>
		</image>
		<text x="50%" y="92.5%" class="futura-condensed center" fill="#0d0f30" font-weight="800" font-size="450%">
        	Find out how<tspan style="font-style:italic;"> your home </tspan>compares.
		</text>
	</xsl:template>
	<!-- just listed case end -->

	<xsl:template name="svg-body">
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link>
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-condensed.css')" />

		</link>
		<link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/caslon.css')" />

		</link>

		<rect x="0" y="0" width="100%" height="100%" fill="#0d0f30	" style="background: #0d0f30;"></rect>
		<image x="20%" y="4.8%" width="40%" class="center" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
			</xsl:attribute>
		</image>
		<image x="64%" y="5.8%" width="13%" class="center" height="3%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/exp-white.png' )" />
			</xsl:attribute>
		</image>
		<svg height="100%" width="100%">
			<circle cx="50%" cy="21.5%" r="12%" fill="#282843" />
		</svg>
		<line xmlns="" x1="0%" y1="22.5%" x2="28%" y2="22.5%" stroke="#282843" stroke-width="0.3%" />

		<xsl:if test="number(//single/statusTypeID)=2">
			<xsl:call-template name="just-sold" />
		</xsl:if>
		<xsl:if test="number(//single/statusTypeID)!=2">
			<xsl:call-template name="just-listed" />
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>