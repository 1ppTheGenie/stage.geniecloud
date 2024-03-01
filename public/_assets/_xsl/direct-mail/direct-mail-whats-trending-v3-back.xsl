<?xml version="1.0"?>
<!--
	Asset Name:	Direct Mail Whats Trending Postage Light 2
	Tags:		Social Marketing Ad
	Sizes:		Postcard
	Supports:	Area, QRCode
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<text x="20%" y="2%" class="center upper " fill="var(--theme-heading-color)" style="font-size:450%;font-weight: 600;" font-family="var(--theme-body-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'salutation'" />
				<xsl:with-param name="default" select="'Hi Neeha!'" />
			</xsl:call-template>
		</text>

		<image x="16%" y="68%" width="18%" height="32%" preserveAspectRatio="xMidYMid slice">
			<xsl:attribute name="href">
				<xsl:value-of select="//agent[1]/photo" />
			</xsl:attribute>
		</image>

		<rect x="0.5%" y="62%" width="15%" height="38%" class="heading" />
		<rect x="0.5%" y="50%" width="67%" height="12%" fill="var(--theme-body-color)" />

		<g style="transform:translate(2%,52%)">
			<text x="1%" y="0%" class="upper" fill="var(--theme-heading-color)" style="font-weight:300;font-size:200%;" font-family="var(--theme-body-font)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'scan-report'" />
					<xsl:with-param name="default" select="'Scan to get the full report'" />
				</xsl:call-template>
			</text>
			<use x="1%" y="2%" width="75%" height="45%" fill="var(--theme-heading-color)">
				<xsl:attribute name="href" select="concat( //output/@siteUrl, '_assets/_img/icons.svg#circle-up-arrow' )" />
			</use>
		</g>
		<text x="35%" y="66%" class="upper" style="font-weight:400;font-size:150%;" font-family="var(--theme-body-font)" fill="var(--theme-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentname'" />
				<xsl:with-param name="default" select="concat( //agent[1]/marketingName,'')" />
			</xsl:call-template>
		</text>
		<text x="35%" y="70%" class="upper" style="font-weight:600;font-size:150%;" font-family="var(--theme-body-font)" fill="var(--theme-heading-color)">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'agentmobile'" />
				<xsl:with-param name="default" select="//agent[1]/mobile" />
			</xsl:call-template>
		</text>

		<image x="32%" y="74%" width="16%" height="16%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>
		<text x="35%" y="90%" class="large" style="font-size:80%;">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'licenseno'" />
				<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
			</xsl:call-template>
		</text>

		<g style="transform:translate(48.58%, 57%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'19.5%'" />
			</xsl:call-template>
		</g>
		<rect x="67%" y="50%" width="33%" height="50%" fill="#DDDEE0" />
		<rect x="85%" y="2%" width="10%" height="18%" fill="#DDDEE0" />

		<g style="transform:translate(1%,17%)">
			<svg x="1%" y="0%" width="65%" height="15%">
				<text class="upper" fill="var(--theme-heading-color)" style="font-size:200%;line-height:140%;" font-family="var(--theme-body-font)">
					<tspan style="font-weight:300;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'know-more-than-you'" />
							<xsl:with-param name="default" select="'I might know more than you do about '" />
						</xsl:call-template>
					</tspan>
					<tspan x="0" dy="50%" style="font-weight:600;">
						<xsl:call-template name="listing-address-line-one" />

					</tspan>
				</text>
			</svg>
			<svg x="2%" y="17.5%" width="95%" height="20%" fill="var(--theme-heading-color)" style="color:var(--theme-heading-color)">
				<text class="upper" style="font-weight:600;font-size:450%;" font-family="var(--theme-body-font)">
					<tspan >...And I'm happy to share</tspan>
				</text>
			</svg>
		</g>
		<g style="transform-origin: 0; transform: rotate(-90deg) translate(-25%, 56%);">
			<text x="0%" y="0%" class="upper bold" fill="var(--theme-body-background)" style="font-size:125%;letter-spacing: 2px;" font-family="var(--theme-body-font)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'area-name-custom'" />
					<xsl:with-param name="default" select="'Balboa Islands'" />
				</xsl:call-template>
			</text>
		</g>
		<g style="transform:translate(6%,62%)">
			<text x="3%" y="0%" class="upper center bold" fill="var(--theme-body-background)" style="font-size:620%;" font-family="var(--theme-body-font)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'generic-id'" />
					<xsl:with-param name="default" select="' 1'" />
				</xsl:call-template>
			</text>
		</g>
		<g style="transform:translate(5%,80%)">
			<svg x="1%" y="0%" width="10%" height="20%" fill="var(--theme-body-background)" style="color:var(--theme-body-background)">
				<text class="upper center bold" style="font-size:200%;" font-family="var(--theme-body-font)">
					<tspan x="30%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'y2018'" />
							<xsl:with-param name="default" select="'2018'" />
						</xsl:call-template>
					</tspan>
					<tspan x="30%" dy="25%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'y2019'" />
							<xsl:with-param name="default" select="'2019'" />
						</xsl:call-template>
					</tspan>
					<tspan x="30%" dy="25%">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'y2020'" />
							<xsl:with-param name="default" select="'2020'" />
						</xsl:call-template>
					</tspan>
				</text>
			</svg>
		</g>
		<g style="transform:translate(52.3%,78%)">
			<rect x="0%" y="0%" rx="2.5%" ry="10%" width="12%" height="8%" fill="var(--theme-heading-color)" />
			<text x="1.5%" y="2.3%" class="upper bold" fill="var(--theme-body-background)" style="font-size:125%;" font-family="var(--theme-body-font)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'scan-now'" />
					<xsl:with-param name="default" select="'Scan Now'" />
				</xsl:call-template>
			</text>
		</g>

		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>