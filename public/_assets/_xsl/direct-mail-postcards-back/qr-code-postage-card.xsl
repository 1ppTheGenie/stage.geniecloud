<?xml version="1.0"?>
<!--
	Asset Name: QR Code Postage Card
	Tags: 		Direct Mail
	Sizes:		Postcard
Supports: 	Area, Print, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:variable name="listingState">
		<xsl:choose>
			<xsl:when test="//single/listingStatus='Sold'">
				<xsl:value-of select="'sold'" />
			</xsl:when>
			<xsl:when test="//single/listingStatus='Pending'">
				<xsl:value-of select="'entered escrow'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'listed'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			ul.bullets li {display:-webkit-box;-webkit-line-clamp:2;font-size:180%;padding:0 0 0 56px;position:relative;margin-right:calc(1% + 48px);font-weight:500;color:var(--theme-heading-color);}
			ul.bullets li:last-child {margin-right:0}
			ul.bullets li:before {width:48px;height:48px;display:inline-block;content:'';-webkit-mask-size:cover;mask-size:cover;background-color:var(--theme-emphasis-color);position:absolute;top:10px;left:0px;
			-webkit-mask: url(/_assets/_img/icons/checkmark.svg) no-repeat 50% 50%;
			-mask: url(/_assets/_img/icons/checkmark.svg) no-repeat 50% 50%;}
			'" />
		</style>

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<script>
			<xsl:text></xsl:text>
			<xsl:value-of select="concat( 'const captionOptions = { &quot;qrBanner&quot; : [ &quot;What&#8217;s Trending with ', //area/name, ' ', $propertyType, '?&quot;')" />
			<xsl:text>,</xsl:text>
			<xsl:value-of select="concat( &quot;'Your neighbor&#8217;s house just &quot;, $listingState, &quot;. Curious how much equity YOU have?'&quot; )" />
			<xsl:text>], 'qrZillow': [</xsl:text>
			<xsl:value-of select="'&quot;See What Zillow Can&#8217;t Show You&quot;'" />
			<xsl:text>,</xsl:text>
			<xsl:value-of select="concat( &quot;'Your neighbor&#8217;s house just &quot;, $listingState, &quot;']};&quot; )" />
		</script>

		<g style="transform:translateY(11%)">
			<text id="qrBanner" x="50%" y="0" class="align-center heading" style="font-size:235%;" data-max-width="72%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'whatstrendingtitle'" />
					<xsl:with-param name="default" select="concat( 'Your neighbor&#8217;s house just ', $listingState, '. Curious how much equity YOU have?'  )" />
				</xsl:call-template>
			</text>

			<g style="transform:translate(35%, 10%)">
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'30%'" />
				</xsl:call-template>

				<use x="35%" width="15%" height="25%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/qr.svg#qr-code' )" />
				</use>

				<text x="34%" y="26%">
					<tspan>Scan the QR Code</tspan>
					<tspan x="34%" dy="2%">with your camera</tspan>
				</text>
			</g>

			<text id="qrZillow" x="50%" y="56.4%" class="align-center heading" style="font-size:235%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'whatzillowcant'" />
					<xsl:with-param name="default" select="'See What Zillow Can&#8217;t Show You'" />
				</xsl:call-template>
			</text>
		</g>

		<foreignObject width="96%" height="17.5%" style="transform:translate(2%,78%);">
			<ul style="display:flex;justify-content:space-between;flex-wrap:nowrap;margin:0;padding:0;" class="bullets" data-editable="true" data-name="xml-QRBullets">
				<xsl:choose>
					<xsl:when test="//overrides/*[name()='xml-QRBullets'][1]">
<xsl:copy-of select="//overrides/*[name()='xml-QRBullets'][1]/*" />

					</xsl:when>
					<xsl:otherwise>
						<li>Community Trends</li>
						<li>Neighborhood Trends</li>
						<li>Multi-Year Trends</li>
						<li>Buyer Trends</li>
					</xsl:otherwise>
				</xsl:choose>
			</ul>
		</foreignObject>
	</xsl:template>
</xsl:stylesheet>