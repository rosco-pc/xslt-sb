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
	exclude-result-prefixes="doc docv xsb intern xlink xs"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="internals.meta.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Interne Funktionen/Meta-Funktionen</doc:title>
		<para>Dieses Stylesheet enthält interne Templates und Funktionen zur Untersuchung von XSLT-Dateien.</para>
		<para>Sie sind das Ergebnis von ein paar Experimenten zur Analyse von Stylesheets und sehr, sehr alpha.</para>
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
				<revnumber>0.93</revnumber>
				<date>2010-05-30</date>
				<authorinitials>Stf</authorinitials>
				<revremark>initiale Version, ausgelagert aus internals.stylecheck.xsl</revremark>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Funktionen     ==================== -->
	<!--  -->
	<!--  -->
	<!-- __________     intern:function-name()     __________ -->
	<doc:function>
		<doc:param name="StringOfAFunctionCall"><para>String, der wie ein Funktionsaufruf aussieht.</para></doc:param>
		<para>ermittelt den Namen einer Funktion aus einem String, der wie eine Funktion aussieht</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe eines ungültigen Strings gibt einen Leerstring zurück.</para>
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
	</doc:function>
	<xsl:function name="intern:function-name" as="xs:string">
		<xsl:param name="StringOfAFunctionCall" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="intern:looks-like-a-function-call($StringOfAFunctionCall)">
				<xsl:sequence select="substring-before(normalize-space($StringOfAFunctionCall), '(' )"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:function-arity()     __________ -->
	<doc:function>
		<doc:param name="StringOfAFunctionCall"><para>String, der wie ein Funktionsaufruf aussieht.</para></doc:param>
		<para>ermittelt die Arity (d.h. die Anzahl der Argumente) einer Funktion</para>
		<para>Die Eingabe eines Leerstringes gibt <code>0</code> zurück.</para>
		<para>Die Eingabe eines ungültigen Strings gibt <code>0</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="intern:function-arity" as="xs:integer">
		<xsl:param name="StringOfAFunctionCall" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="intern:looks-like-a-function-call($StringOfAFunctionCall)">
				<xsl:sequence select="count(intern:function-arguments($StringOfAFunctionCall))"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select="0"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:looks-like-a-function-call()     __________ -->
	<doc:function>
		<doc:param name="StringOfAFunctionCall"><para>String, der wie ein Funktionsaufruf aussieht.</para></doc:param>
		<para>Diese Funktion überprüft eine String darauf, ob er wie der Aufruf einer XSLT-/Xpath-Funktion aussieht.
			Es werden nur zwei Dinge getestet:
			<orderedlist>
				<listitem><para>per regulärem Ausdruck wird geprüft, ob der String aus einem Namen + einem geklammerten Ausdruck besteht und</para></listitem>
				<listitem><para>per Simulation von <code>castable as xs:Name</code> wird geprüft, ob der vermeintliche Funktionsname ein XML-Name ist.
					Die Simulation ist notwendig, weil der Typ <code>xs:Name</code> nicht von einem Basic-XSLT-Prozessor unterstützt wird.</para></listitem>
			</orderedlist>
		</para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe eines ungültigen Strings gibt <code>false()</code> zurück.</para>
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
	</doc:function>
	<xsl:function name="intern:looks-like-a-function-call" as="xs:boolean">
		<xsl:param name="StringOfAFunctionCall" as="xs:string?"/>
		<xsl:variable name="NormalizedStringOfAFunctionCall" as="xs:string?" select="normalize-space($StringOfAFunctionCall)"/>
		<xsl:sequence select="matches($NormalizedStringOfAFunctionCall, '^\w.*\(.*\)$') and 
			intern:castable-as-xs-name(substring-before($NormalizedStringOfAFunctionCall,'(') ) "/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:castable-as-xs-name()     __________ -->
	<doc:function>
		<doc:param name="string"><para>String, der geprüft werden soll.</para></doc:param>
		<para>Diese Funktion überprüft eine String darauf, ob er als <code>xs:Name</code> gecastest werden kann. Diese Funktion ist notwendig,
			weil <code>xs:Name</code> resp. <function>castable as xs:Name</function> nicht von einem Basic-XSLT-Prozessor unterstützt werden.</para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe eines ungültigen Strings gibt <code>false()</code> zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.95</revnumber>
				<date>2010-06-28</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:castable-as-xs-name" as="xs:boolean">
		<xsl:param name="string" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="contains($string, ':')">
				<xsl:sequence select="intern:castable-as-xs-ncname(substring-before($string, ':') ) and intern:castable-as-xs-ncname(substring-after($string, ':') )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:castable-as-xs-ncname($string)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:castable-as-xs-ncname()     __________ -->
	<doc:function>
		<doc:param name="string"><para>String, der geprüft werden soll.</para></doc:param>
		<para>Diese Funktion überprüft eine String darauf, ob er als <code>xs:NCName</code> gecastest werden kann. 
			Die Überprüfung erfolgt an Hand eines regulären Ausdruckes nach 
			<link xlink:href="http://www.w3.org/TR/REC-xml/#NT-Name">http://www.w3.org/TR/REC-xml/#NT-Name</link>.</para>
		<para>Diese Funktion ist notwendig,
			weil <code>xs:NCName</code> resp. <function>castable as xs:NCName</function> nicht von einem Basic-XSLT-Prozessor unterstützt werden.</para>
		<para>Die Eingabe eines Leerstringes gibt <code>false()</code> zurück.</para>
		<para>Die Eingabe eines ungültigen Strings gibt <code>false()</code> zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.95</revnumber>
				<date>2010-06-28</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:castable-as-xs-ncname" as="xs:boolean">
		<xsl:param name="string" as="xs:string?"/>
		<!-- source: http://www.w3.org/TR/REC-xml/#NT-Name -->
		<xsl:sequence select="matches($string, '^([A-Z]|_|[a-z]|[&#xC0;-&#xD6;]|[&#xD8;-&#xF6;]|[&#xF8;-&#x2FF;]|[&#x370;-&#x37D;]|[&#x37F;-&#x1FFF;]|[&#x200C;-&#x200D;]|[&#x2070;-&#x218F;]|[&#x2C00;-&#x2FEF;]|[&#x3001;-&#xD7FF;]|[&#xF900;-&#xFDCF;]|[&#xFDF0;-&#xFFFD;]|[&#x10000;-&#xEFFFF;])([A-Z]|_|[a-z]|[&#xC0;-&#xD6;]|[&#xD8;-&#xF6;]|[&#xF8;-&#x2FF;]|[&#x370;-&#x37D;]|[&#x37F;-&#x1FFF;]|[&#x200C;-&#x200D;]|[&#x2070;-&#x218F;]|[&#x2C00;-&#x2FEF;]|[&#x3001;-&#xD7FF;]|[&#xF900;-&#xFDCF;]|[&#xFDF0;-&#xFFFD;]|[&#x10000;-&#xEFFFF;]|-|\.|[0-9]|&#xB7;|[&#x0300;-&#x036F;]|[&#x203F;-&#x2040;])*$')"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:function-argument-string()     __________ -->
	<doc:function>
		<doc:param name="StringOfAFunctionCall"><para>String, der wie ein Funktionsaufruf aussieht.</para></doc:param>
		<para>Diese Funktion gibt aus einem String, der wie ein Funktionsaufruf aussieht, einen String der vermeintlichen Argumente zurück.</para>
		<para>Die Eingabe eines Leerstringes gibt einen Leerstring zurück.</para>
		<para>Die Eingabe eines ungültigen Strings (d.h. der String sieht nicht wie eine Funktion aus) gibt einen Leerstring zurück.</para>
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
	</doc:function>
	<xsl:function name="intern:function-argument-string" as="xs:string">
		<xsl:param name="StringOfAFunctionCall" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="intern:looks-like-a-function-call($StringOfAFunctionCall)">
				<xsl:sequence select="string-join(tokenize(substring-after(normalize-space($StringOfAFunctionCall), '('), '\)' )[position() lt last()],')')"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:function-arguments()     __________ -->
	<doc:function>
		<doc:param name="StringOfAFunctionCall"><para>String, der wie ein Funktionsaufruf aussieht.</para></doc:param>
		<para>Diese Funktion erzeugt eine Sequence von Strings der Argumente aus einem String, der wie eine Funktion aussieht.</para>
		<para>Die Eingabe eines Leerstringes gibt eine Leersequenz zurück.</para>
		<para>Die Eingabe eines ungültigen Strings (d.h. der String sieht nicht wie eine Funktion aus) gibt eine Leersequenz zurück (um <function>&lt;xsl:for-each/&gt;</function> effektiv nutzen zu können).</para>
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
	</doc:function>
	<xsl:function name="intern:function-arguments" as="xs:string*" intern:solved="EmptySequenceAllowed">
		<xsl:param name="StringOfAFunctionCall" as="xs:string?"/>
		<xsl:if test="intern:looks-like-a-function-call($StringOfAFunctionCall)">
			<xsl:variable name="arguments" as="xs:string" select="intern:function-argument-string($StringOfAFunctionCall)"/>
			<xsl:choose>
				<xsl:when test="not(normalize-space($arguments))"/>
				<xsl:when test="contains($arguments, ',')">
					<xsl:variable name="ColonPositionSpender" as="xs:integer+">
						<!-- String-Segmente entfernen (quoted) -->
						<xsl:variable name="step1" as="xs:string+">
							<xsl:analyze-string select="$arguments" regex="'[^']*'">
								<xsl:matching-substring>
									<xsl:sequence select="for $i in 1 to string-length(.) return '_' "/>
								</xsl:matching-substring>
								<xsl:non-matching-substring>
									<xsl:sequence select="."/>
								</xsl:non-matching-substring>
							</xsl:analyze-string>
						</xsl:variable>
						<!-- String-Segmente entfernen (double quoted) -->
						<xsl:variable name="step2" as="xs:string+">
							<xsl:analyze-string select="string-join($step1, '')" regex="&quot;[^&quot;]*&quot;">
								<xsl:matching-substring>
									<xsl:sequence select="for $i in 1 to string-length(.) return '_' "/>
								</xsl:matching-substring>
								<xsl:non-matching-substring>
									<xsl:sequence select="."/>
								</xsl:non-matching-substring>
							</xsl:analyze-string>
						</xsl:variable>
						<!-- Funktions-Argumente entfernen -->
						<xsl:variable name="step3" as="xs:string+" select="intern:replace-nested-brackets-with-dashes(string-join($step2, ''))"/>
						<xsl:sequence select="0"/>
						<xsl:for-each select="tokenize(string-join($step3, ''), ',')">
							<xsl:variable name="pos" as="xs:integer" select="position()"/>
							<xsl:sequence select="string-length(string-join(tokenize(string-join($step3, ''),',')[position() le $pos], ',')) + 1"/>
						</xsl:for-each>
					</xsl:variable>
					<xsl:for-each select="$ColonPositionSpender[position() lt last()]">
						<xsl:variable name="pos" as="xs:integer" select="position()"/>
						<xsl:sequence select="substring($arguments, . + 1, $ColonPositionSpender[$pos + 1] - $ColonPositionSpender[$pos] - 1)"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:sequence select="$arguments"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:replace-nested-brackets-with-dashes()     __________ -->
	<doc:function>
		<doc:param name="input"><para>String, der wie ein Funktionsargument aussieht (wird nicht validiert).</para></doc:param>
		<para>Diese Funktion ist eine Hilfsfubktion, die nur existiert, weil rekursive Aufrufe notwendig waren. Details sind nicht interssant.</para>
		<para>Die Eingabe eines Leerstringes oder eine Leersequenz gibt einen Leerstring zurück.</para>
		<revhistory>
			<revision>
				<revnumber>0.116</revnumber>
				<date>2010-07-21</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:replace-nested-brackets-with-dashes" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="temp" as="xs:string*">
			<xsl:analyze-string select="string-join($input, '')" regex="\([^\(\)]*\)">
				<xsl:matching-substring>
					<xsl:sequence select="for $i in 1 to string-length(.) return '-' "/>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<xsl:sequence select="."/>
				</xsl:non-matching-substring>
			</xsl:analyze-string>
		</xsl:variable>
		<xsl:variable name="temp2" as="xs:string" select="concat(string-join($temp, ''), '')"/>
		<xsl:sequence select="if (matches($temp2, '\([^\(\)]*\)' ) ) then intern:replace-nested-brackets-with-dashes($temp2) else $temp2"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
