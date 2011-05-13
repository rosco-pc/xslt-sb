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
	xmlns:saxon="http://saxon.sf.net/"
	xmlns:java-file="java:java.io.File"
	xmlns:java-uri="java:java.net.URI"
	exclude-result-prefixes="doc docv xsb intern java-file"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:import href="internals.xsl"/>
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
		<para>Diese Funktion überprüft, ob die angegebene URL absolut ist. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion überprüft, ob die angegebene URL relativ ist. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion überprüft, ob die angegebene URL ausschließlich einen Netzwerk-Server referenziert, d.h. keinen lokalen Teil hat. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion überprüft, ob die angegebene URL einen Authority-Teil hat. Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
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
		<para>Diese Funktion überprüft, ob die angegebene URL ein Pfad ist, d.h. es wird durch die URL keine Datei referenziert. 
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
		<para>Diese Funktion überprüft, ob die angegebene URL nur aus Pfad-Shortcuts ("/", ".", "..") besteht. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion überprüft, ob der eingegebene String eine gültige URL gemäß <link xlink:href="http://tools.ietf.org/html/rfc1808">RFC 1808</link> ist. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion überprüft, ob die angegebene URL einen Query-Teil hat. Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
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
		<para>Diese Funktion gibt den Query-Teil von einer URL zurück.</para>
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
		<para>Diese Funktion überprüft, ob die angegebene URL einen Fragment-Teil (eine Referenz auf einen Dokumenten-Teil nach einem Hash-Zeichen <code>#</code>) hat. Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
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
		<para>Diese Funktion gibt den Fragment-Teil von einer URL zurück.</para>
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
		<para>Diese Funktion gibt den scheme-Teil von einer absoluten URL zurück.</para>
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
		<para>Diese Funktion entfernt Query- und Fragment-Teil von einer URL.</para>
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
		<para>Diese Funktion gibt Dateinamen und Dateierweiterung aus einer URL zurück.</para>
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
		<para>Diese Funktion ermittelt eine eventuelle Dateierweiterung aus einer URL.</para>
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
		<para>Diese Funktion überprüft, ob die angegebene URL einen Dateinamen beinhaltet, und ob dieser Dateiname eine Dateierweiterung hat. Das Ergebnis ist ein Wahrheitswert (<code>xs:boolean</code>, <code>true()</code> oder <code>false()</code>). </para>
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
		<para>Diese Funktion ermittelt einen Dateinamen ohne eventuelle Dateierweiterung aus einer URL.</para>
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
		<para>Diese Funktion ermittelt einen Pfad ohne eventuelle Dateinamen und Dateierweiterung aus einer URL.</para>
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
	<!-- __________     misc:file-exist()     __________ -->
	<doc:function>
		<doc:param name="absoluteURL"><para>Absoluter Pfad zur zu überprüfenden Datei.</para></doc:param>
		<para>Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
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
			<xsl:when test="not(xsb:scheme-from-url($absoluteURL_cleaned) = 'file' )">
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
		<para>Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert 
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
		<para>Diese Funktion wird aufgerufen, wenn weder Java noch Saxon-spezifische Funktionen vorhanden sind.
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
			<xsl:with-param name="caller">xsb:document-exists()</xsl:with-param>
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
		<para>Diese Funktion ermittelt aus der Dateierweiterung den Mediatyp (auch <code>MIME-Typ</code> genannt).</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.</para>
		<para>Die Eingabe einer ungültigen Dateierweiterung gibt einen Leerstring und – in Abhängigkeit von <code>warn-if-wrong-input</code> – 
			ggfs. eine Warnung zurück.</para>
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
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:variable name="temp" as="xs:string" select="lower-case(xsb:fileExtention-from-url($URLwithFileExtension))"/>
		<xsl:choose>
			<xsl:when test="$temp = '' "><xsl:sequence select=" '' "/></xsl:when>
			<xsl:when test="$temp = 'css' ">text/css</xsl:when>
			<xsl:when test="$temp = 'gif' ">image/gif</xsl:when>
			<xsl:when test="$temp = 'jpg' ">image/jpeg</xsl:when>
			<xsl:when test="$temp = 'jpeg' ">image/jpeg</xsl:when>
			<xsl:when test="$temp = 'ncx' ">application/x-dtbncx+xml</xsl:when>
			<xsl:when test="$temp = 'pdf' ">application/pdf</xsl:when>
			<xsl:when test="$temp = 'png' ">image/png</xsl:when>
			<xsl:when test="$temp = 'svg' ">image/svg+xml</xsl:when>
			<xsl:when test="$temp = 'rdf' ">application/rdf+xml</xsl:when>
			<xsl:when test="$temp = 'tif' ">image/tiff</xsl:when>
			<xsl:when test="$temp = 'txt' ">text/plain</xsl:when>
			<xsl:when test="$temp = 'xhtml' ">application/xhtml+xml</xsl:when>
			<!-- application/xml ist allgemeiner als text/xml -->
			<!-- TODO: look into xml and detect media types like docbook's application/docbook+xml -->
			<xsl:when test="$temp = 'xml' ">application/xml</xsl:when>
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
	<doc:function>
		<doc:param name="URLwithFileExtension"><para>URL, aus dessen file extension der Mediatype ermittelt werden soll.</para></doc:param>
		<para>Shortcut für <function>xsb:mediatype-from-url($URLwithFileExtension, true())</function>.</para>
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
	<!--  -->
</xsl:stylesheet>
