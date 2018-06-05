<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<!--  <xsl:output method="text" />
    <xsl:template match="/">
        <xsl:value-of select="count(body/div[1]/line[1]/w)"/>
    </xsl:template> --> 
    <xsl:output method="text" />
    <xsl:template match="//div//w">
            <p>
            <xsl:apply-templates/>
            </p>
    </xsl:template>
</xsl:stylesheet>