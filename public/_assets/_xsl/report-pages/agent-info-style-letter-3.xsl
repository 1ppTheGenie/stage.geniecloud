<?xml version="1.0"?>
<!--
Asset Name: Agent Info Letter Style 3
Tags: Social Marketing Ad
Sizes: US Letter
Supports: Agent
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<g style="transform: translate(50%, 20%);">

			<text class="heading center" x="0" y="0%" font-weight="500" font-size="380%" data-max-width="90%">
				<xsl:call-template name="editable">
					<xsl:with-param name="default" select="concat( 'Your ' , ' ', upper-case( //area[1]/name ), ' Specialist')" />
				</xsl:call-template>
			</text>
			<text x="0" y="11%" class="center upper" font-size="260%" fill="var(--theme-sub-heading-color)" font-family="var(--theme-body-font)">
				<xsl:value-of select="//agent[1]/marketingName" />
			</text>
			<text x="0" y="21%" class="center" font-weight="500" fill="var(--theme-body-color)" font-family="var(--theme-body-font)">
				<tspan font-size="110%" dy="3%">
					<xsl:value-of select="'CALL/TEXT: '" />
				</tspan>
				<tspan font-size="240%" dy="-2%">
					<xsl:value-of select="//agent[1]/mobile" />
				</tspan>
			</text>
			<text x="0" y="29%" class="center" font-weight="500" fill="var(--theme-body-color)" font-family="var(--theme-body-font)">
				<tspan font-size="110%" dy="3.4%">
					<xsl:value-of select="'EMAIL: '" />
				</tspan>
				<tspan font-size="160%" dy="-1%">
					<xsl:value-of select="//agent[1]/marketingEmail" />
				</tspan>
			</text>
			<text x="0" y="36%" class="center" font-weight="500" fill="var(--theme-body-color)" font-family="var(--theme-body-font)">
				<tspan font-size="110%" dy="3.3%">
					<xsl:value-of select="'STATE LICENSE: '" />
				</tspan>
				<tspan font-size="160%" dy="-1%">
					<xsl:value-of select="//agent[1]/marketingLicense" />
				</tspan>
			</text>

			<text x="0" y="60%" class="center" fill="var(--theme-body-color)" font-family="var(--theme-body-font)" font-size="125%">
				<tspan dx="">
					<xsl:if test="//agent[1]/address/street !='' ">
						<xsl:value-of select="//agent[1]/address/street" />
					</xsl:if>
				</tspan>

				<tspan x="0" dy="5.8%">
					<xsl:value-of select="//agent[1]/address/city" />

					<xsl:text>, </xsl:text>
					<xsl:value-of select="//agent[1]/address/state" />

					<xsl:text></xsl:text>
					<xsl:value-of select="//agent[1]/address/zip" />
				</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>