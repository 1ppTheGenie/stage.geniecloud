<?xml version="1.0"?>
<!--
	Asset Name: Eric Matz Flyer 1 Style 2
	Tags:		Direct Mail
	Sizes:		Letter
	Supports:	Listing, Multi-Listing
	Pages:		flyers/eric-matz-flyer-01,flyers/single-rear-01
	Roles:		eric-matz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />


	<xsl:template name="svg-body">

		<g style="transform: translate(9%, 2%);">
			<image width="17%" height="8.7%" preserveAspectRatio="xMinYMid meet">
				<xsl:attribute name="href">
					<xsl:value-of select="$companyLogo" />
				</xsl:attribute>
			</image>
		</g>

		<g style="transform: translate(0%, 12%);">
<rect width="36%" height="9%" fill="var(--theme-body-color)" />

			<text x="18%" y="1%" class="align-center large" fill="var(--theme-body-background)">
				<tspan>
					<xsl:value-of select="//agent[1]/mobile" />
				</tspan>
			</text>
			<text x="18%" y="3%" class="align-center large" fill="var(--theme-body-background)">
				<tspan>
					<xsl:value-of select="//agent[1]/marketingEmail" />
				</tspan>
			</text>
			<text x="18%" y="5%" class="align-center large" fill="var(--theme-body-background)">
				<tspan>
					<xsl:value-of select="//agent[1]/website" />
				</tspan>
			</text>
			<text x="18%" y="7%" class="align-center large" fill="var(--theme-body-background)">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'licenseno'" />
					<xsl:with-param name="default" select="//agent[1]/marketingLicense" />
				</xsl:call-template>
			</text>
		</g>

		<g style="transform: translate(2%,30%)">
<rect x="-2%" y="-7.5%" width="100%" height="0.5%" fill="var(--theme-sub-heading-color)" />


<rect x="-2%" y="-7%" width="100%" height="70%" fill="var(--theme-heading-color)" />


<rect x="-2%" y="62.5%" width="100%" height="0.5%" fill="var(--theme-sub-heading-color)" />


			<text x="0" y="-5%" class="upper" fill="var(--theme-body-background)" style="font-size: 300%;">
				<xsl:call-template name="editable">
					<xsl:with-param name="id" select="'just'" />
					<xsl:with-param name="default" select="'Just'" />
				</xsl:call-template>
				<tspan class="bold">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="' sold'" />
						<xsl:with-param name="default" select="' Sold...'" />
					</xsl:call-template>
				</tspan>
			</text>
			<g style="transform:translate(0%, 0%)">
				<xsl:for-each select="//listings/listing[@state='active']">
					<!-- NO LONGER SORTING HERE: sort done in the incoming data xsl:sort select="@listedDate" data-type="number" order="descending" /> -->
					<xsl:if test="position() &lt;= 12">
						<g>
							<xsl:attribute name="style">
								<xsl:value-of select="concat( 'transform: translate(', ( position() - (floor(position() div 4) * 4 ) - 1) * 24.5, '%, ', (ceiling(position() div 4) - 1) * 21, '%)' )" />
							</xsl:attribute>

							<image width="22%" height="12%" preserveAspectRatio="xMinYMid slice">
								<xsl:attribute name="href">
									<xsl:value-of select="@thumb" />
								</xsl:attribute>
							</image>

							<polygon points="55,0 85,0 0,85 0,55" fill-opacity="0.75" fill="var(--theme-heading-color)"></polygon>

							<text x="4.35%" y="1%" transform-origin="4% 4%" transform="rotate(-45)" fill="var(--theme-body-background)" class="align-center" style="font-size:120%;">Sold</text>

							<!-- <xsl:choose>
									<xsl:when test="( //output/@reportDate - @listedDate ) &lt; ( 86400 * 30 )">
										<xsl:text>New!</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Active</xsl:text>
									</xsl:otherwise>
								</xsl:choose> -->

							<foreignObject x="5%" y="13%" width="140" height="90" class="align-center" style="text-align: center;">
								<text x="0" y="0" class="align-center" style="color: var(--theme-body-background); font-size: 170%;">
									<xsl:value-of select="@address" />
								</text>
							</foreignObject>

							<text x="10.25%" y="18%" class="align-center" fill="var(--theme-body-background)" style="font-size: 170%;">
								<xsl:value-of select="format-number(@listPrice, '$###,###')" />
							</text>
						</g>
					</xsl:if>
				</xsl:for-each>
			</g>
		</g>

		<g>
			<foreignObject x="16%" y="94%" width="66%" height="70" class="center">
				<text x="0" y="0" class="large center">
					<xsl:call-template name="editable">
						<xsl:with-param name="id" select="'agentmobile'" />
						<xsl:with-param name="default" select="concat( 'If you would like your home professionally featured in my publication, which is exposed to thousands of buyers every month call me today', '&#160;', //agent[1]/mobile)" />
					</xsl:call-template>
				</text>
			</foreignObject>
		</g>
	</xsl:template>
</xsl:stylesheet>