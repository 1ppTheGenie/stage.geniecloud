<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <!-- Template to process the snippet -->
    <xsl:template name="process-snippet">
        <xsl:param name="snippet" />
        <xsl:variable name="decoded">
            <xsl:call-template name="decode-entities">
                <xsl:with-param name="text" select="$snippet" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="$decoded" disable-output-escaping="yes"/>
    </xsl:template>

    <!-- Template to decode entities -->
    <xsl:template name="decode-entities">
        <xsl:param name="text" />
        <xsl:value-of select="$text" disable-output-escaping="yes"/>
    </xsl:template>

</xsl:stylesheet>