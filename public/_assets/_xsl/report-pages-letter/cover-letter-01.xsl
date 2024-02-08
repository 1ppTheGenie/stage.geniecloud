<?xml version="1.0"?>
<!--
	Asset Name:	Cover Letter - 01
	Tags:		Text
	Supports:	Area, Map, Multi-Listing
	Sizes:		US Letter
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />

	<xsl:template name="svg-scripts">
		<xsl:call-template name="map-files" />

		<xsl:call-template name="mixed-listings" />
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:choose>
			<xsl:when test="//output/@mapStyle!='no-map' or //area/image=''">
				<foreignObject x="0" y="0" width="100%" height="100%">
					<div data-width="100%" data-height="100%" style="display:flex;">
						<xsl:call-template name="map-output">
							<xsl:with-param name="style" select="//output/@mapStyle" />
						</xsl:call-template>
					</div>
				</foreignObject>
			</xsl:when>
			<xsl:otherwise>
				<image x="0" y="0" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
					<xsl:call-template name="switch-image">
						<xsl:with-param name="id" select="concat('report-image-', //area/id)" />
						<xsl:with-param name="preferArea" select="'true'" />
					</xsl:call-template>
				</image>

				<xsl:call-template name="map-overlay" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="map-overlay">
		<svg style="position: absolute;top: 0;left: 0;z-index: 9999;width:100%;height:100%;">

			<rect x="2%" y="6%" width="96%" height="88.5%" fill-opacity="0" stroke="var(--theme-sub-heading-color)" stroke-width="2" />
			<rect x="4%" y="8%" width="92%" height="84%" fill-opacity="0" stroke="var(--theme-sub-heading-color)" stroke-width="2" />

			<xsl:choose>
				<xsl:when test="//output/@customerName!=''">
					<xsl:variable name="bgY" select="'13%'"/>
					<xsl:variable name="byH" select="'74%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="bgY" select="'18%'"/>
					<xsl:variable name="bgH" select="'60%'"/>
				</xsl:otherwise>
			</xsl:choose>

			<rect x="5%" y="{$bgY}" width="90%" height="{$bgH}" fill-opacity="75%" fill="var(--theme-body-background)" />

			<g>
				<foreignObject x="20%" y="30%" height="10%" width="60%">
					<div style="display:flex;justify-content:center;align-items:center;">
						<svg height="10" width="30" style="flex-grow:0; margin-right: 2%">
							<path stroke-linecap="butt" d="M0 5 l75 0" fill="none" stroke="var(--theme-heading-color)" stroke-width="2"></path>
						</svg>

						<h2 class="upper" style="color: var(--theme-sub-heading-color);text-align: center;font-weight: 400; font-family:var(--theme-sub-heading-font);font-size: 25px;">Market Insider REPORT</h2>

						<svg height="10" width="30" style="flex-grow:0; margin-left: 2%">
							<path stroke-linecap="butt" d="M0 5 l75 0" fill="none" stroke="var(--theme-heading-color)" stroke-width="2"></path>
						</svg>
					</div>
				</foreignObject>

				<xsl:if test="//output/@customerName!=''">
					<text x="50%" y="43%" class="narrow center" font-size="125%">
						<tspan style="fill:var(--theme-heading-color);">Prepared exclusively for</tspan>
						<tspan x="50%" dy="3%" font-size="150%">
							<xsl:value-of select="//output/@customerName" />
						</tspan>
					</text>
				</xsl:if>

				<xsl:if test="//output/@customerName!=''">
					<text x="50%" y="37%" data-max-width="95%" class="heading center upper" style="font-size:350%;fill:var(--theme-body-color);font-weight:500;">
						<xsl:value-of select="//area/name" />
						<xsl:value-of select="concat( ' ', $propertyType )" />
					</text>
					<text x="50%" y="50%" class="narrow center" font-size="170%" style="fill:var(--theme-body-color);">
						<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
					</text>

					<xsl:if test="not(starts-with(//agent[1]/role, 'Affiliate'))">
						<xsl:if test="//agent[1]/marketingName!=''">
							<text x="50%" y="54%" class="center bold" style="fill:var(--theme-body-color);font-size:150%;">
								<xsl:value-of select="concat( 'Courtesy of ', //agent[1]/marketingName )" />
							</text>
						</xsl:if>

						<xsl:if test="//agent[1]/marketingTitle!=''">
							<text x="50%" y="63.5%" class="center" fill="var(--theme-body-color)" font-size="100%;" font-family="var(--theme-body-font)">
								<xsl:value-of select="//agent[1]/marketingTitle" />
							</text>
						</xsl:if>

						<image x="32.5%" y="68%" width="35%" height="18%" id="logo" preserveAspectRatio="xMidYMid meet" href="{$companyLogo}" />
					</xsl:if>
				</xsl:if>

				<xsl:if test="//output/@customerName=''">
					<text x="50%" y="37%" data-max-width="95%" class="heading center upper" style="font-size:350%;fill:var(--theme-body-color);font-weight:500;">
						<xsl:value-of select="//area/name" />
						<xsl:value-of select="concat( ' ', $propertyType )" />
					</text>
					<text x="50%" y="45%" class="center" font-size="170%" style="fill:var(--theme-body-color);" font-family="var(--theme-body-font)">
						<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]')" />
					</text>

					<xsl:if test="//agent[1]/marketingName!=''">
						<text x="50%" y="51%" class="bold center" style="fill:var(--theme-body-color);font-size:150%;" font-family="var(--theme-body-font)">
							<xsl:value-of select="concat( 'Courtesy of ', //agent[1]/marketingName )" />
						</text>
					</xsl:if>

					<xsl:if test="//agent[1]/marketingTitle!=''">
						<text x="50%" y="63.5%" class="center" fill="var(--theme-body-color)" font-size="100%;" font-family="var(--theme-body-font)">
							<xsl:value-of select="//agent[1]/marketingTitle" />
						</text>
					</xsl:if>

					<image x="41.5%" y="55.5%" width="17%" height="12%" id="logo" preserveAspectRatio="xMidYMid meet" href="{$companyLogo}" />
				</xsl:if>
			</g>
		</svg>
	</xsl:template>
</xsl:stylesheet>