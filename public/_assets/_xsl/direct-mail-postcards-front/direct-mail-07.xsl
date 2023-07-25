<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Postage Side - No.7
	Tags: 		Postcard, Direct Mail
	Sizes:		Postcard
	Supports:	Area
	Permission:	Direct Mail
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">

		<image x="20%" y="30%" width="50%" height="70%" preserveAspectRatio="xMidYMid slice" style="transform:skew(-6deg, 3.5deg)translate(-18.2%, -21%);clip-path: polygon(-2% 1%, 97.4% 0%, 104% 100%, 5% 100%)">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>
		<image width="50%" height="100%" preserveAspectRatio="none">
			<xsl:attribute name="href">
				<xsl:value-of select="concat( //output/@siteUrl, '_assets/_img/property_image_bg.png' )" />
			</xsl:attribute>
		</image>
		<rect x="0" y="90%" width="50%" height="6%" fill="var(--sold-red)" />
		<xsl:call-template name="cropped-container" />
	</xsl:template>
	<xsl:template name="cropped-content">
		<text x="25%" y="80%" class="center upper bold" fill="var(--theme-body-background)" style="font-weight:600;font-size:125%;">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'neighborhoodsinfo'" />
					<xsl:with-param name="default" select="'all your neighborhoods information'" />
				</xsl:call-template>
			</tspan>
			<tspan x="25%" dy="5%">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'justfinger'" />
					<xsl:with-param name="default" select="'just a finger touch away'" />
				</xsl:call-template>
			</tspan>
		</text>

		<text x="25%" y="91%" class="center bold" fill="var(--theme-body-background)" style="font-size:125%;font-weight:600;">
			<tspan>
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</tspan>
		</text>

		<g style="transform:translateX(50%)">
			<text x="25%" y="2%" class="center" style="font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'information'" />
					<xsl:with-param name="default" select="'This information is presented by:'" />
				</xsl:call-template>
			</text>

			<g style="transform: translate(8.6%, -3.2%);">
				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
					<circle r=".3500" cx=".5" cy=".5"/>
				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="0%" y="10%" width="14%" height="24%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>

				<g style="transform: translate(2%, 0);">
					<text class="h1" x="11%" y="12%" style="font-size:150%;">
						<tspan>
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentfirstName'" />
								<xsl:with-param name="default" select="//agent[1]/firstName" />
							</xsl:call-template>
						</tspan>
						<tspan>
							<xsl:text>&#160;</xsl:text>
						</tspan>
						<tspan class="bold">
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentlastname'" />
								<xsl:with-param name="default" select="//agent[1]/lastName" />
							</xsl:call-template>
						</tspan>
					</text>

					<text x="11%" y="16%" fill="var(--theme-sub-heading-color)" style="font-size:140%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'innovatorrealtor'" />
							<xsl:with-param name="default" select="'Innovator REALTOR'" />
						</xsl:call-template>
					</text>
					<text x="11%" y="20%" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
					<text x="11%" y="24%" class="bold" fill="var(--theme-sub-heading-color)" style="font-size:200%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>
					<text x="11%" y="29.5%" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</text>
				</g>
			</g>

			<image x="18%" y="33%" width="14%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<text x="25%" y="48%" class="center" style="font-size:100%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'areanames'" />
					<xsl:with-param name="default" select="//area/name" />
				</xsl:call-template>
			</text>
			<text x="25%" y="52%" class="center" style="font-size:100%;">
				<xsl:call-template name="listing-address-line-one"/>
			</text>
			<text x="25%" y="56%" class="center" style="font-size:100%;">
				<xsl:call-template name="listing-address-line-two"/>
			</text>
			<text x="25%" y="60%" class="center" style="font-size:100%;text-transform: capitalize;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="concat( 'become your neighborhood genius at ', //agent[1]/website )" />
				</xsl:call-template>
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>