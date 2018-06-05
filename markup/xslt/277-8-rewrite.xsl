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
            <div section="Book 1">
            <xsl:for-each select="//div[@section='1']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>     
<p><xsl:apply-templates/></p>            
        </xsl:for-each>
            </div>
        
        
            <div section="Book 2">   
        <xsl:for-each select="//div[@section='2']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
        
            <div section="Book 3">    
        <xsl:for-each select="//div[@section='3']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Book 4"> 
        <xsl:for-each select="//div[@section='4']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Book 5">
        <xsl:for-each select="//div[@section='5']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Book 6"> 
        <xsl:for-each select="//div[@section='6']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Book 7">
        <xsl:for-each select="//div[@section='7']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Book 8">
        <xsl:for-each select="//div[@section='8']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Book 9"> 
        <xsl:for-each select="//div[@section='9']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div section="Book 10">
            
        <xsl:for-each select="//div[@section='10']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div section="Book 11">
        <xsl:for-each select="//div[@section='11']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
 
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div section="Book 12">
            <xsl:for-each select="//div[@section='12']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            
            <div section="Book 13">
            <xsl:for-each select="//div[@section='13']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
        
        <!-- histories -->
            <div section="Book 14">
        <xsl:for-each select="//div[@section='14']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>   
        
            <div section="Book 15">
        <xsl:for-each select="//div[@section='15']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
        
            <div section="Book 16">
        <xsl:for-each select="//div[@section='16']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div section="Book 17">
        <xsl:for-each select="//div[@section='17']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div section="Book 18">
        <xsl:for-each select="//div[@section='18']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div section="Book 19">
        <xsl:for-each select="//div[@section='19']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
        <!-- tragedies -->
            <div section="Book 20">           
        <xsl:for-each select="//div[@section='20']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
                    
            <div section="Book 21">      
        <xsl:for-each select="//div[@section='21']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>           
         
            <div section="Book 22">
<xsl:for-each select="//div[@section='22']">
    <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
                    
            <div section="Book 23">      
        <xsl:for-each select="//div[@section='23']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>  
            
            <div section="Book 24">      
                <xsl:for-each select="//div[@section='24']">
                    <head><xsl:apply-templates select="@sealts"/>, 
                        <xsl:apply-templates select="@type"/></head>
                    <p>
                        <xsl:apply-templates/> 
                    </p>  
                </xsl:for-each>
            </div>
            
            <div section="Endverse">      
                <xsl:for-each select="//div[@section='endverse']">
                    <head><xsl:apply-templates select="@sealts"/>, 
                        <xsl:apply-templates select="@type"/></head>
                    <p>
                        <xsl:apply-templates/> 
                    </p>  
                </xsl:for-each>
            </div>
            
        </body>
    </xsl:template>
 </xsl:stylesheet>