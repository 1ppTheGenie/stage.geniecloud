<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template name="process-snippet">
        <xsl:param name="snippet" as="xs:string"/>
        <xsl:value-of select="unparsed-text('data:text/plain;charset=utf-8,' || encode-for-uri($snippet), 'utf-8')" disable-output-escaping="yes"/>
    </xsl:template>

</xsl:stylesheet>