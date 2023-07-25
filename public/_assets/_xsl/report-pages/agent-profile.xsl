<?xml version="1.0"?>
<!--
Asset Name: Agent Profile
Tags: Social Marketing Ad
Sizes: Facebook, Postcard
Supports: Agent
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<g>
			<g style="transform: translateY(5%);">
				<clipPath id="clipCircle">
					<circle r="7%" cx="48.5%" cy="20%"></circle>
				</clipPath>
				<image x="40%" y="4%" width="19%" height="35%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
				<text x="50%" y="33%" class="sub-heading center upper" style="fill:var(--theme-body-color);font-size:250%;">
					<xsl:value-of select="//agent[1]/marketingName" />
				</text>
				<text x="50%" y="41%" class="sub-heading medium center" style="fill:var(--theme-sub-heading-color);">
						Innovator <tspan class="upper">realtor</tspan>
				</text>
				<text x="50%" y="47%" class="normal center upper" style="fill:var(--theme-body-color);">
					<xsl:value-of select="//agent[1]/marketingLicense" />
				</text>
				<text x="50%" y="51%" class="center upper" style="fill:var(--theme-body-color); font-size:240%;fill:var(--theme-sub-heading-color);">

					<xsl:value-of select="//agent[1]/mobile" />
				</text>
				<text x="50%" y="60%" class="medium center" style="fill:var(--theme-sub-heading-color);">
					<xsl:value-of select="//agent[1]/website" />
				</text>
			</g>

			<image x="35%" y="72%" width="30%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>