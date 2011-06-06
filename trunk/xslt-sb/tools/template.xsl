<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY cr "&#x0A;">
<!ENTITY crt "<xsl:text xmlns:xsl='http://www.w3.org/1999/XSL/Transform' disable-output-escaping='yes'>&cr;</xsl:text>">
<!ENTITY TabString "&#160;&#160;&#160;&#160;&#160;&#160;">
<!ENTITY XSL-Base-Directory "http://www.expedimentum.org/example/xslt/xslt-sb">
<!ENTITY doc-Base-Directory "http://www.expedimentum.org/example/xslt/xslt-sb/doc">
]>
<xsl:stylesheet
	version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsb="http://www.expedimentum.org/XSLT/SB"
	xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern"
	xmlns:saxon="http://saxon.sf.net/"
	xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle"
	xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	exclude-result-prefixes="doc docv xsb intern"
	extension-element-prefixes="saxon"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:import href="../internals.stylecheck.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="ToDo.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>ToDo</doc:title>
		<para>Dieses Stylesheet enthält ToDo.</para>
		<para>Autor: <author>
			<firstname>ToDo</firstname>
			<surname>ToDo</surname>
			</author>
		</para>
		<revhistory>
			<revision>
				<revnumber>ToDo</revnumber>
				<date>2011-ToDo-ToDo</date>
				<authorinitials>ToDo</authorinitials>
				<revremark>ToDo</revremark>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     ToDo     ==================== -->
	<!--  -->
	<!--  -->
	<!-- __________     ToDo     __________ -->
	<doc:function>
		<doc:param name="ToDo"><para>ToDo</para></doc:param>
		<para xml:id="ToDo">Diese Funktion ToDo.</para>
		<revhistory>
			<revision>
				<revnumber>ToDo</revnumber>
				<date>2011-ToDo-ToDo</date>
				<authorinitials>ToDo</authorinitials>
				<revdescription>
					<para conformance="ToDo">Status: ToDo</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	
	
	
	
	
	
	
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Tests     ==================== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para>Dieses Template ist der Einstiegspunkt in die Selbst-Tests. Es loggt die Systemparameter und ruft die Test-Routinen 
		der lokalen und eingebundenen Templates und Funktionen auf.</para>
		<revhistory>
			<revision>
				<revnumber>ToDo</revnumber>
				<date>2011-ToDo-ToDo</date>
				<authorinitials>ToDo</authorinitials>
				<revdescription>
					<para conformance="ToDo">Status: ToDo</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template match="/" mode="internals.self-test">
		<xsl:call-template name="xsb:internals.MakeHeader"/>
		<xsl:call-template name="intern:internals.Stylecheck"/>
		<xsl:call-template name="intern:ToDo.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<intern:testliste xml:id="ToDo">
		<test>
			<value/>
			<xsb:ToDo>ToDo</xsb:ToDo>
		</test>
	</intern:testliste>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para xml:id="ToDo.self-test">Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>ToDo</revnumber>
				<date>2011-ToDo-ToDo</date>
				<authorinitials>ToDo</authorinitials>
				<revdescription>
					<para conformance="ToDo">Status: ToDo</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:ToDo.self-test">
		<!--  -->
		<!--  -->
		<!-- __________     xsb:ToDo()     __________ -->
		<!--<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:ToDo('ToDo')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:ToDo('ToDo')"/>
			<xsl:with-param name="reference-value" select="ToDo"/>
		</xsl:call-template>-->
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- damit es etwas übersichtlicher wird -->
		<xsl:variable name="ToDo-Tests" as="element()+" select="document( '' )//intern:testliste[@xml:id='ToDo']/test"/>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:ToDo()     __________ -->
		<!--<xsl:for-each select="$ToDo-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.ToDo">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:ToDo</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:ToDo(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>-->
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
