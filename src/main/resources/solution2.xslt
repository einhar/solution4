<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:b="http://example.net/library/1.0" 
    xmlns:a="http://example.net/author/1.0"
    exclude-result-prefixes="b">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:key name="author" match="b:author" use="@id" />
    
    <xsl:template match="/b:library">
        <books xmlns="http://example.net/books/1.0" xmlns:a="http://example.net/author/1.0">
            <xsl:for-each select="b:books/b:book">  
                <xsl:variable name="author" select="key('author', @author-id)" />
                <book>
                    <a:author>
                        <a:name>
                            <xsl:value-of select="$author/b:name"/>
                        </a:name>
                        <a:surname>
                            <xsl:value-of select="$author/b:surname"/>
                        </a:surname>
                    </a:author>
                    <title>
                        <xsl:value-of select="b:title"/>
                    </title>
                </book>
            </xsl:for-each>
        </books>
    </xsl:template>
    
</xsl:stylesheet>
