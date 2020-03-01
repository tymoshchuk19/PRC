<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="obra">
        ###  http://www.semanticweb.org/eduar/ontologies/2020/1/arqSon#<xsl:value-of select="@id"/>
        :<xsl:value-of select="@id"/> rdf:type owl:NamedIndividual ,
        :obra ;
        <xsl:apply-templates select=".//designacao"/>
        :titulo "<xsl:value-of select="titulo"/>"^^xsd:string ;
        :tipo "<xsl:value-of select="tipo"/>"^^xsd:string ;<xsl:if test="exists(inf-relacionada)">
        :infRelacionada "<xsl:value-of select="inf-relacionada/video/@href"/>"^^xsd:string ;</xsl:if>
        :compositor "<xsl:value-of select="compositor"/>"^^xsd:string .
        <xsl:apply-templates select=".//instrumento"/>
    </xsl:template>
    
    <xsl:template match="designacao">
        :temPartituraPara :<xsl:value-of select="translate(.,' ','-')"/>;
    </xsl:template>
    
    <xsl:template match="instrumento">
        ###  http://www.semanticweb.org/eduar/ontologies/2020/1/arqSon#<xsl:value-of select="translate(designacao,' ','-')"/>
        :<xsl:value-of select="translate(designacao,' ','-')"/> rdf:type owl:NamedIndividual ,
        :instrumento ;
        :eDa :<xsl:value-of select="../../@id"/>;
        <xsl:apply-templates select=".//partitura/@path"/>
        :designacao "<xsl:value-of select="designacao"/>"^^xsd:string.
        <xsl:apply-templates select=".//partitura"/>
    </xsl:template>
    
    <xsl:template match="partitura/@path">
        :tem :<xsl:value-of select="."/>;
    </xsl:template>
    
    <xsl:template match="partitura">
        ###  http://www.semanticweb.org/eduar/ontologies/2020/1/arqSon#<xsl:value-of select="@path"/>
        :<xsl:value-of select="@path"/> rdf:type owl:NamedIndividual ,
        :partitura ;
        :de :<xsl:value-of select="translate(../designacao,' ','-')"/> ;
        :tipo "<xsl:value-of select="@type"/>"^^xsd:string ;<xsl:if test="exists(@voz)">
        :voz "<xsl:value-of select="@voz"/>"^^xsd:string ;</xsl:if><xsl:if test="exists(@clave)">
        :clave "<xsl:value-of select="@clave"/>"^^xsd:string ;</xsl:if><xsl:if test="exists(@afinacao)">
        :afinacao "<xsl:value-of select="@afinacao"/>"^^xsd:string ;</xsl:if>
        :path "<xsl:value-of select="@path"/>"^^xsd:string .
    </xsl:template>
    
</xsl:stylesheet>