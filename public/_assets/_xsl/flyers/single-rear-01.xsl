<?xml version="1.0"?>
<!--
	Asset Name: Single Listing Flyer - Standard Rear
	Tags:		Direct Mail, QRCode
	Sizes:		Letter
	Supports:	Listing, Multi-Listing, QRCode
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:import href="flyers.xsl"/>

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
			'" />
		</style>

		<image x="2%" y="1.5%" width="47%" height="28%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-4'" />
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>

		<g style="transform:translate(51%,1.5%);">
			<text class="medium center upper" x="6.3%" y=".5%" font-size="260%" font-family="var(--theme-heading-font)">
				<tspan class="bold " font-size="160%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'diningroom'" />
						<xsl:with-param name="default" select="'fast facts'" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="22%" y="3.8%" class="heading center" font-size="220%" font-weight="400">
				<tspan>
					<xsl:value-of select="$listingAddressLine1" />
				</tspan>
				<tspan x="22%" dy="2.2%">
					<xsl:value-of select="$listingAddressLine2" />
				</tspan>
			</text>

			<text x="22%" y="24.5%" class="heading center" font-size="250%" font-weight="500">
				<tspan>
					<xsl:choose>
						<xsl:when test="//single/soldDate!=''">
							<tspan class="">Sold For </tspan>
							<xsl:value-of select="format-number( //single/salePrice, '$###,###')"/>
						</xsl:when>
						<xsl:otherwise>
							<tspan class="">Asking </tspan>
							<xsl:value-of select="format-number( //single/price, '$###,###')"/>
						</xsl:otherwise>
					</xsl:choose>
				</tspan>
			</text>

			<g style="transform:translateY(11%)">
				<text class="bold" font-size="140%" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
					<tspan x="0" y="0">Type: </tspan>
					<tspan dx="0.1%" y="0" font-weight="400">
						<xsl:value-of select="$singularPropertyType"/>

						Z<xsl:value-of select="//output/@propertyCaption"/>
