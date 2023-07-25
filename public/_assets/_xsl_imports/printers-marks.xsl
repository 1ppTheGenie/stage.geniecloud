<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:preserve-space elements="*" />

	<xsl:template name="printers-marks">
		<!-- TOP LEFT -->
		<line x1="2" x2="7" stroke="var(--printers-marks)">
			<xsl:attribute name="y1">
				<xsl:value-of select="$cropSize" />
			</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$cropSize" />
			</xsl:attribute>
		</line>
		<line y1="2" y2="7" stroke="var(--printers-marks)">
			<xsl:attribute name="x1">
				<xsl:value-of select="$cropSize" />
			</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$cropSize" />
			</xsl:attribute>
		</line>

		<!-- TOP RIGHT -->
		<line y1="2" y2="7" stroke="var(--printers-marks)">
			<xsl:attribute name="x1">
				<xsl:value-of select="$svgWidth - $cropSize" />
			</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$svgWidth - $cropSize" />
			</xsl:attribute>
		</line>

		<line stroke="var(--printers-marks)">
			<xsl:attribute name="y1">
				<xsl:value-of select="$cropSize" />
			</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$cropSize" />
			</xsl:attribute>
			<xsl:attribute name="x1">
				<xsl:value-of select="$svgWidth - 7" />
			</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$svgWidth - 2" />
			</xsl:attribute>
		</line>

		<!-- BOTTOM RIGHT -->
		<line stroke="var(--printers-marks)">
			<xsl:attribute name="x1">
				<xsl:value-of select="$svgWidth - $cropSize" />
			</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$svgWidth - $cropSize" />
			</xsl:attribute>
			<xsl:attribute name="y1">
				<xsl:value-of select="$svgHeight - 7" />
			</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$svgHeight - 2" />
			</xsl:attribute>
		</line>

		<line stroke="var(--printers-marks)">
			<xsl:attribute name="x1">
				<xsl:value-of select="$svgWidth - 7" />
			</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$svgWidth - 2" />
			</xsl:attribute>
			<xsl:attribute name="y1">
				<xsl:value-of select="$svgHeight - $cropSize" />
			</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$svgHeight - $cropSize" />
			</xsl:attribute>
		</line>

		<!-- BOTTOM LEFT -->
		<line stroke="var(--printers-marks)">
			<xsl:attribute name="x1">
				<xsl:value-of select="$cropSize" />
			</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$cropSize" />
			</xsl:attribute>

			<xsl:attribute name="y1">
				<xsl:value-of select="$svgHeight - 7" />
			</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$svgHeight - 2" />
			</xsl:attribute>
		</line>

		<line x1="2" x2="7" stroke="var(--printers-marks)">
			<xsl:attribute name="y1">
				<xsl:value-of select="$svgHeight - $cropSize" />
			</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$svgHeight - $cropSize" />
			</xsl:attribute>
		</line>
	</xsl:template>
</xsl:stylesheet>