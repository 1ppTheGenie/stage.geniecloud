<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Back - No.2
	Tags: 		Infographic
	Sizes:		Postcard
	Supports:	Area
	Permission:	Direct Mail
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<style>
			<xsl:value-of select="'foreignObject p {margin:0;}'"/>
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
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%"/>
				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#house-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@soldPropertyTypeCount, ' ', $singularPropertyType ,' ',  'Sold')" />
				</text>
			</svg>
			<svg x="0" y="11%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%"/>
				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#map-pin-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@activePropertyTypeCount,' ', $singularPropertyType,' ',' Active')" />
				</text>
			</svg>
			<svg x="0" y="21%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%"/>
				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#dollar-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( format-number( //statistics/@averageSalePrice, '$###,###'), ' Average Sales Price' )" />
				</text>
			</svg>
			<svg x="0" y="31%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%"/>
				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#tag-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( format-number( //statistics/@avgPricePerSqFtSold, '$###,###'), ' / SqFt' )" />
				</text>
			</svg>
			<svg x="0" y="41%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%"/>
				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#calendar-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( //statistics/@averageDaysOnMarket, ' Average days on market' )" />
				</text>
			</svg>
			<svg x="0" y="51%" width="36%" height="30%">
				<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="1%" y="40%" width="90%" height="30%"/>
				<rect x="1%" y="40%" width="15%" height="30%" fill="var(--theme-sub-heading-color)" />
				<use x="-4%" y="48%" width="25%" height="15%" fill="var(--theme-body-background)">
					<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#barchart-icon' )" />
				</use>
				<text class="capitalize" dx="20%" dy="50%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
					<xsl:value-of select="concat( format-number(//statistics/@turnOver, '#.0%'), ' turnover rate' )"/>
				</text>
			</svg>
		</g>
		<g style="transform: translate(2.5%, 80%);">
			<text fill="var(--theme-body-color)" style="font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'moreinfo'" />
					<xsl:with-param name="default" select="'more information'" />
				</xsl:call-template>
			</text>
			<text x="0" y="4%" fill="var(--theme-body-color)" font-Size="120%" class="upper">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentName'" />
					<xsl:with-param name="default" select="concat( //agent[1]/marketingName, ' ' )" />
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
			<text class="sub-heading upper bold" style="font-size:180%" y="2%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'someadvice'" />
					<xsl:with-param name="default" select="'some advice on closing costs'" />
				</xsl:call-template>
			</text>
			<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="0" y="13%" width="53.5%" height="16%"/>
			<svg x="0" y="0" width="30%" height="32%">
				<text class="upper" x="2.5%" y="45%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'downpayment'" />
						<xsl:with-param name="default" select="'DOWN PAYMENT'" />
					</xsl:call-template>
				</text>
				<foreignObject x="2.5%" y="59%" width="80%" height="30%" style="font-size:80%;">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'purchasepricedepending'" />
							<xsl:with-param name="default" select="'20% of the purchase price depending on your qualifications and loan choice'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</svg>
			<svg x="28%" y="0" width="30%" height="32%">
				<text x="2.5%" y="45%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'earnestmoney'" />
						<xsl:with-param name="default" select="'EARNEST MONEY DEPOSIT'" />
					</xsl:call-template>
				</text>
				<foreignObject x="2.5%" y="59%" width="80%" height="30%" style="font-size:80%;">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'themoneyputdown'" />
							<xsl:with-param name="default" select="'The money put down when a contact is written- it usually goes into an escrow account'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</svg>
			<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="0" y="31%" width="53.5%" height="16%"/>
			<svg x="0" y="18%" width="30%" height="32%">
				<text x="2.5%" y="45%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'lenderfees'" />
						<xsl:with-param name="default" select="'LENDER FEES'" />
					</xsl:call-template>
				</text>
				<foreignObject x="2.5%" y="59%" width="80%" height="30%" style="font-size:80%;">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'includescharges'" />
							<xsl:with-param name="default" select="'Includes charges for loan processing, underwritting and preparation'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</svg>
			<svg x="28%" y="18%" width="30%" height="32%">
				<text x="2.5%" y="45%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'3rdpartyfees'" />
						<xsl:with-param name="default" select="'3RD- PARTY FEES'" />
					</xsl:call-template>
				</text>
				<foreignObject x="2.5%" y="59%" width="80%" height="30%" style="font-size:80%;">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'chargesforinsurance'" />
							<xsl:with-param name="default" select="' Includes charges for insurance, title insurance, title search, appraisal fees and other inspections'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</svg>
			<rect stroke="var(--theme-body-color)" stroke-width="1" fill-opacity="0" x="0" y="49%" width="53.5%" height="16%"/>
			<svg x="0" y="36%" width="30%" height="32%">
				<text x="2.5%" y="45%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'govermentfees'" />
						<xsl:with-param name="default" select="'GOVERMENT FEES'" />
					</xsl:call-template>
				</text>
				<foreignObject x="2.5%" y="59%" width="80%" height="30%" style="font-size:80%;">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'includesdeedrecording'" />
							<xsl:with-param name="default" select="'Includes deed recording and state mortgage taxes'" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</svg>
			<svg x="28%" y="36%" width="30%" height="32%">
				<text x="2.5%" y="45%" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'interestfees'" />
						<xsl:with-param name="default" select="'ESCROW &#38; INTEREST FEES'" />
					</xsl:call-template>
				</text>
				<foreignObject x="2.5%" y="59%" width="80%" height="30%" style="font-size:80%;">
					<p style="color:var(--theme-body-color);-webkit-line-clamp:3;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'includehomeowner'" />

							<xsl:with-param name="default" select="concat( 'Include' , ' ', lower-case($singularPropertyType), 'owner’s insurance, loan interest, real estate taxes',' ',lower-case($singularPropertyType),' ', 'warranties and prepaid interest')" />
						</xsl:call-template>
					</p>
				</foreignObject>
			</svg>
		</g>

		<g style="transform: translate(42%, 69%);">

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