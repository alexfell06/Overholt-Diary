<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <xsl:for-each-group select="//div[@type='entry']" group-starting-with="div[@type='entry']">
            
            <xsl:result-document href="../Web/{@xml:id}.html" method="xhtml" indent="yes">
                <html>
                <head><title>K. F. Overholt Diary: Entry <xsl:value-of select="@n"/></title>
               
                <link rel="stylesheet" type="text/css" href="CSS/OverholtEntries.css"/>
            
            </head>
            <body>
                <xsl:comment>#include virtual="SSI-Diarypages.html" </xsl:comment>
            <div id="container">  
                <div id="facsimile">
                    <xsl:apply-templates select="descendant::pb" mode="facsim"/>
                </div>
                <div id="transcript">
               
                    <xsl:apply-templates select="head" mode="transcript"/>
                    <xsl:apply-templates/>
                  <div class="nav">  
                      <xsl:if test="preceding-sibling::div[@type='entry']"><a class="nav" id="previous" href="{preceding-sibling::div[@type='entry'][1]/@xml:id}.html">Previous available entry</a></xsl:if>
                      <xsl:if test="following-sibling::div[@type='entry']"> <a class="nav" id="next" href="{following-sibling::div[@type='entry'][1]/@xml:id}.html">Next available entry</a></xsl:if>
                  </div>
                </div>
            </div> 
            </body>
        </html></xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>
    <xsl:template match="pb" mode="facsim">
        <img src="KFODiary_Web/{@facs}" alt="page {@n} image in the Overholt Diary"/>
    </xsl:template>
    
    <xsl:template match="head" mode="transcript">
        <h1><xsl:apply-templates select="node()[not(./name() = 'pb')]"/></h1><xsl:text> </xsl:text><xsl:apply-templates select="pb" mode="transcript"/>
    </xsl:template>
    <xsl:template match="head//pb" mode="transcript">
        <span class="pagenum"><xsl:value-of select="@n"/></span>
    </xsl:template>
    <xsl:template match="pb[not(ancestor::head)]">
        <span class="pagenum"><xsl:value-of select="@n"/></span>
    </xsl:template>
<xsl:template match="p">
    <p><xsl:apply-templates/></p>
</xsl:template>
    <xsl:template match="persName">
        <span class="persName"><xsl:apply-templates/></span>
    </xsl:template>
   <xsl:template match="abbr">
       <span class="abbr"><xsl:apply-templates/></span>
   </xsl:template> 
    <xsl:template match="placeName">
        <span class="placeName"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="unclear">
        <span class="unclear"><xsl:apply-templates/></span>
    </xsl:template>
   
    <xsl:template match="date">
        <span class="date"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>