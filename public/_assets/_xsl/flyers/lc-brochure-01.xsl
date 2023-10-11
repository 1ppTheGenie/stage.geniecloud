<?xml version="1.0"?>
<!--
	Asset Name: LC-BROCHURE-01
	Tags:		Flyer
	Sizes:		Letter
	Supports:	Listing, Area, QRCode
	Pages:		flyers/lc-brochure-01, flyers/single-rear-01
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'#lineDescription p{-webkit-line-clamp:7;line-height:140%;}'" />
		</style>
		<g>
			<text x="15.5%" y="5.5%" class="center" font-size="115%" font-weight="300" font-family="var(--theme-heading-font)" fill="var(--theme-heading-color)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'THIS FINE PROPERTY BROUGHT TO YOU BY'" />
					<xsl:with-param name="default" select="'THIS FINE PROPERTY BROUGHT TO YOU BY:'" />
				</xsl:call-template>
			</text>

			<xsl:choose>
				<xsl:when test="$personalLogo != ''">
					<image x="3.5%" y="6.4%" width="25%" height="5%" id="logo" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="$personalLogo" />
						</xsl:attribute>
					</image>
				</xsl:when>
				<xsl:otherwise>
					<image x="3.5%" y="7%" width="24%" height="4%" id="logo" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="$companyLogo" />
						</xsl:attribute>
					</image>
				</xsl:otherwise>
			</xsl:choose>

			<g style="transform:translateY(0%)">
				<foreignObject x="25%" y="7.5%" width="50%" height="20%">
					<p class="center upper" style="font-family:var(--theme-heading-font);color:var(--theme-heading-color);margin:0;font-size:45px;line-height:100%;font-weight:300;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'area-gem'" />
							<xsl:with-param name="default" select="concat( genie:indefinite-article( string(//area/name) ), ' ', //area/name, '&#160;Gem' )" />
						</xsl:call-template>
					</p>

					<p class="heading align-center" style="font-size:35px;padding-top:25px;margin:0;font-weight:300;">
						<span>
							<xsl:value-of select="$listingAddressLine1" />
						</span>
						<br/>
						<span>
							<xsl:value-of select="$listingAddressLine2" />
						</span>
					</p>

					<div style="display:flex;justify-content:center;align-items:center;margin-top:25px;">
						<svg height="13" width="60" style="flex-grow:0; margin-right: 5%">
							<path stroke-linecap="butt" d="M0 5 l75 0" fill="none" stroke="var(--theme-heading-color)" stroke-width="6"></path>
						</svg>

						<h2 contenteditable="true" class="bold" style="font-family:var(--theme-heading-font);color:var(--theme-sub-heading-color);font-size:43px;text-align:center;margin:0;">
