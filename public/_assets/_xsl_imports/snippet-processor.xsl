<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template name="process-snippet">
        <xsl:param name="snippet"/>
        <xsl:variable name="snippet-doc">
            <xsl:sequence select="ixsl:eval($snippet, map{})"/>
        </xsl:variable>
        <xsl:copy-of select="$snippet-doc"/>
    </xsl:template>


</xsl:stylesheet>