<?xml version="1.0"?>
<!--
Asset Name: Agent Info Style 1
Tags: Social Marketing Ad
Sizes: Facebook, Postcard
Supports: Agent
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
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
			<text x="50%" y="41%" class="sub-heading medium center">
				<tspan>Innovator </tspan>
				<tspan class="upper">realtor</tspan>
			</text>
			<text x="0" y="46%" class="normal bold center sub-heading">
				<tspan x="49.5%" dy="1%">
					<xsl:text disable-output-escaping="yes">&#9742; &#160;</xsl:text>

					<xsl:value-of select="//agent[1]/mobile" />
				</tspan>
				<tspan x="50%" dy="4%">
					<xsl:text disable-output-escaping="yes">&#x2709; &#160;</xsl:text>

					<xsl:value-of select="//agent[1]/marketingEmail" />
				</tspan>
				<tspan x="49%" dy="4%">
					<xsl:text disable-output-escaping="yes">&#x1f310; &#160;</xsl:text>

					<xsl:value-of select="//agent[1]/website" />
				</tspan>
			</text>
			<text x="50%" y="60%" class="normal center upper" style="fill:var(--theme-body-color);">
				<xsl:value-of select="//agent[1]/marketingLicense" />
			</text>
		</g>

		<image x="35%" y="74%" width="30%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet">
			<xsl:attribute name="href">
				<xsl:value-of select="$companyLogo" />
			</xsl:attribute>
		</image>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>