<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail - No.11
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
<rect x="0" y="0" width="100%" height="18%" fill="var(--theme-sub-heading-color)" />

		<image x="0" y="18%" height="82%" width="100%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
<rect x="0" y="18%" width="100%" height="82%" fill="var(--theme-body-background)" fill-opacity="0.8" />


		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g>
			<image x="5%" y="2%" width="10%" height="15%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>

			<svg height="12%" width="4%" x="20%" y="3%">
				<line x1="0" y1="0" x2="00" y2="180" style="stroke:var(--vivid-end-5);stroke-width:10"></line>
			</svg>
			<text x="24%" y="7%" class="capitalize" fill="var(--theme-body-background)" style="text-anchor:start;font-size:150%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentfirstname'" />
					<xsl:with-param name="default" select="concat( 'The &#160;',//agent[1]/marketingName, '&#160;', '&#160;Team' )" />
				</xsl:call-template>
				&#x2022; 
				<tspan>
					<xsl:variable name="month">
						<xsl:value-of select="genie:format-date( //output/@reportDate, '[MNn]')" />
					</xsl:variable>

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'featuredlisting'" />
						<xsl:with-param name="default" select="concat( $month ,' featured listing' )" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

		<g>
			<svg x="1%" y="12%" width="41.5%" height="80%">
				<image x="9%" y="15%" width="90%" height="50%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="'image-1'" />
						<xsl:with-param name="idx" select="1" />
					</xsl:call-template>
				</image>
<rect stroke="var(--theme-body-color)" stroke-width="5" fill-opacity="0" x="9%" y="15%" width="90%" height="50%" />


				<text x="9%" y="68%" fill="var(--theme-body-color)" style="font-size:150%;font-weight:600;">
					<xsl:call-template name="listing-address-line-one" />
				</text>
				<text class="upper" x="9%" y="74%" fill="var(--theme-body-color)" style="font-size:150%">
					<tspan style="font-weight:600;">
<xsl:value-of select="//single/bedrooms/@count" />

					</tspan>
					<tspan>
						<xsl:text> BR </xsl:text>
					</tspan>
					<tspan class="bold">&#8226;&#160;</tspan>
					<tspan style="font-weight:600;">
<xsl:value-of select="(//single/bathrooms/@full+//single/bathrooms/@half)" />

					</tspan>
					<tspan>
						<xsl:text> BA  </xsl:text>
					</tspan>
					<tspan class="bold">&#8226;&#160;</tspan>
					<tspan style="font-weight:600;">
<xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />

					</tspan>
					<tspan>
						<xsl:text> SF</xsl:text>
					</tspan>
				</text>
				<text x="9%" y="80%" fill="var(--theme-body-color)" style="font-size:150%;font-weight:600;">
					<tspan>
						<xsl:value-of select="//area/name" />
					</tspan>
				</text>
				<text x="9%" y="86%" fill="var(--theme-body-color)" style="font-size:150%;font-weight:600;">
					<xsl:choose>
						<xsl:when test="//single/soldDate!=''">
							<tspan>Sold For </tspan>
<xsl:value-of select="format-number( //single/salePrice, '$###,###')" />

						</xsl:when>
						<xsl:otherwise>
							<tspan>Asking </tspan>
<xsl:value-of select="format-number( //single/price, '$###,###')" />

						</xsl:otherwise>
					</xsl:choose>
				</text>
<rect stroke="var(--theme-body-color)" stroke-width="2" fill-opacity="1" x="9%" y="92%" width="62%" height="0.7%" />

				<g style="transform:translate(4%,15%)">
					<filter x="-0.1" y="-0.3" width="1.2" height="1.7" id="solid">
<feFlood flood-color="var(--theme-sub-heading-color)" />

						<feComposite in="SourceGraphic" operator="xor" />
					</filter>
					<text y="0%" filter="url(#solid)" class="upper" style="fill:var(--theme-body-background); font-size: 200%;">
Just<xsl:value-of select="$soldListed" />

					</text>
					<text y="0%" fill="#fff" class="upper" style="fill:var(--theme-body-background); font-size: 200%;">
Just<xsl:value-of select="$soldListed" />

					</text>
				</g>
			</svg>
			<text x="4.5%" y="88%" class="upper" fill="var(--theme-body-color)" style="font-weight: 600;">
				<tspan style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="concat( 'call ', //agent[1]/mobile, '&#160;to sell your', ' ',lower-case($singularPropertyType) )" />
					</xsl:call-template>
				</tspan>
				<tspan x="4.5%" dy="4%" style="font-size:100%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'fasterformoney'" />
						<xsl:with-param name="default" select="'faster, for more money, and with less stress.'" />
					</xsl:call-template>
				</tspan>
			</text>
			<image x="44%" y="24%" width="20%" height="19%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-2'" />
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>
<rect stroke="var(--theme-body-color)" stroke-width="5" fill-opacity="0" x="44%" y="24%" width="20%" height="19%" />

			<image x="44%" y="45%" width="20%" height="19%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-3'" />
					<xsl:with-param name="idx" select="3" />
				</xsl:call-template>
			</image>
<rect stroke="var(--theme-body-color)" stroke-width="5" fill-opacity="0" x="44%" y="45%" width="20%" height="19%" />

			<svg height="63%" width="4%" x="67%" y="24%">
				<line x1="0" y1="0" x2="00" y2="63%" style="stroke:var(--theme-body-color);stroke-width:5"></line>
			</svg>
		</g>

		<g style="transform: translate(73%, 24%);">
			<text x="10%" class="medium center" fill="var(--theme-sub-heading-color)" style="font-weight: 600;">
				<xsl:value-of select="concat( //agent[1]/marketingName, '&#160;')" />
			</text>
			<text x="10%" y="5.5%" class="center" fill="var(--theme-sub-heading-color)">
<xsl:value-of select="concat( 'Realtor &#124; ', //agent[1]/marketingLicense )" />

			</text>
			<text x="10%" y="9.2%" class="center medium" fill="var(--theme-sub-heading-color)" style="font-weight:600;">
				<xsl:value-of select="//agent[1]/mobile" />
			</text>
			<text x="10%" y="14%" class="center" fill="var(--theme-sub-heading-color)" style="font-size:130%">
				<xsl:value-of select="//agent[1]/marketingEmail" />
			</text>
			<text x="10%" y="18%" class="center" fill="var(--theme-sub-heading-color)" style="font-size:130%; font-weight:600;">
				<xsl:value-of select="//agent[1]/website" />
			</text>
			<svg height="100%" width="26%" y="20.5%" X="-4%">
				<g fill="none" stroke="var(--theme-body-color)" stroke-width="4">
					<path stroke-dasharray="5,2" d="M5 20 l700 0"></path>
				</g>
			</svg>
			<text x="10%" y="26%" class="center upper" fill="var(--theme-sub-heading-color)" style="font-size: 140%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'getone'" />
						<xsl:with-param name="default" select="'you only get one'" />
					</xsl:call-template>
				</tspan>
				<tspan x="10%" dy="5%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'chancetomake'" />
						<xsl:with-param name="default" select="'chance to make a'" />
					</xsl:call-template>
				</tspan>
				<tspan x="10%" dy="5%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'firstimpression'" />
						<xsl:with-param name="default" select="'first impression!'" />
					</xsl:call-template>
				</tspan>
			</text>
		</g>

<rect x="50%" y="69%" width="50%" height="31%" fill="var(--theme-body-background)" />

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>