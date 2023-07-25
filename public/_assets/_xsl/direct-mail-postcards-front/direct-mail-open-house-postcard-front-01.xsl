<?xml version="1.0"?>
<!--
	Asset Name: Direct Mail Open House Postcard - No.1
	Tags: 		Open House
	Sizes:		Postcard
	Supports:	Listing, Open-House, Print
	Permission:	Direct Mail
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<xsl:call-template name="cropped-container" />
	</xsl:template>

	<xsl:template name="cropped-content">
		<g style="transform: translate(2.1%, 4%);">
			<image x="0" y="0" width="25.5%" height="42%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-1'" />
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<image x="26.2%" y="0" width="25.5%" height="42%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-2'" />
					<xsl:with-param name="idx" select="2" />
				</xsl:call-template>
			</image>
			<image x="0" y="43.3%" width="25.5%" height="42%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-3'" />
					<xsl:with-param name="idx" select="3" />
				</xsl:call-template>
			</image>
			<image x="26.2%" y="43.3%" width="25.5%" height="42%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="id" select="'image-4'" />
					<xsl:with-param name="idx" select="4" />
				</xsl:call-template>
			</image>
		</g>

		<rect x="6.7%" y="81.3%" width="41.8%" height="14.8%" fill="var(--theme-sub-heading-color)" />
		<text x="27.5%" y="84%" class="center" fill="var(--theme-body-background)" style="font-size:100%;">
			<xsl:call-template name="listing-address"/>
		</text>
		<text x="27.5%" y="86.3%" class="center upper bold" fill="var(--theme-body-background)" style="font-size:250%;" data-max-width="40%">
			<xsl:call-template name="editable">
				<xsl:with-param name="id" select="'areaname1'" />
				<xsl:with-param name="default" select="//area/name" />
			</xsl:call-template>
		</text>

		<g style="transform:translateX(51%)">
			<text x="27%" y="3%" class="center" style="font-size:130%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'information'" />
					<xsl:with-param name="default" select="'This information is presented by:'" />
				</xsl:call-template>
			</text>

			<g style="transform: translate(8.6%, -2%);">
				<clipPath id="clipCircle" clipPathUnits="objectBoundingBox">
					<circle r=".4700" cx="0.45" cy="0.3"/>
				</clipPath>

				<xsl:if test="//agent[1]/photo">
					<image x="0%" y="10%" width="14%" height="24%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:copy-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
				</xsl:if>

				<g style="transform: translate(2%, 0);">
					<text class="h1" x="11%" y="10%" style="font-size:150%;">

						<tspan >
							<xsl:call-template name="editable">
								<xsl:with-param name="id" select="'agentname'" />
								<xsl:with-param name="default" select="//agent[1]/marketingName" />
							</xsl:call-template>
						</tspan>
					</text>

					<text x="11%" y="15%" fill="var(--theme-sub-heading-color)" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'innovatorrealtor'" />
							<xsl:with-param name="default" select="'Innovator REALTOR'" />
						</xsl:call-template>
					</text>
					<text x="11%" y="19%" style="font-size:100%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'licenseno'" />
							<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
						</xsl:call-template>
					</text>
					<text x="11%" y="23%" fill="var(--theme-sub-heading-color)" style="font-size:150%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmobile'" />
							<xsl:with-param name="default" select="//agent[1]/mobile" />
						</xsl:call-template>
					</text>
					<text x="11%" y="28%" style="font-size:120%;">
						<xsl:call-template name="editable">
							<xsl:with-param name="id" select="'agentmarketingEmail'" />
							<xsl:with-param name="default" select="//agent[1]/marketingEmail" />
						</xsl:call-template>
					</text>
				</g>
			</g>

			<image x="19.8%" y="33%" width="14%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
			<text x="27%" y="47%" class="center" style="font-size:120%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentaddress'" />
						<xsl:with-param name="default" select="//agent[1]/address/street" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="27%" y="51%" class="center" style="font-size:120%;">
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentaddress'" />
						<xsl:with-param name="default" select="//agent[1]/address/city" />
					</xsl:call-template>
				</tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentaddress'" />
						<xsl:with-param name="default" select="//agent[1]/address/state" />
					</xsl:call-template>
				</tspan>
				<tspan></tspan>
				<tspan>
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentaddress'" />
						<xsl:with-param name="default" select="//agent[1]/address/zip" />
					</xsl:call-template>
				</tspan>
			</text>

			<text x="27%" y="88%" class="center" style="font-size:120%;text-transform:capitalize;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'yourneighborhood'" />
					<xsl:with-param name="default" select="'become your neighborhood genius at'" />
				</xsl:call-template>
			</text>
			<text x="27%" y="92%" class="center bold" style="font-size:120%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'agentwebsite'" />
					<xsl:with-param name="default" select="//agent[1]/website" />
				</xsl:call-template>
			</text>
		</g>
		<xsl:call-template name="copyright">
			<xsl:with-param name="disclaimer" select="'direct-mail'" />
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>