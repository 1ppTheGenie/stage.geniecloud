<?xml version="1.0"?>
<!--
	Asset Name:	What People Are Buying - By Size
	Tags:		Infographic
	Supports:	Area
	Sizes:		Facebook
	Approved: 	False
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:template name="svg-body">
		<text x="50%" y="5%" class="medium upper center">
			<xsl:value-of select="$areaWithPropertyType" />
		</text>

		<xsl:variable name="bestSize">
			<xsl:for-each select="//statistics/bySize/size">
				<xsl:sort select="@sold" data-type="number" order="descending"/>
				<xsl:if test="position() = 1">
					<xsl:value-of select="number(@number)" />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<text x="50%" y="11%" class="upper center" style="font-size: 250%; fill: var(--theme-sub-heading-color);">Look at what people are buying</text>

		<text x="50%" y="20%" class="medium center">
			<tspan>
				<xsl:value-of select="concat( //areas/area/name, ' has seen a STRONG DEMAND')" />
			</tspan>
			<tspan class="lower" x="50%" dy="6%">
				<xsl:value-of select="concat( $bestSize, ' bedroom ', $propertyType, ' in the ', $lookbackPeriodName )" />
			</tspan>
		</text>

		<g style="transform: translate(2.5%, 28%);">
			<xsl:variable name="maxSold">
				<xsl:for-each select="//statistics/bySize/size">
					<xsl:sort select="@sold" data-type="number" order="descending"/>
					<xsl:if test="position() = 1">
						<xsl:value-of select="number(@sold)" />
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>

			<xsl:for-each select="//statistics/bySize/size">
				<g>
					<xsl:variable name="level1Count" select="position()"/>
					<xsl:attribute name="style">
						<xsl:value-of select="concat( 'transform: translateY(', -1+( position() * 8.5 ), '%)' )" />
					</xsl:attribute>

					<text class="medium middle" y="3%" fill="var(--theme-body-color);">
						<xsl:choose>
							<xsl:when test="@number = 0">
								<tspan style="font-size: 70%">
									<xsl:text>Studio</xsl:text>
								</tspan>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat( $level1Count, ' br' )"/>
							</xsl:otherwise>
						</xsl:choose>
					</text>

					<g style="transform: translateX(6.5%);">
						<xsl:call-template name="curved-rect">
							<xsl:with-param name="width" select="number(0.85)"/>
							<xsl:with-param name="height" select="number(0.06)"/>
							<xsl:with-param name="fill" select="'#ddd'"/>
						</xsl:call-template>
						<xsl:if test="number(@sold) &gt; 0">
							<xsl:call-template name="curved-rect">
								<xsl:with-param name="width" select="number( (@sold div $maxSold) * 0.85 )"/>
								<xsl:with-param name="height" select="number(0.06)"/>
								<xsl:with-param name="fill" select="'var(--theme-body-color)'"/>
							</xsl:call-template>

							<text y="3%">
								<xsl:choose>
									<xsl:when test="@sold div $maxSold &lt; 0.30">
										<xsl:attribute name="class">
											<xsl:value-of select="'medium middle'"/>
										</xsl:attribute>
										<xsl:attribute name="fill">
											<xsl:value-of select="'var(--theme-sub-heading-background)'"/>
										</xsl:attribute>
										<xsl:attribute name="x">
											<xsl:value-of select="format-number( ( (@sold div $maxSold) * 0.85 + 0.05 ), '#.00%' )"/>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">
											<xsl:value-of select="'medium middle right'"/>
										</xsl:attribute>
										<xsl:attribute name="fill">
											<xsl:value-of select="'var(--theme-body-background)'"/>
										</xsl:attribute>
										<xsl:attribute name="x">
											<xsl:value-of select="format-number( (@sold div $maxSold) * 0.85, '#.00%' )"/>
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>

								<xsl:value-of select="concat( @sold, ' ', $propertyType, ' sold  -  Avg ', format-number(@averageSalePrice, '$###,###') )" />
							</text>
						</xsl:if>
					</g>
				</g>
			</xsl:for-each>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>