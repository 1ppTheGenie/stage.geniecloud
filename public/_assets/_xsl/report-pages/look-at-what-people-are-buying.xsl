<?xml version="1.0"?>
<!--
	Asset Name:	Look At What People Are Buying
	Tags:		Infographic
	Supports:	Area
	Sizes:		Facebook
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
<xsl:import href="common.xsl" />

	<xsl:template name="body">
		<xsl:call-template name="svg-wrapper" />
	</xsl:template>

	<xsl:template name="svg-body">
		<xsl:variable name="bestSize">
			<xsl:for-each select="//statistics/byBedroom/bedroom">
<xsl:sort select="@sold" data-type="number" order="descending" />

				<xsl:if test="position() = 1">
					<xsl:value-of select="concat( last(), ' Bedroom ')" />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<text x="50%" y="5%" class="medium center sub-heading">
			<tspan class="upper" style="letter-spacing:2px;">
				<xsl:value-of select="$areaWithPropertyType" />
			</tspan>
		</text>

		<text x="50%" y="11%" class="upper center heading" style="font-size: 250%; fill: var(--theme-heading-color);letter-spacing:1px;">Look at what people are buying</text>

		<text x="50%" y="20%" class="center">
			<tspan style="fill:var(--theme-body-color); font-size:125%;letter-spacing:1px;">
				<xsl:value-of select="concat( //areas/area/name, ' has seen a STRONG DEMAND for')" />
			</tspan>
		</text>

		<text x="50%" y="26%">
			<tspan class="align-center" style="fill:var(--theme-body-color); font-size:125%;">
				<xsl:call-template name="view-period">
					<xsl:with-param name="prefix" select="concat( $bestSize , lower-case($singularPropertyType) ,' SOLD in the last ')" />
				</xsl:call-template>
			</tspan>
		</text>

		<g style="transform: translate(2.5%, 28%);">
			<xsl:variable name="maxSold">
				<xsl:for-each select="//statistics/bySize/size">
<xsl:sort select="@sold" data-type="number" order="descending" />

					<xsl:if test="position() = 1">
						<xsl:value-of select="number(@sold)" />
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>

			<xsl:for-each select="//statistics/bySize/size">
				<g>
<xsl:variable name="level1Count" select="position()" />

					<xsl:attribute name="style">
						<xsl:value-of select="concat( 'transform: translateY(', -1+( position() * 8.5 ), '%)' )" />
					</xsl:attribute>

					<text class="middle" x="2%" y="3%" fill="var(--theme-body-color);">
						<xsl:choose>
							<xsl:when test="@number = 0">
								<tspan style="font-size: 70%">
									<xsl:text>Studio</xsl:text>
								</tspan>
							</xsl:when>
							<xsl:otherwise>
<xsl:value-of select="concat( $level1Count, ' br' )" />

							</xsl:otherwise>
						</xsl:choose>
					</text>

					<g style="transform: translateX(6.5%);">
						<xsl:call-template name="curved-rect">
<xsl:with-param name="width" select="number(0.85)" />
<xsl:with-param name="height" select="number(0.06)" />
<xsl:with-param name="fill" select="'#ddd'" />

						</xsl:call-template>
						<xsl:if test="@sold &gt; 0">
							<xsl:call-template name="curved-rect">
<xsl:with-param name="width" select="number( (@sold div $maxSold) * 0.85 )" />
<xsl:with-param name="height" select="number(0.06)" />
<xsl:with-param name="fill" select="'var(--theme-body-color)'" />

							</xsl:call-template>

							<text y="3%">
								<xsl:choose>
									<xsl:when test="@sold div $maxSold &lt; 0.30">
										<xsl:attribute name="class">
<xsl:value-of select="'middle'" />

										</xsl:attribute>
										<xsl:attribute name="fill">
<xsl:value-of select="'var(--theme-body-color)'" />

										</xsl:attribute>
										<xsl:attribute name="x">
<xsl:value-of select="format-number( ( (@sold div $maxSold) * 0.85 + 0.05 ), '#.00%' )" />

										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">
<xsl:value-of select="'middle right'" />

										</xsl:attribute>
										<xsl:attribute name="fill">
<xsl:value-of select="'var(--theme-body-background)'" />

										</xsl:attribute>
										<xsl:attribute name="x">
<xsl:value-of select="format-number( (@sold div $maxSold) * 0.85, '#.00%' )" />

										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>

								<xsl:value-of select="concat( @sold, ' ', $propertyType, ' sold  &#160;&#160;&#160; Avg ', format-number(@averageSalePrice, '$###,###') )" />
							</text>
						</xsl:if>
					</g>
				</g>
			</xsl:for-each>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>