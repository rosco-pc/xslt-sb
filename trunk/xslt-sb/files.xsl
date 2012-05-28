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
<!--  -->
<!--  -->
<!--  -->
<!-- Die folgenden Entities sind eine Umsetzung der BNF-Notation für URLs aus RFC 1808 in reguläre Ausdrücke -->
<!--  vgl. http://tools.ietf.org/html/rfc1808#section-2.2-->
<!-- Da die Tilde in RFC 1808 nicht berücksichtigt wird, habe ich sie hinzugefügt -->
<!DOCTYPE xsl:stylesheet [
<!--  -->
<!-- __________     Zeichenklassen     __________ -->
<!--  -->
<!ENTITY hialpha "[A-Z]">
<!ENTITY lowalpha "[a-z]">
<!ENTITY alpha "(&lowalpha;|&hialpha;)">
<!ENTITY digit "[0-9]">
<!-- Da die Tilde ohne Zweifel ein gültiges Zeichen ist, aber in RFC 1808 in der nicht verwendeten Gruppe "national" steht,
habe ich sie hier eingefügt.-->
<!ENTITY safe "[$\-_.+~]">
<!ENTITY extra "[!*(),]">
<!-- nicht verwendet: national -->
<!ENTITY national "[{}|\\\^\[\]~`]">
<!ENTITY reserved "[;/?:@&amp;=]">
<!-- nicht verwendet: punctuation -->
<!ENTITY punctuation "[&lt;&gt;#&#x25;&quot;]">
<!ENTITY hex "(&digit;|[A-Fa-f])">
<!ENTITY escape "(&#x25;&hex;&hex;)">
<!ENTITY unreserved "(&alpha;|&digit;|&safe;|&extra;)">
<!ENTITY uchar "(&unreserved;|&escape;)">
<!ENTITY pchar "(&uchar;|[:@&amp;=])">

<!ENTITY fragment "((&uchar;|&reserved;)*)">
<!ENTITY query "((&uchar;|&reserved;)*)">
<!ENTITY net_loc "((&pchar;|[;?])*)">
<!ENTITY scheme "((&alpha;|&digit;|[+\-.])+)">
<!ENTITY param "((&pchar;|/)*)">
<!ENTITY params "(&param;(;&param;)*)">
<!ENTITY segment "(&pchar;*)">
<!ENTITY fsegment "(&pchar;+)">
<!ENTITY path "(&fsegment;(/&segment;)*)">
<!ENTITY rel_path "(&path;?(;&params;)?(\?&query;)?)">
<!ENTITY abs_path "(/&rel_path;)">
<!ENTITY net_path "(//&net_loc;&abs_path;*)">
<!--  -->
<!-- __________     *RL     __________ -->
<!--  -->
<!ENTITY relativeURL "(&net_path;|&abs_path;|&rel_path;)">
<!ENTITY generic-RL "(&scheme;:&relativeURL;)">
<!ENTITY absoluteURL "(&generic-RL;|(&scheme;:(&uchar;|&reserved;)*))">
<!ENTITY URL "((&absoluteURL;|&relativeURL;)(#&fragment;)?)">

<!-- __________     andere Entities für Verwendung im Stylesheet     __________ -->
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
	<xsl:import href="internals.xsl"/>
	<xsl:import href="numbers.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="files.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Dateien und Dateisystem</doc:title>
		<para>Dieses Stylesheet enthält Funktionen rund um das Dateisystem.</para>
		<para>Ein Großteil der Funktionen führt Formatchecks auf Strings aus und extrahiert Teile aus Strings,
			um den Umgang mit externe Dateien zu vereinfachen. 
			Da der von XSLT präferierte Typ <code>xs:anyURI</code> recht unspezifisch ist, wird dabei auf URLs nach 
			<link xlink:href="http://tools.ietf.org/html/rfc1808">RFC 1808</link> zurückgegriffen.</para>
		<para>Einige Wertebereiche und Funktionsergebnisse sind nicht absolut konform zu RFC 1808 oder auch RFC 3986 (URIs), 
			um den praktischen Nutzen zu erhöhen. So ist beispielsweise laut RFC 1808 die Tilde (~) kein gültiges Zeichen in URLs, sie wurde hier
			aber zugelassen.</para>
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
				<revnumber>0.2.50</revnumber>
				<date>2012-05-27</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para>neue Funktion: <function>xsb:decode-from-url()</function></para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.2.41</revnumber>
				<date>2012-02-04</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para>Umstellung auf stylesheet-interne Tabelle und dadurch mehr Mediatypes und Extensions</para>
				</revdescription>
			</revision>
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
				<revnumber>0.120</revnumber>
				<date>2010-07-26</date>
				<authorinitials>Stf</authorinitials>
				<revremark><function>&lt;xsl:value-of/&gt;</function> gegen <function>&lt;xsl:sequence/&gt;</function> ausgetauscht</revremark>
			</revision>
			<revision>
				<revnumber>0.80</revnumber>
				<date>2010-03-28</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Diverse Ergänzungen und BugFixes, v.a. um xsb:file-exist() zum Laufen zu bringen</revremark>
			</revision>
			<revision>
				<revnumber>0.74</revnumber>
				<date>2010-03-01</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Neudesign mit Java und Entity References, Saxon-spezifische Funktionen entfernt</revremark>
			</revision>
			<revision>
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Umstellung auf Namespaces <code>xsb:</code> und <code>intern:</code></revremark>
			</revision>
			<revision>
				<revnumber>0.52</revnumber>
				<date>2009-10-13</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Anpassungen an unterschiedliche Saxon-Versionen</revremark>
			</revision>
			<revision>
				<revnumber>0.50</revnumber>
				<date>2009-10-11</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Start mit Testroutinen</revremark>
			</revision>
			<revision>
				<revnumber>0.36</revnumber>
				<date>2009-08-02</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Umstellung der Lizenz auf CC-BY&#160;3.0</revremark>
			</revision>
			<revision>
				<revnumber>0.28</revnumber>
				<date>2009-05-03</date>
				<authorinitials>Stf</authorinitials>
				<revremark>erste Version mit Dokumentation</revremark>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Funktionen     ==================== -->
	<!--  -->
	<!--  -->
	<!-- __________     xsb:is-absolute-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="is-absolute-url">Diese Funktion überprüft, ob die angegebene URL absolut ist. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:is-absolute-url" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- zusätzlicher Test mit xsb:is-url, da dort ein paar Sonderbedingungen abgeprüft werden -->
			<xsl:when test="xsb:is-url($URL) and matches($URL, '^&absoluteURL;$' )"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:is-relative-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="is-relative-url">Diese Funktion überprüft, ob die angegebene URL relativ ist. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>true()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:is-relative-url" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- zusätzlicher Test mit xsb:is-url, da dort ein paar Sonderbedingungen abgeprüft werden -->
			<xsl:when test="xsb:is-url($URL) and matches($URL, '^&relativeURL;$' )"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:is-network-server-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="is-network-server-url">Diese Funktion überprüft, ob die angegebene URL ausschließlich einen Netzwerk-Server referenziert, d.h. keinen lokalen Teil hat. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:is-network-server-url" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="xsb:is-url($URL) and matches($URL, '^&scheme;://&net_loc;/?$' )">
				<xsl:sequence select="true()"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:url-has-authority()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="url-has-authority">Diese Funktion überprüft, ob die angegebene URL einen Authority-Teil hat. Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.75</revnumber>
				<date>2010-03-18</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:url-has-authority" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="xsb:is-url($URL) and matches($URL, '^&scheme;://&net_loc;(&rel_path;(#&fragment;)?)?$' )"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:is-path-only-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="is-path-only-url">Diese Funktion überprüft, ob die angegebene URL ein Pfad ist, d.h. es wird durch die URL keine Datei referenziert. 
			Kriterium ist, ob die URL entweder (a) einen Netzwerk-Server referenziert oder (b) mit "/", "/." oder "/.." endet oder (c) "." oder ".." ist. 
			Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:is-path-only-url" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- endet mit "/", "/." oder "/.."bzw. ist "." oder ".." -->
			<xsl:when test="xsb:is-url($URL) and matches($URL, '/\.{0,2}$|^\.{1,2}$' )">
				<xsl:sequence select="true()"/>
			</xsl:when>
			<xsl:when test="xsb:is-network-server-url($URL)">
				<xsl:sequence select="true()"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:is-shortcut-only-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="is-shortcut-only-url">Diese Funktion überprüft, ob die angegebene URL nur aus Pfad-Shortcuts ("/", ".", "..") besteht. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:is-shortcut-only-url" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="xsb:is-url($URL) and matches($URL, '^[\./]+$')">
				<xsl:sequence select="true()"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:is-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="is-url">Diese Funktion überprüft, ob der eingegebene String eine gültige URL gemäß <link xlink:href="http://tools.ietf.org/html/rfc1808">RFC 1808</link> ist. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>true()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
		<para>Abweichend von den zugrundeliegenden Standards RFC 1808 und RFC 3986 werden bestimmte URLs nicht als gültig angesehen  ("scheme" steht für URL-Schema):
			<itemizedlist>
				<listitem>
					<para><code>scheme:</code></para>
				</listitem>
				<listitem>
					<para><code>scheme:/</code></para>
				</listitem>
			</itemizedlist>
		</para>
		<revhistory>
			<revision>
				<revnumber>0.80</revnumber>
				<date>2010-03-27</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Ausschluss standardkonformer, aber wenig hilfreicher URLs wie "scheme:"</para>
				</revdescription>
			</revision>
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
	</doc:function>
	<xsl:function name="xsb:is-url" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="matches($URL, '^&scheme;:/*$' )"><xsl:sequence select="false()"/></xsl:when>
			<xsl:when test="matches($URL, '^&URL;$' )"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:url-has-query()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="url-has-query">Diese Funktion überprüft, ob die angegebene URL einen Query-Teil hat. Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:url-has-query" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="xsb:is-url($URL) and matches($URL, '\?&query;' )"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:query-from-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="query-from-url">Diese Funktion gibt den Query-Teil von einer URL zurück.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:query-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- xsb:is-url kann hier fehlen, weil es in xsb:url-has-query() getestet wird -->
			<xsl:when test="xsb:url-has-query($URL)">
				<xsl:analyze-string select="$URL" regex="\?&query;">
					<xsl:matching-substring>
						<xsl:sequence select="substring-after(., '?')"/>
					</xsl:matching-substring>
				</xsl:analyze-string>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:url-has-fragment()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="url-has-fragment">Diese Funktion überprüft, ob die angegebene URL einen Fragment-Teil (eine Referenz auf einen Dokumenten-Teil nach einem Hash-Zeichen <code>#</code>) hat. Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:url-has-fragment" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="xsb:is-url($URL) and matches($URL, '#&fragment;' )"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fragment-from-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="fragment-from-url">Diese Funktion gibt den Fragment-Teil von einer URL zurück.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:fragment-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- xsb:is-url kann hier fehlen, weil es in xsb:url-has-fragment() getestet wird -->
			<xsl:when test="xsb:url-has-fragment($URL)">
				<xsl:analyze-string select="$URL" regex="#&fragment;">
					<xsl:matching-substring>
						<xsl:sequence select="substring-after(., '#')"/>
					</xsl:matching-substring>
				</xsl:analyze-string>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:scheme-from-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="scheme-from-url">Diese Funktion gibt den scheme-Teil von einer absoluten URL zurück.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.75</revnumber>
				<date>2010-03-07</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:scheme-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- zusätzlicher Test mit xsb:is-url, da dort ein paar Sonderbedingungen abgeprüft werden -->
			<xsl:when test="xsb:is-url($URL) and matches($URL, '^&absoluteURL;(#&fragment;)?$' )">
				<xsl:sequence select="substring-before($URL, ':')"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:remove-query-and-fragment-from-url     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="remove-query-and-fragment-from-url">Diese Funktion entfernt Query- und Fragment-Teil von einer URL.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer Leersequenz gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:remove-query-and-fragment-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- per Definition muss ein eventuelles Fragment nach der Query stehen -->
			<xsl:when test="xsb:url-has-query($URL)">
				<xsl:sequence select="substring-before($URL, '?')"/>
			</xsl:when>
			<xsl:when test="xsb:url-has-fragment($URL)">
				<xsl:sequence select="substring-before($URL, '#')"/>
			</xsl:when>
			<xsl:when test="xsb:is-url($URL)">
				<xsl:sequence select="concat($URL, '')"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fileName-and-fileExtention-from-url     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="fileName-and-fileExtention-from-url">Diese Funktion gibt Dateinamen und Dateierweiterung aus einer URL zurück.</para>
		<para>Die Eingabe einer Server-URL oder eines Pfades gibt einen Leerstring zurück.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:fileName-and-fileExtention-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:variable name="cleanURL" as="xs:string" select="xsb:remove-query-and-fragment-from-url($URL)"/>
		<xsl:choose>
			<!-- keine Ausgabe bei reinen Servern -->
			<xsl:when test="xsb:is-network-server-url($cleanURL)"><xsl:sequence select=" '' "/></xsl:when>
			<!-- keine Ausgabe bei reinen Pfad-Angaben -->
			<xsl:when test="xsb:is-path-only-url($cleanURL)"><xsl:sequence select=" '' "/></xsl:when>
			<!-- String nach dem letzten Slash; wenn $cleanURL mit Slash endet, ist das der Leerstring -->
			<xsl:when test="contains($cleanURL, '/')">
				<xsl:sequence select="tokenize($cleanURL, '/')[last()]"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- entfernt eventuelle query und fragment (und ergibt einen Leerstring, wenn die Eingabe ungültig ist)-->
				<xsl:sequence select="$cleanURL"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fileExtention-from-url     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="fileExtention-from-url">Diese Funktion ermittelt eine eventuelle Dateierweiterung aus einer URL.</para>
		<para>Da die Interpretation von Dateinamenserweiterungen sehr DOS/Windows-spezifisch ist, wird deren Interpretation nachvollzogen. Beispielsweise ist ".txt" (nur Erweiterung "txt") ein gültiger Dateiname für eine Textdatei.</para>
		<para>Die Eingabe einer Server-URL oder eines Pfades gibt einen Leerstring zurück.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer URL mit einem Dateinamen, der nur aus Punkt+Erweiterung besteht, gibt die Erweiterung zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.85</revnumber>
				<date>2010-04-10</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Dateiname = Dateierweiterung berücksichtigt.</para>
				</revdescription>
			</revision>
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
	</doc:function>
	<xsl:function name="xsb:fileExtention-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:variable name="cleanFileNameExtension" as="xs:string" select="xsb:fileName-and-fileExtention-from-url($URL)"/>
		<xsl:sequence select="if (contains($cleanFileNameExtension, '.')) then (tokenize($cleanFileNameExtension, '\.')[last()]) else ( '' )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:url-has-fileExtention()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="url-has-fileExtention">Diese Funktion überprüft, ob die angegebene URL einen Dateinamen beinhaltet, und ob dieser Dateiname eine Dateierweiterung hat. Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Da die Interpretation von Dateinamenserweiterungen sehr DOS/Windows-spezifisch ist, wird deren Interpretation nachvollzogen. Beispielsweise ist ".txt" (nur Erweiterung "txt") ein gültiger Dateiname für eine Textdatei.</para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt <code>false()</code> zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.85</revnumber>
				<date>2010-04-10</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Dateiname = Dateierweiterung berücksichtigt.</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.83</revnumber>
				<date>2010-04-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:url-has-fileExtention" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:sequence select="if (normalize-space(xsb:fileExtention-from-url($URL) ) ) then true() else false()"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fileName-from-url     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="fileName-from-url">Diese Funktion ermittelt einen Dateinamen ohne eventuelle Dateierweiterung aus einer URL.</para>
		<para>Die Eingabe einer Server-URL oder eines Pfades gibt einen Leerstring zurück.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe eines Dateinamens, der nur aus Punkt+Dateierweiterung besteht (z.B. ".txt"),  gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:fileName-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:variable name="cleanFileNameExtension" as="xs:string?" select="xsb:fileName-and-fileExtention-from-url(xsb:remove-query-and-fragment-from-url($URL))"/>
		<xsl:variable name="FileExtension" as="xs:string" select="xsb:fileExtention-from-url($cleanFileNameExtension)"/>
		<xsl:choose>
			<!-- Standardfall -->
			<xsl:when test="normalize-space($cleanFileNameExtension) and normalize-space($FileExtension)">
				<xsl:sequence select="substring($cleanFileNameExtension, 1, string-length($cleanFileNameExtension) - string-length($FileExtension) - 1)"/>
			</xsl:when>
			<!-- ohne Extension -->
			<xsl:when test="normalize-space($cleanFileNameExtension) and not(normalize-space($FileExtension))">
				<xsl:sequence select="$cleanFileNameExtension"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:path-from-url     __________ -->
	<doc:function>
		<doc:param name="URL"><para>String, der als URL interpretiert wird.</para></doc:param>
		<para xml:id="path-from-url">Diese Funktion ermittelt einen Pfad ohne eventuelle Dateinamen und Dateierweiterung aus einer URL.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
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
	</doc:function>
	<xsl:function name="xsb:path-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:variable name="cleanURL" as="xs:string" select="xsb:remove-query-and-fragment-from-url($URL)"/>
		<xsl:choose>
			<xsl:when test="xsb:is-path-only-url($cleanURL) and not(ends-with($cleanURL, '/'))"><xsl:sequence select="concat($cleanURL, '/')"/></xsl:when>
			<xsl:when test="contains($cleanURL, '/')">
				<xsl:sequence select="concat(string-join(tokenize($cleanURL, '/')[position() lt last()], '/'), '/')"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     misc:file-exists()     __________ -->
	<doc:function>
		<doc:param name="absoluteURL"><para>Absoluter Pfad zur zu überprüfenden Datei.</para></doc:param>
		<para xml:id="file-exists">Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Es werden nur lokale Dateien mit absoluten URLs getestet. Dies impliziert, dass auch keine URLs mit einer authority 
			bearbeitet werden können (hier hält sich die Funktion an die Vorgaben von Java), d.h. bei absoluten URLs, die nicht mit dem 
			Protokoll-Teil <code>file:/</code> oder <code>file:///</code> beginnen, 
			wird <code>false()</code> zurückgegeben.</para>
		<para>Der Wertebereich für gültige Parameter wurde auf den kleinsten gemeinsamen Nenner der zu Grunde liegenden Funktionen eingegrenzt.</para>
		<para><emphasis role="bold">Achtung!</emphasis> Diese Funktion erfordert bei Ausführung Java oder Saxon-spezifische Erweiterungen.</para>
		<revhistory>
			<revision>
				<revnumber>0.74</revnumber>
				<date>2010-01-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:file-exists" as="xs:boolean">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:variable name="absoluteURL_cleaned" as="xs:string?" select="xsb:remove-query-and-fragment-from-url($absoluteURL)"/>
		<xsl:choose>
			<!-- Leerstring ist OK, aber das Ergebnis ist false() -->
			<xsl:when test="not(normalize-space($absoluteURL_cleaned))">
				<xsl:sequence select="false()"/>
			</xsl:when>
			<!-- keine absolute URL ist nicht OK -->
			<xsl:when test="not(xsb:is-absolute-url($absoluteURL_cleaned))">
				<xsl:sequence select="false()"/>
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">xsb:file-exists(absoluteURL)</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Eingabe "<xsl:sequence select="$absoluteURL"/>" ist keine absolute URL. Für relative URLs kann xsb:file-exists(relativeURL, baseURL) verwendet werden.</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<!--  -->
			<xsl:when test="xsb:url-has-authority($absoluteURL_cleaned)">
				<xsl:sequence select="false()"/>
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">xsb:file-exists(absoluteURL)</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Eingabe "<xsl:sequence select="$absoluteURL"/>" hat einen authority-Part (d.h. verweist auf eine Ressource im Internet). Es können nur lokale Dateien getestet werden.</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<!-- was anderes als "file: ..." ist nicht OK -->
			<xsl:when test="not(xsb:scheme-from-url($absoluteURL_cleaned) eq 'file' )">
				<xsl:sequence select="false()"/>
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">xsb:file-exists(absoluteURL)</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Eingabe "<xsl:sequence select="$absoluteURL"/>" ist nicht im "file"-Schema. Es können nur lokale Dateien getestet werden, d.h. die absolute URL der Datei muss mit "file:" beginnen.</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:file-exists($absoluteURL_cleaned)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<doc:function>
		<doc:param name="relativeURL"><para>relativer Pfad zur zu überprüfenden Datei.</para></doc:param>
		<doc:param name="baseURL"><para>Basis für den relativen Pfad.</para></doc:param>
		<para xml:id="file-exists_relative">Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Die relative URL wird gegenüber der Basis aufgelöst. Es werden nur lokale Dateien getestet, d.h. beginnt die Basis nicht mit dem 
			Protokoll <code>file:</code> oder verweist auf eine Ressource im Internet (= hat einen authority-Teil), 
			wird <code>false()</code> zurückgegeben.</para>
		<para><emphasis role="bold">Achtung!</emphasis> Diese Funktion erfordert bei Ausführung Java oder Saxon-spezifische Erweiterungen.</para>
		<revhistory>
			<revision>
				<revnumber>0.74</revnumber>
				<date>2010-01-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:file-exists" as="xs:boolean">
		<xsl:param name="relativeURL" as="xs:string?"/>
		<xsl:param name="baseURL" as="xs:string?"/>
		<xsl:variable name="composedURL" as="xs:string?">
			<xsl:choose>
				<xsl:when test="not(normalize-space($relativeURL))"/>
				<xsl:when test="xsb:is-relative-url($relativeURL) and xsb:is-absolute-url($baseURL)">
					<xsl:sequence select="resolve-uri($relativeURL, $baseURL)"/>
				</xsl:when>
				<xsl:when test="not(xsb:is-relative-url($relativeURL))">
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">xsb:file-exists(relativeURL, baseURL)</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
						<xsl:with-param name="message">Eingabe "<xsl:sequence select="$relativeURL"/>" für realtiveURL ist keine relative URL.</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="not(normalize-space($baseURL))">
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">xsb:file-exists(relativeURL, baseURL)</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
						<xsl:with-param name="message">Eingabe einer baseURL erforderlich.</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="not(xsb:is-absolute-url($baseURL))">
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">xsb:file-exists(relativeURL, baseURL)</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
						<xsl:with-param name="message">Eingabe "<xsl:sequence select="$baseURL"/>" für baseURL ist keine absolute URL.</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">xsb:file-exists(relativeURL, baseURL)</xsl:with-param>
						<xsl:with-param name="level">FATAL</xsl:with-param>
						<xsl:with-param name="message">Logischer Fehler in Auswertungslogik.</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:sequence select="xsb:file-exists($composedURL)"/>
	</xsl:function>
	<!--  -->
	<doc:function>
		<doc:param name="absoluteURL"><para>Absoluter Pfad zur zu überprüfenden Datei.</para></doc:param>
		<para xml:id="file-exists_java">Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para>Es werden nur lokale Dateien mit absoluten URLs getestet.</para>
		<para><emphasis role="bold">Achtung!</emphasis> Diese Funktion erfordert bei Ausführung Java.</para>
		<revhistory>
			<revision>
				<revnumber>0.74</revnumber>
				<date>2010-01-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:file-exists" as="xs:boolean" use-when="function-available('java-file:exists')" intern:solved="MissingTests">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:sequence select="java-file:exists(java-file:new(java-uri:new($absoluteURL)))"/>
	</xsl:function>
	<!-- getestet mit Saxon 9.2.0.2 -->
	<doc:function>
		<doc:param name="absoluteURL"><para>Pfad zur zu überprüfenden Datei</para></doc:param>
		<para xml:id="file-exists_saxon9.2">Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para><emphasis role="bold">Achtung!</emphasis> Diese Funktion erfordert bei Ausführung die Saxon-spezifische Erweiterung 
			<function>saxon:last-modified()</function>, die in Saxon-PE und Saxon-EE (aber nicht in Saxon-HE) ab Version 9.2 vorhanden sind.</para>
		<revhistory>
			<revision>
				<revnumber>0.74</revnumber>
				<date>2010-01-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:file-exists" as="xs:boolean" use-when="not(function-available('java-file:exists')) and function-available( 'saxon:last-modified' ) and not(function-available( 'saxon:file-last-modified' ))" intern:solved="MissingTests">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:sequence select="boolean(normalize-space(string(saxon:last-modified($absoluteURL))))"/>
	</xsl:function>
	<!--  -->
	<!-- getestet mit Saxon 9.1.0.7 -->
	<doc:function>
		<doc:param name="absoluteURL"><para>Pfad zur zu überprüfenden Datei</para></doc:param>
		<para xml:id="file-exists_saxon_9.1">Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
			(<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
		<para><emphasis role="bold">Achtung!</emphasis> Diese Funktion erfordert bei Ausführung die Saxon-spezifische Erweiterung 
			<function>saxon:file-last-modified()</function>, die in Saxon-B und Saxon-SA bis einschließlich Version 9.1 vorhanden sind.</para>
		<revhistory>
			<revision>
				<revnumber>0.74</revnumber>
				<date>2010-01-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:file-exists" as="xs:boolean" use-when="not(function-available('java-file:exists')) and function-available( 'saxon:file-last-modified' ) and function-available( 'saxon:last-modified' )" intern:solved="MissingTests">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:sequence select="boolean(normalize-space(string(saxon:file-last-modified($absoluteURL))))"/>
	</xsl:function>
	<!--  -->
	<!-- Catch, getestet mit Saxon 8.9.0.4, Saxon-HE 9.2 und Intel 2.0.0.0 -->
	<doc:function>
		<doc:param name="absoluteURL"><para>Pfad zur zu überprüfenden Datei</para></doc:param>
		<para xml:id="file-exists_catch">Diese Funktion wird aufgerufen, wenn weder Java noch Saxon-spezifische Funktionen vorhanden sind.
			In diesem Fall wird die Stylesheet-Verarbeitung abgebrochen, z.B. bei Saxon-B&#160;8.9, Saxon-HE&#160;9.2 und Intel&#160;2.0.</para>
		<revhistory>
			<revision>
				<revnumber>0.74</revnumber>
				<date>2010-01-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:file-exists" as="xs:boolean" use-when="not(function-available('java-file:exists')) and not(function-available( 'saxon:file-last-modified' ) or function-available( 'saxon:last-modified' ) )" intern:solved="MissingTests">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:sequence select="false()"/>
		<xsl:call-template name="xsb:internals.FunctionError">
			<xsl:with-param name="caller">intern:file-exists()</xsl:with-param>
			<xsl:with-param name="level">FATAL</xsl:with-param>
			<xsl:with-param name="message">Keine Möglichkeit zur Ermittlung, ob eine Datei existiert (Vendor-Hash: "<xsl:sequence select="xsb:current-vendor-hash()"/>")</xsl:with-param>
		</xsl:call-template>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:mediatype-from-url     __________ -->
	<doc:function>
		<doc:param name="URLwithFileExtension"><para>URL, aus dessen file extension der Mediatype ermittelt werden soll.</para></doc:param>
		<doc:param name="warn-if-wrong-input"><para>Soll eine Warnung ausgegeben werden, wenn der Mediatyp nicht ermittelt werden kann?</para></doc:param>
		<para xml:id="mediatype-from-url">Diese Funktion ermittelt aus der Dateierweiterung den Mediatyp (auch <code>MIME-Typ</code> genannt).</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen Dateierweiterung gibt einen Leerstring und – in Abhängigkeit von <code>warn-if-wrong-input</code> – 
			ggfs. eine Warnung zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.41</revnumber>
				<date>2012-02-04</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Umstellung auf stylesheet-interne Tabelle und dadurch mehr Mediatypes und Extensions</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.90</revnumber>
				<date>2010-04-23</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:mediatype-from-url" as="xs:string">
		<xsl:param name="URLwithFileExtension" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:variable name="temp" as="xs:string" select="lower-case(xsb:fileExtention-from-url($URLwithFileExtension))"/>
		<xsl:variable name="lines" as="element()*" select="document('')//intern:table[@xml:id eq 'mimetypes-extensions']/intern:l[intern:e eq $temp]"/>
		<xsl:choose>
			<xsl:when test="not(normalize-space($temp))"><xsl:sequence select=" '' "/></xsl:when>
			<!-- TODO: look into xml and detect media types like docbook's application/docbook+xml -->
			<xsl:when test="$lines">
				<xsl:sequence select="xs:string($lines[1]/intern:m)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="message">Media-Type für "<xsl:sequence select="$URLwithFileExtension"/>" konnte nicht ermittelt werden, Leerstring zurückgegeben.</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="caller">xsb:mediatype-from-url</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!-- basiert auf https://github.com/fcrepo/fcrepo/blob/master/resources/server/org/fcrepo/server/resources/MIMETypes.properties -->
	<!-- mit geringen Änderungen -->
	<!-- bei mehrfachen Einträgen (wiederholter Mediatype oder wiederholte Extension) wird der erste Eintrag in Dokumentenreihenfolge verwendet. -->
	<table xmlns="http://www.expedimentum.org/XSLT/SB/intern" xml:id="mimetypes-extensions">
		<l><m>application/andrew-inset</m><e>ez</e></l>
		<l><m>application/excel</m><e>xls</e></l>
		<l><m>application/mac-binhex40</m><e>hqx</e></l>
		<l><m>application/mac-compactpro</m><e>cpt</e></l>
		<l><m>application/mathml+xml</m><e>mathml</e></l>
		<l><m>application/msword</m><e>doc</e></l>
		<l><m>application/octet-stream</m><e>bin</e></l>
		<l><m>application/oda</m><e>oda</e></l>
		<l><m>application/ogg</m><e>ogg</e></l>
		<l><m>application/pdf</m><e>pdf</e></l>
		<l><m>application/pgp</m><e>pgp</e></l>
		<l><m>application/pgp-encrypted</m><e>pgp</e></l>
		<l><m>application/pgp-keys</m><e>pgp</e></l>
		<l><m>application/pgp-signature</m><e>sig</e></l>
		<l><m>application/postscript</m><e>ps</e></l>
		<l><m>application/postscript</m><e>ai</e></l>
		<l><m>application/postscript</m><e>eps</e></l>
		<l><m>application/rdf+xml</m><e>rdf</e></l>
		<l><m>application/rdf</m><e>rdf</e></l>
		<l><m>application/rtf</m><e>rtf</e></l>
		<l><m>application/smil</m><e>smil</e></l>
		<l><m>application/smil</m><e>smi</e></l>
		<l><m>application/srgs</m><e>gram</e></l>
		<l><m>application/srgs+xml</m><e>grxml</e></l>
		<l><m>application/vnd.mif</m><e>mif</e></l>
		<l><m>application/vnd.mozilla.xul+xml</m><e>xul</e></l>
		<l><m>application/vnd.ms-excel</m><e>xls</e></l>
		<l><m>application/vnd.ms-powerpoint</m><e>ppt</e></l>
		<l><m>application/vnd.ms-project</m><e>mpp</e></l>
		<l><m>application/vnd.ms-tnef</m><e>tnef</e></l>
		<l><m>application/vnd.rn-realmedia</m><e>rm</e></l>
		<l><m>application/vnd.wap.wbxml</m><e>wbxml</e></l>
		<l><m>application/vnd.wap.wmlc</m><e>wmlc</e></l>
		<l><m>application/vnd.wap.wmlscriptc</m><e>wmlsc</e></l>
		<l><m>application/voicexml+xml</m><e>vxml</e></l>
		<l><m>application/x-arj-compressed</m><e>arj</e></l>
		<l><m>application/x-bcpio</m><e>bcpio</e></l>
		<l><m>application/x-cdlink</m><e>vcd</e></l>
		<l><m>application/x-chess-pgn</m><e>pgn</e></l>
		<l><m>application/x-compress</m><e>Z</e></l>
		<l><m>application/x-cpio</m><e>cpio</e></l>
		<l><m>application/x-csh</m><e>csh</e></l>
		<l><m>application/x-debian-package</m><e>deb</e></l>
		<l><m>application/x-director</m><e>dcr</e></l>
		<l><m>application/x-director</m><e>dir</e></l>
		<l><m>application/x-director</m><e>dxr</e></l>
		<l><m>application/x-dtbncx+xml</m><e>ncx</e></l>
		<l><m>application/x-dvi</m><e>dvi</e></l>
		<l><m>application/x-futuresplash</m><e>spl</e></l>
		<l><m>application/x-gtar</m><e>gtar</e></l>
		<l><m>application/x-gunzip</m><e>gz</e></l>
		<l><m>application/x-gzip</m><e>gz</e></l>
		<l><m>application/x-hdf</m><e>hdf</e></l>
		<l><m>application/x-javascript</m><e>js</e></l>
		<l><m>application/x-koan</m><e>skp</e></l>
		<l><m>application/x-koan</m><e>skd</e></l>
		<l><m>application/x-koan</m><e>skt</e></l>
		<l><m>application/x-koan</m><e>skm</e></l>
		<l><m>application/x-latex</m><e>latex</e></l>
		<l><m>application/x-mif</m><e>mif</e></l>
		<l><m>application/x-msdos-program</m><e>exe</e></l>
		<l><m>application/x-netcdf</m><e>cdf</e></l>
		<l><m>application/x-netcdf</m><e>nc</e></l>
		<l><m>application/x-netcdf</m><e>nc</e></l>
		<l><m>application/x-perl</m><e>pl</e></l>
		<l><m>application/x-perl</m><e>pm</e></l>
		<l><m>application/x-python</m><e>py</e></l>
		<l><m>application/x-rar-compressed</m><e>rar</e></l>
		<l><m>application/x-sh</m><e>sh</e></l>
		<l><m>application/x-shar</m><e>shar</e></l>
		<l><m>application/x-shockwave-flash</m><e>swf</e></l>
		<l><m>application/x-stuffit</m><e>sit</e></l>
		<l><m>application/x-sv4cpio</m><e>sv4cpio</e></l>
		<l><m>application/x-sv4crc</m><e>sv4crc</e></l>
		<l><m>application/x-tar</m><e>tar</e></l>
		<l><m>application/x-tar-gz</m><e>tgz</e></l>
		<l><m>application/x-tcl</m><e>tcl</e></l>
		<l><m>application/x-tex</m><e>tex</e></l>
		<l><m>application/x-texinfo</m><e>texi</e></l>
		<l><m>application/x-texinfo</m><e>texinfo</e></l>
		<l><m>application/x-troff</m><e>t</e></l>
		<l><m>application/x-troff</m><e>tr</e></l>
		<l><m>application/x-troff</m><e>troff</e></l>
		<l><m>application/x-troff-man</m><e>man</e></l>
		<l><m>application/x-troff-me</m><e>me</e></l>
		<l><m>application/x-troff-ms</m><e>ms</e></l>
		<l><m>application/x-ustar</m><e>ustar</e></l>
		<l><m>application/x-wais-source</m><e>src</e></l>
		<l><m>application/x-zip-compressed</m><e>zip</e></l>
		<l><m>application/xhtml+xml</m><e>xhtml</e></l>
		<l><m>application/xhtml+xml</m><e>xht</e></l>
		<l><m>application/xhtml</m><e>xhtml</e></l>
		<l><m>application/xhtml</m><e>xht</e></l>
		<l><m>application/xml</m><e>xml</e></l>
		<l><m>application/xml-dtd</m><e>dtd</e></l>
		<l><m>application/xslt+xml</m><e>xslt</e></l>
		<l><m>application/xslt</m><e>xslt</e></l>
		<l><m>application/zip</m><e>zip</e></l>
		<l><m>audio/basic</m><e>au</e></l>
		<l><m>audio/midi</m><e>mid</e></l>
		<l><m>audio/midi</m><e>midi</e></l>
		<l><m>audio/mpeg</m><e>mpa</e></l>
		<l><m>audio/ulaw</m><e>au</e></l>
		<l><m>audio/ulaw</m><e>snd</e></l>
		<l><m>audio/x-aiff</m><e>aif</e></l>
		<l><m>audio/x-mpegurl</m><e>m3u</e></l>
		<l><m>audio/x-pn-realaudio</m><e>ram</e></l>
		<l><m>audio/x-wav</m><e>wav</e></l>
		<l><m>chemical/x-pdb</m><e>pdb</e></l>
		<l><m>chemical/x-xyz</m><e>xyz</e></l>
		<l><m>image/bmp</m><e>bmp</e></l>
		<l><m>image/cgm</m><e>cgm</e></l>
		<l><m>image/g3fax</m><e>fax</e></l>
		<l><m>image/gif</m><e>gif</e></l>
		<l><m>image/ief</m><e>ief</e></l>
		<l><m>image/jpeg</m><e>jpg</e></l>
		<l><m>image/jpeg</m><e>jpeg</e></l>
		<l><m>image/png</m><e>png</e></l>
		<l><m>image/svg+xml</m><e>svg</e></l>
		<l><m>image/tiff</m><e>tif</e></l>
		<l><m>image/tiff</m><e>tiff</e></l>
		<l><m>image/vnd.djvu</m><e>djvu</e></l>
		<l><m>image/vnd.wap.wbmp</m><e>wbmp</e></l>
		<l><m>image/x-cmu-raster</m><e>ras</e></l>
		<l><m>image/x-icon</m><e>ico</e></l>
		<l><m>image/x-portable-anymap</m><e>pnm</e></l>
		<l><m>image/x-portable-bitmap</m><e>pbm</e></l>
		<l><m>image/x-portable-graymap</m><e>pgm</e></l>
		<l><m>image/x-portable-pixmap</m><e>ppm</e></l>
		<l><m>image/x-rgb</m><e>rgb</e></l>
		<l><m>image/x-xbitmap</m><e>xbm</e></l>
		<l><m>image/x-xpixmap</m><e>xpm</e></l>
		<l><m>image/x-xwindowdump</m><e>xwd</e></l>
		<l><m>model/iges</m><e>igs</e></l>
		<l><m>model/mesh</m><e>msh</e></l>
		<l><m>model/vrml</m><e>vrml</e></l>
		<l><m>text/calendar</m><e>ics</e></l>
		<l><m>text/css</m><e>css</e></l>
		<l><m>text/html</m><e>html</e></l>
		<l><m>text/plain</m><e>txt</e></l>
		<l><m>text/richtext</m><e>rtx</e></l>
		<l><m>text/rtf</m><e>rtf</e></l>
		<l><m>text/sgml</m><e>sgml</e></l>
		<l><m>text/tab-separated-values</m><e>tsv</e></l>
		<l><m>text/vnd.wap.wml</m><e>wml</e></l>
		<l><m>text/vnd.wap.wmlscript</m><e>wmls</e></l>
		<l><m>text/x-setext</m><e>etx</e></l>
		<l><m>text/xml</m><e>xml</e></l>
		<l><m>video/dl</m><e>dl</e></l>
		<l><m>video/fli</m><e>fli</e></l>
		<l><m>video/gl</m><e>gl</e></l>
		<l><m>video/mpeg</m><e>mpg</e></l>
		<l><m>video/quicktime</m><e>mov</e></l>
		<l><m>video/vnd.mpegurl</m><e>mxu</e></l>
		<l><m>video/x-msvideo</m><e>avi</e></l>
		<l><m>video/x-sgi-movie</m><e>movie</e></l>
		<l><m>x-conference/x-cooltalk</m><e>ice</e></l>
		<l><m>x-world/x-vrml</m><e>vrml</e></l>
	</table>
	<doc:function>
		<doc:param name="URLwithFileExtension"><para>URL, aus dessen file extension der Mediatype ermittelt werden soll.</para></doc:param>
		<para xml:id="mediatype-from-url_shortcut">Shortcut für <function>xsb:mediatype-from-url($URLwithFileExtension, true())</function>.</para>
		<para></para>
		<revhistory>
			<revision>
				<revnumber>0.90</revnumber>
				<date>2010-04-23</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:mediatype-from-url" as="xs:string">
		<xsl:param name="URLwithFileExtension" as="xs:string?"/>
		<xsl:sequence select="xsb:mediatype-from-url($URLwithFileExtension, true())"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:file-extension-from-mediatype     __________ -->
	<doc:function>
		<doc:param name="mediatype"><para>Mediatype, aus dem die Dateierweiterung ermittelt werden soll.</para></doc:param>
		<doc:param name="warn-if-wrong-input"><para>Soll eine Warnung ausgegeben werden, wenn die Dateierweiterung nicht ermittelt werden kann?</para></doc:param>
		<para xml:id="file-extension-from-mediatype">Diese Funktion ermittelt aus dem Mediatyp (auch <code>MIME-Typ</code> genannt) die Dateierweiterung.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe eines ungültigen Mediatypes gibt einen Leerstring und – in Abhängigkeit von <code>warn-if-wrong-input</code> – 
			ggfs. eine Warnung zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.41</revnumber>
				<date>2012-02-04</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:file-extension-from-mediatype" as="xs:string">
		<xsl:param name="mediatype" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:variable name="temp" as="xs:string?" select="lower-case(normalize-space($mediatype) )"/>
		<xsl:variable name="lines" as="element()*" select="document('')//intern:table[@xml:id eq 'mimetypes-extensions']/intern:l[intern:m eq $temp]"/>
		<xsl:choose>
			<xsl:when test="$mediatype eq '' "><xsl:sequence select=" '' "/></xsl:when>
			<xsl:when test="$lines">
				<xsl:sequence select="xs:string($lines[1]/intern:e)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="message">Dateierweiterung für "<xsl:sequence select="$mediatype"/>" konnte nicht ermittelt werden, Leerstring zurückgegeben.</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="caller">xsb:file-extension-from-mediatype</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<doc:function>
		<doc:param name="mediatype"><para>Mediatype, aus dem die Dateierweiterung ermittelt werden soll.</para></doc:param>
		<para xml:id="file-extension-from-mediatype_shortcut">Shortcut für <function>xsb:file-extension-from-mediatype($mediatype, true())</function>.</para>
		<para></para>
		<revhistory>
			<revision>
				<revnumber>0.2.41</revnumber>
				<date>2012-02-04</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:file-extension-from-mediatype" as="xs:string">
		<xsl:param name="mediatype" as="xs:string?"/>
		<xsl:sequence select="xsb:file-extension-from-mediatype($mediatype, true())"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:decode-from-url()     __________ -->
	<doc:function>
		<doc:param name="URL"><para>zu konvertierende URL</para></doc:param>
		<para xml:id="decode-from-url">wandelt Hex-codierte Zeichen in URLs in Zeichen um.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
		<para>Zeichen außerhalb des in URLs darstellbaren ASCII-Zeichenvorrats (Codepoints 127 oder kleiner 32) werden encodiert belassen.</para>
		<itemizedlist>
			<title>Beispiele</title>
			<listitem>
				<para><function>xsb:decode-from-url('')</function> ergibt den Leerstring</para>
			</listitem>
			<listitem>
				<para><function>xsb:decode-from-url('file')</function> ergibt »<code>file</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:decode-from-url('%3b%4f')</function> ergibt »<code>;O</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:decode-from-url('%17')</function> ergibt »<code>%17</code>«</para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.50</revnumber>
				<date>2012-05-27</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:decode-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="$URL and xsb:is-url($URL)">
				<xsl:variable name="temp" as="xs:string*">
					<xsl:analyze-string select="$URL" regex="%[0-9A-Fa-f]{{2}}">
						<xsl:matching-substring>
							<xsl:variable name="codepoint" as="xs:integer" select="xsb:hex-to-integer(substring(., 2, 2) )"/>
							<xsl:choose>
								<xsl:when test="($codepoint ge 32) and ($codepoint le 126)">
									<xsl:sequence select="codepoints-to-string($codepoint)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:sequence select="."/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:matching-substring>
						<xsl:non-matching-substring>
							<xsl:sequence select="."/>
						</xsl:non-matching-substring>
					</xsl:analyze-string>
				</xsl:variable>
				<xsl:sequence select="string-join($temp, '')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
