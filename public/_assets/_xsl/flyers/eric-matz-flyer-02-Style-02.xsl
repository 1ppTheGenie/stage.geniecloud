<?xml version="1.0"?>
<!--
	Asset Name: Eric Matz Flyer 2 Style 2
	Tags:		Direct Mail
	Sizes:		Letter
	Supports:	Listing
	Pages:		flyers/eric-matz-flyer-02,flyers/single-rear-01
	Roles:		eric-matz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'foreignObject p {margin: 8px 0;}'"/>
		</style>

		<g>
			<image x="5%" y="0" width="28%" height="26%">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>
			<image x="57%" y="1%" width="15%" height="18%">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>

			<text x="65%" y="15%" class="align-center" fill="var(--theme-sub-heading-color)" style="font-size:120%;">
				<tspan>
					<xsl:value-of select="//agent[1]/mobile" />
				</tspan>
				<tspan class="bold">
					<xsl:text>&#160; &#183; &#160;</xsl:text>
				</tspan>
				<tspan>
					<xsl:value-of select="//agent[1]/marketingEmail" />
				</tspan>
				<tspan x="65%" dy="3%" class="bold">
					<xsl:value-of select="//agent[1]/website" />
				</tspan>
			</text>
			<text x="65%" y="21.4%" class="upper narrow center" fill="var(--theme-sub-heading-color)">
				<xsl:value-of select="//agent[1]/marketingLicense" />
			</text>

			<rect x="0" y="25%" width="100%" height="8%" fill="var(--theme-emphasis-color)"/>
			<text x="50%" y="26%" class="center upper" fill="var(--theme-body-background)">
				<tspan>we consistently receive multiple offers, meaning</tspan>
				<tspan x="50%" dy="3%" style="font-weight:600;font-size:120%;">we have qualified buyers in your area!</tspan>
			</text>
		</g>

		<g style="transform: translateY(33.5%);">
			<svg width="33%" height="30%">
				<image x="0" y="0" width="100%" height="80%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:call-template name="listing-image">
							<xsl:with-param name="index" select="number(1)" />
							<xsl:with-param name="preferPrimary" select="'true'" />
						</xsl:call-template>
					</xsl:attribute>
				</image>
				<svg x="32%" y="66%">
					<polygon x="0" y="0" points="0 0, 140 0, 170 35, 140 60, 0 60" fill="var(--vivid-color-5)"></polygon>
				</svg>
				<text x="50%" y="72%" class="upper center" fill="var(--theme-body-background)" style="font-size:110%;">
					<tspan>Greater</tspan>
					<tspan x="50%" dy="8%">Exposure</tspan>
				</text>
			</svg>
			<svg x="33.5%" width="33%" height="30%">
				<image x="0" y="0" width="100%" height="80%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:call-template name="listing-image">
							<xsl:with-param name="index" select="number(2)" />
						</xsl:call-template>
					</xsl:attribute>
				</image>
				<svg x="29%" y="66%">
					<polygon x="0" y="0" points="0 0, 150 0, 180 30, 150 60, 00 60, 30 30" fill="var(--vivid-color-5)"></polygon>
				</svg>
				<text x="50%" y="72%" class="upper center" fill="var(--theme-body-background)" style="font-size:110%;">
					<tspan>Greater</tspan>
					<tspan x="50%" dy="8%">Interest</tspan>
				</text>
			</svg>
			<svg x="67%" width="33%" height="30%">
				<image x="0" y="0" width="100%" height="80%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:call-template name="listing-image">
							<xsl:with-param name="index" select="number(3)" />
						</xsl:call-template>
					</xsl:attribute>
				</image>
				<svg x="28%" y="66%">
					<polygon x="0" y="0" points="0 0, 180 0, 180 30, 180 60, 00 60, 30 30" fill="var(--vivid-color-5)"></polygon>
				</svg>
				<text x="50%" y="72%" class="upper center" fill="var(--theme-body-background)" style="font-size:110%;">
					<tspan>higher sales</tspan>
					<tspan x="50%" dy="8%">price</tspan>
				</text>
			</svg>
		</g>

		<g style="transform:translate(2.5%,62%)">
			<foreignObject y="0" x="0" width="48%" height="34%">
				<p style="color:var(--theme-sub-heading-color);-webkit-line-clamp:10;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'Headquarteredsandiego'" />
						<xsl:with-param name="default" select="'Headquartered in San Diego, California, 1parkplace was established in 1995 by a successful and innovative real estate agent from California’s Silicon Valley. 1parkplace founder and CEO, Steve Hundley, leveraged his previous 10 year real estate sales career (starting back in 1984) to develop and deploy the most comprehensive real estate marketing and lead generation solutions 1parkplace offers today.'" />
					</xsl:call-template>
				</p>
				<p style="color:var(--theme-sub-heading-color);">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'realestatefinancialservices'" />
						<xsl:with-param name="default" select="'Since its beginning, 1parkplace has catapulted businesses in the real estate and financial services sector to leading market positions. The key for the company is to stay ahead of the technological curve and keep its members on the cutting edge of the real estate technology wave.'" />
					</xsl:call-template>
				</p>
				<text class="narrow upper bold" style="color:var(--theme-sub-heading-color);">
						&#8275;
					<tspan>
						<xsl:value-of select="//agent[1]/marketingName" />
					</tspan>
				</text>
			</foreignObject>

			<g style="transform: translate(52%, 3%);">
				<rect x="0" width="42%" height="30%" fill="var(--theme-emphasis-color)"/>
				<svg width="90%" x="2.5%" y="1%">
					<image x="0" y="1%" width="7%" height="7%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/flyer-price-icon.png' )" />
					</image>
					<line x1="10%" y1="2%" x2="10%" y2="7%" stroke="var(--vivid-dark-5)" stroke-width="3"></line>
					<text class="small" fill="var(--theme-body-background)" x="13%" y="1.5%">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'averagesales'" />
								<xsl:with-param name="default" select="'Average Sales Price to List Ratio'" />
							</xsl:call-template>
						</tspan>
						<tspan x="13%" dy="2%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentname'" />
								<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;', '&#160;Team : TODO%' )" />
							</xsl:call-template>
						</tspan>
						<tspan x="13%" dy="2%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'averagerealtor'" />
								<xsl:with-param name="default" select="'Average Realtor: TODO%'" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>

				<svg width="90%" x="2.5%" y="10%">
					<image x="0" y="1%" width="7%" height="7%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/flyer-watch-icon.png' )" />
					</image>
					<line x1="10%" y1="2%" x2="10%" y2="7%" stroke="var(--vivid-dark-5)" stroke-width="3"></line>
					<text class="small" fill="var(--theme-body-background)" x="13%" y="1.5%">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'averagedays'" />
								<xsl:with-param name="default" select="'Average Days on Market'" />
							</xsl:call-template>
						</tspan>
						<tspan x="13%" dy="2%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentname'" />
								<xsl:with-param name="default" select="concat( //agent[1]/marketingName, '&#160;', '&#160;Team : TODO Days' )" />
							</xsl:call-template>
						</tspan>
						<tspan x="13%" dy="2%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'averagerealtortododays'" />
								<xsl:with-param name="default" select="'Average Realtor: TODO Days'" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
				<svg width="90%" x="2.5%" y="19%">
					<image x="0.5%" y="1%" width="6%" height="6%" preserveAspectRatio="xMidYMid meet">
						<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/flyer-note-icon.png' )" />
					</image>
					<line x1="10%" y1="2%" x2="10%" y2="7%" stroke="var(--vivid-dark-5)" stroke-width="3"></line>
					<text class="small" fill="var(--theme-body-background)" x="13%" y="1.5%">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'averagesalesprice'" />
								<xsl:with-param name="default" select="'Average Sales Price to List Ratio'" />
							</xsl:call-template>
						</tspan>
						<tspan x="13%" dy="2%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentfirstnames'" />
								<xsl:with-param name="default" select="concat( //agent[1]/firstName, '&#160;', //agent[1]/lastName, '&#160;Team :  Team : &#36;TODO' )" />
							</xsl:call-template>
						</tspan>
						<tspan x="13%" dy="2%">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'realtortodo'" />
								<xsl:with-param name="default" select="'Average Realtor: &#36;TODO'" />
							</xsl:call-template>
						</tspan>
					</text>
				</svg>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>