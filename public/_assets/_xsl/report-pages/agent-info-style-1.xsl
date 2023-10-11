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
		<style>
			<xsl:value-of select="'text {dominant-baseline: middle;}'" />
		</style>

		<g>

			<xsl:if test="//agent[1]/photo=''">
				<g style="transform: translateY(0);">
					<clipPath id="clipCircle">
						<circle r="7.8%" cx="49.8%" cy="18.5%"></circle>
					</clipPath>
					<image x="42.5%" y="6.1%" width="15%" height="25%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:value-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
					<text x="50%" y="37%" class="sub-heading center upper" style="fill:var(--theme-sub-heading-color);font-size:250%;">
						<xsl:value-of select="//agent[1]/marketingName" />
					</text>
					<text x="50%" y="43.5%" class="sub-heading center" style="fill:var(--theme-body-color); font-size:160%;">
						<xsl:value-of select="//agent[1]/address/company" />
					</text>
					<text x="50%" y="49%" class="center upper" style="fill:var(--theme-body-color); font-size:90%">
						<xsl:value-of select="//agent[1]/marketingLicense" />
					</text>
					<text x="50%" y="55.5%" class="center upper" style="fill:var(--theme-body-color); font-size:240%;">
						<tspan>
							<xsl:value-of select="//agent[1]/mobile" />
						</tspan>
					</text>
					<text x="50%" y="62%" class="center" style="fill:var(--theme-body-color); font-size:160%;">
						<xsl:value-of select="//agent[1]/website" />
					</text>
				</g>
			</xsl:if>
			<xsl:if test="//agent[1]/photo!=''">
				<g style="transform: translateY(0);">
					<clipPath id="clipCircle">
						<circle r="7.8%" cx="49.8%" cy="18.5%"></circle>
					</clipPath>
					<image x="42.5%" y="6.1%" width="15%" height="25%" preserveAspectRatio="xMidYMid meet" clip-path="url(#clipCircle)">
						<xsl:attribute name="href">
							<xsl:value-of select="//agent[1]/photo" />
						</xsl:attribute>
					</image>
					<text x="50%" y="37%" class="sub-heading center upper" style="fill:var(--theme-sub-heading-color);font-size:250%;">
						<xsl:value-of select="//agent[1]/marketingName" />
					</text>
					<text x="50%" y="43.5%" class="sub-heading center" style="fill:var(--theme-body-color); font-size:160%;">
						<xsl:value-of select="//agent[1]/address/company" />
					</text>
					<text x="50%" y="49%" class="center upper" style="fill:var(--theme-body-color); font-size:90%">
						<xsl:value-of select="//agent[1]/marketingLicense" />
					</text>
					<text x="50%" y="55.5%" class="center upper" style="fill:var(--theme-body-color); font-size:240%;">
						<tspan>
							<xsl:value-of select="//agent[1]/mobile" />
						</tspan>
					</text>
					<text x="50%" y="62%" class="center" style="fill:var(--theme-body-color); font-size:160%;">
						<xsl:value-of select="//agent[1]/website" />
					</text>
				</g>
			</xsl:if>

			<xsl:if test="$companyLogo!='' and $personalLogo!=''">
				<image x="40%" y="66.5%" width="20%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>

				<image x="40%" y="78.5%" width="20%" height="11%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</xsl:if>

			<xsl:if test="$companyLogo='' or $personalLogo=''">
				<image x="40%" y="68.5%" width="20%" height="20%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
				<image x="40%" y="68.5%" width="20%" height="20%" id="logo" preserveAspectRatio="xMinYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$personalLogo" />
					</xsl:attribute>
				</image>
			</xsl:if>

			<text x="50%" y="92.5%" class="center" style="fill:var(--theme-body-color); font-size:110%;">
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