<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<!--  <xsl:output method="text" />
    <xsl:template match="/">
        <xsl:value-of select="count(body/div[1]/line[1]/w)"/>
    </xsl:template> --> 
    <xsl:output method="text" />
    <xsl:template match="/">
       
        <xsl:for-each select="/body/div">
            <p>
                <xsl:value-of select="@num" /> <xsl:value-of select="string-length(.)" /> characters
            </p>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>