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
	xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle"
	xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:saxon="http://saxon.sf.net/"
	xmlns:java-file="java:java.io.File"
	xmlns:java-uri="java:java.net.URI"
	exclude-result-prefixes="doc docv xsb intern java-file"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:import href="files.xsl"/>
	<xsl:import href="internals.stylecheck.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="files_tests.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Tests für files.xsl</doc:title>
		<para>Dieses Stylesheet enthält Tests für <code>files.xsl</code>.</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/files.xsl">&XSL-Base-Directory;/files.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/files.html">&doc-Base-Directory;/files.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/files_tests.xsl">&XSL-Base-Directory;/files_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/files_tests.html">&doc-Base-Directory;/files_tests.html</link></para>
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
				<revnumber>0.83</revnumber>
				<date>2010-04-03</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Ausgelagert aus <code>files.xsl</code></revremark>
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
		<xsl:call-template name="intern:files.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<intern:testliste xml:id="URLs">
		<test>
			<!-- empty sequence -->
			<value/>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url/>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<!-- ein Leerzeichen -->
			<value> </value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<!-- AltovaXML stolpert hier über das automatische Strippen von Whitespace-Only-Nodes aus //test/value -->
			<xsb:is-relative-url intern:skip="AltovaXML_CE_2010.3sp1 AltovaXML_CE_2011.2sp1 AltovaXML_CE_2012.sp1 AltovaXML_CE_2012.2">false</xsb:is-relative-url>
			<xsb:is-url intern:skip="AltovaXML_CE_2010.3sp1 AltovaXML_CE_2011.2sp1 AltovaXML_CE_2012.sp1 AltovaXML_CE_2012.2">false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url/>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<!-- nur Whitespace -->
			<value>&#160;</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url/>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>true</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>true</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org/</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/wiki</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org/wiki</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>wiki</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url>wiki</xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/wiki/wiki</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org/wiki/wiki</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>wiki</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url>wiki</xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/wiki/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/wiki/wiki/</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org/wiki/wiki/</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/wiki/wiki/</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>/</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>/</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>true</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>/</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>file:///c:/some/where/file.txt</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///c:/some/where/file.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>file.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>file</xsb:fileName-from-url>
			<xsb:path-from-url>file:///c:/some/where/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/wiki/Wikipedia#Statistik</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>true</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url>Statistik</xsb:fragment-from-url>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org/wiki/Wikipedia</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>Wikipedia</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url>Wikipedia</xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/wiki/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/wiki/Wikipedia#Statistik#Statistik</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url/>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/w/index.php?title=Wikipedia&amp;action=edit&amp;section=31</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>true</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url>title=Wikipedia&amp;action=edit&amp;section=31</xsb:query-from-url>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org/w/index.php</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>index.php</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>php</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>index</xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/w/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/w/index.php?title=Wikipedia?action=edit?section=31</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>true</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url>title=Wikipedia?action=edit?section=31</xsb:query-from-url>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org/w/index.php</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>index.php</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>php</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>index</xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/w/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>sche-ma://de.wikipedia.org/</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>true</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>sche-ma://de.wikipedia.org/</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>sche-ma://de.wikipedia.org/</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url>sche-ma</xsb:scheme-from-url>
		</test>
		<test>
			<value>sche\ma://de.wikipedia.org/</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url/>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>sche.ma://de.wikipedia.org/</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>true</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>sche.ma://de.wikipedia.org/</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>sche.ma://de.wikipedia.org/</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url>sche.ma</xsb:scheme-from-url>
		</test>
		<test>
			<!-- ist lt. RFC 1808 eine gültige URL -->
			<value>schema:</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url></xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<!-- ist lt. RFC 3986 eine gültige URI -->
			<value>schema:/</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url></xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>something</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>something</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>something</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url>something</xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>something/else</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>something/else</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>else</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url>else</xsb:fileName-from-url>
			<xsb:path-from-url>something/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>file:///c:/some/~where/file.txt</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///c:/some/~where/file.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>file.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>file</xsb:fileName-from-url>
			<xsb:path-from-url>file:///c:/some/~where/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<value>file:///c:/some/~where/file.txt#anchor</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>true</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url>anchor</xsb:fragment-from-url>
			<xsb:remove-query-and-fragment-from-url>file:///c:/some/~where/file.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>file.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>file</xsb:fileName-from-url>
			<xsb:path-from-url>file:///c:/some/~where/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<value>file:///c:/some/~where/file.txt?abc=ID_abc</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>true</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url>abc=ID_abc</xsb:query-from-url>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///c:/some/~where/file.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>file.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>file</xsb:fileName-from-url>
			<xsb:path-from-url>file:///c:/some/~where/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<value>file:/c:/some/~where/file.txt</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:/c:/some/~where/file.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>file.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>file</xsb:fileName-from-url>
			<xsb:path-from-url>file:/c:/some/~where/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://de.wikipedia.org/http://de.wikipedia.org/</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://de.wikipedia.org/http://de.wikipedia.org/</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>http://de.wikipedia.org/http://de.wikipedia.org/</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>.</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>.</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>true</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>./</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>..</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>..</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>true</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>../</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>./.</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>./.</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>true</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>././</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>./..</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>./..</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>true</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>./../</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>../..</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>../..</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>true</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>../../</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>../../../..</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>../../../..</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>true</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>../../../../</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>../../test/..</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>../../test/..</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>../../test/../</xsb:path-from-url>
			<xsb:is-path-only-url>true</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>../test.txt</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>../test.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>test.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>test</xsb:fileName-from-url>
			<xsb:path-from-url>../</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>../../test.txt</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>../../test.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>test.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>test</xsb:fileName-from-url>
			<xsb:path-from-url>../../</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>../some/../where/test.txt</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>../some/../where/test.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>test.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>test</xsb:fileName-from-url>
			<xsb:path-from-url>../some/../where/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>..\some\..\where\test.txt</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url/>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>\\server\path\test.txt</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url/>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url></xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>//server/path/test.txt</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>//server/path/test.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>test.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>test</xsb:fileName-from-url>
			<xsb:path-from-url>//server/path/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url></xsb:scheme-from-url>
		</test>
		<test>
			<value>file:///server/path/test.txt</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///server/path/test.txt</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>test.txt</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>txt</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>test</xsb:fileName-from-url>
			<xsb:path-from-url>file:///server/path/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<value>file:///server/path/test.txt/test</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///server/path/test.txt/test</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>test</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url>test</xsb:fileName-from-url>
			<xsb:path-from-url>file:///server/path/test.txt/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<!-- ".txt" ist unter Windows XP ein gültiger Dateiname für eine Textdatei -->
			<value>file:///server/path/test.txt/.ext</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///server/path/test.txt/.ext</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>.ext</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>ext</xsb:fileExtention-from-url>
			<xsb:fileName-from-url></xsb:fileName-from-url>
			<xsb:path-from-url>file:///server/path/test.txt/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<!-- "..txt" ist unter Windows XP ein gültiger Dateiname für eine Textdatei -->
			<value>file:///server/path/test.txt/..ext</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///server/path/test.txt/..ext</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>..ext</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>ext</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>.</xsb:fileName-from-url>
			<xsb:path-from-url>file:///server/path/test.txt/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
	
	
	
		<test>
			<value>file:///server/path/test.txt/test</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///server/path/test.txt/test</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>test</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url>test</xsb:fileName-from-url>
			<xsb:path-from-url>file:///server/path/test.txt/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<value>file:///server/path/test.txt/test</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>file:///server/path/test.txt/test</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>test</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url></xsb:fileExtention-from-url>
			<xsb:fileName-from-url>test</xsb:fileName-from-url>
			<xsb:path-from-url>file:///server/path/test.txt/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>file</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://www.ix.de/a.htm?a=b</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>true</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url>a=b</xsb:query-from-url>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://www.ix.de/a.htm</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>a.htm</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>htm</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>a</xsb:fileName-from-url>
			<xsb:path-from-url>http://www.ix.de/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
		<test>
			<value>http://en.wiktionary.org/wiki/מילנו</value>
			<xsb:is-absolute-url>false</xsb:is-absolute-url>
			<xsb:is-relative-url>false</xsb:is-relative-url>
			<xsb:is-url>false</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>false</xsb:url-has-authority>
			<xsb:url-has-query>false</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>false</xsb:url-has-fileExtention>
			<xsb:query-from-url/>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url/>
			<xsb:fileName-and-fileExtention-from-url/>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url/>
			<xsb:fileName-from-url/>
			<xsb:path-from-url/>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url/>
		</test>
		<test>
			<value>http://en.wiktionary.org/w/index.php?title=%D7%9E%D7%99%D7%9C%D7%95%D7%9F&amp;action=edit</value>
			<xsb:is-absolute-url>true</xsb:is-absolute-url>
			<xsb:is-relative-url>true</xsb:is-relative-url>
			<xsb:is-url>true</xsb:is-url>
			<xsb:is-network-server-url>false</xsb:is-network-server-url>
			<xsb:url-has-authority>true</xsb:url-has-authority>
			<xsb:url-has-query>true</xsb:url-has-query>
			<xsb:url-has-fragment>false</xsb:url-has-fragment>
			<xsb:url-has-fileExtention>true</xsb:url-has-fileExtention>
			<xsb:query-from-url>title=%D7%9E%D7%99%D7%9C%D7%95%D7%9F&amp;action=edit</xsb:query-from-url>
			<xsb:fragment-from-url/>
			<xsb:remove-query-and-fragment-from-url>http://en.wiktionary.org/w/index.php</xsb:remove-query-and-fragment-from-url>
			<xsb:fileName-and-fileExtention-from-url>index.php</xsb:fileName-and-fileExtention-from-url>
			<xsb:is-shortcut-only-url>false</xsb:is-shortcut-only-url>
			<xsb:fileExtention-from-url>php</xsb:fileExtention-from-url>
			<xsb:fileName-from-url>index</xsb:fileName-from-url>
			<xsb:path-from-url>http://en.wiktionary.org/w/</xsb:path-from-url>
			<xsb:is-path-only-url>false</xsb:is-path-only-url>
			<xsb:scheme-from-url>http</xsb:scheme-from-url>
		</test>
	</intern:testliste>
	<doc:template>
		<para xml:id="files.self-test">Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>0.74</revnumber>
				<date>2010-01-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:files.self-test">
		<!-- damit es etwas übersichtlicher wird -->
		<xsl:variable name="seqURL-Tests" as="element()+" select="document( '' )//intern:testliste[@xml:id eq 'URLs']/test"/>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-absolute-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:is-absolute-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:is-absolute-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-relative-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:is-relative-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:is-relative-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-network-server-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:is-network-server-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:is-network-server-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:is-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:is-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:url-has-authority()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:url-has-authority</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:url-has-authority(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:url-has-query()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:url-has-query</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:url-has-query(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:url-has-fragment()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:url-has-fragment</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:url-has-fragment(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:query-from-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:query-from-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:query-from-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fragment-from-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:fragment-from-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:fragment-from-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:remove-query-and-fragment-from-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:remove-query-and-fragment-from-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:remove-query-and-fragment-from-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-shortcut-only-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:is-shortcut-only-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:is-shortcut-only-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-path-only-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:is-path-only-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:is-path-only-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fileName-and-fileExtention-from-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:fileName-and-fileExtention-from-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:fileName-and-fileExtention-from-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fileExtention-from-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:fileExtention-from-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:fileExtention-from-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fileName-from-url()     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:fileName-from-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:fileName-from-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________    xsb:path-from-url     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:path-from-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:path-from-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________    xsb:scheme-from-url     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:scheme-from-url</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:scheme-from-url(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________    xsb:url-has-fileExtention     __________ -->
		<xsl:for-each select="$seqURL-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:url-has-fileExtention</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:url-has-fileExtention(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:file-exist()     __________ -->
		<!-- arity=1 -->
		<!-- null-wert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-exists( '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-exists( '' )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-exists( () )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-exists( () )"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!-- wahr -->
		<xsl:choose>
			<xsl:when test="xsb:listed('Saxon-HE_9.2 Saxon-HE_9.3 Saxon-HE_9.4 AltovaXML_CE_2011.2sp1 AltovaXML_CE_2012.sp1 AltovaXML_CE_2012.2', $_internals.testing.current-vendor-hash)">
				<xsl:call-template name="xsb:internals.testing.SkippedTests">
					<xsl:with-param name="caller">xsb:file-exists()</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( document-uri(document( '' )) )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( document-uri(document( '' )) )"/>
					<xsl:with-param name="reference-value" select="true()"/>
				</xsl:call-template>
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( concat(document-uri(document( '' ) ), '#test') )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( concat(document-uri(document( '' ) ), '#test') )"/>
					<xsl:with-param name="reference-value" select="true()"/>
				</xsl:call-template>
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( concat(document-uri(document( '' ) ), '?test') )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( concat(document-uri(document( '' ) ), '?test') )"/>
					<xsl:with-param name="reference-value" select="true()"/>
				</xsl:call-template>
				<!-- falsch -->
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( 'file:///c:/giebt-es-nicht.abc' )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( 'file:///c:/giebt-es-nicht.abc' )"/>
					<xsl:with-param name="reference-value" select="false()"/>
				</xsl:call-template>
				<!-- arity=2 -->
				<!-- null-wert -->
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( '', base-uri(/) )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( '', base-uri(/) )"/>
					<xsl:with-param name="reference-value" select="false()"/>
				</xsl:call-template>
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( '', xsb:path-from-url(base-uri(/) ) )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( '', xsb:path-from-url(base-uri(/) ) )"/>
					<xsl:with-param name="reference-value" select="false()"/>
				</xsl:call-template>
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( (), base-uri(/) )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( (), base-uri(/) )"/>
					<xsl:with-param name="reference-value" select="false()"/>
				</xsl:call-template>
				<!-- wahr -->
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists(xsb:fileName-and-fileExtention-from-url(document-uri(document( '' ) ) ), base-uri(/))</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists(xsb:fileName-and-fileExtention-from-url(document-uri(document( '' ) ) ), base-uri(/))"/>
					<xsl:with-param name="reference-value" select="true()"/>
				</xsl:call-template>
				<!--<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists(concat( xsb:fileName-and-fileExtention-from-url(document-uri(document( '?test' ) ) ), ''), base-uri(/))</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists(concat( xsb:fileName-and-fileExtention-from-url(document-uri(document( '?test' ) ) ), ''), base-uri(/))"/>
					<xsl:with-param name="reference-value" select="true()"/>
					</xsl:call-template>
					<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists(concat( xsb:fileName-and-fileExtention-from-url(document-uri(document( '#test' ) ) ), ''), base-uri(/))</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists(concat( xsb:fileName-and-fileExtention-from-url(document-uri(document( '#test' ) ) ), ''), base-uri(/))"/>
					<xsl:with-param name="reference-value" select="true()"/>
					</xsl:call-template>
					<!-\- falsch -\->
					<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( 'giebt-es-nicht.abc', base-uri(/) )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( 'giebt-es-nicht.abc', base-uri(/) )"/>
					<xsl:with-param name="reference-value" select="false()"/>
					</xsl:call-template>-->
				
				<!-- auskommentiert, weil intendiert mit Fehlermeldung und Abbruch -->
				<!--<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists('irgendeinekomischeDatei.nix')</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists('irgendeinekomischeDatei.nix')"/>
					<xsl:with-param name="reference-value" select="false()"/>
					</xsl:call-template>
					<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">xsb:file-exists( 'file://c:/io.sys' )</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:file-exists( 'file://c:/io.sys' )"/>
					<xsl:with-param name="reference-value" select="false()"/>
					</xsl:call-template>-->
				
			</xsl:otherwise>
		</xsl:choose>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:mediatype-from-url()     __________ -->
		<!-- null-wert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( '', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( '', false() )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( '' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( '' )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- gültige Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( 'text.txt', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( 'text.txt', false() )"/>
			<xsl:with-param name="reference-value" select=" 'text/plain' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( 'text.txt' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( 'text.txt' )"/>
			<xsl:with-param name="reference-value" select=" 'text/plain' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( 'text.pdf' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( 'text.pdf' )"/>
			<xsl:with-param name="reference-value" select=" 'application/pdf' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( 'http://de.wikipedia.org/wiki/abc.gif', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( 'http://de.wikipedia.org/wiki/abc.gif', false() )"/>
			<xsl:with-param name="reference-value" select=" 'image/gif' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( 'http://de.wikipedia.org/wiki/abc.gif' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( 'http://de.wikipedia.org/wiki/abc.gif' )"/>
			<xsl:with-param name="reference-value" select=" 'image/gif' "/>
		</xsl:call-template>
		<!-- ungültige Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( 'text.tx_', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( 'text.tx_', false() )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- auskommentiert, um intendierte Fehlermeldung zu vermeiden -->
		<!--<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:mediatype-from-url( 'text.tx_' )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:mediatype-from-url( 'text.tx_' )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
			</xsl:call-template>-->
		<!--  -->
		<!--  -->
		<!-- __________     xsb:file-extension-from-mediatype()     __________ -->
		<!-- null-wert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-extension-from-mediatype('', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-extension-from-mediatype('', false() )"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-extension-from-mediatype('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-extension-from-mediatype('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<!-- gültige Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-extension-from-mediatype('text/plain', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-extension-from-mediatype('text/plain', false() )"/>
			<xsl:with-param name="reference-value" select=" 'txt' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-extension-from-mediatype('application/msword', false() )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-extension-from-mediatype('application/msword', false() )"/>
			<xsl:with-param name="reference-value" select=" 'doc' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-extension-from-mediatype('application/xhtml+xml')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-extension-from-mediatype('application/xhtml+xml')"/>
			<xsl:with-param name="reference-value" select=" 'xhtml' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-extension-from-mediatype('image/tiff')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-extension-from-mediatype('image/tiff')"/>
			<xsl:with-param name="reference-value" select=" 'tif' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-extension-from-mediatype('image/jpeg')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-extension-from-mediatype('image/jpeg')"/>
			<xsl:with-param name="reference-value" select=" 'jpg' "/>
		</xsl:call-template>
		<!-- auskommentiert, um intendierte Fehlermeldung zu vermeiden -->
		<!--<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:file-extension-from-mediatype('image/gibtesnicht')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:file-extension-from-mediatype('image/gibtesnicht')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>-->
		<!--  -->
		<!--  -->
		<!-- __________     xsb:decode-from-url()     __________ -->
		<!-- null-wert -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url(())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url(())"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url('haus')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url('haus')"/>
			<xsl:with-param name="reference-value" select=" 'haus' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url('3b4f')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url('3b4f')"/>
			<xsl:with-param name="reference-value" select=" '3b4f' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url('%3b%4f')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url('%3b%4f')"/>
			<xsl:with-param name="reference-value" select=" ';O' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url('%20')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url('%20')"/>
			<xsl:with-param name="reference-value" select=" ' ' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url('%3A%2F%3F%23%5B%5D%20%40%22%21%24%25%26%27%28%29%2A%2B%2C%3B%3D%7E')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url('%3A%2F%3F%23%5B%5D%20%40%22%21%24%25%26%27%28%29%2A%2B%2C%3B%3D%7E')"/>
			<xsl:with-param name="reference-value" select=" ':/?#[] @&quot;!$%&amp;''()*+,;=~' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url('%17')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url('%17')"/>
			<xsl:with-param name="reference-value" select=" '%17' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:decode-from-url('%ff')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:decode-from-url('%ff')"/>
			<xsl:with-param name="reference-value" select=" '%ff' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
