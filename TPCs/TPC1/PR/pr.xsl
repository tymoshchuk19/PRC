<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Project Record</title>
                <meta charset="UTF-8"></meta>
            </head>
            <body>
                <h1>Project Record</h1>
                <xsl:for-each select="pr/*">
                    <hr/>
                        <xsl:apply-templates select="."/>
                    <hr/>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="meta" >
        <table>
            <tr>
                <td>
                    <p><b>KEY NAME: </b><xsl:value-of select="keyname"/></p>
                    <p><b>TITLE: </b><xsl:value-of select="title"/></p>
                    <p><b>SUBTITLE: </b><xsl:value-of select="subtitle"/></p>
                </td>
                <td>
                    <p><b>BEGIN DATE: </b><xsl:value-of select="bdate"/></p>
                    <p><b>END DATE: </b><xsl:value-of select="edate"/></p>
                    <p><b>SUPERVISOR: </b><xsl:value-of select="supervisor"/></p>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="workteam" >
        <h3>Work Team</h3>
        <ol>
            <li><xsl:apply-templates select="member"/></li>
        </ol>
    </xsl:template>
    
    <xsl:template match="member" >
        <p>
            <b>Identifier: </b><xsl:value-of select="identifier"/>
            <b>    Name: </b><xsl:value-of select="name"/>
            <b>    Email: </b><xsl:value-of select="email"/>
        </p>
    </xsl:template>
    
    <xsl:template match="abstract" >
        <h3>Abstract</h3>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="p">
       <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="b">
       <b><xsl:apply-templates/></b>
    </xsl:template>
    <xsl:template match="i">
       <i><xsl:apply-templates/></i>
    </xsl:template>
    <xsl:template match="u">
       <u><xsl:apply-templates/></u>
    </xsl:template>
    
    <xsl:template match="deliverables" >
        <h3>Deliverables</h3>
        <ul>
            <xsl:apply-templates select="deliverable"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="deliverable">
        <li>
            <a href="{./@path}"><xsl:value-of select="."/></a>
        </li>
    </xsl:template>
    
</xsl:stylesheet>