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
        <xsl:variable name="step1" select="replace($text, '&amp;lt;', '&lt;')"/>
        <xsl:variable name="step2" select="replace($step1, '&amp;gt;', '&gt;')"/>
        <xsl:variable name="step3" select="replace($step2, '&amp;amp;', '&amp;')"/>
        <xsl:variable name="step4" select="replace($step3, '&amp;quot;', '&quot;')"/>
        <xsl:variable name="step5" select="replace($step4, '&amp;apos;', &quot;'&quot;)"/>
        <xsl:variable name="step6" select="replace($step5, '&amp;#10;', '&#10;')"/>
        <xsl:value-of select="$step6"/>
    </xsl:template>

</xsl:stylesheet>