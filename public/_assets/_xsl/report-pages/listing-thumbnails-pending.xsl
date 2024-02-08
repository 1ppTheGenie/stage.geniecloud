<?xml version="1.0"?>
<!--
	Asset Name:	Listing Thumbnails - Pending
	Tags:		Thumbnails
	Supports:	Area, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<!-- Exclude from render if there are no pending properties -->
	<xsl:template name="include-in-render">
		<xsl:choose>
			<xsl:when test="count(//listings/listing[@state='pending']) = 0">
				<xsl:value-of select="'false'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'true'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'text {dominant-baseline:middle;}'" />

		</style>
		<xsl:call-template name="listings-header">
			<xsl:with-param name="title" select="'Pending Listings'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>

		<g style="transform: translate(3.7%,27.5%)">
			<xsl:for-each select="//listings/listing[@state='pending']">
			    <xsl:sort select="@isAgent" data-type="number" order="descending"/>
    			<xsl:sort select="@sortDate" data-type="number" order="descending"/>

				<xsl:if test="position() &lt;= 8">
					<g width="22%" height="20%">
						<xsl:attribute name="style">
							<xsl:value-of select="concat( 'transform: translate(', ( position() - (floor(position() div 5) * 4 ) - 1) * 23.5, '%, ', (ceiling(position() div 4) - 1) * 31.5, '%)' )" />
						</xsl:attribute>

						<image width="22.5%" height="29.5%" preserveAspectRatio="xMinYMid slice">
							<xsl:attribute name="href">
								<xsl:value-of select="concat( //output/@apiUrl, 'thumbnail?width=600&amp;url=', encode-for-uri( @thumb ) )" />
							</xsl:attribute>
						</image>

						<circle cx="1.5%" cy="2.5%" r="1%" fill="var(--pending-yellow)" fill-opacity="0.75" />

						<text style="font-size:70%">
							<tspan x="1.5%" y="2.5%" class="align-center" fill="#fff">
								<xsl:value-of select="position()" />
							</tspan>
						</text>
						<polygon points="55,0 85,0 0,85 0,55" fill="var(--pending-yellow)" fill-opacity="0.75" />

						<text x="2.35%" y="3.88%" transform-origin="4% 4%" transform="rotate(-45)" fill="#fff" class="align-center upper">
							Pending
						</text>

						<clipPath id="polyClip1" clipPathUnits="objectBoundingBox">
							<path d="m 0 0 h 1 v 1 h -0.6 c -0.2 0 -0.3 0 -0.3 -1" />
						</clipPath>
						<rect x="13%" width="9.5%" height="8%" clip-path="url(#polyClip1)" fill="var(--printers-marks)" fill-opacity="0.5" />

						<text class="align-right upper" x="22%" y="3%" fill="#fff">Listed for</text>
						<text class="align-right" x="22%" y="6%" fill="#fff">
							<xsl:value-of select="format-number(@listPrice, '$###,###')" />
						</text>

						<rect y="21.5%" height="8%" width="22.5%" fill="var(--printers-marks)" fill-opacity="0.5" />

						<text x="11.25%" y="24%" fill="#fff" class="align-center">
							<xsl:value-of select="@address" />
						</text>
						<text x="11.25%" y="27.5%" fill="#fff" class="align-center">
							<tspan>
								<xsl:value-of select="@beds" />
							</tspan>
							<tspan> BR &#124; </tspan>
							<tspan>
								<xsl:value-of select="@baths" />
							</tspan>
							<tspan> BA &#124; </tspan>
							<xsl:value-of select="format-number(@size, '###,###')" />
							<tspan> SQFT</tspan>
						</text>
					</g>
				</xsl:if>
			</xsl:for-each>
		</g>

		<xsl:call-template name="listings-footer">
			<xsl:with-param name="min" select="number(8)" />
				<xsl:with-param name="nodes" select="$listingsTotalPending" />
			<xsl:with-param name="summary" select="' pending listings.'" />
		</xsl:call-template>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>