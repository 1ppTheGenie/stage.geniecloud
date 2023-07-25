<?xml version="1.0"?>
<!--
	Asset Name:	Home Sold By Bedroom
	Tags: 		Social Marketing Ad, Infographic
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<xsl:call-template name="svg-defs" />

		<image preserveAspectRatio="xMidYMid slice" width="100%" opacity="0.4" height="100%">
			<xsl:call-template name="switch-image">
				<xsl:with-param name="id" select="image-1" />
				<xsl:with-param name="idx" select="1" />
			</xsl:call-template>
		</image>

		<g style="transform:translateY(2.5%)">
			<xsl:call-template name="area-heading">
				<xsl:with-param name="default" select="'What Hot By Bedroom'" />
				<xsl:with-param name="id" select="'market-update-title'" />
			</xsl:call-template>
		</g>

		<xsl:variable name="totalSales" select="sum(//byValue/range/@sold)"/>

		<xsl:variable name="maxSales">
			<xsl:for-each select="//byValue/range">
				<xsl:sort select="@sold" data-type="number" order="descending"/>
				<xsl:if test="position() = 1">
					<xsl:value-of select="@sold" />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<g style="transform: translate(5%, 20%)">
			<g style="transform: translateY(6%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'1'" />
					<xsl:with-param name="available-space" select="number(0.55)" />
					<xsl:with-param name="caption">
						<tspan x="0" y="2%">
							<xsl:value-of select="//byValue/range[1]/@value" />
						</tspan>
						<tspan x="0" dy="3.5%">
							<xsl:text>Or Less</xsl:text>
						</tspan>
					</xsl:with-param>
					<xsl:with-param name="width" select="//byValue/range[1]/@sold div $maxSales" />
					<xsl:with-param name="diamond-caption" select="format-number( //byValue/range[1]/@sold div $totalSales, '#%' )" />
					<xsl:with-param name="value" select="concat( //byValue/range[1]/@sold, ' sales' )"/>
				</xsl:call-template>
			</g>

			<g style="transform: translateY(26%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'2'" />
					<xsl:with-param name="available-space" select="number(0.55)" />
					<xsl:with-param name="caption">
						<tspan x="0" y="2%">
							<xsl:value-of select="//byValue/range[1]/@value" />
						</tspan>
						<tspan x="0" dy="3.5%">
							<xsl:value-of select="concat( 'To ', //byValue/range[3]/@value )" />
						</tspan>
					</xsl:with-param>
					<xsl:with-param name="width" select="//byValue/range[2]/@sold div $maxSales" />
					<xsl:with-param name="diamond-caption" select="format-number( //byValue/range[2]/@sold div $totalSales, '#%' )" />
					<xsl:with-param name="value" select="concat( //byValue/range[2]/@sold, ' sales' )"/>
				</xsl:call-template>
			</g>

			<g style="transform: translateY(46%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'3'" />
					<xsl:with-param name="available-space" select="number(0.55)" />
					<xsl:with-param name="caption">
						<tspan x="0" y="2%">
							<xsl:value-of select="//byValue/range[3]/@value" />
						</tspan>
						<tspan x="0" dy="3.5%">
							<xsl:text>Or More</xsl:text>
						</tspan>
					</xsl:with-param>
					<xsl:with-param name="width" select="//byValue/range[3]/@sold div $maxSales" />
					<xsl:with-param name="diamond-caption" select="format-number( //byValue/range[3]/@sold div $totalSales, '#%' )" />
					<xsl:with-param name="value" select="concat( //byValue/range[3]/@sold, ' sales' )"/>
				</xsl:call-template>
			</g>
			<g style="transform: translateY(66%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'4'" />
					<xsl:with-param name="available-space" select="number(0.55)" />
					<xsl:with-param name="caption">
						<tspan x="0" y="2%">
							<xsl:value-of select="//byValue/range[3]/@value" />
						</tspan>
						<tspan x="0" dy="3.5%">
							<xsl:text>Or More</xsl:text>
						</tspan>
					</xsl:with-param>
					<xsl:with-param name="width" select="//byValue/range[3]/@sold div $maxSales" />
					<xsl:with-param name="diamond-caption" select="format-number( //byValue/range[3]/@sold div $totalSales, '#%' )" />
					<xsl:with-param name="value" select="concat( //byValue/range[3]/@sold, ' sales' )"/>
				</xsl:call-template>
			</g>
			<g style="transform: translateY(86%)">
				<xsl:call-template name="lozenge">
					<xsl:with-param name="fill-id" select="'5'" />
					<xsl:with-param name="available-space" select="number(0.55)" />
					<xsl:with-param name="caption">
						<tspan x="0" y="2%">
							<xsl:value-of select="//byValue/range[3]/@value" />
						</tspan>
						<tspan x="0" dy="3.5%">
							<xsl:text>Or More</xsl:text>
						</tspan>
					</xsl:with-param>
					<xsl:with-param name="width" select="//byValue/range[3]/@sold div $maxSales" />
					<xsl:with-param name="diamond-caption" select="format-number( //byValue/range[3]/@sold div $totalSales, '#%' )" />
					<xsl:with-param name="value" select="concat( //byValue/range[3]/@sold, ' sales' )"/>
				</xsl:call-template>
			</g>
		</g>

		<g style="transform: translate(81%, 50%);">
			<polyline style="fill:#fff;" filter="url(#blurred-shadow)" points="-20,60 0,40 0,0 200,0 200,120 0,120 0,80"/>

			<text x="8%" y="3%" class="center" style="font-size:450%" font-weight="bold" fill="#000">
				<xsl:value-of select="//statistics/@averageDaysOnMarket" />
			</text>

			<text x="8%" y="22%" class="medium center">
				<tspan>Average Days</tspan>
				<tspan x="8%" dy="5%">on Market</tspan>
			</text>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>

</xsl:stylesheet>