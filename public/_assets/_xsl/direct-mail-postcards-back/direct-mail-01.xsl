<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Back - No.1
	Known As:	Targetted DM Piece
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Area
	Permission:	Direct Mail
	Approved: 	True
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<style>
<xsl:value-of select="'foreignObject p { margin:0; }'" />

		</style>

		<g style="transform: translate(2.5%, 5%);">
			<text class="sub-heading capitalize bold" style="font-size:200%" y="2%" data-max-width="38%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areaname'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
				<tspan x="0" dy="6%" class="upper tiny" style="font-weight:400;" fill="var(--theme-body-color)">
					<xsl:value-of select="//date/@period" />
				</tspan>
			</text>
			<svg x="0" y="1%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#house-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@soldPropertyTypeCount, ' ', $singularPropertyType ,' ',  'Sold')" />
				</text>
			</svg>
			<svg x="0" y="11%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#map-pin-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@activePropertyTypeCount,' ', $singularPropertyType,' ',' Active')" />
				</text>
			</svg>
			<svg x="0" y="21%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#dollar-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="format-number( //statistics/@averageSalePrice, '$###,###')" />
				</text>
			</svg>
			<svg x="0" y="31%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( format-number( //statistics/@avgPricePerSqFtSold, '$###,###'), ' / SqFt' )" />
				</text>
			</svg>
			<svg x="0" y="41%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@averageDaysOnMarket, ' Average days on market' )" />
				</text>
			</svg>
			<svg x="0" y="51%" width="36%" height="30%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%" />

				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#barchart-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( format-number( //statistics/@turnOver, '#.00%'), ' turnover rate' )" />
				</text>
			</svg>
		</g>
		<g style="transform: translate(2.5%, 80%);">
			<text fill="var(--theme-body-color)" style="font-size:100%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'moreinfo'" />
					<xsl:with-param name="default" select="'more information'" />
				</xsl:call-template>
			</text>
			<text x="0" y="4%" fill="var(--theme-body-color)" font-Size="100%" class="upper">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentName'" />
					<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '' )" />
				</xsl:call-template>
			</text>
			<text x="0" y="7%" class="sub-heading bold" font-Size="180%" data-max-width="30%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
		</g>
		<g style="transform: translate(42%, 5%);">
			<text class="sub-heading upper bold" font-Size="170%" y="2%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'tipstogetting'" />
					<xsl:with-param name="default" select="concat( '3 tips to getting your' , ' ',$singularPropertyType , '', ' sold fast')" />
				</xsl:call-template>
			</text>
			<svg x="-3%" y="0" width="62%" height="32%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="8%" y="40%" width="83%" height="47%" />

				<circle cx="8%" r="8%" fill="var(--theme-sub-heading-color)" cy="64%"></circle>
				<text x="8%" y="65%" class="large center middle" fill="var(--theme-body-background)" style="font-size:360%;">
						1
				</text>
				<text x="14%" y="44%" fill="var(--theme-sub-heading-color)" style="font-size:125%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'upgradedkitchen'" />
<xsl:with-param name="default" select="concat( 'Upgraded Kitchen and bathrooms sells',' ', lower-case( $singularPropertyType )" />

					</xsl:call-template>
				</text>
				<foreignObject x="15%" y="58%" width="75%" height="20%" style="font-size:90%;">
					<div style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'html-countertopsupgrade'" />
							<xsl:with-param name="default" select="'Swap out your old counter taps with granite counter tops upgrade to stain steel appliance'" />
							<xsl:with-param name="data-element" select="'p'" />
						</xsl:call-template>
					</div>
				</foreignObject>
			</svg>

			<svg x="-3%" y="17%" width="62%" height="32%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="8%" y="40%" width="83%" height="47%" />

				<circle cx="8%" r="8%" fill="var(--theme-sub-heading-color)" cy="64%"></circle>
				<text x="8%" y="65%" class="large center middle" fill="var(--theme-body-background)" style="font-size:360%;">
					2
				</text>
				<text x="14%" y="44%" fill="var(--theme-sub-heading-color)" style="font-size:125%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'declutter'" />
						<xsl:with-param name="default" select="'De-Clutter'" />
					</xsl:call-template>
				</text>
				<foreignObject x="15%" y="58%" width="75%" height="30%" style="font-size:90%;">
					<div style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'html-buyerslovehomes'" />
							<xsl:with-param name="default" select="concat( 'Buyers love' , ' ', lower-case( $propertyType ),' ', 'that are clean and don’t have too much clutter Too much clutter can make a buyer feel stressed and negative while viewing your', ' ', lower-case( $propertyType ))" />
							<xsl:with-param name="data-element" select="'p'" />
						</xsl:call-template>
					</div>
				</foreignObject>
			</svg>

			<svg y="34%" x="-3%" width="62%" height="32%">
<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="8%" y="40%" width="83%" height="47%" />

				<circle cx="8%" r="8%" fill="var(--theme-sub-heading-color)" cy="64%"></circle>
				<text x="8%" y="65%" class="large center middle" fill="var(--theme-body-background)" style="font-size:360%;">
					3
				</text>
				<text x="14%" y="44%" fill="var(--theme-sub-heading-color)" style="font-size:125%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'upgradedkitchenbathrooms'" />
<xsl:with-param name="default" select="concat( 'Upgraded Kitchen and bathrooms sells',' ', lower-case( $singularPropertyType )" />

					</xsl:call-template>
				</text>
				<foreignObject x="15%" y="58%" width="75%" height="30%" style="font-size:90%;">
					<div style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'html-repainting'" />
							<xsl:with-param name="default" select="concat( 're-painting can be one of the least expensive preparations for getting your ' , ' ', lower-case( $propertyType ),' ', 'ready to sell pick colors that will feel inviting and evoke motions of warmth and joy')" />
							<xsl:with-param name="data-element" select="'p'" />
						</xsl:call-template>
					</div>
				</foreignObject>
			</svg>
		</g>

		<g style="transform: translate(42%, 69%);">
			<text x="28%" class="center" fill="var(--theme-body-color)" style="font-size:100%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentname'" />
					<xsl:with-param name="default" select="concat( 'Need help getting started? Call ', //agent[1]/marketingName, ' ', ' today at ', //agent[1]/mobile )" />
				</xsl:call-template>
			</text>

			<image x="0" y="5%" width="17.7%" height="20%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<image x="18%" y="5%" width="17.7%" height="20%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>
			<image x="36%" y="5%" width="17.7%" height="20%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="3" />
				</xsl:call-template>
			</image>
		</g>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>