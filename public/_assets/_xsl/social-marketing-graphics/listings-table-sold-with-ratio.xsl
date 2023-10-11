<?xml version="1.0"?>
<!--
	Asset Name:	Sold Listings Table with Sale/List Ratio
	Tags:		Table
	Supports:	Area, Multi-Listing
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:genie="https://theGenie.ai/hub" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="svg-body">
		<xsl:call-template name="listings-header">
			<xsl:with-param name="title" select="'Sold Listings'" />
			<xsl:with-param name="color" select="'var(--sold-red)'" />
		</xsl:call-template>

		<g style="transform:translateY(22%)">
			<rect style="fill:var(--sold-red);stroke:var(--sold-red);" x="2%" y="0" width="96%" height="5%" />

			<text y="1%" fill="#fff">
				<tspan x="3%" class="bold">Address</tspan>
				<tspan x="40%" class="align-center bold">BR</tspan>
				<tspan x="45%" class="align-center bold">BA</tspan>
				<tspan x="50%" class="align-center bold">Sq Ft</tspan>
				<tspan x="58%" class="align-center bold">List Price</tspan>
				<tspan x="68%" class="align-center bold">Sold Price</tspan>
				<tspan x="78%" class="align-center bold">Sold Date</tspan>
				<tspan x="86%" class="align-center bold">DOM</tspan>
				<tspan x="93%" class="align-center bold">Sale/List %</tspan>
			</text>

			<xsl:for-each select="//listings/listing[@state='sold']">
				<!-- NO LONGER SORTING HERE:  < xsl:sort select="@soldDate" data-type="number" order="descending" /> -->

				<xsl:if test="position() &lt;= 10">
					<rect style="stroke:var(--sold-red);" fill-opacity="0" x="2%" width="96%" height="6%">
						<xsl:attribute name="y">
							<xsl:value-of select="concat( -1+( position() * 6 ), '%' )" />
						</xsl:attribute>
					</rect>
					<circle cx="3.5%" r="1.2%" style="fill:var(--sold-red);">
						<xsl:attribute name="cy">
							<xsl:value-of select="concat( 2.5 + ( position() * 6 ), '%' )" />
						</xsl:attribute>
					</circle>
					<text fill="var(--theme-body-color)">
						<xsl:attribute name="y">
							<xsl:value-of select="concat( 1 + ( position() * 6 ), '%' )" />
						</xsl:attribute>

						<tspan x="3.5%" class="align-center" fill="#fff">
							<xsl:value-of select="position()" />
						</tspan>
						<tspan x="5%">
							<xsl:value-of select="@address" />
						</tspan>
						<tspan x="40%" class="align-center">
							<xsl:value-of select="@beds" />
						</tspan>
						<tspan x="45%" class="align-center">
							<xsl:value-of select="@baths" />
						</tspan>
						<tspan x="50%" class="align-center">
							<xsl:value-of select="format-number(@size, '###,###')" />
						</tspan>
						<tspan x="58%" class="align-center">
							<xsl:value-of select="format-number(@listPrice, '$###,###')" />
						</tspan>
						<tspan x="68%" class="align-center">
							<xsl:value-of select="format-number(@salePrice, '$###,###')" />
						</tspan>
						<tspan x="78%" class="align-center">
							<xsl:value-of select="genie:format-date( @soldDate, '[M02]-[D]-[Y0001]')" />
						</tspan>
						<tspan x="86%" class="align-center">
							<xsl:choose>
								<xsl:when test="@dom = 1">
									<xsl:value-of select="concat( @dom, ' day')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat( @dom, ' days')" />
								</xsl:otherwise>
							</xsl:choose>
						</tspan>
						<tspan x="93%" class="align-center">
							<xsl:value-of select="format-number( @salePrice div @listPrice, '##.##%')" />
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

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>