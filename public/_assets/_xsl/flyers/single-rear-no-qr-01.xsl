<?xml version="1.0"?>
<!--
	Asset Name: Single Listing Flyer - Standard Rear
	Tags:		Direct Mail, QRCode
	Sizes:		Letter
	Supports:	Listing, Multi-Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:import href="flyers.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />
		<xsl:variable name="salePrice" select="number(//single/salePrice)" />
		<script>
			<xsl:value-of select="concat( &quot;var listings=[ { iconType: 'flag', listPrice: &quot;, //single/price, &quot;, salePrice:&quot;, $salePriceOrZero, &quot;, state:'&quot;,//single/listingStatus, &quot;',lat:'&quot;, //single/latitude, &quot;',lng:'&quot;, //single/longitude, &quot;'} ];&quot; )" />
		</script>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
			.h1 { font-size: 150%; }
			#dimensions text {dominant-baseline: middle}
			.schedule{display:none;}
			g#footer{
					transform: translate(2.5%, 98.3%);
				}
				g#footer text{
					<!-- font-size: 15px; -->
					fill: #94949D;
				}
				g#footer text a tspan{
					fill: #337ab7;
				}
			'" />
		</style>

		<image x="2%" y="1.5%" width="47%" height="28%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-4'" />
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>
        
		<g style="transform:translate(51%,1.5%);">
			<text class="medium center upper" x="6.3%" y=".5%" font-size="260%" font-family="var(--theme-sub-heading-font)">
				<tspan class="bold " font-size="160%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'diningroom'" />
						<xsl:with-param name="default" select="'fast facts'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="22%" y="3.8%" class="center" style="font-family:var(--theme-sub-heading-font);color:var(--theme-heading-color);"  font-size="220%" font-weight="400">
				<tspan>
					<xsl:value-of select="$listingAddressLine1" />
				</tspan>
				<tspan x="22%" dy="2.2%">
					<xsl:value-of select="$listingAddressLine2" />
				</tspan>
			</text>

			<text x="22%" y="24.5%" class="center" style="font-family:var(--theme-sub-heading-font);color:var(--theme-heading-color);" font-size="250%" font-weight="500">
				<tspan>
					<xsl:choose>
						<xsl:when test="//single/soldDate!=''">
							<tspan class="">Sold For </tspan>
							<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />
						</xsl:when>
						<xsl:otherwise>
							<tspan class="">Asking </tspan>
							<xsl:value-of select="format-number( //single/price, '$###,###')" />
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>

			<g style="transform:translateY(11%)">
				<text class="bold" font-size="140%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
					<tspan x="0" y="0">Type: </tspan>
					<tspan dx="0.1%" y="0" font-weight="400">
						<xsl:value-of select="$singularPropertyType" />
					</tspan>

					<tspan x="0" dy="2%">Bedrooms:</tspan>
					<tspan dx="0.1%" dy="0%" font-weight="400">
						<xsl:value-of select="//single/bedrooms/@count" />
					</tspan>

					<tspan x="0" dy="2%">Bathrooms Full:</tspan>

					<tspan dx="0.1%" dy="0%" font-weight="400">
						<xsl:value-of select="//single/bathrooms/@full" />
					</tspan>

					<xsl:if test="//single/bathrooms/@half!=''">
						<tspan x="0" dy="2%">Bathrooms Half: </tspan>
						<tspan dx="0.1%" dy="0%" font-weight="400">
							<xsl:value-of select="//single/bathrooms/@half" />
						</tspan>
					</xsl:if>

					<xsl:if test="//single/parking/@garage!=''">
						<tspan x="0" dy="2%">Garage Spaces:</tspan>
						<tspan dx="0.1%" dy="0%" font-weight="400">
							<xsl:value-of select="//single/parking/@garage" />
						</tspan>
					</xsl:if>
					<xsl:if test="//single/parking/@spaces!=''">
						<tspan x="0" dy="2%">Parking Spaces:</tspan>
						<tspan dx="0.1%" dy="0%" font-weight="400">
							<xsl:value-of select="//single/parking/@spaces" />
						</tspan>
					</xsl:if>
				</text>
			</g>

			<g style="transform:translate(25%,11%)">
				<text class="bold" font-size="140%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
					<tspan x="0" y="0%">Status: </tspan>
					<tspan dx="0.1%" y="0%" font-weight="400">
						<xsl:value-of select="$listingStatusCaption" />
					</tspan>

					<xsl:if test="//single/built!=''">
						<tspan x="0" dy="2%">
							<xsl:text>Year Built: </xsl:text>
						</tspan>
						<tspan dx="0.1%" dy="0%" font-weight="400">
							<xsl:value-of select="//single/built" />
						</tspan>
					</xsl:if>

					<xsl:if test="//single/squareFeet!=''">
						<tspan x="0%" dy="2%">
							<xsl:text>Sq. Ft.: </xsl:text>
						</tspan>
						<tspan dx="0.1%" dy="0%" font-weight="400">
							<xsl:value-of select="format-number(//single/squareFeet, '###,###')" />
						</tspan>
					</xsl:if>

					<tspan x="0%" dy="2%">
						<xsl:text>Lot Sq. Ft.: </xsl:text>
					</tspan>
					<tspan dx="0.1%" dy="0%" font-weight="400">
						<xsl:value-of select="genie:maybe-not-number( //single/lotSize )" />
					</tspan>

					<xsl:if test="//single/squareFeet!='' and //single/price!=''">
						<tspan x="0%" dy="2%">
							<xsl:text>Price Per Sq. Ft.: </xsl:text>
						</tspan>
						<tspan dx="0.1%" dy="0%" font-weight="400">
							<xsl:value-of select="format-number( //single/price div //single/squareFeet, '###,###')" />
						</tspan>
					</xsl:if>

					<xsl:if test="//single/mlsNumber!=''">
						<tspan x="0%" dy="2%">
							<xsl:text>MLS #: </xsl:text>
						</tspan>
						<tspan dx="0.1%" dy="0%" font-weight="400">
							<xsl:value-of select="//single/mlsNumber" />
						</tspan>
					</xsl:if>
				</text>
			</g>
		</g>

		<g style="transform:translate( 2%, 31% )">
			<xsl:choose>
				<xsl:when test="count(//single/dimensions/room) = 0">
					<image x="0" y="0" width="47%" height="31%" preserveAspectRatio="xMidYMid slice">
						<xsl:call-template name="switch-image">
							<xsl:with-param name="id" select="'image-9'" />
							<xsl:with-param name="idx" select="9" />
						</xsl:call-template>
					</image>
				</xsl:when>

				<xsl:otherwise>
					<text x="0%" y="0.5%" class="heading bold upper" font-size="230%">
						<xsl:text>Room Dimensions</xsl:text>
					</text>
					<g style="transform:translate( 0, 4.5% )">
						<xsl:for-each select="//single/dimensions/room">
							<g>
								<xsl:attribute name="style">
									<xsl:variable name="xpos">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 0">
												<xsl:value-of select="'23.5%'" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="'0'" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of select="concat( 'transform: translate(', $xpos, ', ', (round( position() div 2 ) - 1) * 4.5, '%')" />
								</xsl:attribute>

								<rect x="0" y="0" width="22.5%" height="3.75%" stroke-width="1" stroke="var(--theme-sub-heading-color)" fill="none" />


								<text x="1%" y="1.25%" font-family="var(--theme-heading-font)" fill="var(--theme-body-color)" font-size="160%" dominant-baseline="middle">
									<tspan class="bold">
										<xsl:call-template name="editable">
											<xsl:with-param name="id" select="concat( 'dimensions-room-', position() )" />
											<xsl:with-param name="default" select="@name" />
										</xsl:call-template>
									</tspan>
									<tspan x="16%">
										<xsl:choose>
											<xsl:when test="@size!='0x0'">
												<xsl:value-of select="@size" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="'Enquire'" />
											</xsl:otherwise>
										</xsl:choose>
									</tspan>
								</text>
							</g>
						</xsl:for-each>
					</g>
				</xsl:otherwise>
			</xsl:choose>
		</g>

		<g style="transform:translate(51%,31%)">
			<image x="0" y="0" width="23%" height="15%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-5'" />
					<xsl:with-param name="idx" select="5" />
				</xsl:call-template>
			</image>
			<image x="24%" y="0" width="23%" height="15%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-6'" />
					<xsl:with-param name="idx" select="6" />
				</xsl:call-template>
			</image>
			<image x="0" y="16%" width="23%" height="15%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-7'" />
					<xsl:with-param name="idx" select="7" />
				</xsl:call-template>
			</image>
			<image x="24%" y="16%" width="23%" height="15%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-8'" />
					<xsl:with-param name="idx" select="8" />
				</xsl:call-template>
			</image>
		</g>

		<g style="transform:translate(2%,63.6%)">
			<foreignObject x="0" y="0" width="47%" height="22.7%">
				<div style="height: 425px; width:100%;display: inline-block;">
					<xsl:call-template name="map-output">
						<xsl:with-param name="style" select="'streets-v11'" />
					</xsl:call-template>
				</div>
			</foreignObject>
            <image x="49%" y="0%" width="47%" height="22.7%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-10'" />
				<xsl:with-param name="idx" select="10" />
			</xsl:call-template>
		</image>
		</g>

		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1400 1883">
  			<xsl:call-template name="flyer-footer" />
		</svg>

		<xsl:call-template name="copyright" />

	</xsl:template>
</xsl:stylesheet>