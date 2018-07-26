<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output  method="html"/>
    
    <xsl:template match="/">
        <html>
            <h2>Word counts of Melville's markings in each of Shakespeare's plays</h2>
            <body>
        <table border="2">
            <tr>
                <th>Play</th>
                <th>Word Count</th>
                <xsl:for-each select="/body/div">
                    <tr>
                    <td><xsl:value-of disable-output-escaping="yes" select="@play"/>
                    </td>
                    <td>
                        <xsl:value-of select="count(.//w)" />
                    </td>
                    </tr>
                </xsl:for-each> 
                
            </tr>
     </table></body>
        </html>
    </xsl:template>
        
    <xsl:strip-space elements="p"/>
    
</xsl:stylesheet>