<?xml version="1.0"?>
<!--
	Asset Name: Eric Matz Flyer 2 Style 1
	Tags:		Direct Mail
	Sizes:		Letter
	Supports:	Listing
	Pages:		flyers/eric-matz-flyer-02,flyers/single-rear-01
	Roles:		eric-matz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<g>
			<text x="3%" y="3%" class="upper" style="font-size: 180%">
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn]')" />
				<xsl:text> FEATURED LISTING</xsl:text>
			</text>
			<image x="82%" y="1%" width="14%" height="8%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<rect x="2.5%" y="9.5%" width="95%" height="4" stroke-width="4" fill-opacity="1" fill="var(--theme-body-color)"/>

			<g style="transform: translate(0%, 11%);">
				<image x="3%" y="0" width="94%" height="28%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-1'" />
						<xsl:with-param name="idx" select="1" />
					</xsl:call-template>
				</image>
				<rect stroke="var(--theme-body-color)" stroke-width="4" fill-opacity="0" x="2.8%" y="0" width="94%" height="28%"/>
				<g style="transform:translate(4%,3%)">
					<filter x="-0.3" y="-0.3" width="1.8" height="1.7" id="solid">
						<feFlood flood-color="var(--theme-sub-heading-color)"/>
						<feComposite in="SourceGraphic" operator="xor" />
					</filter>
					<text x="0" y="0" filter="url(#solid)" class="upper" style="fill:var(--theme-body-background); font-size: 90%;">
						<xsl:value-of select="$soldListed"/>
					</text>
					<text x="0" y="0" fill="#fff" class="upper" style="fill:var(--theme-body-background); font-size: 90%;">
						<xsl:value-of select="$soldListed"/>
					</text>
				</g>
			</g>

			<g style="transform: translate(0%, 39%);">
				<text class="center large bold sub-heading" x="50%" y="0" fill="var(--theme-body-color)">
					<xsl:call-template name="listing-address-line-one" />
				</text>
				<text x="50%" y="5%" class="center bold medium sub-heading">
					<tspan>
						<xsl:value-of select="//single/bedrooms/@count"/>
						<xsl:text>BR</xsl:text>
					</tspan>
					<tspan dx="1%">|</tspan>
					<tspan dx="1%">
						<xsl:value-of select="$listingTotalBathrooms"/>
						<xsl:text>BA</xsl:text>
					</tspan>
					<tspan dx="1%">|</tspan>
					<tspan dx="1%">
						<xsl:value-of select="format-number( //single/squareFeet, '###,###' )"/>
					</tspan>
					<tspan dx="1%">|</tspan>
					<xsl:choose>
						<xsl:when test="//single/soldDate!=''">
							<tspan dx="1%">Sold For </tspan>
							<xsl:value-of select="format-number( //single/salePrice, '$###,###')"/>
						</xsl:when>
						<xsl:otherwise>
							<tspan dx="1%">Asking </tspan>
							<xsl:value-of select="format-number( //single/price, '$###,###')"/>
						</xsl:otherwise>
					</xsl:choose>
				</text>
			</g>
			<g style="transform: translate(0%, 50%);">
				<image x="3%" y="0" width="46.5%" height="18%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-2'" />
						<xsl:with-param name="idx" select="2" />
					</xsl:call-template>
				</image>
				<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="2.8%" y="0" width="46.5%" height="18%"/>
				<image x="50.5%" y="0" width="46.5%" height="18%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-3'" />
						<xsl:with-param name="idx" select="3" />
					</xsl:call-template>
				</image>
				<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="50.4%" y="0" width="46.5%" height="18%"/>
				<rect x="2.5%" y="19%" width="95%" height="4" stroke-width="4" fill-opacity="1" fill="var(--theme-body-color)"/>
			</g>
			<g style="transform: translate(0%, 70.5%);">
				<svg x="3%" y="0" width="31%" height="50%">
					<image x="0" y="0" width="100%" height="25%" preserveAspectRatio="xMidYMid slice">
						<xsl:call-template name="switch-image">
							<xsl:with-param name="id" select="'image-4'" />
							<xsl:with-param name="idx" select="4" />
						</xsl:call-template>
					</image>
					<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="0" y="0" width="100%" height="25%"/>
					<polygon points="55,0 85,0 0,85 0,55" fill-opacity="0.75" fill="var(--sold-red)"></polygon>
					<text x="5%" y="10.5%" transform-origin="4% 4%" transform="rotate(-45)" fill="var(--theme-body-background)" class="small align-center">Sold</text>
					<text class="center sub-heading" x="50%" y="26%" fill="var(--theme-body-color)">
						<xsl:call-template name="listing-address-line-one" />
					</text>
					<text class="center upper sub-heading" x="50%" y="31%" fill="var(--theme-body-color)" style="font-size:90%">
						<xsl:value-of select="//single/bedrooms/@count"/>
						<xsl:text>BR &#8226; </xsl:text>
						<xsl:value-of select="$listingTotalBathrooms"/>
						<xsl:text>BA &#8226; </xsl:text>
						<xsl:value-of select="format-number( //single/squareFeet, '###,###' )"/>
						<xsl:text>ESF</xsl:text>
					</text>
				</svg>
				<svg x="34.5%" y="0" width="31%" height="50%">
					<image x="0" y="0" width="100%" height="25%" preserveAspectRatio="xMidYMid slice">
						<xsl:call-template name="switch-image">
							<xsl:with-param name="id" select="'image-5'" />
							<xsl:with-param name="idx" select="5" />
						</xsl:call-template>
					</image>
					<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="0" y="0" width="100%" height="25%"/>
					<polygon points="55,0 85,0 0,85 0,55" fill-opacity="0.75" fill="var(--sold-red)"></polygon>
					<text x="5%" y="10.5%" transform-origin="4% 4%" transform="rotate(-45)" fill="var(--theme-body-background)" class="small align-center">Sold</text>
					<text class="center sub-heading" x="50%" y="26%" fill="var(--theme-body-color)">
						<xsl:call-template name="listing-address-line-one" />
					</text>
					<text class="center upper sub-heading" x="50%" y="31%" fill="var(--theme-body-color)" style="font-size:90%">
						<xsl:value-of select="//single/bedrooms/@count"/>
						<xsl:text>BR &#8226; </xsl:text>
						<xsl:value-of select="$listingTotalBathrooms"/>
						<xsl:text>BA &#8226; </xsl:text>
						<xsl:value-of select="format-number( //single/squareFeet, '###,###' )"/>
						<xsl:text>ESF</xsl:text>
					</text>
				</svg>
				<svg x="66%" y="0" width="31%" height="50%">
					<image x="0" y="0" width="100%" height="25%" preserveAspectRatio="xMidYMid slice">
						<xsl:call-template name="switch-image">
							<xsl:with-param name="id" select="'image-6'" />
							<xsl:with-param name="idx" select="6" />
						</xsl:call-template>
					</image>
					<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="0" x="0" y="0" width="100%" height="25%"/>
					<polygon points="55,0 85,0 0,85 0,55" fill-opacity="0.75" fill="var(--sold-red)"></polygon>
					<text x="5%" y="10.5%" transform-origin="4% 4%" transform="rotate(-45)" fill="var(--theme-body-background)" class="small align-center">Sold</text>
					<text class="center sub-heading" x="50%" y="26%" fill="var(--theme-body-color)">
						<xsl:call-template name="listing-address-line-one" />
					</text>
					<text class="center upper sub-heading" x="50%" y="31%" fill="var(--theme-body-color)" style="font-size:90%">
						<xsl:value-of select="//single/bedrooms/@count"/>
						<xsl:text>BR &#8226; </xsl:text>
						<xsl:value-of select="$listingTotalBathrooms"/>
						<xsl:text>BA &#8226; </xsl:text>
						<xsl:value-of select="format-number( //single/squareFeet, '###,###' )"/>
						<xsl:text>ESF</xsl:text>
					</text>
				</svg>
			</g>
		</g>

		<g>
			<rect x="3%" y="90%" width="94%" height="8%" fill="var(--theme-sub-heading-color)"/>
			<foreignObject x="10%" y="91%" width="80%" height="50" class="align-center" style="text-align: center;">
				<text x="0" y="0" class="normal align-center" style="fill:var(--theme-body-background); color: #fff;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="concat( 'If you would like your home professionally featured in my publication, which is exposed to thousands of buyers every month call me today', '&#160;', //agent[1]/mobile)" />
					</xsl:call-template>
				</text>
			</foreignObject>
		</g>
	</xsl:template>
</xsl:stylesheet>