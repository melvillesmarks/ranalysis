<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes" />
    
    <xsl:template match="//w">
        <w><xsl:apply-templates/></w>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="/">
        <body>
  
            <div section="Paradise Lost">
            <xsl:for-each select="//div[@work='pl']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
                <p>
                    <xsl:apply-templates/>
                </p>
                
        </xsl:for-each>
            </div>
        
        
            <div section="Paradise Regained">   
        <xsl:for-each select="//div[@work='pr']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
        
            <div section="The Verse">    
        <xsl:for-each select="//div[@work='verse']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Samson Agonistes"> 
        <xsl:for-each select="//div[@work='samag']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Comus">
        <xsl:for-each select="//div[@work='com']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Lycidas"> 
        <xsl:for-each select="//div[@work='lyc']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Life of Milton">
        <xsl:for-each select="//div[@work='life']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Complimentary Verses">
        <xsl:for-each select="//div[@work='cv']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Il Penseroso"> 
        <xsl:for-each select="//div[@work='ilpen']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="L'Allegro">
            
        <xsl:for-each select="//div[@work='lalle']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div section="Misc. Poems">
        <xsl:for-each select="//div[@work='miscp']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <xsl:if test="div[1]"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
                
            </xsl:if>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div section="Sonnets">
            <xsl:for-each select="//div[@work='sonnets']"><head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
                        
        </body>
    </xsl:template>
    <xsl:strip-space elements="p"/>
    </xsl:stylesheet>