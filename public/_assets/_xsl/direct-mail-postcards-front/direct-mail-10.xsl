<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Postage Side - No.10
	Tags: 		Open House
	Sizes:		Facebook
	Supports:	Listing, Open-House, Print
	Permission:	Direct Mail
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<g>
<rect x="0" y="0" width="100%" height="25%" fill="var(--theme-sub-heading-color)" />

			<svg height="80" width="100%" y="22%" x="0">
				<path stroke-linecap="butt" d="M0 20 l1200 0" fill="none" stroke="var(--vivid-color-5)" stroke-width="6"></path>
			</svg>

			<image x="5%" y="5%" width="10%" height="15%">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<text x="55%" y="5%" class="upper bold large center" fill="var(--theme-body-background)" style="font-size: 230%;font-weight: 600">are you considering buying or selling?</text>

			<svg height="80" width="100%" y="13%" x="23%">
				<path stroke-linecap="butt" d="M0 20 l50 0" fill="none" stroke="var(--vivid-color-5)" stroke-width="6"></path>
			</svg>
			<text x="55%" y="13%" class="upper bold large center" fill="var(--theme-body-background)" style="font-size: 230%;font-weight: 600">
call<xsl:value-of select="//agent[1]/mobile" />
and let's talk!
			</text>
			<svg height="80" width="100%" y="13%" x="83%">
				<path stroke-linecap="butt" d="M0 20 l50 0" fill="none" stroke="var(--vivid-color-5)" stroke-width="6"></path>
			</svg>
			<text x="89.5%" y="17%" class="upper normal center" fill="var(--theme-body-background)" style="font-size:95%;">
				<xsl:value-of select="//agent[1]/marketingLicense" />
			</text>
		</g>

		<g style="transform: translateY(21%);">

			<svg x="2.5%" width="20%" height="50%">
				<image x="5%" y="15%" width="95%" height="37%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:call-template name="listing-image">
							<xsl:with-param name="index" select="number(1)" />
							<xsl:with-param name="preferPrimary" select="'true'" />
						</xsl:call-template>
					</xsl:attribute>
				</image>
				<text class="bold center medium" x="50%" y="54%" fill="var(--theme-body-color)" style="font-size:110%" data-max-width="19%">
					<xsl:value-of select="//areas/area[1]/name" />
				</text>
				<text class="center" x="50%" y="62%" fill="var(--theme-body-color)" style="font-size:90%">
					<xsl:call-template name="listing-address-line-one" />
				</text>
				<text class="center upper" x="50%" y="70%" fill="var(--theme-body-color)" style="font-size:90%">
<xsl:value-of select="//single/bedrooms/@count" />
				 BR &#8226; <xsl:value-of select="(//single/bathrooms/@full+//single/bathrooms/@half)" />
				 BA &#8226; <xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />

				 ESF
			</text>
			<text class="upper center bold" x="50%" y="78%" fill="var(--theme-body-color)" style="font-size:110%;">
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
			<g style="transform:translate(4%,35%)">
				<filter x="-0.1" y="-0.3" width="1.2" height="1.7" id="solid">
<feFlood flood-color="var(--theme-sub-heading-color)" />

					<feComposite in="SourceGraphic" operator="xor" />
				</filter>
				<text y="0" filter="url(#solid)" class="upper" style="fill:var(--theme-body-background); font-size: 90%;">
Just<xsl:value-of select="$soldListed" />

				</text>
				<text y="0" fill="#fff" class="upper" style="fill:var(--theme-body-background); font-size: 90%;">
Just<xsl:value-of select="$soldListed" />

				</text>
			</g>
		</svg>

		<svg x="23.5%" width="20%" height="50%">
			<image x="5%" y="15%" width="95%" height="37%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>
			<text class="bold center medium" x="50%" y="54%" fill="var(--theme-body-color)" style="font-size:110%" data-max-width="19%">
				<xsl:value-of select="//areas/area[1]/name" />
			</text>
			<text class="center" x="50%" y="62%" fill="var(--theme-body-color)" style="font-size:90%">
				<xsl:call-template name="listing-address-line-one" />
			</text>
			<text class="center upper" x="50%" y="70%" fill="var(--theme-body-color)" style="font-size:90%">
