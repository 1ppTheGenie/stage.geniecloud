<?xml version="1.0"?>
<!--
	Asset Name:	Active Listings Table
	Tags:		Table
	Supports:	Area, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text {dominant-baseline: middle;}'" />
		</style>
		<xsl:choose>
			<xsl:when test="count(//listings/listing[@state='active']) != 0">
				<xsl:call-template name="no-active-listings" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="has-listings" />
			</xsl:otherwise>
		</xsl:choose>

		<xsl:call-template name="copyright" />
	</xsl:template>

	<xsl:template name="has-listings">
		<xsl:call-template name="listings-header">
			<xsl:with-param name="title" select="'Active Listings'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>

		<g style="transform:translateY(28%)">
			<rect style="fill:var(--active-green);stroke:var(--active-green);" x="2%" y="-0.8%" width="96%" height="6%" />

			<text y="2.4%" fill="#fff" font-size="110%">
				<tspan x="3%" class="bold">Address</tspan>
				<tspan x="40%" class="align-center" style="font-weight:800">List Price</tspan>
				<tspan x="50%" class="align-center" style="font-weight:800">BR</tspan>
				<tspan x="57%" class="align-center" style="font-weight:800">BA</tspan>
				<tspan x="68%" class="align-center" style="font-weight:800">List Date</tspan>
				<tspan x="82%" class="align-center" style="font-weight:800">Sq Ft</tspan>
				<tspan x="94%" class="align-center" style="font-weight:800">DOM</tspan>
			</text>

			<xsl:for-each select="//listings/listing[@state='active']">
				<xsl:if test="position() &lt;= 9">
					<rect style="stroke:var(--active-green);" fill-opacity="0" x="2%" width="96%" height="6%">
						<xsl:attribute name="y">
							<xsl:value-of select="concat( -1+( position() * 6 ), '%' )" />
						</xsl:attribute>
					</rect>

					<xsl:if test="@dom &lt;= $domNew">
<circle cx="3.5%" r="1.2%" style="fill:var(--new-blue);">
							<xsl:attribute name="cy">
								<xsl:value-of select="concat( 2.1 + ( position() * 6 ), '%' )" />
							</xsl:attribute>
						</circle>
					</xsl:if>

					<xsl:if test="@dom &gt;= $domNew">
						<circle cx="3.5%" r="1.2%" style="fill:var(--active-green);">
							<xsl:attribute name="cy">
								<xsl:value-of select="concat( 2.1 + ( position() * 6 ), '%' )" />
							</xsl:attribute>
						</circle>
					</xsl:if>

					<text fill="var(--theme-body-color)" font-size="110%" style="font-weight:600;">
						<xsl:attribute name="y">
							<xsl:value-of select="concat( 2.35 + ( position() * 6 ), '%' )" />
						</xsl:attribute>

						<tspan x="3.5%" class="align-center" fill="#fff">
							<xsl:value-of select="position()" />
						</tspan>
						<tspan x="5%">
							<xsl:value-of select="@address" />
						</tspan>
						<tspan x="40%" class="align-center">
							<xsl:value-of select="format-number(@listPrice, '$###,###')" />
						</tspan>
						<tspan x="50%" class="align-center">
							<xsl:value-of select="@beds" />
						</tspan>
						<tspan x="57%" class="align-center">
							<xsl:value-of select="@baths" />
						</tspan>
						<tspan x="68%" class="align-center">
							<xsl:value-of select="genie:format-date( @listedDate, '[M02]-[D]-[Y0001]')" />
						</tspan>
						<tspan x="82%" class="align-center">
							<xsl:value-of select="format-number(@size, '###,###')" />
						</tspan>
						<tspan x="94%" class="align-center">
							<xsl:choose>
								<xsl:when test="@dom = 1">
									<xsl:value-of select="concat( @dom, ' day')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat( @dom, ' days')" />
								</xsl:otherwise>
							</xsl:choose>
						</tspan>
					</text>
				</xsl:if>
			</xsl:for-each>
		</g>

		<xsl:call-template name="listings-footer">
<xsl:with-param name="nodes" select="$listingsTotalActive" />

			<xsl:with-param name="summary" select="' active listings.'" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="no-active-listings">
		<xsl:call-template name="listings-header">
			<xsl:with-param name="title" select="'Active Listings'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>
		<xsl:call-template name="empty-listing-text" />
	</xsl:template>
</xsl:stylesheet>