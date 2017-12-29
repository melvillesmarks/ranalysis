<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*" />
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="div[@mode='commentary']|commentary"></xsl:template>
    <xsl:template match="div[@type='annotation']|annotation"/>
    <xsl:template match="div[@type2='annotation']|annotation"/>
    <xsl:template match="div[@type3='annotation']|annotation"/>
    <xsl:template match="div[@type4='annotation']|annotation"/>
    <xsl:template match="div[@type='notation']|notation"/>
    
</xsl:stylesheet>