<xsl:value-of select="//single/bedrooms/@count" />
				 BR &#8226; <xsl:value-of select="(//single/bathrooms/@full+//single/bathrooms/@half)" />
				 BA &#8226; <xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />

				 ESF
		</text>
		<text class="upper center bold" x="50%" y="78%" fill="var(--theme-body-color)" style="font-size:110%;">
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
		<g style="transform:translate(4%,35%)">
			<filter x="-0.1" y="-0.3" width="1.2" height="1.7" id="solid">
<feFlood flood-color="var(--theme-sub-heading-color)" />

				<feComposite in="SourceGraphic" operator="xor" />
			</filter>
			<text y="0" filter="url(#solid)" class="upper" style="fill:var(--theme-body-background); font-size: 90%;">
Just<xsl:value-of select="$soldListed" />

			</text>
			<text y="0" fill="#fff" class="upper" style="fill:var(--theme-body-background); font-size: 90%;">
Just<xsl:value-of select="$soldListed" />

			</text>
		</g>
	</svg>

	<svg x="44.5%" width="20%" height="50%">
		<image x="5%" y="15%" width="95%" height="37%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="3" />
			</xsl:call-template>
		</image>
		<text class="bold center medium" x="50%" y="54%" fill="var(--theme-body-color)" style="font-size:110%" data-max-width="19%">
			<xsl:value-of select="//areas/area[1]/name" />
		</text>
		<text class="center" x="50%" y="62%" fill="var(--theme-body-color)" style="font-size:90%">
			<xsl:call-template name="listing-address-line-one" />
		</text>
		<text class="center upper" x="50%" y="70%" fill="var(--theme-body-color)" style="font-size:90%">
<xsl:value-of select="//single/bedrooms/@count" />
				 BR &#8226; <xsl:value-of select="(//single/bathrooms/@full+//single/bathrooms/@half)" />
				 BA &#8226; <xsl:value-of select="format-number( //single/squareFeet, '###,###' )" />

				 ESF
	</text>
	<text class="upper center bold" x="50%" y="78%" fill="var(--theme-body-color)" style="font-size:110%;">
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
	<g style="transform:translate(4%,35%)">
		<filter x="-0.1" y="-0.3" width="1.2" height="1.7" id="solid">
<feFlood flood-color="var(--theme-sub-heading-color)" />

			<feComposite in="SourceGraphic" operator="xor" />
		</filter>
		<text y="0" filter="url(#solid)" class="upper" style="fill:var(--theme-body-background); font-size: 90%;">
Just<xsl:value-of select="$soldListed" />

		</text>
		<text y="0" fill="#fff" class="upper" style="fill:var(--theme-body-background); font-size: 90%;">
Just<xsl:value-of select="$soldListed" />

		</text>
	</g>
</svg>

<xsl:if test="//agent[1]/photo">
	<image x="65%" y="7%" width="35%" height="53%" preserveAspectRatio="xMidYMid meet">
		<xsl:attribute name="href">
			<xsl:copy-of select="//agent[1]/photo" />
		</xsl:attribute>
	</image>
</xsl:if>

<rect x="2.5%" y="46%" width="63%" height="13%" fill="var(--theme-sub-heading-color)" />

<text x="35%" y="48%" class="center bold" fill="var(--theme-body-background)" style="    font-size: 140%;font-weight: 600;">
	<tspan class="capitalize">Buying Or Selling Anywhere In <xsl:value-of select="//single/address/city" />
...
	</tspan>
	<tspan class="upper" x="35%" dy="5%">WE SELL IT ALL!</tspan>
</text>
</g>

<g style="transform: translateY(83%);">
<image x="5%" width="10%" height="15%">
	<xsl:attribute name="href">
		<xsl:value-of select="$companyLogo" />
	</xsl:attribute>
</image>
<text x="96%" class="upper" fill="var(--theme-sub-heading-color)" style="font-weight: 600;text-anchor:end;">
	<tspan class="narrow" style="font-size:170%;">call 
		<xsl:value-of select="//agent[1]/mobile" />

		 to sell your   
		<xsl:value-of select="$singularPropertyType" />
	</tspan>
	<tspan class="medium" x="96%" dy="5%">faster, for more money, and with less stress.</tspan>
</text>
</g>
<xsl:call-template name="copyright">
<xsl:with-param name="disclaimer" select="'direct-mail'" />
</xsl:call-template>
</xsl:template>
</xsl:stylesheet>