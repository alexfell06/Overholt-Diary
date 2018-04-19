<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
        <head><title>Personography <xsl:value-of select="@n"/></title>
            
            <link rel="stylesheet" type="text/css" href="CSS/OVERHOLT.css"/>
            
        </head>
        <body>
            <xsl:comment>#include virtual="SSI-DIarypages.html" </xsl:comment>
            <h2>Index of People in the Diary</h2>
            <p>Here you will find a list of people in the diary. By clicking on each person, you can link into the diary entries they were mentioned in.</p>
            <ul>
            <xsl:apply-templates select="//person">
                <xsl:sort select="tokenize(persName[1], ' ')[last()]"/>
            </xsl:apply-templates></ul>
        </body>
        </html>
    </xsl:template>
    <xsl:template match="person">
        <li id="{@xml:id}">
            <b><xsl:apply-templates select="persName"/></b>
            <ul>
                <li>
                    <xsl:text>Born: </xsl:text><xsl:apply-templates select="birth"/>
                </li>
                <li>
                    <xsl:text>Died: </xsl:text><xsl:apply-templates select="death"/>
                </li>
                <li>
                    <xsl:apply-templates select="@sex"/>
                </li>
                <li>
                    <xsl:apply-templates select="note"/>
                </li>
                <li> <xsl:text>Mentioned in the following entries:</xsl:text>
                    <ul>
                        <xsl:for-each select="//div[@type='entry'][descendant::persName[substring-after(@ref, '#') = current()/@xml:id]]">
                            <li><a href="{@xml:id}.html"><xsl:value-of select="head/string()"/></a></li>
                            
                        </xsl:for-each>
                    </ul>
                </li>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="note//persName">
        <a href="{@ref}"><xsl:apply-templates/></a>
    </xsl:template>
</xsl:stylesheet>