<xsl:value-of select="$propertyType" />

						</h2>

						<svg height="13" width="60" style="flex-grow:0; margin-left: 5%">
							<path stroke-linecap="butt" d="M0 5 l75 0" fill="none" stroke="var(--theme-heading-color)" stroke-width="6"></path>
						</svg>
					</div>
				</foreignObject>
			</g>

			<g style="transform:translate(4%, 25.5%)">
				<text x="0" y="0" class="heading bold" font-size="280%">
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

				<foreignObject y="3.5%" width="60%" height="15%" id="lineDescription">
					<p style="font-size:27px;font-family:var(--theme-body-font);color:var(--theme-body-color);margin:0;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'singledescription'" />
							<xsl:with-param name="default" select="//single/description" />
						</xsl:call-template>
					</p>
				</foreignObject>
				<svg x="0%" y="19.4%">
					<circle cx="5" cy="8" r="5" fill="black" />
				</svg>
				<text x="1.8%" y="19%" class="heading" font-size="165%" font-weight="400">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Get the FULL DESCRIPTION and DETAILS by Scanning QR-CODE above.'" />
						<xsl:with-param name="default" select="'Get the FULL DESCRIPTION and DETAILS by Scanning QR-CODE above.'" />
					</xsl:call-template>
				</text>
			</g>

			<g style="transform:translate(72.5%, 9.5%)">
				<xsl:call-template name="qr-code">
					<xsl:with-param name="width" select="'14.5%'" />
					<xsl:with-param name="height" select="'14%'" />
				</xsl:call-template>
			</g>

			<g style="transform: translate(88%, 14%);">
				<use x="0" y="-2%" width="10%" height="5%">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/qr.svg#qr-code' )" />
				</use>
				<text x="0%" y="1.5%" font-size="var(--theme-body-font)" fill="var(--theme-body-color)" style="font-size:65%" font-weight="500">
					<tspan x="0%" dy=".6%">Scan the</tspan>
					<tspan x="0%" dy=".6%">QR Code</tspan>
					<tspan x="0%" dy=".6%">with your</tspan>
					<tspan x="0%" dy=".6%">camera</tspan>
				</text>
			</g>

			<svg width="11.5%" x="74%" y="-44.5%" viewBox="0 0 68 92" fill="var(--theme-heading-color)"
				xmlns="http://www.w3.org/2000/svg">
				<path d="M0 66.5V0H67.5V66.5L33.5 92L0 66.5Z" />
			</svg>

			<text x="79.7%" y="0%" class="bold align-center" font-family="var(--theme-heading-font)" fill="var(--theme-body-background)" font-size="215%" font-weight="800">
				<tspan x="79.7%" dy="2.5%">
					<xsl:value-of select="'SCAN FOR'" />
				</tspan>
				<tspan x="79.7%" dy="2%">
					<xsl:value-of select="'DETAILS'" />
				</tspan>
			</text>

			<g style="transform:translate(62%, 18%)">
				<svg width="88%" height="50%" x="-9%" y="5%">
					<use x="3" y="2.8%" width="57%" height="121" fill="var(--theme-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bed-icon' )" />
					</use>
					<text x="39.8%" y="5%" class="bold" fill="var(--theme-heading-color)" style="font-size: 470%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bedroomscount'" />
							<xsl:with-param name="default" select="//single/bedrooms/@count" />
						</xsl:call-template>
					</text>
				</svg>

				<svg width="88%" height="50%" x="-9%" y="11%">
					<use x="3" y="2.8%" width="57%" height="121" fill="var(--theme-heading-color)">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#bath-icon' )" />
					</use>
					<text x="39.8%" y="5%" class="bold" fill="var(--theme-heading-color)" style="font-size: 470%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'bathroomscount'" />
							<xsl:with-param name="default" select="$listingTotalBathrooms" />
						</xsl:call-template>
					</text>
				</svg>

				<svg width="88%" height="50%" x="-9%" y="18%">
					<!-- <use x="3" y="2.8%" width="57%" height="121" fill="var(theme-heading-color)"><xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#park-icon' )" /></use> -->
					<svg x="21%" y="2.8%" width="12%" height="12%" viewBox="-86 -66 512 512" fill="var(--theme-heading-color)">
