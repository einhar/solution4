<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:b="http://example.net/library/1.0" 
    xmlns:a="http://example.net/author/1.0"
    exclude-result-prefixes="b">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:key name="author" match="b:author" use="@id" />
    <xsl:param name="delim" select="','" />
    <xsl:param name="space" select="' '" />
    <xsl:param name="quote" select="'&quot;'" />
    <xsl:param name="break" select="'&#xA;'" />
    <xsl:param name="header" select="'AUTHOR, TITLE, PUBLISHED'" />
        
    <xsl:template match="/b:library">
        <xsl:value-of select="concat($header, $break)"/>
        <xsl:for-each select="b:books/b:book">
            <xsl:variable name="author" select="key('author', @author-id)" />
            <xsl:value-of select="concat($author/b:name, $space, $author/b:surname, $delim, $space, b:title, $delim, $space, b:published)"/>
            <xsl:if test="not(position()=last())">
                <xsl:value-of select="$break"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>