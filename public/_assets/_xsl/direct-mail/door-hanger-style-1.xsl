<?xml version="1.0"?>
<!--
	Asset Name:	Door Hanger - Agent Side
	Tags:		Direct Mail
Supports:	Area, QRCode
	Sizes:		Door-Hanger
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<rect x="0" y="0" width="100%" height="100%" fill="var(--theme-body-color)" />

		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<xsl:choose>
			<xsl:when test="$companyLogo='' or $personalLogo=''">
				<xsl:choose>
					<xsl:when test="$companyLogo=''">
						<image x="30%" y="2%" width="40%" height="10%" preserveAspectRatio="xMinYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="$personalLogo" />
							</xsl:attribute>
						</image>
					</xsl:when>
					<xsl:otherwise>
						<image x="30%" y="2%" width="40%" height="10%" preserveAspectRatio="xMinYMid meet">
							<xsl:attribute name="href">
								<xsl:value-of select="$companyLogo" />
							</xsl:attribute>
						</image>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<image x="25%" y="2%" width="25%" height="10%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
				<image x="759%" y="2%" width="25%" height="10%" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
			</xsl:otherwise>
		</xsl:choose>

		<text x="50%" y="45%" class="sub-heading super-large center upper bold" font-size="160%">
	Want the inside scoop
on your neighborhood’s
real estate trends
before they happen?
		</text>

		<g style="transform:translate(41%, 71.6%)">
			<xsl:call-template name="qr-code">
				<xsl:with-param name="width" select="'19.5%'" />
			</xsl:call-template>
		</g>

		<text x="50%" y="45%" class="sub-heading super-large center upper bold" font-size="220%">
			<xsl:text>Become a KRG Market Insider.</xsl:text>
		</text>

		<g >
			<image x="2%" y="10%" width="20%" height="80%" preserveAspectRatio="xMidYMid slice">
				<xsl:attribute name="href">
					<xsl:value-of select="//agent[1]/photo" />
				</xsl:attribute>
			</image>

			<line x1="2%" y1="60%" x2="96%" y2="60%" stroke="var(--theme-body-color)" />

			<text x="0" y="70%" style="text-transform:uppercase;" class="middle center">
				<tspan>ALL-DIGITAL </tspan>
				<tspan>&#9679;</tspan>
				<tspan> THE UP-TO-DATE INFO YOU NEED</tspan>
				<tspan x="50%" dy="2%">YOUR HOME’S CURRENT VALUE IN JUST SECONDS</tspan>
				<tspan x="50%" dy="2%">NO ADS </tspan>
				<tspan>&#9679;</tspan>
				<tspan> NO POSTCARDS </tspan>
				<tspan>&#9679;</tspan>
				<tspan> 100% FREE FOREVER</tspan>
			</text>

			<line x1="2%" y1="60%" x2="96%" y2="60%" stroke="var(--theme-body-color)" />

			<g style="transform:translate(25%,12%)">
				<text x="0" font-size="150%">
					<tspan fill="var(--theme-body-color)">
						<xsl:value-of select="//agent[1]/firstName" />

						<xsl:text>&#160;</xsl:text>
					</tspan>

					<tspan fill="var(--theme-body-color)">
						<xsl:value-of select="//agent[1]/lastName" />
					</tspan>
				</text>

				<text x="0" y="23%" class="bold">
					<tspan x="0">
						<xsl:value-of select="//agent[1]/mobile" />
					</tspan>
					<tspan x="0" dy="17.5%" class="bold">
						<xsl:choose>
							<xsl:when test="//agent[1]/marketingEmail!=''">
								<xsl:value-of select="//agent[1]/marketingEmail" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//agent[1]/marketingEmail" />
							</xsl:otherwise>
						</xsl:choose>
					</tspan>
					<tspan x="0" dy="17.5%" class="bold">
						<xsl:choose>
							<xsl:when test="website!=''">
								<xsl:value-of select="//agent[1]/website" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//agent[1]/website" />
							</xsl:otherwise>
						</xsl:choose>
					</tspan>
				</text>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>