<path d="M39.61 196.8L74.8 96.29C88.27 57.78 124.6 32 165.4 32H346.6C387.4 32 423.7 57.78 437.2 96.29L472.4 196.8C495.6 206.4 512 229.3 512 256V448C512 465.7 497.7 480 480 480H448C430.3 480 416 465.7 416 448V400H96V448C96 465.7 81.67 480 64 480H32C14.33 480 0 465.7 0 448V256C0 229.3 16.36 206.4 39.61 196.8V196.8zM109.1 192H402.9L376.8 117.4C372.3 104.6 360.2 96 346.6 96H165.4C151.8 96 139.7 104.6 135.2 117.4L109.1 192zM96 256C78.33 256 64 270.3 64 288C64 305.7 78.33 320 96 320C113.7 320 128 305.7 128 288C128 270.3 113.7 256 96 256zM416 320C433.7 320 448 305.7 448 288C448 270.3 433.7 256 416 256C398.3 256 384 270.3 384 288C384 305.7 398.3 320 416 320z" />

					</svg>

					<xsl:if test="//single/parking/@spaces='' or //single/parking/@garage=''">
						<text x="39.8%" y="4.5%" class="bold" fill="var(--theme-heading-color)" font-size="470%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'parkingspaces'" />
								<xsl:with-param name="default" select="//single/parking/@spaces" />
							</xsl:call-template>
						</text>
						<text x="39.8%" y="4.5%" class="bold" fill="var(--theme-heading-color)" font-size="470%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'parkingspaces'" />
								<xsl:with-param name="default" select="//single/parking/@garage" />
							</xsl:call-template>
						</text>
					</xsl:if>

					<xsl:if test="//single/parking/@spaces!='' and //single/parking/@garage!=''">
						<text x="39.8%" y="4.5%" class="bold" fill="var(--theme-heading-color)" font-size="470%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'parkingspaces'" />
								<xsl:with-param name="default" select="//single/parking/@spaces+//single/parking/@garage" />
							</xsl:call-template>
						</text>
					</xsl:if>
				</svg>
			</g>

			<xsl:if test="//single/mlsNumber!=''">
				<text x="82%" y="46%" class="normal" fill="var(--theme-sub-heading-color)">
					<tspan font-size="150%">
							MLS#: <xsl:value-of select="//single/mlsNumber" />
					</tspan>
				</text>
			</xsl:if>

			<g style="transform:translate(0%, 49%)">
				<image x="2%" y="0" width="48%" height="23%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-1'" />
						<xsl:with-param name="idx" select="1" />
					</xsl:call-template>
				</image>

				<image x="51%" y="0" width="47%" height="23%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-2'" />
						<xsl:with-param name="idx" select="2" />
					</xsl:call-template>
				</image>

				<image x="2%" y="24.5%" width="48%" height="23%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-3'" />
						<xsl:with-param name="idx" select="3" />
					</xsl:call-template>
				</image>

				<g style="transform:translate(51%, 26.5%)">
					<svg width="100%" height="100%">
						<image x="1.6%" y="0" width="20%" height="19%" preserveAspectRatio="xMidYMid slice">
							<xsl:attribute name="href">
								<xsl:value-of select="//agent[1]/photo" />
							</xsl:attribute>
						</image>
						<!-- <image x="3%" y="5%" width="21%" height="23%" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
<xsl:value-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image> -->
						<g style="transform:translate(24%, 0%)">
							<image x="4%" y="0%" width="19%" height="4%" id="logo" preserveAspectRatio="xMaxYMid meet">
								<xsl:attribute name="href">
									<xsl:value-of select="$personalLogo" />
								</xsl:attribute>
							</image>
							<text class="align-right bold heading" x="23%" y="4%" font-size="250%">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'agentname'" />
									<xsl:with-param name="default" select="//agent[1]/marketingName" />
								</xsl:call-template>
							</text>
							<text class="sub-heading align-right" x="23%" y="6.8%" fill="var(--theme-sub-heading-color)" font-size="200%" font-weight="800">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'agentmobile'" />
									<xsl:with-param name="default" select="//agent[1]/mobile" />
								</xsl:call-template>
							</text>
							<text x="23%" y="10%" class="sub-heading align-right" fill="var(--theme-sub-heading-color)" style="font-size:150%;dominant-baseline: middle;" data-max-width="25%">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'agentmarketingemail'" />
									<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
								</xsl:call-template>
							</text>
							<text x="23%" y="12%" class="sub-heading align-right" fill="var(--theme-sub-heading-color)" style="font-size:150%;dominant-baseline: middle;" data-max-width="25%">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'agentwebsite'" />
									<xsl:with-param name="default" select="//agent[1]/website" />
								</xsl:call-template>
							</text>
							<text class="sub-heading align-right" x="23%" y="13%" fill="var(--theme-sub-heading-color)" style="font-size:140%;">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'licenseno'" />
									<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
								</xsl:call-template>
							</text>
							<image x="10.5%" y="15%" width="13%" height="3%" id="logo" preserveAspectRatio="xMaxYMid meet">
								<xsl:attribute name="href">
									<xsl:value-of select="$companyLogo" />
								</xsl:attribute>
							</image>
						</g>
					</svg>
				</g>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>