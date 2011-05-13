<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	Copyright (c) 2009-2011 Stefan Krause
	
	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:
	
	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
<!DOCTYPE xsl:stylesheet [
<!ENTITY cr "&#x0A;">
<!ENTITY crt "<xsl:text xmlns:xsl='http://www.w3.org/1999/XSL/Transform' disable-output-escaping='yes'>&cr;</xsl:text>">
<!ENTITY TabString "&#160;&#160;&#160;&#160;&#160;&#160;">
<!ENTITY XSL-Base-Directory "http:/www.expedimentum.org/example/xslt/XSLT-SB">
<!ENTITY doc-Base-Directory "http:/www.expedimentum.org/example/xslt/XSLT-SB/doc">
]>
<xsl:stylesheet
	version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsb="http://www.expedimentum.org/XSLT/SB"
	xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern"
	xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle"
	xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	exclude-result-prefixes="doc docv xsb intern xlink xs"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:import href="internals.stylecheck.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="internals.meta.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Tests für internals.meta.xsl</doc:title>
		<para>Dieses Stylesheet testet <code>internals.meta.xsl</code>.</para>
		<para>Autor: <author>
			<firstname>Stefan</firstname>
			<surname>Krause</surname>
			</author>
		</para>
		<para>Homepage: <link xlink:href="http://www.expedimentum.org/">http://www.expedimentum.org/</link></para>
		<para role="license"><emphasis role="bold">Lizenz (duale Lizenzierung):</emphasis></para>
		<para role="license">Dieses Stylesheet und die dazugehörige Dokumentation sind unter einer Creative Commons-Lizenz (<link xlink:href="http://creativecommons.org/licenses/by/3.0/">CC-BY&#160;3.0</link>)
			lizenziert. Die Weiternutzung ist bei Namensnennung erlaubt.</para>
		<para role="license">Dieses Stylesheet und die dazugehörige Dokumentation sind unter der sogenannten Expat License (einer GPL-kompatiblen MIT License) lizensiert. Es darf – als Ganzes oder auszugweise – 
			unter Beibehaltung der Copyright-Notiz kopiert, verändert, veröffentlicht und verbreitet werden. Die Copyright-Notiz steht im Quelltext
			des Stylesheets und auf der <link xlink:href="standard.html#standard.license">Startseite der Dokumentation</link>.</para>
		<itemizedlist>
			<title>Original-URLs</title>
			<listitem>
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/internals.meta.xsl">&XSL-Base-Directory;/internals.meta.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/internals.meta.html">&doc-Base-Directory;/internals.meta.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/internals.meta_tests.xsl">&XSL-Base-Directory;/internals.meta_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/internals.meta_tests.html">&doc-Base-Directory;/internals.meta_tests.html</link></para>
			</listitem>
			<listitem>
				<para>XSLT-SB: <link xlink:href="&XSL-Base-Directory;/">&XSL-Base-Directory;/</link></para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.0</revnumber>
				<date>2011-05-14</date>
				<authorinitials>Stf</authorinitials>
				<revremark>erste veröffentlichte Version</revremark>
			</revision>
			<revision>
				<revnumber>0.129</revnumber>
				<date>2011-02-27</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Erweiterung der Lizenz auf Expath/MIT license</revremark>
			</revision>
			<revision>
				<revnumber>0.93</revnumber>
				<date>2010-05-30</date>
				<authorinitials>Stf</authorinitials>
				<revremark>initiale Version</revremark>
			</revision>
		</revhistory>
	</doc:doc>
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
	</doc:template>
	<xsl:template match="/" mode="internals.self-test">
		<xsl:call-template name="xsb:internals.MakeHeader"/>
		<xsl:call-template name="intern:internals.Stylecheck"/>
		<xsl:call-template name="intern:internals.meta.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<intern:testliste xml:id="FunctionTreatment">
		<!-- Null/Leerstring -->
		<test>
			<value/>
			<intern:looks-like-a-function-call>false</intern:looks-like-a-function-call>
			<intern:function-name></intern:function-name>
			<intern:function-argument-string></intern:function-argument-string>
			<intern:function-arity>0</intern:function-arity>
		</test>
		<test>
			<value>intern:GibtEsNicht</value>
			<intern:looks-like-a-function-call>false</intern:looks-like-a-function-call>
			<intern:function-name></intern:function-name>
			<intern:function-argument-string></intern:function-argument-string>
			<intern:function-arity>0</intern:function-arity>
		</test>
		<!-- gültige Werte -->
		<test>
			<value>string(abc)</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>string</intern:function-name>
			<intern:function-argument-string>abc</intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>string(abc-def)</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>string</intern:function-name>
			<intern:function-argument-string>abc-def</intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>string(abc[1])</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>string</intern:function-name>
			<intern:function-argument-string>abc[1]</intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>string(abc, def)</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>string</intern:function-name>
			<intern:function-argument-string>abc, def</intern:function-argument-string>
			<intern:function-arity>2</intern:function-arity>
		</test>
		<test>
			<value>string(abc(), def())</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>string</intern:function-name>
			<intern:function-argument-string>abc(), def()</intern:function-argument-string>
			<intern:function-arity>2</intern:function-arity>
		</test>
		<test>
			<value>string(abc(def(ghi) ) )</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>string</intern:function-name>
			<intern:function-argument-string>abc(def(ghi) ) </intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>xs:string(abc)</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>xs:string</intern:function-name>
			<intern:function-argument-string>abc</intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>xs:string(@abc)</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>xs:string</intern:function-name>
			<intern:function-argument-string>@abc</intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>xs:string(1.2)</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>xs:string</intern:function-name>
			<intern:function-argument-string>1.2</intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>xs:string(1)</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>xs:string</intern:function-name>
			<intern:function-argument-string>1</intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>string(abc(def(ghi, 2) ), 3, 4 )</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>string</intern:function-name>
			<intern:function-argument-string>abc(def(ghi, 2) ), 3, 4 </intern:function-argument-string>
			<intern:function-arity>3</intern:function-arity>
		</test>
		<!-- Praxisbeispiele -->
		<test>
			<value>concat(document-uri(document( '' ) ), '#test')</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>concat</intern:function-name>
			<intern:function-argument-string>document-uri(document( '' ) ), '#test'</intern:function-argument-string>
			<intern:function-arity>2</intern:function-arity>
		</test>
		<test>
			<value>concat(document-uri(document( '' ) ), '?test')</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>concat</intern:function-name>
			<intern:function-argument-string>document-uri(document( '' ) ), '?test'</intern:function-argument-string>
			<intern:function-arity>2</intern:function-arity>
		</test>
		<test>
			<value>aaa( bbb(ccc(ddd( '' ) ), '#test') )</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>aaa</intern:function-name>
			<intern:function-argument-string> bbb(ccc(ddd( '' ) ), '#test') </intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>xsb:file-exists( concat(document-uri(document( '' ) ), '#test') )</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>xsb:file-exists</intern:function-name>
			<intern:function-argument-string> concat(document-uri(document( '' ) ), '#test') </intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<test>
			<value>xsb:file-exists( concat(document-uri(document( '' ) ), '?test') )</value>
			<intern:looks-like-a-function-call>true</intern:looks-like-a-function-call>
			<intern:function-name>xsb:file-exists</intern:function-name>
			<intern:function-argument-string> concat(document-uri(document( '' ) ), '?test') </intern:function-argument-string>
			<intern:function-arity>1</intern:function-arity>
		</test>
		<!-- ungültige Werte -->
		<test>
			<value>abc</value>
			<intern:looks-like-a-function-call>false</intern:looks-like-a-function-call>
			<intern:function-name></intern:function-name>
			<intern:function-argument-string></intern:function-argument-string>
			<intern:function-arity>0</intern:function-arity>
		</test>
		<test>
			<value>1abc()</value>
			<intern:looks-like-a-function-call>false</intern:looks-like-a-function-call>
			<intern:function-name></intern:function-name>
			<intern:function-argument-string></intern:function-argument-string>
			<intern:function-arity>0</intern:function-arity>
		</test>
		<test>
			<value>()</value>
			<intern:looks-like-a-function-call>false</intern:looks-like-a-function-call>
			<intern:function-name></intern:function-name>
			<intern:function-argument-string></intern:function-argument-string>
			<intern:function-arity>0</intern:function-arity>
		</test>
		<test>
			<value>[]</value>
			<intern:looks-like-a-function-call>false</intern:looks-like-a-function-call>
			<intern:function-name></intern:function-name>
			<intern:function-argument-string></intern:function-argument-string>
			<intern:function-arity>0</intern:function-arity>
		</test>
		<test>
			<value>abc(</value>
			<intern:looks-like-a-function-call>false</intern:looks-like-a-function-call>
			<intern:function-name></intern:function-name>
			<intern:function-argument-string></intern:function-argument-string>
			<intern:function-arity>0</intern:function-arity>
		</test>
		<test>
			<value>abc(&quot;cc&quot;, bbb(kkk, lll(mm, &quot;)nn&quot;))),test</value>
			<intern:looks-like-a-function-call>false</intern:looks-like-a-function-call>
			<intern:function-name></intern:function-name>
			<intern:function-argument-string></intern:function-argument-string>
			<intern:function-arity>0</intern:function-arity>
		</test>
	</intern:testliste>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para>Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>0.93</revnumber>
				<date>2010-05-30</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.meta.self-test">
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- damit es etwas übersichtlicher wird -->
		<xsl:variable name="seqFunction-Tests" as="element()+" select="document( '' )//intern:testliste[@xml:id='FunctionTreatment']/test"/>
		<!--  -->
		<!--  -->
		<!-- __________     intern:looks-like-a-function-call     __________ -->
		<xsl:for-each select="$seqFunction-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:looks-like-a-function-call</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:looks-like-a-function-call(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     intern:function-name     __________ -->
		<xsl:for-each select="$seqFunction-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:function-name</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:function-name(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     intern:function-argument-string     __________ -->
		<xsl:for-each select="$seqFunction-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:function-argument-string</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:function-argument-string(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     intern:function-name     __________ -->
		<xsl:for-each select="$seqFunction-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:function-arity</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:function-arity(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     intern:function-arguments     __________ -->
		<!-- Null-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('')"/>
			<xsl:with-param name="reference-value" select="()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('abc')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('abc')"/>
			<xsl:with-param name="reference-value" select="()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('abc()')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('abc()')"/>
			<xsl:with-param name="reference-value" select="()"/>
		</xsl:call-template>
		<!-- Ergebnisse -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('abc(def)')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('abc(def)')"/>
			<xsl:with-param name="reference-value" select="('def')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('abc(def,ghi)')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('abc(def,ghi)')"/>
			<xsl:with-param name="reference-value" select="('def', 'ghi')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('abc(xyz(def,ghi))')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('abc(xyz(def,ghi))')"/>
			<xsl:with-param name="reference-value" select="('xyz(def,ghi)')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('abc(xyz(&quot;def&quot;, ghi))')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('abc(xyz(&quot;def&quot;, ghi))')"/>
			<xsl:with-param name="reference-value" select="('xyz(&quot;def&quot;, ghi)')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('abc(xyz(&quot;def&quot;, &quot;ghi&quot;))')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('abc(xyz(&quot;def&quot;, &quot;ghi&quot;))')"/>
			<xsl:with-param name="reference-value" select="('xyz(&quot;def&quot;, &quot;ghi&quot;)')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('xs:string(@abc)')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('xs:string(@abc)')"/>
			<xsl:with-param name="reference-value" select="('@abc')"/>
		</xsl:call-template>
		<!-- Praxisbeispiele -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('xsb:file-exists( concat(document-uri(document( &quot;&quot; ) ), &quot;#test&quot;) )')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('xsb:file-exists( concat(document-uri(document( &quot;&quot; ) ), &quot;#test&quot;) )')"/>
			<xsl:with-param name="reference-value" select="(' concat(document-uri(document( &quot;&quot; ) ), &quot;#test&quot;) ')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('xsb:file-exists( concat(document-uri(document( &quot;&quot; ) ), &quot;?test&quot;) )')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('xsb:file-exists( concat(document-uri(document( &quot;&quot; ) ), &quot;?test&quot;) )')"/>
			<xsl:with-param name="reference-value" select="(' concat(document-uri(document( &quot;&quot; ) ), &quot;?test&quot;) ')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('xsb:file-exists( concat(document-uri(document( &quot;)&quot; ) ), &quot;?test&quot;) )')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('xsb:file-exists( concat(document-uri(document( &quot;)&quot; ) ), &quot;?test&quot;) )')"/>
			<xsl:with-param name="reference-value" select="(' concat(document-uri(document( &quot;)&quot; ) ), &quot;?test&quot;) ')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:function-arguments('aaa( bbb(ccc(ddd( &quot;&quot; ) ), &quot;#test&quot;) )')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:function-arguments('aaa( bbb(ccc(ddd( &quot;&quot; ) ), &quot;#test&quot;) )')"/>
			<xsl:with-param name="reference-value" select="(' bbb(ccc(ddd( &quot;&quot; ) ), &quot;#test&quot;) ')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:castable-as-xs-ncname()     __________ -->
		<!-- Null-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-ncname(())</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-ncname(())"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-ncname('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-ncname('')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!-- wahr -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-ncname('hund')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-ncname('hund')"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-ncname('_hund.köter')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-ncname('_hund.köter')"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!-- falsch -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-ncname('123')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-ncname('123')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-ncname(':hund')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-ncname(':hund')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-ncname('hund:katze')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-ncname('hund:katze')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:castable-as-xs-name()     __________ -->
		<!-- Null-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name(())</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name(())"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name('')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!-- wahr -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name('hund')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name('hund')"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name('hund:katze')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name('hund:katze')"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!-- falsch -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name('123')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name('123')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name('abc:123')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name('abc:123')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name('123:abc')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name('123:abc')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name('123:')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name('123:')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name(':abc')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name(':abc')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:castable-as-xs-name('abc[')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:castable-as-xs-name('abc[')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:replace-nested-brackets-with-dashes()     __________ -->
		<!-- Null-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:replace-nested-brackets-with-dashes(())</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:replace-nested-brackets-with-dashes(())"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:replace-nested-brackets-with-dashes('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:replace-nested-brackets-with-dashes('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- Verarbeitung -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:replace-nested-brackets-with-dashes('aaa')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:replace-nested-brackets-with-dashes('aaa')"/>
			<xsl:with-param name="reference-value" select=" 'aaa' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:replace-nested-brackets-with-dashes('aaa(bbb)')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:replace-nested-brackets-with-dashes('aaa(bbb)')"/>
			<xsl:with-param name="reference-value" select=" 'aaa-----' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:replace-nested-brackets-with-dashes('aaa(bbb(ccc) )')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:replace-nested-brackets-with-dashes('aaa(bbb(ccc) )')"/>
			<xsl:with-param name="reference-value" select=" 'aaa-----------' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:replace-nested-brackets-with-dashes('aaa(bbb(ccc), ddd(eee))')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:replace-nested-brackets-with-dashes('aaa(bbb(ccc), ddd(eee))')"/>
			<xsl:with-param name="reference-value" select=" 'aaa--------------------' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:replace-nested-brackets-with-dashes('aaa(bbb(ccc)), ddd(eee)')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:replace-nested-brackets-with-dashes('aaa(bbb(ccc)), ddd(eee)')"/>
			<xsl:with-param name="reference-value" select=" 'aaa----------, ddd-----' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
