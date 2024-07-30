<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="process-snippet">
        <xsl:param name="snippet" />
        <xsl:variable name="decoded">
            <xsl:call-template name="decode-entities">
                <xsl:with-param name="text" select="$snippet" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="$decoded" disable-output-escaping="yes" />
    </xsl:template>

    <xsl:template name="decode-entities">
        <xsl:param name="text" />
        <xsl:value-of select="replace(
            replace(
                replace(
                    replace(
                        replace($text, '&amp;lt;', '&lt;'),
                    '&amp;gt;', '&gt;'),
                '&amp;amp;', '&amp;'),
            '&amp;quot;', '&quot;'),
        '&amp;apos;', &quot;&apos;&quot;)" disable-output-escaping="yes" />
    </xsl:template>

</xsl:stylesheet>