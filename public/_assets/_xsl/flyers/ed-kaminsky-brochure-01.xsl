<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Brochure 01
	Tags:		Direct Mail
	Sizes:		Ipad Landscape
	Supports:	Listing, Multi-Listing
	Pages:		flyers/ed-kaminsky-brochure-01,flyers/ed-kaminsky-brochure-02
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<!-- <link rel="stylesheet">
<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_css/futura-embedded.css')" />

		</link> -->

		<style>
			<xsl:value-of select="'
			.areaname{
			    font-size: 33px;
			    color: #b0934c;
			    margin-top: 20px;
			    font-weight: 600;
			    margin-bottom: 0;
}'" />
		</style>

		<rect x="0%" y="0%" width="100%" height="100%" fill="#fff" />

		<image x="2%" y="2%" width="96%" height="96%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="$primaryImage" />
			</xsl:attribute>
		</image>

		<image x="64.2%" y="3%" width="30.8%" height="19%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/kaminsky-white.png' )" />
			</xsl:attribute>
		</image>

		<rect width="49.8%" height="25%" x="4.5%" y="65.2%" fill="var(--theme-body-background)" />

		<foreignObject x="7%" y="64.8%" height="25%" width="20%">
			<div style="width: 80%;">
				<h2 class="upper" style="color:var(--theme-heading-color);font-size: 75px;line-height: 1;margin-bottom: 34px; font-family:var(--theme-heading-font)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areanames'" />
						<xsl:with-param name="default" select="$listingAddressLine1" />
					</xsl:call-template>
				</h2>
			</div>
			<div >
				<p class="areaname" style="text-transform: lowercase; margin-top:-10px; font-family:var(--theme-heading-font)">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'areanames'" />
						<xsl:with-param name="default" select="//area/name" />
					</xsl:call-template>
				</p>
			</div>
		</foreignObject>

		<image x="37.2% " y="68.7%" width="14.2%" height="18.6%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/qr-download.png' )" />
			</xsl:attribute>
		</image>

		<image x="82.6%" y="83%" width="13.3%" height="9%" preserveAspectRatio="xMidYMin slice">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/agent-logo.png' )" />
			</xsl:attribute>
		</image>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>