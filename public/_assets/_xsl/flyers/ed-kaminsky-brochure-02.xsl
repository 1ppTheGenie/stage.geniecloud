<?xml version="1.0"?>
<!--
	Asset Name: Ed Kaminsky Brochure 02
	Tags:		Direct Mail
	Sizes:		Ipad Landscape
	Supports:	Listing, Multi-Listing
	Pages:		flyers/ed-kaminsky-brochure-01,flyers/ed-kaminsky-brochure-02
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:genie="https://theGenie.ai/hub" version="3.0"
	expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:template name="svg-body">
		<xsl:value-of select="'
			foreignObject:not(.editing) p:first-child {
    			margin-top: 20px;
			}
			
			foreignObject:not(.editing) p {
    			line-height: 118%;
				margin-top: 0px;
    			margin-bottom: 14px;
}'" />

		<rect x="0%" y="0%" width="100%" height="100%" fill="var(--theme-body-background)" />
		<rect x="2%" y="2.5%" width="96%" height="97.5%" fill="var(--theme-heading-color)" />

		<xsl:choose>
			<xsl:when test="//output/@themeHue = 'light'">
				<image x="-33.8%" y="8%" width="27.7%" id="logo" preserveAspectRatio="xMidYMin meet"
					style="transform: rotate(270deg); -webkit-transform: rotate(270deg);">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoDark" />
					</xsl:attribute>
				</image>
			</xsl:when>
			<xsl:otherwise>
				<image x="-33.8%" y="8%" width="27.7%" height="9.3%" id="logo" preserveAspectRatio="xMidYMid meet"
					style="transform: rotate(270deg); -webkit-transform: rotate(270deg);">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/personalLogoLight" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>
		<text x="9.5%" y="48.3%" class="center" font-family="var(--theme-heading-font)">
			<tspan x="9.5%" dy="1%" font-size="36" font-weight="700" fill="var(--theme-body-background)">
				<xsl:value-of select="//single/bedrooms/@count" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" class="center" font-family="var(--theme-heading-font)"
				fill="var(--theme-sub-heading-color)" font-size="25" font-weight="400">
				<xsl:value-of select="'beds'" />
			</tspan>
		</text>
		<text x="9.5%" y="56.3%" class="center" font-family="var(--theme-heading-font)">
			<tspan x="9.5%" dy="1%" font-size="36" font-weight="700" fill="var(--theme-body-background)">
				<xsl:value-of select="//single/bathrooms/@full" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" fill="var(--theme-sub-heading-color)" font-size="25" font-weight="400">
				<xsl:value-of select="'baths'" />
			</tspan>
		</text>
		<text x="9.5%" y="64.3%" class="center" font-family="var(--theme-heading-font)">
			<tspan x="9.5%" dy="1%" font-size="36" font-weight="700" fill="var(--theme-body-background)">
				<xsl:value-of select="format-number(//single/squareFeet, '###,###')" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" fill="var(--theme-sub-heading-color)" font-size="25" font-weight="400">
				<xsl:value-of select="'sq ft (btv)'" />
			</tspan>
		</text>
		<text x="9.5%" y="72.3%" class="center" font-family="var(--theme-heading-font)">
			<tspan x="9.5%" dy="1%" font-size="36" font-weight="700" fill="var(--theme-body-background)">
				<xsl:call-template name="lot-size" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" fill="var(--theme-sub-heading-color)" font-size="25" font-weight="400">
				<xsl:value-of select="'sq ft lot'" />
			</tspan>
		</text>
		<text x="9.5%" y="80.5%" class="center" font-family="var(--theme-heading-font)">
			<tspan x="9.5%" dy="1%" font-size="36" font-weight="700" fill="var(--theme-body-background)">
				<xsl:value-of select="//single/built" />
			</tspan>
			<tspan x="9.5%" dy="3.2%" fill="var(--theme-sub-heading-color)" font-size="25" font-weight="400">
				<xsl:value-of select="'year built'" />
			</tspan>
		</text>
		<text x="9.5%" y="88.6%" class="center" font-family="var(--theme-heading-font)">
			<tspan x="9.5%" dy="1%" font-size="36" font-weight="700" fill="var(--theme-body-background)">$1,599,000
			</tspan>
			<tspan x="9.5%" dy="3.3%" fill="var(--theme-sub-heading-color)" font-size="25" font-weight="400">
				<xsl:value-of select="'Just Sold'" />
			</tspan>
		</text>
		<rect x="17%" y="2.5%" width="83%" height="98%" fill="var(--theme-body-background)" />
		<image x="17.3%" y="2.5%" width="54.6%" height="44.8%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-4'" />
				<xsl:with-param name="idx" select="4" />
			</xsl:call-template>
		</image>
		<text x="20%" y="51%" fill="var(--theme-heading-color)" font-family="var(--theme-heading-font)" font-size="40"
			font-weight="800">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areanames'" />
				<xsl:with-param name="default" select="concat(//single/address/street,', ', //area/name)" />
			</xsl:call-template>
		</text>
		<foreignObject width="50%" height="50%" x="20%" y="54.8%" font-family="var(--theme-heading-font)"
			style="color:var(--theme-heading-color);font-size:21px; line-height:1.3; height:40%; font-family:var(--theme-heading-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'description'" />
				<xsl:with-param name="default" select="//single/description" />
			</xsl:call-template>
		</foreignObject>
		<image x="20%" y="94.2%" width="5.1%" height="5.1%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/360-icon.png' )" />
			</xsl:attribute>
		</image>
		<a href="https://www.itzsold.com/">
			<text x="25.8%" y="95.1%" fill="var(--theme-sub-heading-color)" font-family="var(--theme-heading-font)"
				class="super-bold" font-size="220%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
		</a>
		<rect x="72.2%" y="2.5%" width="26%" height="98%" fill="var(--theme-body-background)" />
		<image x="72.2%" y="2.5%" width="26%" height="22.2%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-7'" />
				<xsl:with-param name="idx" select="7" />
			</xsl:call-template>
		</image>
		<image x="72.2%" y="25.2%" width="26%" height="22.2%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-10'" />
				<xsl:with-param name="idx" select="10" />
			</xsl:call-template>
		</image>
		<image x="72.2%" y="47.8%" width="26%" height="24.9%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="'image-13'" />
				<xsl:with-param name="idx" select="13" />
			</xsl:call-template>
		</image>

		<rect x="72.2%" y="73.2%" width="26%" height="25%" fill="var(--theme-heading-color)" />
		<xsl:choose>
			<xsl:when test="$hasMultipleAgents">
				<g>
					<g>
						<image x="75%" y="74.6%" width="100" height="100" id="logo" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="//agent[1]/photo" />
							</xsl:attribute>
						</image>
						<text x="81.8%" y="74.2%" class="super-bold" font-family="var(--theme-body-font)"
							font-size="200%">
							<tspan x="81.8%" y="74.2%" fill="var(--theme-body-background)">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'marketingFirstName'" />
									<xsl:with-param name="default" select="//agent[1]/firstName" />
								</xsl:call-template>
							</tspan>
							<tspan fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'marketingLastName'" />
									<xsl:with-param name="default" select="concat(' ',//agent[1]/lastName)" />
								</xsl:call-template>
							</tspan>
						</text>
						<text x="81.8%" y="77%" fill="var(--theme-body-background)" font-family="var(--theme-body-font)"
							font-size="120%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'licenseno'" />
								<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
							</xsl:call-template>
						</text>
						<text x="81.8%" y="78.7%" font-family="var(--theme-body-font)" font-size="120%">
							<tspan dx="0%" fill="var(--theme-sub-heading-color)">o</tspan>
							<tspan dx=".3%" fill="var(--theme-body-background)">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'agentmobile'" />
									<xsl:with-param name="default" select="translate(//agent[1]/mobile,'-','.')" />
								</xsl:call-template>
							</tspan>
						</text>
					</g>
					<g style="transform: translateY(110px);">
						<image x="75%" y="74.6%" width="100" height="100" id="logo" preserveAspectRatio="xMidYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="//agent[2]/photo" />
							</xsl:attribute>
						</image>
						<text x="81.8%" y="74.2%" class="super-bold" font-family="var(--theme-body-font)"
							font-size="200%">
							<tspan x="81.8%" y="74.2%" fill="var(--theme-body-background)">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'marketingFirstName'" />
									<xsl:with-param name="default" select="//agent[2]/firstName" />
								</xsl:call-template>
							</tspan>
							<tspan fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'marketingLastName'" />
									<xsl:with-param name="default" select="concat(' ',//agent[2]/lastName)" />
								</xsl:call-template>
							</tspan>
						</text>
						<text x="81.8%" y="77%" fill="var(--theme-body-background)" font-family="var(--theme-body-font)"
							font-size="120%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'licenseno'" />
								<xsl:with-param name="default" select="//agent[2]/marketingLicense" />
							</xsl:call-template>
						</text>
						<text x="81.8%" y="78.7%" font-family="var(--theme-body-font)" font-size="120%">
							<tspan dx="0%" fill="var(--theme-sub-heading-color)">o</tspan>
							<tspan dx=".3%" fill="var(--theme-body-background)">
								<xsl:call-template name="editable">
									<xsl:with-param name="id" select="'agentmobile'" />
									<xsl:with-param name="default" select="translate(//agent[2]/mobile,'-','.')" />
								</xsl:call-template>
							</tspan>
						</text>
					</g>

				</g>
			</xsl:when>
			<xsl:otherwise>
				<g>
					<image x="72%" y="73.6%" width="10%" height="13%" id="logo" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href">
							<xsl:value-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
					<text x="81.8%" y="74.2%" class="super-bold" font-family="var(--theme-body-font)" font-size="220%">
						<tspan x="81.8%" y="74.2%" fill="var(--theme-body-background)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'marketingFirstName'" />
								<xsl:with-param name="default" select="//agent[1]/firstName" />
							</xsl:call-template>
						</tspan>
						<tspan fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'marketingLastName'" />
								<xsl:with-param name="default" select="concat(' ',//agent[1]/lastName)" />
							</xsl:call-template>
						</tspan>
					</text>
					<text x="81.8%" y="77.2%" fill="var(--theme-body-background)" font-family="var(--theme-body-font)"
						font-size="140%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
					<line xmlns="" x1="82%" y1="80.5%" x2="96%" y2="80.5%"
						style="stroke:var(--theme-sub-heading-color);stroke-width:3.5"></line>
					<text x="81.8%" y="82.6%" font-family="var(--theme-body-font)" font-size="140%">
						<tspan dx="0%" fill="var(--theme-sub-heading-color)">c</tspan>
						<tspan dx=".3%" fill="var(--theme-body-background)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentmobile'" />
								<xsl:with-param name="default" select="translate(//agent[1]/mobile,'-','.')" />
							</xsl:call-template>
						</tspan>
					</text>

					<text x="81.8%" y="84.7%" font-family="var(--theme-body-font)" font-size="140%">
						<tspan dx="0%" fill="var(--theme-sub-heading-color)">e</tspan>
						<tspan dx="0.3%" fill="var(--theme-body-background)">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentmarketingEmail'" />
								<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
							</xsl:call-template>
						</tspan>
					</text>
				</g>
			</xsl:otherwise>
		</xsl:choose>

		<text x="73.5%" y="88.8%" fill="var(--theme-body-background)" font-family="var(--theme-body-font)"
			font-size="110%">
			<tspan>
				<xsl:text>Listed by </xsl:text>
			</tspan>
			<tspan dx="5" font-weight="900"><xsl:value-of select="//agent[1]/marketingName" /></tspan>
			<tspan dx="5"> • </tspan>
			<tspan dx="5"><xsl:value-of select="//agent[1]/marketingLicense" /></tspan>
		</text>
		<foreignObject width="23.5%" height="7%" x="73.5%" y="90.6%" font-family="var(--theme-sub-heading-font)"
			font-size="19" style="color:var(--theme-body-background); opacity:0.36; text-transform:uppercase;">
			<div>
				<xsl:value-of
					select="concat(//single[1]/listingAgents/listingAgent[1]/@broker, ' LICENSE ', //agent[1]/marketingLicense, '. INFORMATION IS DEEMED')" />
			</div>
			<div><xsl:value-of
					select="'RELIABLE, BUT NOT GUARANTEED. BROKER HAS NOT AND WILL NOT INVESTIGATE OR VERIFY'" /></div>
			<div><xsl:value-of select="'THE ACCURACY OF THIS INFORMATION'" /></div>
		</foreignObject>
	</xsl:template>
</xsl:stylesheet>