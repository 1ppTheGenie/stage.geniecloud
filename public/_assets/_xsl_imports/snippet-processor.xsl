<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Character map for decoding entities -->
    <xsl:output method="html" encoding="UTF-8" indent="yes" use-character-maps="entities"/>
    
    <xsl:character-map name="entities">
        <xsl:output-character character="&lt;" string="&#60;"/>
        <xsl:output-character character="&gt;" string="&#62;"/>
        <xsl:output-character character="&amp;" string="&#38;"/>
        <xsl:output-character character="&quot;" string="&#34;"/>
        <xsl:output-character character="&apos;" string="&#39;"/>
    </xsl:character-map>

    <!-- Define variables for quotes -->
    <xsl:variable name="apos">'</xsl:variable>

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
        <xsl:choose>
            <xsl:when test="contains($text, '&lt;')">
                <xsl:value-of select="substring-before($text, '&lt;')" />
                <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
                <xsl:call-template name="decode-entities">
                    <xsl:with-param name="text" select="substring-after($text, '&lt;')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($text, '&gt;')">
                <xsl:value-of select="substring-before($text, '&gt;')" />
                <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
                <xsl:call-template name="decode-entities">
                    <xsl:with-param name="text" select="substring-after($text, '&gt;')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($text, '&amp;')">
                <xsl:value-of select="substring-before($text, '&amp;')" />
                <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
                <xsl:call-template name="decode-entities">
                    <xsl:with-param name="text" select="substring-after($text, '&amp;')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($text, '&quot;')">
                <xsl:value-of select="substring-before($text, '&quot;')" />
                <xsl:text disable-output-escaping="yes">"</xsl:text>
                <xsl:call-template name="decode-entities">
                    <xsl:with-param name="text" select="substring-after($text, '&quot;')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($text, $apos)">
                <xsl:value-of select="substring-before($text, $apos)" />
                <xsl:text disable-output-escaping="yes">'</xsl:text>
                <xsl:call-template name="decode-entities">
                    <xsl:with-param name="text" select="substring-after($text, $apos)" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" disable-output-escaping="yes" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
