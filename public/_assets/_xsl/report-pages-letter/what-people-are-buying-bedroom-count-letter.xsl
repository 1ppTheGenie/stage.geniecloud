<?xml version="1.0"?>
<!--
	Asset Name:	What People Are Buying - By Bedroom Letter
	Tags:		Infographic
	Supports:	Area
	Sizes:		US Letter
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>
	<xsl:template name="svg-body">
		<style>
			<xsl:value-of select="'text {dominant-baseline: middle;}'" />
		</style>

		<xsl:call-template name="letter-report-header">
			<xsl:with-param name="title" select="'look at what people are buying'" />
			<xsl:with-param name="color" select="'var(--theme-heading-color)'" />
		</xsl:call-template>

		<xsl:variable name="bestSize">
			<xsl:for-each select="//statistics/byBedroom/bedroom">
				<xsl:sort select="@sold" data-type="number" order="descending"/>
				<xsl:if test="position() = 1">
					<xsl:value-of select="number(@number)" />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<text x="50%" y="20%" class="medium center" font-family="var(--theme-body-font)" fill="var(--theme-body-color)">
			<tspan>
				<xsl:value-of select="concat( //areas/area/name, ' has seen a STRONG DEMAND for')" />
			</tspan>
			<tspan x="50%" dy="3%">
				<xsl:value-of select="concat( $bestSize, ' bedroom ' ,lower-case( $propertyType ), ' SOLD ', 'in the ', $lookbackPeriodName ,'.')" />
			</tspan>
		</text>

		<g style="transform: translate(2.5%, 31%);">
			<xsl:variable name="maxSold">
				<xsl:for-each select="//statistics/byBedroom/bedroom">
					<xsl:sort select="@sold" data-type="number" order="descending"/>
					<xsl:if test="position() = 1">
						<xsl:value-of select="number(@sold)" />
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>

			<xsl:for-each select="//statistics/byBedroom/bedroom[@sold &gt; 0]">
				<g>
					<xsl:attribute name="style">
						<xsl:value-of select="concat( 'transform: translateY(', -1+( position() * 6 ), '%)' )" />
					</xsl:attribute>

					<text class="medium" y="3%" fill="var(--theme-body-color);">
						<xsl:choose>
							<xsl:when test="@number = 0">
								<tspan style="font-size: 70%">
									<xsl:text>Studio</xsl:text>
								</tspan>
							</xsl:when>
							<xsl:when test="count(//statistics/byBedroom/bedroom[@sold &gt; 0]) = position()">
								<xsl:value-of select="concat( @number, '+ br ' )"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat( @number, ' br' )"/>
							</xsl:otherwise>
						</xsl:choose>
					</text>

					<xsl:variable name="soldColor">
						<xsl:choose>
							<xsl:when test="@number = 1">
								<xsl:value-of select="'#b6e026'"/>
							</xsl:when>
							<xsl:when test="@number = 2">
								<xsl:value-of select="'#e570e7'"/>
							</xsl:when>
							<xsl:when test="@number = 3">
								<xsl:value-of select="'#f03a87'"/>
							</xsl:when>
							<xsl:when test="@number = 4">
								<xsl:value-of select="'#57e7a9'"/>
							</xsl:when>
							<xsl:when test="@number = 5">
								<xsl:value-of select="'#2ee2fa'"/>
							</xsl:when>
							<xsl:when test="@number = 6">
								<xsl:value-of select="'#ffc700'"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'#e570e7'"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>

					<g style="transform: translateX(8.5%);">
						<xsl:call-template name="curved-rect">
							<xsl:with-param name="width" select="number(0.85)"/>
							<xsl:with-param name="height" select="number(0.04)"/>
							<xsl:with-param name="fill" select="'#ddd'"/>
						</xsl:call-template>
						<xsl:if test="@sold &gt; 0">
							<xsl:call-template name="curved-rect">
								<xsl:with-param name="width" select="number( (@sold div $maxSold) * 0.85 )"/>
								<xsl:with-param name="height" select="number(0.04)"/>
								<xsl:with-param name="fill" select="$soldColor"/>
							</xsl:call-template>

							<text y="2.5%" style="font-size:130%;">
								<xsl:choose>
									<xsl:when test="@sold div $maxSold &lt; 0.35">

										<xsl:attribute name="fill">
											<xsl:value-of select="'#000000'"/>
										</xsl:attribute>
										<xsl:attribute name="x">
											<xsl:value-of select="format-number( ( (@sold div $maxSold) * 0.85 + 0.025 ), '#.00%' )"/>
										</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">
											<xsl:value-of select="'medium right'"/>
										</xsl:attribute>
										<xsl:attribute name="fill">
											<xsl:value-of select="'#2f2d2d'"/>
										</xsl:attribute>
										<xsl:attribute name="x">
											<xsl:value-of select="format-number( (@sold div $maxSold) * 0.85, '#.00%' )"/>
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>

								<xsl:value-of select="concat( @sold, ' ', $propertyType, ' SOLD  -  Avg ', format-number(@averageSalePrice, '$###,###') )" />
							</text>
						</xsl:if>
					</g>
				</g>
			</xsl:for-each>
		</g>

		<xsl:call-template name="copyright" />
	</xsl:template>
</xsl:stylesheet>