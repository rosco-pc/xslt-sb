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
	<xsl:import href="internals.stylecheck.xsl"/>
	<xsl:import href="math.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="ToDo.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision: 37 $, $Date: 2011-06-26 22:53:01 +0200 (Sun, 26 Jun 2011) $">
		<doc:title>ToDo</doc:title>
		<para>Dieses Stylesheet enthält ein paar Funktionen zu Erzeugen von Zufallszahlen. Beim nächsten Release werden diese Funktionen in math.xsl eingehen.</para>
		<para>Autor: <author>
			<firstname>Stefan</firstname>
			<surname>Krause</surname>
			</author>
		</para>
		<revhistory>
			<revision>
				<revnumber>0.2.39</revnumber>
				<date>2011-07-03</date>
				<authorinitials>Stf</authorinitials>
				<revremark>temporäres Stylesheet</revremark>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     random()     ==================== -->
	<!--  -->
	<!--  -->
	
	
	<!-- intern:seed(volatile) as xs:integer -->
	<!-- intern:lcg(length, seed) as xs:integer(0 ... iMax) -->
	<!-- intern:random-sequence(length, {get-seed(volatile)}) as xs:integer(0 ... max) -->
	<!-- xsb:random({get-seed(volatile)}) as xs:decimal (0 ... 1) -->
	<!-- xsb:random-sequence(length, {get-seed(volatile)}) as xs:decimal+ (0 ... 1) -->
	
	
	
	<!-- __________     ToDo()     __________ -->
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
	
	<xsl:function name="intern:seed" as="xs:integer">
		<xsl:param name="seed" as="xs:anyAtomicType"/>
		<xsl:variable name="integer-of-seed" as="xs:integer" select="if ($seed castable as xs:integer) then xs:integer($seed) else sum(string-to-codepoints(string($seed) ) )"/>
		<xsl:variable name="integer-of-current-date" as="xs:integer" select="xs:integer(format-dateTime(current-dateTime(), '[Y][d][H][m][s][f]') )"/>
		<!-- zum Hintergrund siehe http://www.nesterovsky-bros.com/weblog/2008/11/22/GeneratorFunctionInXslt20.aspx -->
		<xsl:variable name="temporary_node" as="text()">?</xsl:variable>
		<xsl:variable name="sequence-of-weighted-id-integers" as="xs:integer+">
			<xsl:for-each select="string-to-codepoints(generate-id($temporary_node) )">
				<xsl:sequence select="intern:power(xs:integer(10), position()) * xs:integer(.)"/>
			</xsl:for-each>
		</xsl:variable>
		<xsl:sequence select="intern:linear-congruential-generator(1, $integer-of-seed + $integer-of-current-date + xs:integer(sum($sequence-of-weighted-id-integers) ) )"/>
	</xsl:function>
	
	<xsl:function name="intern:linear-congruential-generator" as="xs:integer+">
		<xsl:param name="length" as="xs:integer"/>
		<xsl:param name="vortrag" as="xs:integer+"/>
		<xsl:choose>
			<xsl:when test="$length eq 0">
				<xsl:sequence select="$vortrag[position() gt 1]"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- Werte für 'glibc' nach http://en.wikipedia.org/wiki/Linear_congruential_generator -->
				<!-- Ergebnisse liegen zwischen 0 und 4294967295 -->
				<xsl:sequence select="intern:linear-congruential-generator($length - 1, ($vortrag, (1103515245 *$vortrag[last()] + 12345) mod 4294967296) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	<xsl:function name="intern:random-sequence" as="xs:integer+">
		<xsl:param name="length" as="xs:integer"/>
		<xsl:param name="volatile" as="xs:integer"/>
		<xsl:sequence select="intern:linear-congruential-generator($length, intern:seed($volatile) )"/>
	</xsl:function>
	
	<xsl:function name="xsb:random" as="xs:anyAtomicType">
		<xsl:param name="volatile" as="xs:anyAtomicType"/>
		<xsl:sequence select="xs:decimal(intern:seed($volatile) div xs:decimal(4294967295) )"/>
	</xsl:function>
	
	<xsl:function name="xsb:random-sequence" as="xs:anyAtomicType+">
		<xsl:param name="length" as="xs:anyAtomicType"/>
		<xsl:param name="volatile" as="xs:anyAtomicType"/>
		<xsl:sequence select="for $i in intern:random-sequence($length, $volatile) return xs:decimal($i div xs:decimal(4294967295) )"/>
	</xsl:function>
	
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
		
		<xsl:message select="for $i in 1 to 10 return intern:seed(1)"/>
		<!--<xsl:message select="for $i in 1 to 10 return xs:integer(intern:seed(1))"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="for $i in 1 to 100 return xsb:random($i)"/>
		<xsl:message select="max(for $i in 1 to 100000 return xsb:random($i))"/>
		<xsl:message select="max(for $i in 1 to 100000 return xsb:random($i))"/>
		<xsl:message select="max(for $i in 1 to 100000 return xsb:random($i))"/>
		<xsl:message select="max(for $i in 1 to 100000 return xsb:random($i))"/>
		<xsl:message select="max(for $i in 1 to 100000 return xsb:random($i))"/>
		<xsl:message select="min(for $i in 1 to 100000 return xsb:random($i))"/>
		<xsl:message select="min(for $i in 1 to 100000 return xsb:random($i))"/>
		<xsl:message select="min(for $i in 1 to 100000 return xsb:random($i))"/>-->
		<xsl:message>----</xsl:message>
		<xsl:message select="xsb:random-sequence(100, 1)"/>
		<xsl:message select="xsb:random-sequence(100, 1)"/>
		<xsl:message select="xsb:random-sequence(100, 1)"/>
		
		<xsl:result-document href="daten.csv" encoding="UTF-8" method="text">
			<xsl:for-each select="1 to 100">
				<xsl:for-each select="xsb:random-sequence(100, xs:integer(.))">
					<xsl:value-of select="."/>
					<xsl:if test="position() lt last()">
						<xsl:text>;</xsl:text>
					</xsl:if>
				</xsl:for-each>
				<xsl:text>&cr;</xsl:text>
			</xsl:for-each>
		</xsl:result-document>
		
		
		<xsl:message select="for $i in 1 to 100 return string(xsb:random(1))"/>
		<xsl:message select="for $i in 1 to 100 return string(xsb:random($i))"/>
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
