<?xml version="1.0"?>
<!--
	Asset Name:	Cover - 01
	Tags:		Text
	Supports:	Area, Map, Multi-Listing
	Sizes:		Facebook
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
			<rect x="3%" y="5%" width="94%" height="90%" fill-opacity="0" stroke="var(--theme-sub-heading-color)" stroke-width="2" />
			<rect x="4%" y="8%" width="92%" height="84%" fill-opacity="0" stroke="var(--theme-sub-heading-color)" stroke-width="2" />

			<xsl:variable name="bgY" select="if (//output/@customerName != '') then '13%' else '18%'" />
			<xsl:variable name="bgH" select="if (//output/@customerName != '') then '74%' else '60%'" />
			<xsl:variable name="foY" select="if (//output/@customerName != '') then '14%' else '19.5%'" />
			<xsl:variable name="headingY" select="if (//output/@customerName != '') then '26%' else '31%'" />
			<xsl:variable name="dateY" select="if (//output/@customerName != '') then '52.5%' else '41.5%'" />
			<xsl:variable name="nameY" select="if (//output/@customerName != '') then '59%' else '49.5%'" />
			<xsl:variable name="titleY" select="if (//output/@customerName != '') then '63.5%' else '53.5%'" />

			<xsl:variable name="logoY" select="if (//output/@customerName != '') then '70%' else '62%'" />
			<xsl:variable name="logoH" select="if (//output/@customerName != '') then '15%' else '15%'" />

			<rect x="5%" y="{$bgY}" width="90%" height="{$bgH}" fill-opacity="75%" fill="var(--theme-body-background)" />

			<foreignObject x="20%" y="{$foY}" height="10%" width="60%">
				<div style="display:flex;justify-content:center;align-items:center;">
					<svg height="10" width="30" style="flex-grow:0; margin-right: 2%">
						<path stroke-linecap="butt" d="M0 5 l75 0" fill="none" stroke="var(--theme-heading-color)" stroke-width="2"></path>
					</svg>

					<h2 class="upper" style="color: var(--theme-sub-heading-color);text-align: center;font-weight: 400; font-family:var(--theme-sub-heading-font)">Market Insider REPORT</h2>

					<svg height="10" width="30" style="flex-grow:0; margin-left: 2%">
						<path stroke-linecap="butt" d="M0 5 l75 0" fill="none" stroke="var(--theme-heading-color)" stroke-width="2"></path>
					</svg>
				</div>
			</foreignObject>

			<xsl:if test="string(//output/@customerName)!=''">
				<text x="50%" y="39%" class="narrow center" font-size="125%">
					<tspan style="fill:var(--theme-heading-color);">Prepared exclusively for</tspan>
					<tspan x="50%" dy="4%" font-size="150%">
						<xsl:value-of select="string(//output/@customerName)" />
					</tspan>
				</text>
			</xsl:if>

			<text x="50%" y="{$headingY}" data-max-width="80%" class="heading center upper" style="font-size:350%;fill:var(--theme-body-color);font-weight:500;">
				<xsl:value-of select="//area/name" />
				<xsl:value-of select="concat( ' ', $propertyType )" />
			</text>
			<text x="50%" y="{$dateY}" class="narrow center" font-size="140%" style="fill:var(--theme-body-color);">
				<xsl:value-of select="genie:format-date( //output/@reportDate, '[FNn], [MNn] [D], [Y0001]' )" />
			</text>

			<xsl:if test="not(starts-with(//agent[1]/role, 'Affiliate'))">
				<xsl:if test="//agent[1]/marketingName!=''">
					<text x="50%" y="{$nameY}" class="center bold" fill="var(--theme-body-color)" font-family="var(--theme-body-font)" font-size="120%">
						<xsl:value-of select="concat( 'Courtesy of ', //agent[1]/marketingName )" />
					</text>
					<xsl:if test="//agent[1]/marketingTitle!=''">
						<text x="50%" y="{$titleY}" class="center" style="fill:var(--theme-body-color);font-size:100%;" font-family="var(--theme-body-font)">
							<xsl:value-of select="//agent[1]/marketingTitle" />
						</text>
					</xsl:if>
				</xsl:if>
			
				<image x="32.5%" y="{$logoY}" width="35%" height="{$logoH}" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="//output/@themeHue = 'light'">
								<xsl:value-of select="$companyLogo" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$companyLogoInverse" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</image>
			</xsl:if>
		</svg>
	</xsl:template>
</xsl:stylesheet>