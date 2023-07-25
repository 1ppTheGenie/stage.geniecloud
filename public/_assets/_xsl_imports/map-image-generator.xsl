<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="yes">
	<xsl:import href="common.xsl"/>

	<xsl:preserve-space elements="*" />

	<xsl:template name="body">
		<html>
			<head>
				<base>
					<xsl:attribute name="href">
						<xsl:value-of select="//output/@siteUrl" />
					</xsl:attribute>
				</base>
				<xsl:call-template name="map-files" />
				<script>var listings = [];</script>
			</head>
			<body style="height: 100%; width:100%;margin:0;padding:0;overflow:hidden">
				<xsl:call-template name="map-output">
					<xsl:with-param name="style" select="//output/@mapStyle" />
				</xsl:call-template>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>