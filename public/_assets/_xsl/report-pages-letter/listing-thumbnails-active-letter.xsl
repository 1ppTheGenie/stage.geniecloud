<?xml version="1.0"?>
<!--
	Asset Name:	Listing Thumbnails - Active Letter
	Tags:		Thumbnails
	Supports:	Area, Multi-Listing
	Sizes:		US Letter
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

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
			<xsl:value-of select="'text {dominant-baseline: middle;}'" />
		</style>

		<text x="50%" y="8%" class="align-center upper sub-heading" font-size="180%" style="letter-spacing:2px;">
			<xsl:value-of select="concat( //areas/area/name, ' ', $propertyType)" />
		</text>

		<text x="50%" y="13%" class="align-center upper heading" font-size="300%" fill="var(--theme-heading-color)" font-weight="500" style="letter-spacing:2px;">
			<xsl:value-of select="'Active Listings'" />
		</text>

		<text x="50%" y="17%" class="align-center capitalize" font-size="140%">
			<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
		</text>

		<xsl:if test="count(//listings/listing[@state='active']) = 0">
			<xsl:call-template name="empty-listing-text" />
		</xsl:if>
		<xsl:if test="count(//listings/listing[@state='active']) != 0">
			<g style="transform: translate(5.5%,20%)">
				<xsl:for-each select="//listings/listing[@state='active']">
					<xsl:if test="position() &lt;= 8">
						<g>
							<xsl:attribute name="style">
								<xsl:if test="(position() mod 2) = 0">
									<xsl:value-of select="concat( 'transform: translate(', '45% ,' , (ceiling(position() div 2) - 1) * 18, '%)' )" />
								</xsl:if>

								<xsl:if test="(position() mod 2) != 0">
									<xsl:value-of select="concat( 'transform: translate(', '0% ,' , (ceiling(position() div 2) - 1) * 18, '%)' )" />
								</xsl:if>
							</xsl:attribute>

							<image width="43%" height="16.5%" preserveAspectRatio="xMinYMid slice">
								<xsl:attribute name="href">
<xsl:value-of select="@thumb" />

								</xsl:attribute>
							</image>

<circle cx="1.5%" cy="1.7%" r="1%" fill="var(--pending)" fill-opacity="0.75" />

							<text font-size="70%" x="1.5%" y="1.9%" class="align-center" fill="#fff">
								<xsl:value-of select="position()" />
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

							<text x="4%" y="3.65%" transform-origin="4% 4%" transform="rotate(-45)" fill="#fff" class="align-center upper">
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
							<rect x="30%" width="13%" height="6%" clip-path="url(#polyClipab)" fill="var(--printers-marks)" fill-opacity="0.5" />

							<text class="align-right upper" x="42%" y="2%" fill="#fff">Asking</text>
							<text class="align-right" x="42%" y="4%" fill="#fff">
								<xsl:value-of select="format-number(@listPrice, '$###,###')" />
							</text>

							<rect y="11.5%" height="5%" width="43%" fill="var(--printers-marks)" fill-opacity="0.5" />

							<text x="22%" y="13.2%" fill="#fff" class="align-center">
								<xsl:value-of select="@address" />
							</text>
							<text x="22%" y="15.3%" fill="#fff" class="align-center">
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

		<g style="transform: translate(0%,1.5%)">
			<xsl:call-template name="listings-footer">
				<xsl:with-param name="min" select="number(8)" />
<xsl:with-param name="nodes" select="$listingsTotalActive" />

				<xsl:with-param name="summary" select="' active listings.'" />
			</xsl:call-template>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>