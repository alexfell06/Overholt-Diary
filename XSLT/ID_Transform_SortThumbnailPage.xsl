<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">

<xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="div[@id='thumbnails']">
     <div id="thumbnails">   
        <xsl:apply-templates select="span">
            <xsl:sort select="node()[1]"/>
        </xsl:apply-templates>
     </div>
    </xsl:template>
<xsl:template match="span">
    <span class="tn" id="{node()[1]}">
        <a href="KFODiary_Web/KFODiary_{node()[1]}.jpg"><xsl:apply-templates/></a>
    </span>
</xsl:template>

</xsl:stylesheet>