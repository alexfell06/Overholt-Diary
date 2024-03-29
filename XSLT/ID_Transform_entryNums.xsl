<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="div[@type='entry']">
        <div type="entry" xml:id="KFO-{descendant::pb[1]/@n}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
</xsl:stylesheet>
    
