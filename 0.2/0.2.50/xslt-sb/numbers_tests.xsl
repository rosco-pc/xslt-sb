<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	Copyright (c) 2009-2012 Stefan Krause
	
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
	<!--  -->
	<xsl:import href="internals.stylecheck.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="numbers_tests.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Tests für numbers.xsl</doc:title>
		<para>Dieses Stylesheet testet Funktionen rund um Zahlen und Rechenoperationen.</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/numbers.xsl">&XSL-Base-Directory;/numbers.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/numbers.html">&doc-Base-Directory;/numbers.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/numbers_tests.xsl">&XSL-Base-Directory;/numbers_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/numbers_tests.html">&doc-Base-Directory;/numbers_tests.html</link></para>
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
				<revnumber>0.2.50</revnumber>
				<date>2015-05-27</date>
				<authorinitials>Stf</authorinitials>
				<revremark>numbers_tests.xsl aus numbers.xsl ausgegliedert</revremark>
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
		<revhistory>
			<revision>
				<revnumber>0.50</revnumber>
				<date>2009-10-11</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para>initiale Version</para>
					<para conformance="beta">Status: beta</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template match="/" mode="internals.self-test">
		<xsl:call-template name="xsb:internals.MakeHeader"/>
		<xsl:call-template name="intern:internals.Stylecheck"/>
		<xsl:call-template name="intern:numbers.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para xml:id="numbers.self-test">Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>0.50</revnumber>
				<date>2009-10-11</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para>initiale Version</para>
					<para conformance="beta">Status: beta</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:numbers.self-test">
		<!--  -->
		<!-- __________     xsb:is-roman-numeral()     __________ -->
		<!--  -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-roman-numeral('MMIX')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-roman-numeral('MMIX')"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-roman-numeral('abc')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-roman-numeral('abc')"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-roman-numeral( '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-roman-numeral( '' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-roman-numeral( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-roman-numeral( () )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!--  -->
		<!-- __________     xsb:roman-number-char-to-integer()     __________ -->
		<!--  -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-number-char-to-integer('M')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-number-char-to-integer('M')"/>
			<xsl:with-param name="reference-value" select="1000"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-number-char-to-integer('c')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-number-char-to-integer('c')"/>
			<xsl:with-param name="reference-value" select="100"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-number-char-to-integer('MM')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-number-char-to-integer('MM')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-number-char-to-integer('a')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-number-char-to-integer('a')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-number-char-to-integer('-')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-number-char-to-integer('-')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-number-char-to-integer( '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-number-char-to-integer( '' )"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-number-char-to-integer( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-number-char-to-integer( () )"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<!--  -->
		<!-- __________     xsb:roman-numeral-to-integer()     __________ -->
		<!--  -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-numeral-to-integer('MMIX')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-numeral-to-integer('MMIX')"/>
			<xsl:with-param name="reference-value" select="2009"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-numeral-to-integer('abc')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-numeral-to-integer('abc')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-numeral-to-integer('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-numeral-to-integer('')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:roman-numeral-to-integer( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:roman-numeral-to-integer( () )"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<!--  -->
		<!-- __________     xsb:force-cast-to-decimal()     __________ -->
		<!-- Arity: 2 -->
		<!-- Null-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal((), false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal((), false())"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('', false())"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('MMIX', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('MMIX', false())"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<!-- Wahr-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('0', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('0', false())"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('1', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('1', false())"/>
			<xsl:with-param name="reference-value" select="xs:decimal(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('1.23', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('1.23', false())"/>
			<xsl:with-param name="reference-value" select="1.23" as="xs:decimal"/>
		</xsl:call-template>
		<!-- Arity: 1 -->
		<!-- Null-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal(())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal(())"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('')"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('MMIX')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('MMIX')"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<!-- Wahr-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('0')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('0')"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('1')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('1')"/>
			<xsl:with-param name="reference-value" select="xs:decimal(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('1.23')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('1.23')"/>
			<xsl:with-param name="reference-value" select="1.23" as="xs:decimal"/>
		</xsl:call-template>
		<!--  -->
		<!-- __________     xsb:force-cast-to-integer()     __________ -->
		<!-- Arity: 2 -->
		<!-- Null-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer((), false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer((), false())"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('', false())"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('MMIX', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('MMIX', false())"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer"/>
		</xsl:call-template>
		<!-- Wahr-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('0', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('0', false())"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('1', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('1', false())"/>
			<xsl:with-param name="reference-value" select="1" as="xs:integer"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('1.23', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('1.23', false())"/>
			<xsl:with-param name="reference-value" select="1" as="xs:integer"/>
		</xsl:call-template>
		<!-- Arity: 1 -->
		<!-- Null-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer(())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer(())"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('')"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('MMIX')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('MMIX')"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer"/>
		</xsl:call-template>
		<!-- Wahr-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('0')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('0')"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('1')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('1')"/>
			<xsl:with-param name="reference-value" select="1" as="xs:integer"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-integer('1.23')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-integer('1.23')"/>
			<xsl:with-param name="reference-value" select="1" as="xs:integer"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:hex-to-integer()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('0')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('0')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('1')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('1')"/>
			<xsl:with-param name="reference-value" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('9')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('9')"/>
			<xsl:with-param name="reference-value" select="9"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('a')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('a')"/>
			<xsl:with-param name="reference-value" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('A')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('A')"/>
			<xsl:with-param name="reference-value" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('0a')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('0a')"/>
			<xsl:with-param name="reference-value" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('ff')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('ff')"/>
			<xsl:with-param name="reference-value" select="255"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('FFFF')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('FFFF')"/>
			<xsl:with-param name="reference-value" select="65535"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('ffffffff')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('ffffffff')"/>
			<xsl:with-param name="reference-value" select="4294967295"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer(' ff ff ff ff')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer(' ff ff ff ff')"/>
			<xsl:with-param name="reference-value" select="4294967295"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('2A')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('2A')"/>
			<xsl:with-param name="reference-value" select="42"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('42')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('42')"/>
			<xsl:with-param name="reference-value" select="66"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('29a')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('29a')"/>
			<xsl:with-param name="reference-value" select="666"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('-0')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('-0')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('-29a')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('-29a')"/>
			<xsl:with-param name="reference-value" select="-666"/>
		</xsl:call-template>
		<!-- mit Fehlermeldung -->
		<!--
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('1.0')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('1.0')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('- 2F')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('- 2F')"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		-->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
