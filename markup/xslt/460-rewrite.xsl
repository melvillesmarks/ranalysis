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
        <!-- comedies -->
            <div play="Tempest">
            <xsl:for-each select="//div[@play='1a']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/>
                </head>     
<p><xsl:apply-templates/></p>            
        </xsl:for-each>
            </div>
        
        
            <div play="Two Gentlemen of Verona">   
        <xsl:for-each select="//div[@play='2a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
        
            <div play="Merry Wives of Windsor">    
        <xsl:for-each select="//div[@play='3a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div play="Twelfth Night"> 
        <xsl:for-each select="//div[@play='4a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div play="Measure for Measure">
        <xsl:for-each select="//div[@play='5a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div play="Much Ado About Nothing"> 
        <xsl:for-each select="//div[@play='6a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div play="Midsummer-Night's Dream">
        <xsl:for-each select="//div[@play='7a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div play="Love's Labor's Lost">
        <xsl:for-each select="//div[@play='8a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div play="Merchant of Venice"> 
        <xsl:for-each select="//div[@play='9a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
            </div>
            
            <div play="As You Like It">
            
        <xsl:for-each select="//div[@play='10a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div play="All's Well That Ends Well">
        <xsl:for-each select="//div[@play='11a']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
 
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div play="The Taming of the Shrew">
            <xsl:for-each select="//div[@play='12a']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            
            <div play="Winter's Tale">
            <xsl:for-each select="//div[@play='13a']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
        
        <!-- histories -->
            <div play="King John">
        <xsl:for-each select="//div[@play='1b']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>   
        
            <div play="King Richard II">
        <xsl:for-each select="//div[@play='2b']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
        
            <div play="King Henry IV">
        <xsl:for-each select="//div[@play='3b']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div play="King Henry V">
        <xsl:for-each select="//div[@play='4b']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div play="King Richard III">
        <xsl:for-each select="//div[@play='5b']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div play="King Henry VIII">
        <xsl:for-each select="//div[@play='6b']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
        <!-- tragedies -->
            <div play="Timon of Athens">           
        <xsl:for-each select="//div[@play='1c']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
                    
            <div play="Coriolanus">      
        <xsl:for-each select="//div[@play='2c']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>           
         
            <div play="Julius Caesar">
<xsl:for-each select="//div[@play='3c']">
    <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
                    
            <div play="Antony and Cleopatra">      
        <xsl:for-each select="//div[@play='4c']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>     
            
            <div play="Cymbeline">
            <xsl:for-each select="//div[@play='5c']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
             
            <div play="Titus Andronicus">
        <xsl:for-each select="//div[@play='6c']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
                        
                    
            <div play="King Lear">
           
            <xsl:for-each select="//div[@play='7c']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>     
                    
            <div play="Romeo and Juliet">
            
            <xsl:for-each select="//div[@play='8c']">
                <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>
            
            <div play="Hamlet">
            <xsl:for-each select="//div[@play='9c']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p>
                <xsl:apply-templates/> 
            </p>  
        </xsl:for-each>
            </div>       
                    
            <div play="Othello">
<xsl:for-each select="//div[@play='10c']">
    <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>  
        </xsl:for-each>
            </div>
                    
        
        <!-- others -->
            <div play="Troilus and Cressida">
                      
        <xsl:for-each select="//div[@play='1d']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/></p>  
        </xsl:for-each>
            </div>  
            <div play="Pericles, Prince of Tyre">
                  
        <xsl:for-each select="//div[@play='2d']">
            <head><xsl:apply-templates select="@sealts"/>, 
                <xsl:apply-templates select="@type"/></head>
            <p><xsl:apply-templates/>
            </p>  
        </xsl:for-each>
            </div> 
        </body>
    </xsl:template>
 </xsl:stylesheet>