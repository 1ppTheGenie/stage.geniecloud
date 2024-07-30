<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template name="process-snippet">
        <xsl:param name="snippet"/>
        <xsl:variable name="snippet-doc" as="document-node()">
            <xsl:sequence select="parse-xml-fragment(concat('<root>', $snippet, '</root>'))"/>
        </xsl:variable>
        <xsl:copy-of select="$snippet-doc/root/node()"/>
    </xsl:template>

</xsl:stylesheet>