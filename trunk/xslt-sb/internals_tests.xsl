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
	<!-- internals.xsl wird bereits früher importiert -->
	<xsl:import href="internals.stylecheck.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="internals-tests.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Tests für internals.xsl</doc:title>
		<para>Dieses Stylesheet enthält die Tests für <code>internals.xsl</code>.</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/internals.xsl">&XSL-Base-Directory;/internals.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/internals.html">&doc-Base-Directory;/internals.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/internals_tests.xsl">&XSL-Base-Directory;/internals_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/internals_tests.html">&doc-Base-Directory;/internals_tests.html</link></para>
			</listitem>
			<listitem>
				<para>XSLT-SB: <link xlink:href="&XSL-Base-Directory;/">&XSL-Base-Directory;/</link></para>
			</listitem>
			<listitem>
				<para>Google Code: <link xlink:href="http://code.google.com/p/xslt-sb/">http://code.google.com/p/xslt-sb/</link></para>
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
				<revnumber>0.82</revnumber>
				<date>2010-04-02</date>
				<authorinitials>Stf</authorinitials>
				<revremark>initiale Version, ausgelagert aus <code>internals.xsl</code>und ergänzt.</revremark>
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
		<xsl:call-template name="intern:internals.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para>Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>0.36</revnumber>
				<date>2009-08-02</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.self-test">
		<!--  -->
		<!--  -->
		<!-- __________     xsb:parse-string-to-boolean()     __________ -->
		<!-- arity=1 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:parse-string-to-boolean( 'true' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:parse-string-to-boolean( 'true' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:parse-string-to-boolean( 'nein' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:parse-string-to-boolean( 'nein' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:parse-string-to-boolean( '1' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:parse-string-to-boolean( '1' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:parse-string-to-boolean( '0' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:parse-string-to-boolean( '0' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!-- arity=2 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:parse-string-to-boolean( '' , false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:parse-string-to-boolean( '' , false() )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:parse-string-to-boolean( () , false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:parse-string-to-boolean( () , false() )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:parse-string-to-boolean( 'true', true() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:parse-string-to-boolean( 'true', true() )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!-- indentierte Fehlermeldungen in der Ausgabe verwirren eher, deshalb auskommentiert.-->
		<!--<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:parse-string-to-boolean( 'true', true() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:parse-string-to-boolean( 'true_', true() )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>-->
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is()     __________ -->
		<!-- Testwerte -->
		<!-- haben den gleichen Inhalt, sind aber nicht identisch -->
		<xsl:variable name="is-testwert1" as="element()">
			<root id="root1">
				<xsl:comment>ein Kommentar</xsl:comment>
				<item>Text</item>
			</root>
		</xsl:variable>
		<xsl:variable name="is-testwert2" as="element()">
			<root id="root1">
				<xsl:comment>ein Kommentar</xsl:comment>
				<item>Text</item>
			</root>
		</xsl:variable>
		<!-- Nullwerte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is( (), () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is( (), () )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is('', '')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is('', '')"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is(/.., /..)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is(/.., /..)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!-- wahr -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is(1, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is(1, 1)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is('1', '1')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is('1', '1')"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is(current-date(), current-date())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is(current-date(), current-date())"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is(doc(''), doc(''))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is(doc(''), doc(''))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is($is-testwert1, $is-testwert1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is($is-testwert1, $is-testwert1)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is($is-testwert1/self::root/@id, $is-testwert1/self::root/@id)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is($is-testwert1/self::root/@id, $is-testwert1/self::root/@id)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is($is-testwert1/comment(), $is-testwert1/comment())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is($is-testwert1/comment(), $is-testwert1/comment())"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!-- falsch -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is(1, 2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is(1, 2)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is('1', '2')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is('1', '2')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is(current-date(), current-time())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is(current-date(), current-time())"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is(doc('internals.xsl'), doc('internals.logging.xsl'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is(doc('internals.xsl'), doc('internals.logging.xsl'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is($is-testwert1, $is-testwert2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is($is-testwert1, $is-testwert2)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is($is-testwert1/item/text(), $is-testwert2/item/text())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is($is-testwert1/item/text(), $is-testwert2/item/text())"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is((doc('')/descendant::root[@id eq 'root1'])[1]/item[1]/text(), (doc('')/descendant::root[@id eq 'root1'])[2]/item[1]/text())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is((doc('')/descendant::root[@id eq 'root1'])[1]/item[1]/text(), (doc('')/descendant::root[@id eq 'root1'])[2]/item[1]/text())"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is($is-testwert1/self::root/@id, $is-testwert2/self::root/@id)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is($is-testwert1/self::root/@id, $is-testwert2/self::root/@id)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is($is-testwert1/comment(), $is-testwert2/comment())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is($is-testwert1/comment(), $is-testwert2/comment())"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:node-kind()     __________ -->
		<!-- Hilfsvariable zum Testen -->
		<xsl:variable name="rcas-testwert" as="element()">
			<root id="root-id">
				<!-- via xslt-Instruktionen, weil sie sonst nicht in der Variable zur Verfügung stehen -->
				<xsl:comment>ein Kommentar</xsl:comment>
				<xsl:processing-instruction name="test">eine PI</xsl:processing-instruction>
				<intern:item att1="item1" att2="item2">Text</intern:item>
			</root>
		</xsl:variable>
		<!-- arity=1 -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind($rcas-testwert/irgendwas)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind($rcas-testwert/irgendwas)"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- kein namespace -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind(/)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind(/)"/>
			<xsl:with-param name="reference-value" as="xs:string">document-node</xsl:with-param>
		</xsl:call-template>
		<!-- mit namespace -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind($rcas-testwert/intern:item)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind($rcas-testwert/intern:item)"/>
			<xsl:with-param name="reference-value" as="xs:string">element</xsl:with-param>
		</xsl:call-template>
		<!-- Attribut -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind($rcas-testwert/intern:item/@att1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind($rcas-testwert/intern:item/@att1)"/>
			<xsl:with-param name="reference-value" as="xs:string">attribute</xsl:with-param>
		</xsl:call-template>
		<!-- Kommentar -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind($rcas-testwert/comment())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind($rcas-testwert/comment())"/>
			<xsl:with-param name="reference-value" as="xs:string">comment</xsl:with-param>
		</xsl:call-template>
		<!-- pi -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind($rcas-testwert/processing-instruction())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind($rcas-testwert/processing-instruction())"/>
			<xsl:with-param name="reference-value" as="xs:string">processing-instruction</xsl:with-param>
		</xsl:call-template>
		<!-- namespace-axis -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind($rcas-testwert/intern:item/namespace::intern)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind($rcas-testwert/intern:item/namespace::intern)"/>
			<xsl:with-param name="reference-value" as="xs:string">namespace</xsl:with-param>
		</xsl:call-template>
		<!-- arity=2 -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind($rcas-testwert/irgendwas, true())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind($rcas-testwert/irgendwas, true())"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- kein namespace -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind(/, true())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind(/, true())"/>
			<xsl:with-param name="reference-value" as="xs:string">document-node</xsl:with-param>
		</xsl:call-template>
		<!-- mit namespace -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:node-kind($rcas-testwert/intern:item, true())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:node-kind($rcas-testwert/intern:item, true())"/>
			<xsl:with-param name="reference-value" as="xs:string">element</xsl:with-param>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:render-context-as-string()     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:render-context-as-string($rcas-testwert/irgendwas)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:render-context-as-string($rcas-testwert/irgendwas)"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- kein namespace -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:render-context-as-string($rcas-testwert)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:render-context-as-string($rcas-testwert)"/>
			<xsl:with-param name="reference-value" as="xs:string">root[@id="root-id"]</xsl:with-param>
		</xsl:call-template>
		<!-- mit namespace -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:render-context-as-string($rcas-testwert/intern:item)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:render-context-as-string($rcas-testwert/intern:item)"/>
			<xsl:with-param name="reference-value" as="xs:string">intern:item[(@att1="item1") and (@att2="item2")]</xsl:with-param>
		</xsl:call-template>
		<!-- Attribut -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:render-context-as-string($rcas-testwert/intern:item/@att1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:render-context-as-string($rcas-testwert/intern:item/@att1)"/>
			<xsl:with-param name="reference-value" as="xs:string">@att1[. ="item1"]</xsl:with-param>
		</xsl:call-template>
		<!-- Kommentar -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:render-context-as-string($rcas-testwert/comment())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:render-context-as-string($rcas-testwert/comment())"/>
			<xsl:with-param name="reference-value" as="xs:string">comment()</xsl:with-param>
		</xsl:call-template>
		<!-- pi -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:render-context-as-string($rcas-testwert/processing-instruction())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:render-context-as-string($rcas-testwert/processing-instruction())"/>
			<xsl:with-param name="reference-value" as="xs:string">processing-instruction()</xsl:with-param>
		</xsl:call-template>
		<!-- namespace-axis -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:render-context-as-string($rcas-testwert/intern:item/namespace::intern)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:render-context-as-string($rcas-testwert/intern:item/namespace::intern)"/>
			<xsl:with-param name="reference-value" as="xs:string">namespace::intern</xsl:with-param>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:render-context-and-parent-as-string()     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-context-and-parent-as-string($rcas-testwert/irgendwas)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-context-and-parent-as-string($rcas-testwert/irgendwas)"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '' "/>
		</xsl:call-template>
		<!-- kein parent -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-context-and-parent-as-string($rcas-testwert)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-context-and-parent-as-string($rcas-testwert)"/>
			<xsl:with-param name="reference-value" as="xs:string">//root[@id="root-id"]</xsl:with-param>
		</xsl:call-template>
		<!-- mit parent -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-context-and-parent-as-string($rcas-testwert/intern:item)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-context-and-parent-as-string($rcas-testwert/intern:item)"/>
			<xsl:with-param name="reference-value" as="xs:string">//root[@id="root-id"]/intern:item[(@att1="item1") and (@att2="item2")]</xsl:with-param>
		</xsl:call-template>
		<!-- attribut -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-context-and-parent-as-string($rcas-testwert/intern:item/@att1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-context-and-parent-as-string($rcas-testwert/intern:item/@att1)"/>
			<xsl:with-param name="reference-value" as="xs:string">//intern:item[(@att1="item1") and (@att2="item2")]/@att1[. ="item1"]</xsl:with-param>
		</xsl:call-template>
		<!-- pi -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-context-and-parent-as-string($rcas-testwert/processing-instruction())</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-context-and-parent-as-string($rcas-testwert/processing-instruction())"/>
			<xsl:with-param name="reference-value" as="xs:string">//root[@id="root-id"]/processing-instruction()</xsl:with-param>
		</xsl:call-template>
		<!-- namespace axis -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-context-and-parent-as-string($rcas-testwert/intern:item/namespace::intern)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-context-and-parent-as-string($rcas-testwert/intern:item/namespace::intern)"/>
			<xsl:with-param name="reference-value" as="xs:string">//intern:item[(@att1="item1") and (@att2="item2")]/namespace::intern</xsl:with-param>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:render-level-to-pretext()     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( '' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '    ' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( () )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '    ' "/>
		</xsl:call-template>
		<!-- Standardwerte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( 'ALL' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( 'ALL' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '    ' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( 'TRACE' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( 'TRACE' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '    ' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( 'DEBUG' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( 'DEBUG' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '    ' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( 'INFO' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( 'INFO' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( 'WARN' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( 'WARN' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '---- ' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( 'ERROR' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( 'ERROR' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '#### ' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( 'FATAL' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( 'FATAL' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '###### ' "/>
		</xsl:call-template>
		<!-- falsche Eingabe -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:render-level-to-pretext( 'xxxxx' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:render-level-to-pretext( 'xxxxx' )"/>
			<xsl:with-param name="reference-value" as="xs:string?" select=" '    ' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:logging-level()     __________ -->
		<!-- arity = 1 -->
		<!-- Nullwert -->
		<!-- auskommentiert, um verwirrende Fehlermeldung zu vermeiden
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( '' )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( () )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="4"/>
		</xsl:call-template> -->
		<!-- Standardwerte: 'ALL', 'TRACE', 'DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL' -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'ALL' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'ALL' )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'TRACE' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'TRACE' )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'DEBUG' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'DEBUG' )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="2"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'INFO' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'INFO' )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="3"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'WARN' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'WARN' )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'ERROR' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'ERROR' )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="5"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'FATAL' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'FATAL' )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="6"/>
		</xsl:call-template>
		<!-- arity = 2 -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( '', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( '', false() )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( (), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( (), false() )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="4"/>
		</xsl:call-template>
		<!-- ungültig -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'gibt es nicht', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'gibt es nicht', false() )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="4"/>
		</xsl:call-template>
		<!-- Standardwerte: 'ALL', 'TRACE', 'DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL' -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:logging-level( 'ALL', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:logging-level( 'ALL', false() )"/>
			<xsl:with-param name="reference-value" as="xs:integer" select="0"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:vendor-hash(4)     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( (), (), false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( (), (), false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'FEHLER' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash('', '', true(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash('', '', true(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'FEHLER' "/>
		</xsl:call-template>
		<!-- ungültige Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( 'SAWON', '9.2.1.2', false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( 'SAWON', '9.2.1.2', false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'FEHLER' "/>
		</xsl:call-template>
		<!-- gültige Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( 'SAXON', '9.2.1.2', false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( 'SAXON', '9.2.1.2', false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'Saxon-HE_9.2' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( 'SAXON', '9.2.1.2', true(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( 'SAXON', '9.2.1.2', true(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'Saxon-PE_9.2' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:vendor-hash(5)     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( (), (), false(), false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( (), (), false(), false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'FEHLER' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash('', '', true(), false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash('', '', true(), false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'FEHLER' "/>
		</xsl:call-template>
		<!-- ungültige Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( 'SAWON', '9.2.1.2', false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( 'SAWON', '9.2.1.2', false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'FEHLER' "/>
		</xsl:call-template>
		<!-- gültige Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( 'SAXON', '9.2.1.2', false(), false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( 'SAXON', '9.2.1.2', false(), false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'Saxon-HE_9.2' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( 'SAXON', '9.2.1.2', true(), false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( 'SAXON', '9.2.1.2', true(), false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'Saxon-PE_9.2' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:vendor-hash( 'SAXON', '9.1.0.8', true(), false(), false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:vendor-hash( 'SAXON', '9.1.0.8', true(), false(), false() )"/>
			<xsl:with-param name="reference-value" as="xs:string" select=" 'Saxon-B_9.1' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
