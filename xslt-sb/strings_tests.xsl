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
	xmlns:saxon="http://saxon.sf.net/"
	xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle"
	xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	exclude-result-prefixes="doc docv xsb intern"
	extension-element-prefixes="saxon"
	>
	<!--  -->
	<!--  -->
	<!-- strings.xsl wird bereits früher importiert -->
	<xsl:import href="internals.stylecheck.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="string-tests.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Tests für strings.xsl</doc:title>
		<para>Dieses Stylesheet enthält die Tests für <code>string.xsl</code>.</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/strings.xsl">&XSL-Base-Directory;/strings.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/strings.html">&doc-Base-Directory;/strings.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/strings_tests.xsl">&XSL-Base-Directory;/strings_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/strings_tests.html">&doc-Base-Directory;/strings_tests.html</link></para>
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
				<revremark>initiale Version, ausgelagert aus <code>internals.xsl</code> und ergänzt.</revremark>
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
		<xsl:call-template name="intern:strings.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para>Dieses Template führt die lokalen Selbst-Tests aus.</para>
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
	<xsl:template name="intern:strings.self-test">
		<!--  -->
		<!--  -->
		<!-- __________     xsb:lax-string-compare()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:lax-string-compare( 'Wort', 'Wort' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:lax-string-compare( 'Wort', 'Wort' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:lax-string-compare( 'wort', 'wort' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:lax-string-compare( 'wort', 'wort' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:lax-string-compare( 'Wort', 'wort' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:lax-string-compare( 'Wort', 'wort' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:lax-string-compare( ' Wort ', 'wort' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:lax-string-compare( ' Wort ', 'wort' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:lax-string-compare( ' Wört ', 'wort' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:lax-string-compare( ' Wört ', 'wort' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:lax-string-compare( '', '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:lax-string-compare( '', '' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:lax-string-compare( (), () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:lax-string-compare( (), () )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:return-default-if-empty()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-default-if-empty( 'Wort', 'Default' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-default-if-empty( 'Wort', 'Default' )"/>
			<xsl:with-param name="reference-value" select=" 'Wort' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-default-if-empty( '', 'Default' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-default-if-empty( '', 'Default' )"/>
			<xsl:with-param name="reference-value" select=" 'Default' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-default-if-empty( ' ', 'Default' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-default-if-empty( ' ', 'Default' )"/>
			<xsl:with-param name="reference-value" select=" 'Default' "/>
		</xsl:call-template>
		<!-- empty sequence als Eingabe -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-default-if-empty( (), 'leer' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-default-if-empty( (), 'leer' )"/>
			<xsl:with-param name="reference-value" select=" 'leer' "/>
		</xsl:call-template>
		<!-- empty sequence als Rückgabewert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-default-if-empty( ' ', () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-default-if-empty( ' ', () )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:trim-left()     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-left( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-left( () )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-left('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-left('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- unverändert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-left('Camel  Case')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-left('Camel  Case')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-left('Camel  Case  ')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-left('Camel  Case  ')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case  ' "/>
		</xsl:call-template>
		<!-- Funktion greift -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-left(' Camel  Case')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-left(' Camel  Case')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-left('  Camel  Case  ')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-left('  Camel  Case  ')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case  ' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:trim-right()     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-right( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-right( () )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-right('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-right('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- unverändert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-right('Camel  Case')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-right('Camel  Case')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-right('  Camel  Case')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-right('  Camel  Case')"/>
			<xsl:with-param name="reference-value" select=" '  Camel  Case' "/>
		</xsl:call-template>
		<!-- Funktion greift -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-right('Camel  Case ')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-right('Camel  Case ')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim-right('  Camel  Case  ')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim-right('  Camel  Case  ')"/>
			<xsl:with-param name="reference-value" select=" '  Camel  Case' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:trim()     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim( () )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- unverändert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim('Camel  Case')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim('Camel  Case')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case' "/>
		</xsl:call-template>
		<!-- Funktion greift -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim('Camel  Case ')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim('Camel  Case ')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:trim('  Camel  Case  ')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:trim('  Camel  Case  ')"/>
			<xsl:with-param name="reference-value" select=" 'Camel  Case' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:normalize-paragraphs()     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:normalize-paragraphs( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs( () )"/>
			<xsl:with-param name="reference-value" select=" () "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- keine Änderung am übergebenen String -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort')"/>
			<xsl:with-param name="reference-value" select=" 'Wort' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function" xml:id="a1" intern:solved="CallTemplateTestFunction">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort\nZeile')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort&#x0A;Zeile')"/>
			<xsl:with-param name="reference-value" select=" 'Wort&#x0A;Zeile' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function" xml:id="a2" intern:solved="CallTemplateTestFunction">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort\nZeile')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort&#x0D;Zeile')"/>
			<xsl:with-param name="reference-value" select=" 'Wort&#x0D;Zeile' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function" xml:id="a3" intern:solved="CallTemplateTestFunction">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort\nZeile')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort&#x0A;&#x0D;Zeile')"/>
			<xsl:with-param name="reference-value" select=" 'Wort&#x0A;&#x0D;Zeile' "/>
		</xsl:call-template>
		<!-- Normalisierung greift -->
		<xsl:call-template name="xsb:internals.test.Function" xml:id="a4" intern:solved="CallTemplateTestFunction">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort\n\nZeile')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort&#x0A;&#x0A;Zeile')"/>
			<xsl:with-param name="reference-value" select=" 'Wort&#x0A;Zeile' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function" xml:id="a5" intern:solved="CallTemplateTestFunction">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort\n\nZeile')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort&#x0D;&#x0D;Zeile')"/>
			<xsl:with-param name="reference-value" select=" 'Wort&#x0D;Zeile' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function" xml:id="a6" intern:solved="CallTemplateTestFunction">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort\n\nZeile')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort&#x0A;&#x0D;&#x0A;&#x0D;Zeile')"/>
			<xsl:with-param name="reference-value" select=" 'Wort&#x0A;&#x0D;Zeile' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function" xml:id="a7" intern:solved="CallTemplateTestFunction">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort\n\n\nZeile')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort&#x0A;&#x0A;&#x0D;&#x0D;Zeile')"/>
			<xsl:with-param name="reference-value" select=" 'Wort&#x0A;&#x0D;Zeile' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function" xml:id="a8" intern:solved="CallTemplateTestFunction">
			<xsl:with-param name="caller">xsb:normalize-paragraphs('Wort\n\n\nZeile')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:normalize-paragraphs('Wort&#x0D;&#x0D;&#x0A;&#x0A;Zeile')"/>
			<xsl:with-param name="reference-value" select=" 'Wort&#x0D;&#x0A;Zeile' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:return-composed-string-if-not-empty     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-composed-string-if-not-empty((), (), ())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-composed-string-if-not-empty((), (), ())"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-composed-string-if-not-empty('', '', '')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-composed-string-if-not-empty('', '', '')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-composed-string-if-not-empty('x', '', 'x')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-composed-string-if-not-empty('x', '', 'x')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- Testwerte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-composed-string-if-not-empty('x', 'test', '')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-composed-string-if-not-empty('x', 'test', '')"/>
			<xsl:with-param name="reference-value" select=" 'xtest' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-composed-string-if-not-empty('', 'test', 'x')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-composed-string-if-not-empty('', 'test', 'x')"/>
			<xsl:with-param name="reference-value" select=" 'testx' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:return-composed-string-if-not-empty('x', 'test', 'y')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:return-composed-string-if-not-empty('x', 'test', 'y')"/>
			<xsl:with-param name="reference-value" select=" 'xtesty' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:listed()     __________ -->
		<!-- falsch -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( '', '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( '', '' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( (), () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( (), () )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( 'list', '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( 'list', '' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( '', 'item' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( '', 'item' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( 'liste', 'list' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( 'liste', 'list' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( 'liste item', 'list' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( 'liste item', 'list' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!-- wahr -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( 'item', 'item' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( 'item', 'item' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( 'list item', 'item' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( 'list item', 'item' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( 'item list', 'item' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( 'item list', 'item' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:listed( 'item list item', 'item' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:listed( 'item list item', 'item' )"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		
		
		
		
		<!--  -->
		<!--  -->
		<!-- __________     xsb:encode-for-id()     __________ -->
		<!-- Nullwert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:encode-for-id('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:encode-for-id('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:encode-for-id( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:encode-for-id( () )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- unverändert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:encode-for-id('EineID_123')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:encode-for-id('EineID_123')"/>
			<xsl:with-param name="reference-value" select=" 'EineID_123' "/>
		</xsl:call-template>
		<!-- Funktion greift -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:encode-for-id('EineID 123')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:encode-for-id('EineID 123')"/>
			<xsl:with-param name="reference-value" select=" 'EineID_123' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:encode-for-id('EineIDÄ123')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:encode-for-id('EineIDÄ123')"/>
			<xsl:with-param name="reference-value" select=" 'EineIDxC3x84123' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:encode-for-id('EineID_123')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:encode-for-id('EineID_123')"/>
			<xsl:with-param name="reference-value" select=" 'EineID_123' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:encode-for-id('EineID=123')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:encode-for-id('EineID=123')"/>
			<xsl:with-param name="reference-value" select=" 'EineIDx3D123' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
