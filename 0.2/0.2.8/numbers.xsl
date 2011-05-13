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
	<xsl:import href="internals.stylecheck.xsl"/>
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
		<para>Diese Funktion überprüft, ob der angegebene String eine römische Zahl ist.</para>
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
		<para>Diese Funktion wandelt eine römische Zahl in einen Integer-Wert um. Ist der eingegebene Wert keine römische Zahl oder leer, ist das Ergebnis 0.
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
		<para>Diese Funktion wandelt eine römische Ziffer (eines der Zeichen I, V, X, L, C, D, M) in einen Integer-Wert um. Ist das eingegebene Zeichen 
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
			<xsl:when test="$temp = 'I' ">1</xsl:when>
			<xsl:when test="$temp = 'V' ">5</xsl:when>
			<xsl:when test="$temp = 'X' ">10</xsl:when>
			<xsl:when test="$temp = 'L' ">50</xsl:when>
			<xsl:when test="$temp = 'C' ">100</xsl:when>
			<xsl:when test="$temp = 'D' ">500</xsl:when>
			<xsl:when test="$temp = 'M' ">1000</xsl:when>
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
		<para>Diese Funktion erzwingt die Umwandlung eines Strings in <code>xs:decimal</code>.</para>
		<para>Ein gültiger String wird mit <function>xs:decimal()</function> umgewandelt. 
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
	<xsl:function name="xsb:force-cast-to-decimal" as="xs:decimal">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:choose>
			<xsl:when test="$input castable as xs:decimal">
				<xsl:sequence select="xs:decimal($input)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="0"/>
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
		<para>Shortcut für <function>xsb:force-cast-to-decimal($input, true() )</function></para>
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
		<para>Diese Funktion erzwingt die Umwandlung eines Strings in <code>xs:integer</code>.</para>
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
		<para>Shortcut für <function>xsb:force-cast-to-integer($input, true() )</function></para>
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
			<xsl:with-param name="reference-value" select="0" as="xs:decimal"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('', false())"/>
			<xsl:with-param name="reference-value" select="0" as="xs:decimal"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('MMIX', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('MMIX', false())"/>
			<xsl:with-param name="reference-value" select="0" as="xs:decimal"/>
		</xsl:call-template>
		<!-- Wahr-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('0', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('0', false())"/>
			<xsl:with-param name="reference-value" select="0" as="xs:decimal"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('1', false())</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('1', false())"/>
			<xsl:with-param name="reference-value" select="1" as="xs:decimal"/>
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
			<xsl:with-param name="reference-value" select="0" as="xs:decimal"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('')"/>
			<xsl:with-param name="reference-value" select="0" as="xs:decimal"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('MMIX')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('MMIX')"/>
			<xsl:with-param name="reference-value" select="0" as="xs:decimal"/>
		</xsl:call-template>
		<!-- Wahr-Werte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('0')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('0')"/>
			<xsl:with-param name="reference-value" select="0" as="xs:decimal"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:force-cast-to-decimal('1')</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:force-cast-to-decimal('1')"/>
			<xsl:with-param name="reference-value" select="1" as="xs:decimal"/>
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
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