Z
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

		<g style="transform:translate( 2%, 31.5% )">
			<xsl:choose>
				<xsl:when test="count(//single/dimensions/room) = 0">
					<image x="0" y="0" width="47%" height="28%" preserveAspectRatio="xMidYMid slice">
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

								<rect x="0" y="0" width="22.5%" height="3.75%" stroke-width="1" stroke="var(--theme-sub-heading-color)" fill="none"/>

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

		<g style="transform:translate(2%,64%)">
			<foreignObject x="0" y="0" width="47%" height="22%">
				<div style="height: 400px; width:100%;display: inline-block;">
					<xsl:call-template name="map-output">
						<xsl:with-param name="style" select="'streets-v11'" />
					</xsl:call-template>
				</div>
			</foreignObject>
			<foreignObject x="49%" y="0" width="50%" height="22%">
				<xsl:if test="//features/feature!=''">
					<div style="width: 100%;">
						<text class="upper bold large sub-heading">
							<tspan>Features</tspan>
						</text>
						<xsl:for-each select="//features/feature">
							<xsl:if test="position() &lt;= 7">
								<p style="line-height:150%">
									<text class="bold medium" style="color:var(--theme-body-color)">
										<xsl:value-of select="@category" />
									</text>
									<text class="medium" style="color:var(--theme-body-color)">
										<xsl:text>: </xsl:text>
										<xsl:value-of select="@description" />
									</text>
								</p>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:if>
			</foreignObject>

			<g style="transform: translate(48.5%, 0);">
				<text x="0" y="0%" class="upper super-bold" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-size="100%">
					<tspan class="super-bold" style="font-size: 32px;">Scan to access</tspan>
				</text>
				<svg height="100" width="100">
					<circle cx="15" cy="56" r="4" fill="#a47f54" />
				</svg>
				<text x="2%" y="2.5%" class="upper" font-weight="100" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-size="115%">
					<tspan>Floor plans</tspan>
				</text>
				<svg height="100" width="100">
					<circle cx="15" cy="81" r="4" fill="#a47f54" />
				</svg>
				<text x="2%" y="3.8%" class="upper" font-weight="100" fill="var(--theme-heading-color)" style="font-family:var(--theme-heading-font);font-size:115%;">
					<tspan>3D VIRTUAL TOUR</tspan>
				</text>
				<svg height="100" width="100" y="0.5%">
					<circle cx="15" cy="98" r="4" fill="#a47f54" />
				</svg>
				<text x="2%" y="5.1%" class="upper" font-weight="100" fill="var(--theme-heading-color)" style="font-family:var(--theme-heading-font);font-size:115%;">
					<tspan>HI RES PHOTO COLLECTION</tspan>
				</text>
				<svg height="100" width="100" y="2.2%">
					<circle cx="15" cy="90" r="4" fill="#a47f54" />
				</svg>
				<text x="2%" y="6.5%" class="upper" font-weight="100" fill="var(--theme-heading-color)" style="font-family:var(--theme-heading-font);font-size:115%;">
					<tspan>FULL DESCRIPTION</tspan>
				</text>
				<svg height="100" width="100" y="3.5%">
					<circle cx="15" cy="90" r="4" fill="#a47f54" />
				</svg>
				<text x="2%" y="7.8%" class="upper" font-weight="100" fill="var(--theme-heading-color)" style="font-family:var(--theme-heading-font);font-size:115%;">
					<tspan>DETAILED FEATURE LIST</tspan>
				</text>

				<svg height="100" width="100" y="4.9%">
					<circle cx="15" cy="90" r="4" fill="#a47f54" />
				</svg>
				<text x="2%" y="9.2%" font-weight="100" fill="var(--theme-heading-color)" style="font-family:var(--theme-heading-font);font-size:115%;">
					<tspan>Real-Time MARKET INSIDER Report</tspan>
					<tspan x="2%" dy="1%" class="capatilize">
						<xsl:call-template name="editable">
							<xsl:with-param name="default" select="concat( 'for the ', //area/name, ' area')" />
						</xsl:call-template>
					</tspan>
				</text>
				<svg height="100" width="100" y="7.3%">
					<circle cx="15" cy="90" r="4" fill="#a47f54" />
				</svg>
				<text x="2%" y="11.5%" class="upper" font-weight="100" fill="var(--theme-heading-color)" style="font-family:var(--theme-heading-font);font-size:115%;">
					<tspan>AND MORE...</tspan>
				</text>
				<svg xmlns="http://www.w3.org/2000/svg" x="53%" y="36%" width="10%" height="9%" viewBox="0 0 313 348" fill="none">
					<rect x="15.5" y="71.0069" width="259" height="261" style="stroke: var(--theme-sub-heading-color); opacity: 0.3;" stroke-width="31"></rect>
				</svg>
				<text x="63%" y="38%" class="upper bold" fill="var(--theme-heading-color)" style="font-family:var(--theme-body-font);font-size:100%;">
					<tspan>Homes</tspan>
					<tspan x="63%" dy="3%">Currently</tspan>
					<tspan x="63%" dy="3%">Listed</tspan>
				</text>
				<text x="91%" y="40%" width="26%" height="8%" fill="var(--theme-heading-color)" class="center" style="font-family:var(--theme-body-font);">
					<tspan class="upper  bold" style="font-size:120%;line-height:20px;" data-element="p" data-editable="true" data-default="And Much " data-name="And Much ">And Much </tspan>
					<tspan x="91%" dy="4%" class="upper bold" style="font-size:170%;line-height:21px;" data-element="p" data-editable="true" data-default="More..." data-name="More...">More...</tspan>
				</text>
			</g>

			<g style="transform:translate(49%, 13.5%)">
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'10%'" />
					<xsl:with-param name="height" select="'10%'" />
				</xsl:call-template>
			</g>

			<g style="transform: translate(59%, 13.7%);">
				<use x=".4%" y="2%" width="8%" height="6%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#qr-code-svg' )" />
				</use>
				<text x="0%" y="5.4%" fill="var(--theme-body-color)" style="font-size:65%">
					<tspan x="0%">Scan the</tspan>
					<tspan x="0%" dy=".7%">QR Code</tspan>
					<tspan x="0%" dy=".7%">with your</tspan>
					<tspan x="0%" dy=".7%">camera</tspan>
				</text>
			</g>
		</g>

		<image x="73%" y="66%" width="23%" height="21%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/mobile-image1.png' )" />
			</xsl:attribute>
		</image>
		<rect x="74.2%" y="68%" width="20.5%" height="19%" stroke-width="1" style="fill:#FFF;" />
		<image x="75%" y="65%" width="18%" height="15%" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/mobile-floor-plan.jpg' )" />
			</xsl:attribute>
		</image>

		<text x="84.5%" y="78.3%" class="heading center" font-size="190%" data-max-width="16%">
			<tspan font-weight="700">
				<xsl:value-of select="$listingAddressLine1" />
			</tspan>
			<tspan x="84.5%" dy="1.8%" font-weight="300">
				<xsl:value-of select="$listingAddressLine2" />
			</tspan>
		</text>

		<rect x="80.5%" y="83%" width="8%" rx="5px" ry="5px" height="2.5%" stroke-width="1" fill="#6A953E" />
		<text x="84.5%" y="83.5%" class="upper center" font-size="150%" font-family="var(--theme-heading-font)" fill="#fff">
			<tspan>DETAILS</tspan>
		</text>

		<xsl:call-template name="flyer-footer" />

	</xsl:template>
</xsl:stylesheet>