<?xml version="1.0"?>
<!--
	Asset Name: Eric Matz Flyer 1 Style 1
	Tags:		Direct Mail
	Sizes:		Letter
	Supports:	Listing
	Pages:		flyers/eric-matz-flyer-01,flyers/single-rear-01
	Roles:		eric-matz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<g>
			<text x="50%" y="29%" class="bold center super-large">
				<tspan>INTELLIGENT</tspan>
				<tspan dx="1%" dy="-1%" style="font-size: 130%;font-style: italic;">Real Estate</tspan>
				<tspan dx="1%" dy="1%">MARKETING</tspan>
			</text>

			<g style="transform: translate(0%, 35%);">
				<image x="0" y="0" width="100%" height="30%" preserveAspectRatio="xMidYMid slice">
					<xsl:attribute name="href">
						<xsl:call-template name="listing-image">
							<xsl:with-param name="index" select="number(1)" />
							<xsl:with-param name="preferPrimary" select="'true'" />
						</xsl:call-template>
					</xsl:attribute>
				</image>
				<rect stroke="#f6cc45" stroke-width="4" fill-opacity="0" x="0.4%" y="-0.3%" width="99.4%" height="1"/>
				<rect stroke="#f6cc45" stroke-width="4" fill-opacity="0" x="0.4%" y="30%" width="99.4%" height="1"/>
			</g>

			<g style="transform: translate(0%, 58%);">
				<rect stroke="var(--theme-body-color)" stroke-width="4" fill-opacity="1" x="30%" y="0" width="40%" height="15%" fill="var(--theme-body-background)"/>
				<image x="40%" y="2%" width="20%" height="10%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
			</g>

			<g style="transform: translate(3%, 97%);">
				<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="1" x="0" y="0" width="25%" height="1" fill="var(--theme-body-background)"/>

				<rect stroke="var(--theme-body-color)" stroke-width="3" fill-opacity="1" x="70%" y="0" width="25%" height="1" fill="var(--theme-body-background)"/>
			</g>

			<g style="transform: translate(0%, 95.5%);">

				<text x="50%" y="0" class="center" fill="var(--theme-sub-heading-color)" style="font-size:300%;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentwebsite'" />
						<xsl:with-param name="default" select="//agent[1]/website" />
					</xsl:call-template>
				</text>
			</g>
		</g>
	</xsl:template>
</xsl:stylesheet>