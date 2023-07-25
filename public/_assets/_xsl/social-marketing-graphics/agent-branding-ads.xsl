<?xml version="1.0"?>
<!--
	Asset Name:	Agent Branding Ads
	Tags:		Social Marketing Ad
	Sizes:		Facebook, Postcard
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<g>
			<svg width="100%" viewBox="0 0 100 100" opacity="0.8"
				xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
				<rect width="100%" height="18%" fill="var(--theme-sub-heading-color)" fill-opacity="70%"/>
			</svg>
			<foreignObject x="15%" y="2%" width="70%" height="18%">
				<p class="upper" style="color:var(--theme-body-color);-webkit-line-clamp:10; line-height:150%; text-align:center; font-size:172%; margin:0" data-max-width="45%">

					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'active'" />
						<xsl:with-param name="default" select="concat('I have an all cash buyer looking for a' ,' ', $singularPropertyType, ' ' , 'in' , ' ', //area/name, ' ',' up to $2.7million')" />
					</xsl:call-template>
				</p>
			</foreignObject>
			<image x="0" y="18%" width="100%" height="41%" preserveAspectRatio="xMidYMid slice">
				<xsl:call-template name="switch-image">
					<xsl:with-param name="idx" select="1" />
				</xsl:call-template>
			</image>
			<g style="transform: translate(0%, 60%);">
				<text x="42%" y="0" class="center upper large" fill="var(--theme-body-color)" style=" font-weight:600;">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'When you are ready to sell'" />
						<xsl:with-param name="default" select="'When you are ready to sell'" />
					</xsl:call-template>
				</text>
				<svg xmlns="http://www.w3.org/2000/svg" width="100%" y="7%" x="0" viewBox="0 0 100 100" opacity="1" preserveAspectRatio="none">
					<rect width="84%" height="8%" fill="var(--theme-sub-heading-color)" fill-opacity="100%"/>
				</svg>
				<text x="42%" y="8%" class="upper large bold center">
					<tspan>
						<xsl:value-of select="concat('Call ', //agent[1]/firstName, ' | ',//agent[1]/mobile )" />
					</tspan>
				</text>
				<image x="0" y="16%" width="84%" height="9%" id="logo" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="$companyLogo" />
					</xsl:attribute>
				</image>
				<text x="42%" y="26%" class="bold center" style="font-size:80%" fill="var(--theme-body-color)">
					<xsl:value-of select="//agent[1]/marketingLicense" />
				</text>
			</g>
			<g style="transform: translate(84%, -49%);">
				<svg width="100%" y="100%" x="-0.8%" viewBox="0 0 100 100" opacity="1"
					xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
					<rect width="100%" height="38.7%" fill="var(--theme-body-color)" fill-opacity="100%"/>
				</svg>
				<image width="18%" height="100%" x="0" y="70%" preserveAspectRatio="xMidYMid meet">
					<xsl:attribute name="href">
						<xsl:value-of select="//agent[1]/photo" />
					</xsl:attribute>
				</image>
			</g>
			<g style="transform: translate(0, 89%);">
				<rect width="100%" height="11%" fill="var(--theme-sub-heading-color)"/>
				<text x="50%" y="1%" class="center large bold" data-max-width="80%">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'1areaname'" />
						<xsl:with-param name="default" select="concat( '#1', '&#160;', //area/name)"/>
					</xsl:call-template>
				</text>
			</g>
		</g>
		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>