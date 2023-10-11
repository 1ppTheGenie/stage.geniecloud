<?xml version="1.0"?>
<!--
	Asset Name:	Agent Branding
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
	Supports:	Listing
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">

		<g style="transform:translate(3%,84.5%)rotate(-90deg)">
			<text class="sub-heading bold" style="font-size:200%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanamemarket'" />
<xsl:with-param name="default" select="concat( 'Single Family &#124; ', //area/name)"/>

				</xsl:call-template>
			</text>
			<text y="8%" fill="var(--theme-body-color)" style="font-size:140%;">
				<tspan>
					<xsl:value-of select="//single/bedrooms/@count" />
 Beds
				</tspan>
				<tspan>
&#124;
				</tspan>
				<tspan>
					<xsl:value-of select="$listingTotalBathrooms" />
 Bath
				</tspan>
				<tspan>
&#124;
				</tspan>
				<tspan>
					<xsl:value-of select="format-number( //single/price div //single/squareFeet, '$###,###' )" />
 SF
				</tspan>
			</text>
		</g>

		<g style="transform:translate(15%,2%)">
			<image width="16%" height="22%" x="69%" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
			<text x="0" class="sub-heading bold" style="font-size:350%;">
				<xsl:value-of select="$status-caption" />
!
			</text>
			<text x="0" y="13%" class="medium bold" fill="var(--theme-body-color)">
				<xsl:choose>
					<xsl:when test="//single/soldDate!=''">
						<tspan class="narrow">Sold For </tspan>
						<xsl:value-of select="format-number( //single/salePrice, '$###,###')"/>
					</xsl:when>
					<xsl:otherwise>
						<tspan class="narrow">Listed </tspan>
						<xsl:value-of select="format-number( //single/price, '$###,###')"/>
					</xsl:otherwise>
				</xsl:choose>
			</text>
			<text x="0" y="19%" fill="var(--theme-body-color)" class="normal">				
				Buyer Represented
			</text>
		</g>
		<g style="transform:translate(15%,27%)">
			<image width="85%" height="58%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<image x="70%" y="47%" width="14%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>
		<image x="85.5%" y="86%" width="14%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>