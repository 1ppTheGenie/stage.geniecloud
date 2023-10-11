<?xml version="1.0"?>
<!--
	Asset Name:	Listing Thumbnails - Active
	Tags:		Thumbnails
	Supports:	Area, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<!-- Exclude from render if there are no active properties -->
	<xsl:template name="include-in-render">
		<xsl:choose>
			<xsl:when test="count(//listings/listing[@state='active']) = 0">
				<xsl:value-of select="'false'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'true'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text {dominant-baseline:middle;}'"/>
		</style>

		<xsl:call-template name="listings-header">
			<xsl:with-param name="title" select="'Active Listings'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>

		<xsl:if test="count(//listings/listing[@state='active']) = 0">
			<xsl:call-template name="empty-listing-text" />
		</xsl:if>
		<xsl:if test="count(//listings/listing[@state='active']) != 0">
			<g style="transform: translate(3.7%,27.5%)">
				<xsl:for-each select="//listings/listing[@state='active']">
					<xsl:if test="position() &lt;= 8">
						<g>
							<xsl:attribute name="style">
								<xsl:value-of select="concat( 'transform: translate(', ( position() - (floor(position() div 5) * 4 ) - 1) * 23.5, '%, ', (ceiling(position() div 4) - 1) * 31.5, '%)' )" />
							</xsl:attribute>

							<image width="22.5%" height="29.5%" preserveAspectRatio="xMinYMid slice">
								<xsl:attribute name="href">
									<!-- <xsl:val ue-of select="concat( //output/@siteUrl, 'thumbnail?url=', @thumb )" /> -->
									<xsl:value-of select="@thumb" />
								</xsl:attribute>
							</image>

							<circle cx="1.5%" cy="2.5%" r="1%" fill="var(--active-green)" fill-opacity="0.75"/>
							<text style="font-size:70%">
								<tspan x="1.5%" y="2.5%" class="align-center" fill="#fff">
									<xsl:value-of select="position()" />
								</tspan>
							</text>

							<polygon points="55,0 85,0 0,85 0,55" fill-opacity="0.75">
								<xsl:attribute name="fill">
									<xsl:choose>
										<xsl:when test="( //output/@reportDate - @listedDate ) &lt; ( 86400 * 30 )">
											<xsl:value-of select="'var(--new-blue)'" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'var(--active-green)'" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</polygon>

							<text x="2.35%" y="3.88%" transform-origin="4% 4%" transform="rotate(-45)" fill="#fff" class="align-center upper">
								<xsl:choose>
									<xsl:when test="( //output/@reportDate - @listedDate ) &lt; ( 86400 * 30 )">
										<xsl:text>New!</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Active</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</text>

							<clipPath id="polyClipab" clipPathUnits="objectBoundingBox">
								<path d="m 0 0 h 1 v 1 h -0.7 c -0.3 0 -0.3 0 -0.3 -1" />
							</clipPath>
							<rect x="14%" width="8.5%" height="8%" clip-path="url(#polyClipab)" fill="var(--printers-marks)" fill-opacity="0.5" />

							<text class="align-right upper" x="22%" y="3%" fill="#fff">Asking</text>
							<text class="align-right" x="22%" y="6%" fill="#fff">
								<xsl:value-of select="format-number(@listPrice, '$###,###')" />
							</text>

							<rect y="21.5%" height="8%" width="22.5%" fill="var(--printers-marks)" fill-opacity="0.5" />

							<text x="11.25%" y="24%" fill="#fff" class="align-center">
								<xsl:value-of select="@address" />
							</text>
							<text x="11.25%" y="27.4%" fill="#fff" class="align-center">
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
		</xsl:if>
		<xsl:call-template name="listings-footer">
			<xsl:with-param name="min" select="number(8)" />
			<xsl:with-param name="nodes" select="$listingsTotalActive"/>
			<xsl:with-param name="summary" select="' active listings.'" />
		</xsl:call-template>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>