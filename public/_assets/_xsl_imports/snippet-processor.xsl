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

    <!-- Define variables for entities -->
    <xsl:variable name="lt">&lt;</xsl:variable>
    <xsl:variable name="gt">&gt;</xsl:variable>
    <xsl:variable name="amp">&amp;</xsl:variable>
    <xsl:variable name="quot">&quot;</xsl:variable>
    <xsl:variable name="apos">&apos;</xsl:variable>

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
        <xsl:variable name="decoded">
            <xsl:analyze-string select="$text" regex="(&amp;(lt|gt|amp|quot|apos);)|[^&amp;]+">
                <xsl:matching-substring>
                    <xsl:choose>
                        <xsl:when test=". = '&amp;lt;'"><xsl:value-of select="$lt"/></xsl:when>
                        <xsl:when test=". = '&amp;gt;'"><xsl:value-of select="$gt"/></xsl:when>
                        <xsl:when test=". = '&amp;amp;'"><xsl:value-of select="$amp"/></xsl:when>
                        <xsl:when test=". = '&amp;quot;'"><xsl:value-of select="$quot"/></xsl:when>
                        <xsl:when test=". = '&amp;apos;'"><xsl:value-of select="$apos"/></xsl:when>
                        <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
                    </xsl:choose>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:value-of select="$decoded" disable-output-escaping="yes"/>
    </xsl:template>

</xsl:stylesheet>
