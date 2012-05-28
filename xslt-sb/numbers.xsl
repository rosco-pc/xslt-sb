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
	<xsl:import href="internals.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="numbers.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Zahlen und Rechnen</doc:title>
		<para>Dieses Stylesheet enthält Funktionen rund um Zahlen und Rechenoperationen.</para>
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
				<revremark><code>numbers_tests.xsl</code> aus <code>numbers.xsl</code> ausgegliedert, neue Funktion: <function>xsb:hex-to-integer()</function></revremark>
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
				<revnumber>0.29</revnumber>
				<date>2009-05-03</date>
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
	<!-- __________     xsb:is-roman-numeral     __________ -->
	<doc:function>
		<doc:param name="input"><para>Eingabe (String)</para></doc:param>
		<para xml:id="is-roman-numeral">Diese Funktion überprüft, ob der angegebene String eine römische Zahl ist.</para>
		<revhistory>
			<revision>
				<revnumber>0.29</revnumber>
				<date>2009-05-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:is-roman-numeral" as="xs:boolean">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="temp" as="xs:string?" select="normalize-space(upper-case($input))"/>
		<xsl:sequence select="not(matches($temp,'(([IXCM])2{3,})|[^IVXLCDM]|([IL][LCDM])|([XD][DM])|(V[VXLCDM])|(IX[VXLC])|(VI[VX])|(XC[LCDM])|(LX[LC])|((CM|DC)[DM])|(I[VX]I)|(X[CL]X)|(C[DM]C)|(I{2,}[VX])|(X{2,}[CL])|(C{2,}[DM])'))"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:roman-numeral-to-integer     __________ -->
	<doc:function>
		<doc:param name="input"><para>römische Zahl (String)</para></doc:param>
		<para xml:id="roman-numeral-to-integer">Diese Funktion wandelt eine römische Zahl in einen Integer-Wert um. Ist der eingegebene Wert keine römische Zahl oder leer, ist das Ergebnis 0.
			Die Funktion ist nicht case-sensitiv, d.h. Groß-/Kleinschreibung der Eingabe spielt keine Rolle.</para>
		<revhistory>
			<revision>
				<revnumber>0.29</revnumber>
				<date>2009-05-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:roman-numeral-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="temp" as="xs:string?" select="normalize-space(upper-case($input))"/>
		<xsl:choose>
			<xsl:when test="xsb:is-roman-numeral($temp)">
				<xsl:variable name="Values" as="xs:integer*">
					<xsl:for-each select="for $i in 1 to string-length($temp) return $i">
						<xsl:variable name="CharValue" as="xs:integer"
							select="xsb:roman-number-char-to-integer(substring($temp, position(), 1))"/>
						<xsl:variable name="NextCharValue" as="xs:integer"
							select="xsb:roman-number-char-to-integer(substring($temp, position() + 1, 1) )"/>
						<xsl:choose>
							<xsl:when test="$CharValue lt $NextCharValue">
								<xsl:sequence select="- $CharValue"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="$CharValue"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:variable>
				<xsl:sequence select="sum($Values)"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:roman-number-char-to-integer     __________ -->
	<doc:function>
		<doc:param name="input"><para>römische Ziffer (String)</para></doc:param>
		<para xml:id="roman-number-char-to-integer">Diese Funktion wandelt eine römische Ziffer (eines der Zeichen I, V, X, L, C, D, M) in einen Integer-Wert um. Ist das eingegebene Zeichen 
			keine römische Ziffer oder leer, ist das Ergebnis 0. Die Funktion ist nicht case-sensitiv, d.h. Groß-/Kleinschreibung der Eingabe spielt keine Rolle.</para>
		<revhistory>
			<revision>
				<revnumber>0.29</revnumber>
				<date>2009-05-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:roman-number-char-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="temp" as="xs:string?" select="upper-case(normalize-space($input))"/>
		<xsl:choose>
			<xsl:when test="$temp eq 'I' ">1</xsl:when>
			<xsl:when test="$temp eq 'V' ">5</xsl:when>
			<xsl:when test="$temp eq 'X' ">10</xsl:when>
			<xsl:when test="$temp eq 'L' ">50</xsl:when>
			<xsl:when test="$temp eq 'C' ">100</xsl:when>
			<xsl:when test="$temp eq 'D' ">500</xsl:when>
			<xsl:when test="$temp eq 'M' ">1000</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:force-cast-to-decimal     __________ -->
	<doc:function>
		<doc:param name="input"><para>zu castender String</para></doc:param>
		<doc:param name="warn-if-wrong-input"><para>(Boolean) Erzeugt eine Fehlermeldung, 
			wenn der eingegebenen String keine gültige <code>xs:decimal</code>-Zahl ist.</para></doc:param>
		<para xml:id="force-cast-to-decimal">Diese Funktion erzwingt die Umwandlung eines Strings in <code>xs:decimal</code>.</para>
		<para>Ein gültiger String wird mit <function>xs:decimal()</function> umgewandelt. 
			Die Eingabe einer Leersequenz, eines Leerstring oder eines ungültigen Strings ergibt 0.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-26</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>saubere Typung auf xs:decimal ergänzt</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.114</revnumber>
				<date>2010-07-17</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:force-cast-to-decimal" as="xs:decimal">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:choose>
			<xsl:when test="$input castable as xs:decimal">
				<xsl:sequence select="xs:decimal($input)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="xs:decimal(0)"/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">xsb:force-cast-to-decimal</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="message">Ungültige Eingabe: »<xsl:sequence select="$input"/>«, deshalb »0« als Ergebnis geliefert.</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:function>
		<doc:param name="input"><para>zu castender String</para></doc:param>
		<para xml:id="force-cast-to-decimal_shortcut">Shortcut für <function>xsb:force-cast-to-decimal($input, true() )</function></para>
		<revhistory>
			<revision>
				<revnumber>0.114</revnumber>
				<date>2010-07-17</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:force-cast-to-decimal" as="xs:decimal">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="xsb:force-cast-to-decimal($input, true() )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:force-cast-to-integer     __________ -->
	<doc:function>
		<doc:param name="input"><para>zu castender String</para></doc:param>
		<doc:param name="warn-if-wrong-input"><para>(Boolean) Erzeugt eine Fehlermeldung, 
			wenn der eingegebenen String keine gültige <code>xs:integer</code>-Zahl ist.</para></doc:param>
		<para xml:id="force-cast-to-integer">Diese Funktion erzwingt die Umwandlung eines Strings in <code>xs:integer</code>.</para>
		<para>Ein gültiger String wird mit <function>xsb:force-cast-to-integer()</function> umgewandelt. 
			Die Eingabe einer Leersequenz, eines Leerstring oder eines ungültigen Strings ergibt 0.</para>
		<revhistory>
			<revision>
				<revnumber>0.114</revnumber>
				<date>2010-07-17</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:force-cast-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:sequence select="xs:integer(xsb:force-cast-to-decimal($input, $warn-if-wrong-input) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:function>
		<doc:param name="input"><para>zu castender String</para></doc:param>
		<para xml:id="force-cast-to-integer_shortcut">Shortcut für <function>xsb:force-cast-to-integer($input, true() )</function></para>
		<revhistory>
			<revision>
				<revnumber>0.114</revnumber>
				<date>2010-07-17</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:force-cast-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="xsb:force-cast-to-integer($input, true() )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:hex-to-integer()     __________ -->
	<!-- in numbers.xsl, damit in file.xsl verwendet werden kann -->
	<doc:function>
		<doc:param name="input"><para>eine hexadezimale Zahl (beliebige Folge aus <code>0-9</code> und <code>A-F</code> bzw. <code>a-f</code>), ggfs. mit einem vorangestellten »<code>-</code>« (Minus) für negative Zahlen</para></doc:param>
		<para xml:id="hex-to-integer">wandelt Hexadezimal- in Integer-Zahlen um.</para>
		<para>Whitespace in der Eingabe wird entfernt, damit Notationen wie »<code>ff d8 d2 e9</code>« ohne weitere Bearbeitung konvertiert werden können.</para>
		<para>Die Eingabe eines Leerstrings, einer Leersequenz, eines oder mehrerer ungültiger Zeichen führt zu einer Fehlermeldung.</para>
		<para>Eine andere Version dieser Funktion, die negative Zahlen als Zweierkomplement behandelt, findet sich in <link xlink:href="math.html#hex-to-integer_2">math.xsl</link></para>
		<itemizedlist>
			<title>Beispiele</title>
			<listitem>
				<para><function>xsb:hex-to-integer('0')</function> ergibt »<code>0</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:hex-to-integer('a')</function> ergibt »<code>10</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:hex-to-integer('FFFF')</function> ergibt »<code>65535</code>«</para>
			</listitem>
			<listitem>
				<para><function>xsb:hex-to-integer('-29a')</function> ergibt »<code>-666</code>«</para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.50</revnumber>
				<date>2012-05-19</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:hex-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string"/>
		<xsl:variable name="uppercase-input" as="xs:string" select="translate(normalize-space(upper-case($input) ), ' ', '')"/>
		<xsl:choose>
			<!-- mehrere Zeichen -->
			<xsl:when test="matches($uppercase-input, '^[0-9A-Z]{2,}$')">
				<xsl:sequence select="xsb:hex-to-integer(substring($uppercase-input, string-length($uppercase-input) ) )
							   + 16 * xsb:hex-to-integer(substring($uppercase-input, 1, string-length($uppercase-input) - 1 ) )"/>
			</xsl:when>
			<!-- nur noch ein Zeichen -->
			<xsl:when test="matches($uppercase-input, '^[0-9A-Z]$')">
				<xsl:sequence select="index-of( ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'), $uppercase-input) - 1"/>
			</xsl:when>
			<!-- negativ -->
			<xsl:when test="matches($uppercase-input, '^-[0-9A-Z]+$')">
				<xsl:sequence select="-1 * xsb:hex-to-integer(substring($uppercase-input, 2, string-length($uppercase-input) - 1 ) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="caller">xsb:hex-to-integer()</xsl:with-param>
					<xsl:with-param name="message">ungültige Eingabe. Kann »<xsl:sequence select="$input"/>« nicht in einen Integer umwandeln</xsl:with-param>
				</xsl:call-template>
				<!-- da ein Cast von von NaN auf Integer fehlschlägt, führt das zwingend zum Abbruch -->
				<xsl:sequence select="xs:integer(number('NaN') )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
