<?xml version="1.0"?>
<!--
	Asset Name:	LC-PROP-POST-03
	Tags:		Agent Ad, LC
	Sizes:		Facebook Post, Facebook Ad, Instagram-Square
	Supports:	Listing, Area
	Version:	1.1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl" />
	<xsl:import href="lc-prop-posts.xsl" />

	<xsl:template name="svg-body">
		<rect fill="var(--theme-body-color)" stroke-width="0" fill-opacity="1" x="0" y="0" width="100%" height="17%" />

		<text class="upper center" font-family="var(--theme-body-font)" fill="var(--theme-body-background)" font-weight="400" font-size="130%">
			<xsl:choose>
				<xsl:when test="number(//single/statusTypeID)=1 or number(//single/statusTypeID)=2">
					<tspan x="50%" y="1%">I have an all cash buyer</tspan>
					<tspan x="50%" y="6%">
						<xsl:value-of select="concat('looking for a ', $singularPropertyType ,' in') " />
					</tspan>
				</xsl:when>
				<xsl:otherwise>
					<tspan x="50%" y="4%">IN ESCROW – WE HAVE BUYERS WHO MISSED</tspan>
					<tspan x="50%" y="9%">OUT AND WANT YOUR HOME</tspan>
				</xsl:otherwise>
			</xsl:choose>
		</text>

		<xsl:if test="number(//single/statusTypeID)=1 or number(//single/statusTypeID)=2">
			<text class="upper center" font-family="var(--theme-body-font)" x="50%" y="11%" fill="var(--theme-body-background)" font-weight="400" font-size="130%" data-max-width="90%">
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

		<image x="0" y="17%" width="100%" height="49%" preserveAspectRatio="xMidYMid slice">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<rect x="80%" y="22%" width="20%" height="5.5%">
			<xsl:attribute name="fill">
				<xsl:value-of select="$listingStatusColor" />
			</xsl:attribute>
		</rect>

		<foreignObject width="125" height="34" x="78%" y="22.1%" class="upper middle center" style="-webkit-box-orient: vertical;">
			<p style="font-weight:600;-webkit-box-orient: vertical;margin:0;color:#ffffff;line-height:160%; font-size:120%;" class="middle center" font-family="var(--theme-heading-font)">
				<xsl:value-of select="$listingStatusCaption" />
			</p>
		</foreignObject>

		<xsl:choose>
			<xsl:when test="//agent[1]/photo">
				<xsl:call-template name="agentAd1-NumberAndLogo">
					<xsl:with-param name="readyX" select="'40%'" />
					<xsl:with-param name="boxWidth" select="'100%'" />
					<xsl:with-param name="agentX" select="'38.5%'" />
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

		<rect fill="var(--theme-body-color)" stroke-width="0" fill-opacity="1" x="0%" y="92%" width="100%" height="10%" />

		<text class="upper center" x="50%" y="93.5%" fill="var(--theme-body-background)" font-weight="600" font-size="130%" data-max-width="80%" font-family="var(--theme-body-font)">
			<xsl:call-template name="editable">
				<xsl:with-param name="default" select="concat( 'Top ', //area/name ,' Agent') " />
			</xsl:call-template>
		</text>

		<style>
			<xsl:value-of select="'#footer tspan {fill:var(--theme-body-background)!important;}'" />
		</style>

		<g id="agent-contact" style="transform: translateX(-31.5%);">
			<xsl:call-template name="copyright" />
		</g>
	</xsl:template>


</xsl:stylesheet>