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
	<!--  -->
	<doc:doc filename="strings.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Strings und Texte</doc:title>
		<para>Dieses Stylesheet enthält Funktionen für Strings und Texte.</para>
		<para>Da für Testroutinen Funktionen und Templates aus <code>internals.xsl</code> benötigt werden, wird dieses Stylesheet in <code><link xlink:href="strings_tests.html">strings_tests.xsl</link></code> getestet.</para>
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
				<revnumber>0.2.49</revnumber>
				<date>2012-05-18</date>
				<authorinitials>Stf</authorinitials>
				<revremark>neue Funktionen: <code>xsb:escape-for-replacement()</code>;
					überarbeitet: <code>xsb:trim-left()</code>, <code>xsb:trim-right()</code>;
					erweiter: <code>xsb:listed()</code></revremark>
			</revision>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-15</date>
				<authorinitials>Stf</authorinitials>
				<revremark>neue Funktionen: <code>xsb:sort()</code>, <code>xsb:escape-for-regex()</code>, <code>xsb:count-matches()</code></revremark>
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
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Umstellung auf Namespaces <code>xsb:</code> und <code>intern:</code></revremark>
			</revision>
			<revision>
				<revnumber>0.36</revnumber>
				<date>2009-08-02</date>
				<authorinitials>Stf</authorinitials>
				<revremark>initiale Version</revremark>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Funktionen     ==================== -->
	<!--  -->
	<!--  -->
	<!-- __________     xsb:lax-string-compare()     __________ -->
	<doc:function>
		<doc:param name="input"><para>Eingabe (String)</para></doc:param>
		<doc:param name="compare-to"><para>Vergleichswert (String)</para></doc:param>
		<para xml:id="lax-string-compare">Verarbeitet Eingabe und Vergleichswert mit <function>normalize-space()</function> und <function>lower-case()</function> und vergleicht dann Eingabe und Vergleichswert. Dadurch werden kleine Differenzen ignoriert.</para>
		<revhistory>
			<revision>
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:lax-string-compare" as="xs:boolean">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="compare-to" as="xs:string?"/>
		<xsl:sequence select="normalize-space(lower-case($input)) eq normalize-space(lower-case($compare-to))"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:return-default-if-empty()     __________ -->
	<doc:function>
		<doc:param name="input"><para>Eingabe (String)</para></doc:param>
		<doc:param name="default"><para>Standardwert (String)</para></doc:param>
		<para xml:id="return-default-if-empty">gibt einen übergebenen Standardwert aus, wenn der übergeben String leer ist oder nur Whitespace enthält, sonst den String selbst</para>
		<para>Wenn der übergebene Standardwert eine Leersequenz ist, wird ein Leerstring zurückgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:return-default-if-empty" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="default" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($input)">
				<xsl:sequence select="$input"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat('', $default)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:trim-left()     __________ -->
	<doc:function>
		<doc:param name="input"><para>Eingabe (String)</para></doc:param>
		<para xml:id="trim-left">entfernt führenden Whitespace</para>
		<revhistory>
			<revision>
				<revnumber>0.2.48</revnumber>
				<date>2012-05-18</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>auf <code>fn:replace()</code> umgeschrieben</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:trim-left" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="concat('', replace($input, '^\s+', '') )"></xsl:sequence>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:trim-right()     __________ -->
	<doc:function>
		<doc:param name="input"><para>Eingabe (String)</para></doc:param>
		<para xml:id="trim-right">entfernt Whitespace am Ende eines Strigs</para>
		<revhistory>
			<revision>
				<revnumber>0.2.48</revnumber>
				<date>2012-05-18</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>auf <code>fn:replace()</code> umgeschrieben</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:trim-right" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="concat('', replace($input, '\s+$', '') )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:trim()     __________ -->
	<doc:function>
		<doc:param name="input"><para>Eingabe (String)</para></doc:param>
		<para xml:id="trim">entfernt Whitespace am Anfang und am Ende. Im Unterschied zu <function>normalize-space()</function> wird Whitespace in der Mitte nicht berücksichtigt.</para>
		<revhistory>
			<revision>
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:trim" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="xsb:trim-left(xsb:trim-right($input))"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:normalize-paragraphs()     __________ -->
	<doc:function>
		<doc:param name="input"><para>Eingabe (String)</para></doc:param>
		<para xml:id="normalize-paragraphs">ersetzt mehrfache Zeilenwechsel durch einen einzelnen Zeilenwechsel. Im Unterschied zu <function>normalize-space()</function> wird ein Zeilenwechsel aber erhalten.</para>
		<para>rekursiver Algorithmus: die Funktion ruft sich solange selbst auf, bis keine mehrfachen Zeilenwechsel in der Eingabe vorhanden sind.</para>
		<para>Da die Eingabe sinnvoll eine Leersequenz sein kann, ist die Rückgabe einer Leersequenze erlaubt.</para>
		<revhistory>
			<revision>
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:normalize-paragraphs" as="xs:string?" intern:solved="EmptySequenceAllowed">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:choose>
			<!-- Windows: &#x0A;&#x0D; -->
			<xsl:when test="matches($input, '&#x0A;&#x0D;&#x0A;&#x0D;', 'm' )">
				<xsl:sequence select="xsb:normalize-paragraphs(replace($input, '&#x0A;&#x0D;&#x0A;&#x0D;', '&#x0A;&#x0D;', 'm'))"/>
			</xsl:when>
			<!-- Unix: &#x0A; -->
			<xsl:when test="matches($input, '&#x0A;&#x0A;', 'm' )">
				<xsl:sequence select="xsb:normalize-paragraphs(replace($input, '&#x0A;&#x0A;', '&#x0A;', 'm'))"/>
			</xsl:when>
			<!-- Mac: &#x0D; -->
			<xsl:when test="matches($input, '&#x0D;&#x0D;', 'm' )">
				<xsl:sequence select="xsb:normalize-paragraphs(replace($input, '&#x0D;&#x0D;', '&#x0D;', 'm'))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$input"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:listed     __________ -->
	<doc:function>
		<doc:param name="list"><para>Whitespace-getrennte Liste von String-Token</para></doc:param>
		<doc:param name="item"><para>String-Token, auf dessen Existenz getestet werden soll</para></doc:param>
		<para xml:id="listed">Diese Funktion überprüft, ob in einer Leerzeichen-getrennten Liste ein bestimmter Eintrag vorhanden ist.</para>
		<para>Die Eingabe eines Leerstrings oder einer Leersequenz als Parameter <code>list</code> ergibt <code>false()</code>.</para>
		<para>Die Eingabe eines Leerstrings oder einer Leersequenz als Parameter <code>item</code> ergibt <code>false()</code>.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.48</revnumber>
				<date>2012-05-18</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>neben Leerzeichen ist jetzt auch anderer Whitespace zum Trennen der String-Token erlaubt</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.69</revnumber>
				<date>2009-12-05</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:listed" as="xs:boolean">
		<xsl:param name="list" as="xs:string?"/>
		<xsl:param name="item" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="some $i in tokenize($list, '\s+') satisfies ($i eq $item)"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- __________     xsb:return-composed-string-if-not-empty   __________ -->
	<doc:function>
		<doc:param name="tested-string"><para>getesteter String</para></doc:param>
		<doc:param name="string-before"><para>String, der vor dem getesteten String eingefügt werden soll</para></doc:param>
		<doc:param name="string-after"><para>String, der nach dem getesteten String eingefügt werden soll</para></doc:param>
		<para xml:id="return-composed-string-if-not-empty">Diese Funktion fügt vor und nach dem zu testenden String die übergebenen Strings ein, wenn der zu testende String nicht leer ist.</para>
		<para>Mit dieser Funktion wird die Erzeugung von bedingten Texten vereinfacht, bspw. das Einfügen von Kommata oder Doppelpunkten nach einem Text.</para>
		<revhistory>
			<revision>
				<revnumber>0.96</revnumber>
				<date>2010-06-27</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:return-composed-string-if-not-empty" as="xs:string">
		<xsl:param name="string-before" as="xs:string?"/>
		<xsl:param name="tested-string" as="xs:string?"/>
		<xsl:param name="string-after" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($tested-string)">
				<xsl:sequence select="concat($string-before, $tested-string, $string-after)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:encode-for-id()     __________ -->
	<doc:function>
		<doc:param name="input"><para>Eingabe (String)</para></doc:param>
		<para xml:id="encode-for-id">wandelt einen eingegebenen String in eine xs:ID um, indem verbotene Zeichen ersetzt werden</para>
		<revhistory>
			<revision>
				<revnumber>0.124</revnumber>
				<date>2010-10-10</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:encode-for-id" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="concat(translate(encode-for-uri(translate(normalize-space($input), ' ', '_')), '%', 'x'), '')"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:sort()     __________ -->
	<doc:function>
		<doc:param name="input-sequence"><para>Sequenz von <code>atomic values</code></para></doc:param>
		<para xml:id="sort_2">Shortcut für <function><link linkend="sort">xsb:sort($input-sequence, 'ascending')</link></function></para>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-14</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:sort" as="xs:anyAtomicType*" intern:solved="EmptySequenceAllowed">
		<xsl:param name="input-sequence" as="xs:anyAtomicType*"/>
		<xsl:sequence select="xsb:sort($input-sequence, 'ascending')"/>
	</xsl:function>
	<doc:function>
		<doc:param name="input-sequence"><para>Sequenz von <code>atomic values</code></para></doc:param>
		<doc:param name="order"><para>»<code>ascending</code>«/»<code>descending</code>«</para></doc:param>
		<para xml:id="sort">sortiert <code>atomic values</code></para>
		<para>Die Implementierung folgt dem <link xlink:href="http://www.w3.org/TR/2007/REC-xslt20-20070123/#d5e20205">XSLT&#160;Beispiel aus dem 2.0-Standard</link>.</para>
		<para>Die Werte in der Sequenz müssen mit <code>lt</code> vergleichbar sein. Insbesondere scheitert das Sortieren von gemischten Sequenzen aus Strings und Zahlen.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-14</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:sort" as="xs:anyAtomicType*" intern:solved="EmptySequenceAllowed">
		<xsl:param name="input-sequence" as="xs:anyAtomicType*"/>
		<xsl:param name="order" as="xs:string"/>
		<xsl:perform-sort select="$input-sequence">
			<xsl:sort select="." order="{$order}"/>
		</xsl:perform-sort>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:escape-for-regex()     __________ -->
	<doc:function>
		<doc:param name="input"><para>String, der escapet werden soll</para></doc:param>
		<para xml:id="escape-for-regex">escapet Steuerzeichen in regulären Ausdrücken mit »<code>\</code>«</para>
		<para>Ist <code>input</code> die Leersequenz, wird der Leerstring zurückgegeben.</para>
		<itemizedlist>
			<title>Beispiele</title>
			<listitem>
				<para><function>xsb:escape-for-regex('Jan.')</function> ergibt »<code>Jan\.</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:escape-for-regex('^1.200$')</function> ergibt »<code>\^1\.200\$</code>«</para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-15</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:escape-for-regex" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="concat('', replace($input, '[\\*.+?^$()\[\]{}|]', '\\$0') )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:escape-for-replacement()     __________ -->
	<doc:function>
		<doc:param name="input"><para>String, der escapet werden soll</para></doc:param>
		<para xml:id="escape-for-replacement">escapet Steuerzeichen in Ersetzungstexten für <code>fn:replace()</code> (»<code>\</code>« und »<code>$</code>«) mit »<code>\</code>«</para>
		<para>Ist <code>input</code> die Leersequenz, wird der Leerstring zurückgegeben.</para>
		<itemizedlist>
			<title>Beispiele</title>
			<listitem>
				<para><function>xsb:escape-for-replacement('$0')</function> ergibt »<code>\$0</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:escape-for-replacement('\1.200$')</function> ergibt »<code>\\1.200\$</code>«</para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.48</revnumber>
				<date>2012-05-17</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:escape-for-replacement" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="concat('', replace($input, '[\\$]', '\\$0') )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:count-matches()     __________ -->
	<doc:function>
		<doc:param name="string"><para>String, in dem gezählt wird</para></doc:param>
		<doc:param name="regex"><para>regulärer Ausdruck, nach dem in <code>string</code> gesucht wird</para></doc:param>
		<doc:param name="flags"><para>flags analog zum <code>flags</code>-Parameter von <function>fn:matches()</function>
			(siehe <emphasis>XQuery 1.0 and XPath 2.0 Functions and Operators (Second Edition)</emphasis>,
			<link xlink:href="http://www.w3.org/TR/xpath-functions/#flags">7.6.6.1 Flags</link>)</para></doc:param>
		<para xml:id="count-matches">zählt das Vorkommen eines Suchstrings in einem String</para>
		<para>Sind <code>string</code> oder <code>regex</code> Leerstring oder die Leersequenz, wird <code>0</code> zurückgegeben.</para>
		<itemizedlist>
			<title>Beispiele</title>
			<listitem>
				<para><function>xsb:count-matches('abc def abc', 'def')</function> ergibt »<code>1</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:count-matches('abc def abc', 'abc')</function> ergibt »<code>2</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:count-matches('abc', '[ab]')</function> ergibt »<code>2</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:count-matches('abc', '[ab]+')</function> ergibt »<code>1</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:count-matches('Aa', 'a', '')</function> ergibt »<code>1</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:count-matches('Aa', 'a', 'i')</function> ergibt »<code>2</code>«</para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-15</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:count-matches" as="xs:integer">
		<xsl:param name="string" as="xs:string?"/>
		<xsl:param name="regex" as="xs:string?"/>
		<xsl:param name="flags" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($string) and normalize-space($regex)">
				<xsl:sequence select="count(tokenize($string, $regex, $flags)) - 1"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<doc:function>
		<doc:param name="string"><para>String, in dem gezählt wird</para></doc:param>
		<doc:param name="regex"><para>regulärer Ausdruck, nach dem in <code>string</code> gesucht wird</para></doc:param>
		<para xml:id="count-matches_2">Shortcut für <function><link linkend="count-matches">xsb:count-matches($string, $regex, '')</link></function></para>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-16</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:count-matches" as="xs:integer">
		<xsl:param name="string" as="xs:string?"/>
		<xsl:param name="regex" as="xs:string?"/>
		<xsl:sequence select="xsb:count-matches($string, $regex, '')"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:replace()     __________ -->
	<doc:function>
		<doc:param name="input"><para>String, in dem ersetzt wird</para></doc:param>
		<doc:param name="pattern"><para>Sequenz von regulären Ausdrücken, nach denen in <code>input</code> gesucht wird</para></doc:param>
		<doc:param name="replacement"><para>Sequenz von Ersetzungstexten</para></doc:param>
		<doc:param name="flags"><para>flags analog zum <code>flags</code>-Parameter von <function>fn:replace()</function>
			(siehe <emphasis>XQuery 1.0 and XPath 2.0 Functions and Operators (Second Edition)</emphasis>,
			<link xlink:href="http://www.w3.org/TR/xpath-functions/#flags">7.6.6.1 Flags</link>)</para></doc:param>
		<para xml:id="replace">führt wiederholtes paarweises Suchen und Ersetzen über einen String aus</para>
		<para>Diese Funktion vereinfachte wiederholtes Suchen und Ersetzen über den selben String. Für jeden Wert aus der
			<code>pattern</code>-Sequenz wird ein <function>fn:replace()</function> mit dem korrespondierenden Wert (selbe Position)
			aus der <code>replacement</code>-Sequenz über den Eingabe-String ausgeführt. Sind in der <code>replacement</code>-Sequenz
			weniger Werte als in der <code>pattern</code>-Sequenz, werden (analog zu <function>fn:translate()</function>) die Fundstellen der »überzähligen« Pattern gelöscht.</para>
		<para>Ist <code>input</code> der Leerstring oder die Leersequenz, wird ein Leerstring zurückgegeben.</para>
		<para>Ist <code>pattern</code> der Leerstring oder die Leersequenz, wird <code>input</code> unverändert zurückgegeben
			(Ausnahme: Wenn <code>input</code> die Leersequenz ist, wird ein Leerstring zurückgegeben).</para>
		<para>Ist <code>replacement</code> der Leerstring, wird jeder Treffer von <code>pattern</code> in <code>input</code> gelöscht.</para>
		<para><emphasis render="bold">Achtung: </emphasis>eine Leersequenz innerhalb der pattern- oder replacement-Sequenz »verschwindet« aus der Sequenz,
			d.h. die nachfolgenden Werte rücken eine Position nach vorn. Das wird in der Regel nicht der gewünschte Effekt sein!</para>
		<itemizedlist>
			<title>Beispiele</title>
			<listitem>
				<para><function>xsb:replace('Affe Bär Elefant', ('Affe', 'Elefant') , ('monkey', 'elephant') )</function> ergibt »<code>monkey Bär elephant</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:replace('Affe Bär Elefant', ('Affe', 'Elefant') , ('monkey', '') )</function> ergibt »<code>monkey Bär </code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:replace('Affe Bär Elefant', ('Affe', 'Elefant') , ('monkey') )</function> ergibt »<code>monkey Bär </code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:replace('Affe Bär Elefant Löwe', ('Affe', 'Bär', 'Elefant', 'Löwe') , ('monkey', '', 'elephant', 'lion') )</function> ergibt »<code>monkey  elephant lion</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:replace('Affe Bär Elefant', ('Affe', '', 'Elefant') , ('monkey', '', 'elephant') )</function> ergibt
					»<code>monkey Bär elephant</code>« (Leerstring in der pattern-Sequenz lässt Eingabe unverändert)</para>
			</listitem>
			<listitem>
				<para><function>xsb:replace('Affe Bär Elefant', ('Affe', (), 'Elefant') , ('monkey', '', 'elephant') )</function> ergibt
					»<code>monkey Bär </code>« (Leersequenz in der pattern-Sequenz »verschwindet«, dadurch wird <emphasis>Elefant</emphasis>
					durch den Leerstring ersetzt)</para>
			</listitem>
			<listitem>
				<para><function>xsb:replace('Affe Bär Elefant', ('Affe', 'Bär', 'Elefant') , ('monkey', (), 'elephant') )</function> ergibt
					»<code>monkey elephant </code>« (Leersequenz in der replacement-Sequenz »verschwindet«, dadurch wird <emphasis>Bär</emphasis>
					durch <emphasis>elephant</emphasis> ersetzt, und <emphasis>Elefant</emphasis> wird gelöscht.)</para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-15</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:replace" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="pattern" as="xs:string*"/>
		<xsl:param name="replacement" as="xs:string*"/>
		<xsl:param name="flags" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="exists($pattern[1])">
				<xsl:sequence select="
					xsb:replace(
						if (boolean($pattern[1]) )
							then replace($input, $pattern[1], string($replacement[1]), $flags)
							else $input,
						$pattern[position() gt 1],
						$replacement[position() gt 1],
						$flags
					)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat('', $input)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<doc:function>
		<doc:param name="input"><para>String, in dem ersetzt wird</para></doc:param>
		<doc:param name="pattern"><para>Sequenz von regulären Ausdrücken, nach denen in <code>input</code> gesucht wird</para></doc:param>
		<doc:param name="replacement"><para>Sequenz von Ersetzungstexten</para></doc:param>
		<para xml:id="replace_3">Shortcut für <function><link linkend="replace">xsb:replace($input, $pattern, $replacement, '')</link></function></para>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-15</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:replace" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="pattern" as="xs:string*"/>
		<xsl:param name="replacement" as="xs:string*"/>
		<xsl:sequence select="xsb:replace($input, $pattern, $replacement, '')"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:index-of-first-match()     __________ -->
	<doc:function>
		<doc:param name="input"><para>String, in dem gesucht wird</para></doc:param>
		<doc:param name="pattern"><para>regulärer Ausdruck, nach dem in <code>input</code> gesucht wird</para></doc:param>
		<doc:param name="flags"><para>flags analog zum <code>flags</code>-Parameter von <function>fn:tokenize()</function>
			(siehe <emphasis>XQuery 1.0 and XPath 2.0 Functions and Operators (Second Edition)</emphasis>,
			<link xlink:href="http://www.w3.org/TR/xpath-functions/#flags">7.6.6.1 Flags</link>)</para></doc:param>
		<para xml:id="index-of-first-match">ermittelt die Position des ersten Auftretens von <code>pattern</code> in <code>string</code></para>
		<para>Ist <code>string</code> oder <code>pattern</code> der Leerstring oder die Leersequenz, wird <code>0</code> zurückgegeben.</para>
		<itemizedlist>
			<title>Beispiele</title>
			<listitem>
				<para><function>xsb:index-of-first-match('ab', 'a')</function> ergibt »<code>1</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:index-of-first-match('ab', 'b')</function> ergibt »<code>2</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:index-of-first-match('ab', 'c')</function> ergibt »<code>0</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:index-of-first-match('ABC', 'b', '')</function> ergibt »<code>0</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:index-of-first-match('ABC', 'b', 'i')</function> ergibt »<code>2</code>«</para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-16</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:index-of-first-match" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="pattern" as="xs:string?"/>
		<xsl:param name="flags" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($pattern) and matches($input, $pattern, $flags)">
				<xsl:sequence select="string-length(tokenize($input, $pattern, $flags)[1]) + 1"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<doc:function>
		<doc:param name="input"><para>String, in dem gesucht wird</para></doc:param>
		<doc:param name="pattern"><para>regulärer Ausdruck, nach dem in <code>input</code> gesucht wird</para></doc:param>
		<para xml:id="index-of-first-match_2">Shortcut für <function><link linkend="index-of-first-match">xsb:index-of-first-match($input, $pattern, '')</link></function></para>
		<revhistory>
			<revision>
				<revnumber>0.2.47</revnumber>
				<date>2012-05-16</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:index-of-first-match" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="pattern" as="xs:string?"/>
		<xsl:sequence select="xsb:index-of-first-match($input, $pattern, '')"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
