<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--  <xsl:output method="text" />
        <xsl:template match="/">
        <xsl:value-of select="count(body/div[1]/line[1]/w)"/>
    </xsl:template> -->
    
    <xsl:output method="xhtml" encoding="UTF-8"/>    
        
        
 
    <xsl:template match="/">
        <html>
            <head><script type="text/javascript" src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script></head>
                <body>
                    <h2>Word counts of all Melville's markings in Homer's <em>Odyssey</em></h2>
                    <table border="2" class="sortable">
                        <tr bgcolor="#9acd32">
                            <th>Each Marking Instance</th>
                            <th>Word Count</th>
                            <xsl:for-each select="//div/p">
                                
                                <tr>
                                    <td><xsl:apply-templates/>
                                        (<xsl:value-of select="preceding-sibling::head[1]"/>)
                                    </td>
                                    
                                    <td><xsl:value-of select="count(w)"/>
                                    </td>
                                    
                                </tr>
                                
                            </xsl:for-each>
                        
                              
                            <!--  <xsl:for-each select="//div[@play='Tempest']/p">
                            
                            <tr>
                                <td><xsl:apply-templates/>
                                    (<xsl:value-of select="preceding-sibling::head[1]"/>)
                        </td>
                                
                            <td><xsl:value-of select="count(w)"/> words
                                    </td>         
                            </tr>
                        </xsl:for-each>
                            
                           <tr bgcolor="#9acd32">
                                <th>Each Marking Instance in 'King Lear'</th>
                                <th>Count</th>
                                
                                
                                <xsl:for-each select="//div[@play='King Lear']/p">
                                    
                                    <tr>
                                        <td><xsl:apply-templates/>
                                            (<xsl:value-of select="preceding-sibling::head[1]"/>)
                                        </td>
                                        
                                        <td><xsl:value-of select="count(w)"/> words
                                        </td>         
                                    </tr> 
                            
                            </xsl:for-each> 
                            </tr> -->
                        
                        </tr>
                        
                    </table>
                </body>
            </html> 
        
        <!-- get char lengths
            
            <xsl:for-each select="/body/div">
            <p>
                <xsl:value-of select="@num" /> <xsl:value-of select="string-length(.)" /> characters
            </p>
        </xsl:for-each> -->
        
    </xsl:template>
       
    
</xsl:stylesheet>