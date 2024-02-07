<?xml version="1.0"?>
<!--
	Asset Name:	Sold Listings Table
	Tags:		Table
	Supports:	Area, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<!-- Exclude from render if there are no sold properties -->
	<xsl:template name="include-in-render">
		<xsl:choose>
			<xsl:when test="count(//listings/listing[@state='sold']) = 0">
				<xsl:value-of select="'false'" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'true'" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="svg-body">
		<style>
<xsl:value-of select="'text { dominant-baseline: middle;}'" />

		</style>

		<xsl:call-template name="listings-header">
			<xsl:with-param name="title" select="'Sold Listings'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>
		<xsl:if test="count(//listings/listing[@state='sold']) = 0">
			<xsl:call-template name="empty-listing-text" />
		</xsl:if>
		<xsl:if test="count(//listings/listing[@state='sold']) != 0">
			<g style="transform:translateY(28%)">
				<rect style="fill:var(--sold-red);stroke:var(--sold-red);stroke-width:1px;" x="2%" y="-0.8%" width="96%" height="6%" />

				<text y="2.4%" fill="#fff" font-size="110%">
					<tspan x="3%" class="bold">Address</tspan>
					<tspan x="35%" class="align-center" style="font-weight:800">BR</tspan>
					<tspan x="43%" class="align-center" style="font-weight:800">BA</tspan>
					<tspan x="51%" class="align-center" style="font-weight:800">SQ FT</tspan>
					<tspan x="61%" class="align-center" style="font-weight:800">LIST PRICE</tspan>
					<tspan x="71%" class="align-center" style="font-weight:800">SOLD DATE</tspan>
					<tspan x="81%" class="align-center" style="font-weight:800">SOLD PRICE</tspan>

					<tspan x="94%" class="align-center" style="font-weight:800">DOM</tspan>
				</text>

				<xsl:for-each select="//listings/listing[@state='sold']">
					<xsl:sort select="@isAgent" data-type="number" order="descending"/>
					<xsl:sort select="@sortDate" data-type="number" order="descending"/>

					<xsl:if test="position() &lt;= 8">
						<rect style="stroke:var(--sold-red);stroke-width:1px;" shape-rendering="geometricPrecision" fill-opacity="0" x="2%" width="96%" height="6%">
							<xsl:attribute name="y">
								<xsl:value-of select="concat( -1+( position() * 6 ), '%' )" />
							</xsl:attribute>
						</rect>
						<circle cx="3.5%" r="1.2%" style="fill:var(--sold-red);">
							<xsl:attribute name="cy">
								<xsl:value-of select="concat( 2.1 + ( position() * 6 ), '%' )" />
							</xsl:attribute>
						</circle>
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
							<tspan x="35%" class="align-center">
								<xsl:value-of select="@beds" />
							</tspan>
							<tspan x="43%" class="align-center">
								<xsl:value-of select="@baths" />
							</tspan>
							<tspan x="51%" class="align-center">
								<xsl:value-of select="format-number(@size, '###,###')" />
							</tspan>
							<tspan x="61%" class="align-center">
								<xsl:value-of select="format-number(@listPrice, '$###,###')" />
							</tspan>
							<tspan x="71%" class="align-center">
								<xsl:value-of select="format-number(@salePrice, '$###,###')" />
							</tspan>
							<tspan x="81%" class="align-center">
								<xsl:value-of select="genie:format-date( @soldDate, '[M02]-[D]-[Y0001]')" />
							</tspan>
							<tspan x="93%" class="align-center">
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

			<xsl:variable name="periodName">
				<xsl:call-template name="view-period" />
			</xsl:variable>

			<xsl:call-template name="listings-footer">
<xsl:with-param name="nodes" select="$listingsTotalSold" />

				<xsl:with-param name="summary" select="concat( ' listings sold in the last ', $periodName, '.' )" />
			</xsl:call-template>
		</xsl:if>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>