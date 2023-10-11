<?xml version="1.0"?>
<!--
Asset Name: Agent Info Letter Style 1
Tags: Social Marketing Ad
Sizes:	US Letter
Supports: Agent
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text {dominant-baseline: middle;}'" />
		</style>

		<g>

			<xsl:if test="//agent[1]/photo!=''">
				<g style="transform: translateY(10%);">
					<clipPath id="clipCircle">
						<circle r="7%" cx="49.8%" cy="20%"></circle>
					</clipPath>
					<image x="42.5%" y="14.5%" width="15%" height="12%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:value-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
					<text x="50%" y="30%" class="sub-heading center upper" fill="var(--theme-sub-heading-color)" font-size="250%">
						<xsl:value-of select="//agent[1]/marketingName" />
					</text>
					<text x="50%" y="34%" class="center" font-family="var(--theme-sub-heading-font)" fill="var(--theme-body-color)" font-size="160%">
						<xsl:value-of select="//agent[1]/marketingTitle" />
					</text>
					<text x="50%" y="37%" class="center upper" fill="var(--theme-body-color)" font-size="90%">
						<xsl:value-of select="//agent[1]/marketingLicense" />
					</text>
					<text x="50%" y="41%" class="center upper" fill="var(--theme-body-color)" font-size="240%">
						<xsl:value-of select="//agent[1]/mobile" />
					</text>
					<text x="50%" y="45%" class="center" fill="var(--theme-body-color)" font-size="160%">
						<xsl:value-of select="//agent[1]/website" />
					</text>
				</g>
			</xsl:if>
			<xsl:if test="//agent[1]/photo=''">
				<g style="transform: translateY(0);">

					<text x="50%" y="30%" class="sub-heading center upper" fill="var(--theme-sub-heading-color)" font-size="250%">
						<xsl:value-of select="//agent[1]/marketingName" />
					</text>
					<text x="50%" y="35%" class="center" font-family="var(--theme-sub-heading-font)" fill="var(--theme-body-color)" font-size="160%">
						<xsl:value-of select="//agent[1]/marketingTitle" />
					</text>
					<text x="50%" y="40%" class="center upper" fill="var(--theme-body-color)" font-size="90%">
						<xsl:value-of select="//agent[1]/marketingLicense" />
					</text>
					<text x="50%" y="45%" class="center upper" fill="var(--theme-body-color)" font-size="240%">
						<xsl:value-of select="//agent[1]/mobile" />
					</text>
					<text x="50%" y="50%" class="center" fill="var(--theme-body-color)" font-size="160%">
						<xsl:value-of select="//agent[1]/website" />
					</text>
				</g>
			</xsl:if>

			<xsl:if test="$companyLogo!='' and $personalLogo!=''">
				<image x="33.3%" y="57%" width="35%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>

				<image x="40.5%" y="65%" width="20%" height="11%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:if>

			<xsl:if test="$companyLogo='' or $personalLogo=''">
				<image x="40.5%" y="65%" width="20%" height="11%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
				<image x="33.3%" y="57%" width="35%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
			</xsl:if>

			<text x="50%" y="78%" class="center" fill="var(--theme-body-color)" font-size="120%" font-weight="700">
				<xsl:if test="//agent[1]/marketingEmail!='' ">
					<tspan>
<xsl:value-of select="concat( //agent[1]/marketingEmail, ' &#124; ' )" />

</tspan>
				</xsl:if>
				<tspan>
					<xsl:if test="//agent[1]/address/street !='' ">
<xsl:value-of select="concat( //agent[1]/address/street, ' &#124; ' )" />

					</xsl:if>
<xsl:value-of select="concat( //agent[1]/address/city, ', ', //agent[1]/address/state, ' ', //agent[1]/address/zip )" />

				</tspan>
			</text>
		</g>
	</xsl:template>
</xsl:stylesheet>