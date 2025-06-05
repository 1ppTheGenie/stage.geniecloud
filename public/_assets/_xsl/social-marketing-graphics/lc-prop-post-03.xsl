<?xml version="1.0"?>
<!--
	Asset Name:	LC-PROP-POST-03
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:import href="lc-prop-posts.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'
				#footer tspan {
					
					font-size: 9px;
				}
				g#footer text a tspan{
					fill: #337ab7;
				}
				g#agent-contact{
					transform: translate(0, 10px) !important;
				}
			'" />
		</style>

		<rect fill="var(--theme-body-color)" stroke-width="0" fill-opacity="1" x="0" y="0" width="100%" height="20.3%" />

		<text class="upper center" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" font-weight="400" font-size="46">
			<xsl:choose>
				<xsl:when test="number(//single/statusTypeID)=1 or number(//single/statusTypeID)=2">
					<tspan x="50.2%" y="2%">I have an all cash buyer</tspan>
					<tspan x="50.2%" y="7.2%">
						<xsl:value-of select="concat('looking for a ', $singularPropertyType ,' in') " />
					</tspan>
				</xsl:when>
				<xsl:otherwise>
					<tspan x="50.2%" y="5%">IN ESCROW – WE HAVE BUYERS WHO MISSED</tspan>
					<tspan x="50.2%" y="10.2%">OUT AND WANT YOUR HOME</tspan>
				</xsl:otherwise>
			</xsl:choose>
		</text>

		<xsl:if test="number(//single/statusTypeID)=1 or number(//single/statusTypeID)=2">
			<text class="upper center" font-family="var(--theme-body-font)" x="50.2%" y="12.2%" fill="var(--theme-body-background)" font-weight="400" font-size="46" data-max-width="90%">
				<xsl:call-template name="editable">
					<xsl:with-param name="default" select="concat( //area/name ,' up to ') " />
				</xsl:call-template>

				<xsl:variable name="lPrice">
					<xsl:choose>
						<xsl:when test="number(//single/statusTypeID)=1">
							<xsl:value-of select="//single/price" />
						</xsl:when>

						<xsl:when test="number(//single/statusTypeID)=2">
							<xsl:value-of select="//single/salePrice" />
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</xsl:variable>
				<xsl:text>

				</xsl:text>
				<tspan style="font-weight:600;">
					<xsl:value-of select="genie:currency-format( $lPrice, 0 )" />
				</tspan>
			</text>
		</xsl:if>

		<image x="0" y="20.3%" width="100%" height="46.3%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<rect x="80%" y="24.5%" width="20%" height="6%">
			<xsl:attribute name="fill">
				<xsl:value-of select="$listingStatusColor" />
			</xsl:attribute>
		</rect>

		<text class="center upper" x="90%" y="25%" font-family="var(--theme-body-font)" fill="#fff" font-weight="700" font-size="46">
			<xsl:value-of select="$listingStatusCaption" />
		</text>

		<text class="upper center middle" x="34.8%" y="69.6%"  fill="var(--theme-heading-color)" font-weight="400" font-size="231.5%" font-family="var(--theme-body-font)">
			When you are ready to sell
		</text>

		<xsl:choose>
			<xsl:when test="//agent[1]/photo">
				<xsl:call-template name="agentAd1-NumberAndLogo">
					<xsl:with-param name="readyX" select="'40%'" />
					<xsl:with-param name="boxWidth" select="'100%'" />
					<xsl:with-param name="agentX" select="'34.8%'" />
					<xsl:with-param name="logoWidth" select="'75%'" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="agentAd1-NumberAndLogo">
					<xsl:with-param name="readyX" select="'50%'" />
					<xsl:with-param name="boxWidth" select="'100%'" />
					<xsl:with-param name="agentX" select="'50%'" />
					<xsl:with-param name="logoWidth" select="'98%'" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>

		<rect fill="var(--theme-body-color)" stroke-width="0" fill-opacity="1" x="0%" y="93%" width="100%" height="10%" />

		<text class="upper center" x="50%" y="93.5%" fill="var(--theme-body-background)" font-weight="600" font-size="250%" data-max-width="80%" font-family="var(--theme-sub-heading-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat( 'Top ', //area/name ,' Agent') " />
			</xsl:call-template>
		</text>

		<g id="agent-contact" style="transform: translateX(-31.5%);">
			<xsl:call-template name="copyright" />
		</g>
	</xsl:template>


</xsl:stylesheet>