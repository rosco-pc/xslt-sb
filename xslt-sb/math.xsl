<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	Copyright (c) 2007-2010 Thomas Meinike
	
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
	<!-- TODO: Rundung bei rekursiven Funktionsaufrufen prüfen, ggfs. in intern:*- und xsb:*-Funktionen aufteilen (zumindest bei xsb:pow) -->
	<!--  -->
	<!--  -->
	<xsl:import href="internals.stylecheck.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="math.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Mathematische Funktionen</doc:title>
		<para>Dieses Stylesheet enthält mathematische Funktionen.</para>
		<para>Autor: <author>
			<honorific>Dr</honorific>
			<firstname>Thomas</firstname>
			<surname>Meinike</surname>
			</author>
		</para>
		<para>Homepage: <link xlink:href="http://datenverdrahten.de/">http://datenverdrahten.de/</link></para>
		<para xml:id="math.hinweise"><emphasis role="bold">Hinweise:</emphasis></para>
		<para>Bei der Berechnung der Funktionen können zwei Fehlertypen auftreten:
			<itemizedlist>
				<listitem>
					<para>mathematische Fehler: das Ergebnis einer Funktion ist für <code>xs:double</code> nicht definiert 
						(bspw. <code>ln(-2)</code> oder <code>sqrt(-2)</code>). In diesem Fall wird <code>NaN</code> (für <emphasis>not a number</emphasis>) ausgegeben.</para>
				</listitem>
				<listitem>
					<para>technischer Fehler: die Software bzw. der Algorithmus ist nicht für die Verarbeitung einer bestimmten Eingabe geeignet
						(bspw. benötigt <code>xsb:pow</code> als Exponenten eine nichtnegative Ganzzahl). In diesem Fall bricht das Stylesheet die Verarbeitung ab.</para>
					<para>(Dieses Problem hätte zwar mit einer genaueren Typung umgangen werden können, aber Basic XSLT-Prozessoren unterstützen nicht alle Datentypen.)</para>
				</listitem>
			</itemizedlist>
		</para>
		<para role="license"><emphasis role="bold">Lizenz (duale Lizenzierung):</emphasis></para>
		<para role="license">Dieses Stylesheet und die dazugehörige Dokumentation sind unter einer Creative Commons-Lizenz (<link xlink:href="http://creativecommons.org/licenses/by/3.0/">CC-BY&#160;3.0</link>)
			lizenziert. Die Weiternutzung ist bei Namensnennung erlaubt.</para>
		<para role="license">Dieses Stylesheet und die dazugehörige Dokumentation sind unter der sogenannten Expat License (einer GPL-kompatiblen MIT License) lizensiert. Es darf – als Ganzes oder auszugweise – 
			unter Beibehaltung der Copyright-Notiz kopiert, verändert, veröffentlicht und verbreitet werden. Die Copyright-Notiz steht im Quelltext
			des Stylesheets und auf der <link xlink:href="standard.html#standard.license">Startseite der Dokumentation</link>.</para>
		<itemizedlist>
			<title>Original-URLs</title>
			<listitem>
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/math.xsl">&XSL-Base-Directory;/math.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/math.html">&doc-Base-Directory;/math.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/math.xsl">&XSL-Base-Directory;/math.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/math.html">&doc-Base-Directory;/math.html</link></para>
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
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>Stf</authorinitials>
					<revdescription>
					<para conformance="draft">Status: draft</para>
						<para>initiale Version auf der Grundlage der Bibliothek von Thomas Meinike
							(Original-URL <link xlink:href="http://datenverdrahten.de/xslt2/tm_mathlib.xsl">http://datenverdrahten.de/xslt2/tm_mathlib.xsl</link>)</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Konstanten     ==================== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:variable>
		<para>Wert von Pi als globale Variable (Konstante)</para>
		<!-- TODO: Müssten dass nach der Logik von XPath nicht Funktionen aka xsb:pi() sein?-->
	</doc:variable>
	<xsl:variable name="xsb:pi" as="xs:double" select="3.141592653589793"/>
	<!--  -->
	<doc:variable>
		<para>natürlicher Logarithmus von 10 (Konstante)</para>
	</doc:variable>
	<!--  -->
	<xsl:variable name="intern:ln10" as="xs:double" select="2.302585092994046"/>
	<doc:variable>
		<para>Anzahl der Glieder für Reihenentwicklungen</para>
		<para>Die Genauigkeit der Reihenentwicklungen lässt sich über den Wert der Variable <code>$intern:max</code> steuern. Ein guter Wert ist TODO: Was sind sinnvolle werte?</para>
	</doc:variable>
	<xsl:variable name="intern:max" as="xs:integer" select="200"/>
	<!--  -->
	<doc:variable>
		<para>Stellen für Ergebnis-Rundung</para>
		<para>Am Ende der Berechnung werden die Ergebnisse auf diese Anzahl der Stellen gerundet. Default: 8</para>
		<!-- TODO: wie viele Stellen umfasst mathematisch sauber eine sinnvolle Genauigkeit? 8, wie vorgegeben? 14, um noch runden zu können? -->
	</doc:variable>
	<xsl:variable name="intern:round" as="xs:integer" select="8"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Funktionen     ==================== -->
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fact     __________ -->
	<doc:function>
		<doc:param name="n"><para>natürliche Zahl (einschließlich 0)</para></doc:param>
		<para xml:id="fact">berechnet die Fakultät einer natürlichen Zahl</para>
		<para>Die Eingabe einer ungültigen Zahl (kleiner 0) führt zum Abbruch (mit Fehlermeldung)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:fact" as="xs:double">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$n ge 0">
				<xsl:sequence select="if($n le 1) then 1 else $n * xsb:fact($n - 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:fact</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe: ist »<xsl:sequence select="$n"/>«, muss aber größer/gleich 0 sein. Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:pow     __________ -->
	<doc:function>
		<doc:param name="basis"><para>Basis</para></doc:param>
		<doc:param name="exponent"><para>Exponent, nichtnegative Ganzzahl</para></doc:param>
		<para xml:id="pow">Potenz basis^exponent für nichtnegative ganzzahlige Exponenten</para>
		<para>Die Eingabe einer ungültigen Zahl als Exponent (kleiner 0) führt zum Abbruch (mit Fehlermeldung)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:pow" as="xs:double">
		<xsl:param name="basis" as="xs:double"/>
		<xsl:param name="exponent" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$exponent ge 0">
				<xsl:sequence select="if($exponent eq 0) then 1 else $basis * xsb:pow($basis, $exponent - 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:pow</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe: Exponent ist »<xsl:sequence select="$exponent"/>«, muss aber Ganzzahl größer/gleich 0 sein. Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:exp     __________ -->
	<doc:function>
		<doc:param name="exponent"><para>Exponent der e-Funktion</para></doc:param>
		<para xml:id="exp">Exponential-Funktion e^exponent (Reihenentwicklung)</para>
		<para>Die Genauigkeit der Reihenentwicklungen lässt sich über den Wert der Variable <code>$intern:max</code> steuern.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:exp" as="xs:double">
		<xsl:param name="exponent" as="xs:double"/>
		<xsl:sequence select="round-half-to-even(sum( (for $n in (0 to $intern:max) return (xsb:pow($exponent, $n) div xsb:fact($n) ) )[not(string(.) = ('NaN', 'INF') )] ), $intern:round)"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:sin     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="sin">Sinus-Funktion (Reihenentwicklung)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:sin" as="xs:double">
		<xsl:param name="arg" as="xs:double"/>
		<xsl:variable name="x" as="xs:double" select="if($arg ge 2 * $xsb:pi) then ($arg - floor($arg div (2 * $xsb:pi) ) * 2 * $xsb:pi) else
			(if ($arg le -2 * $xsb:pi) then ($arg + floor($arg div (-2 * $xsb:pi) ) * 2 * $xsb:pi) else $arg)"/>
		<xsl:variable name="sum_seq" as="xs:double+" select="for $n in (0 to $intern:max) return (xsb:pow(-1, $n) * xsb:pow($x, 2 * $n + 1) div xsb:fact(2 * $n + 1) )"/>
		<xsl:sequence select="round-half-to-even(sum($sum_seq), $intern:round)"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:cos     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="cos">Cosinus-Funktion (Reihenentwicklung)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:cos" as="xs:double">
		<xsl:param name="arg" as="xs:double"/>
		<xsl:variable name="x" as="xs:double" select="if ($arg ge 2 * $xsb:pi) then ($arg - floor($arg div (2 * $xsb:pi) ) * 2 * $xsb:pi) else
			(if ($arg le -2 * $xsb:pi) then ($arg + floor($arg div (-2 * $xsb:pi)) * 2 * $xsb:pi) else $arg)"/>
		<xsl:variable name="sum_seq" as="xs:double+" select="for $n in (0 to $intern:max) return number(xsb:pow(-1, $n) * xsb:pow($x, 2 * $n) div xsb:fact(2 * $n) )"/>
		<xsl:sequence select="round-half-to-even(sum($sum_seq), $intern:round)"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:deg-to-rad     __________ -->
	<doc:function>
		<doc:param name="deg"><para>Eingabe im Gradmaß</para></doc:param>
		<para xml:id="deg-to-rad">wandelt Gradmaß in Bogenmaß um</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:deg-to-rad" as="xs:double">
		<xsl:param name="deg" as="xs:double"/>
		<xsl:value-of select="$deg * $xsb:pi div 180"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:rad-to-deg     __________ -->
	<doc:function>
		<doc:param name="rad"><para>Eingabe im Bogenmaß</para></doc:param>
		<para xml:id="rad-to-deg">rechnet Bogenmaß in Gradmaß um</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:rad-to-deg" as="xs:double">
		<xsl:param name="rad" as="xs:double"/>
		<xsl:value-of select="$rad * 180 div $xsb:pi"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:sqrt     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert</para></doc:param>
		<para xml:id="sqrt">berechnet die Quadratwurzel</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:sqrt" as="xs:double">
		<xsl:param name="arg" as="xs:double"/>
		<xsl:choose>
			<xsl:when test="$arg ge 0">
				<xsl:value-of select="xsb:nroot($arg, 2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="number('NaN')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:nroot     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument</para></doc:param>
		<doc:param name="wurzelexponent"><para>Wurzelexponent</para></doc:param>
		<para xml:id="nroot">berechnet die n-te (n = Wurzelexponent) Wurzel</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<!-- n-te Wurzel -->
	<xsl:function name="xsb:nroot" as="xs:double">
		<xsl:param name="arg" as="xs:double"/>
		<xsl:param name="wurzelexponent" as="xs:integer"/>
		<xsl:if test="$arg ge 0 and $wurzelexponent ge 1">
			<xsl:sequence select="intern:root-iterator($wurzelexponent, $arg, 0, $arg)"/>
		</xsl:if>
		<xsl:if test="($arg lt 0) or ($wurzelexponent lt 1)">
			<!-- ToDo: hier hätte ich lieber einen Abbruch, weil das ja nicht undefiniert ist, sondern nicht vom Algorithmus abgedeckt ist (Stf, 2011-05-17) -->
			<xsl:value-of select="number('NaN')"/>
		</xsl:if>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:root-iterator     __________ -->
	<doc:function>
		<doc:param name="n"><para>ToDo</para></doc:param>
		<doc:param name="x"><para>ToDo</para></doc:param>
		<doc:param name="y"><para>ToDo</para></doc:param>
		<doc:param name="yn"><para>ToDo</para></doc:param>
		<para xml:id="root-iterator">iterative Wurzelberechnung nach dem Heron-Verfahren</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:root-iterator" as="xs:double">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:param name="x" as="xs:double"/>
		<xsl:param name="y" as="xs:double"/>
		<xsl:param name="yn" as="xs:double"/>
		<xsl:choose>
			<xsl:when test="abs($y - $yn) gt 1E-8">
				<xsl:variable name="akt_y" select="$yn" as="xs:double"/>
				<xsl:variable name="akt_yn" select="1 div $n * ( ( ($n - 1) * $akt_y) + ($x div xsb:pow($akt_y, $n - 1) ) )" as="xs:double"/>
				<xsl:sequence select="intern:root-iterator($n, $x, $akt_y, $akt_yn)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="round-half-to-even($yn, $intern:round)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:ln     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument</para></doc:param>
		<para xml:id="ln">berechnet den natürlichen Logarithmus</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:ln" as="xs:double">
		<xsl:param name="arg" as="xs:double"/>
		<xsl:choose>
			<xsl:when test="$arg gt 0">
				<xsl:variable name="argm" as="xs:double" select="$arg - 1"/>
				<xsl:variable name="argp" as="xs:double" select="$arg + 1"/>
				<xsl:variable name="sum_seq" as="xs:double*" select="for $n in (1 to 4 * $intern:max)[. mod 2 = 1] return (xsb:pow($argm, $n) div ($n * xsb:pow($argp, $n) ) )[string(.) ne ('NaN')]"/>
				<xsl:sequence select="round-half-to-even(2 * sum($sum_seq), $intern:round)"/>
			</xsl:when>
			<xsl:when test="$arg eq 0">
				<xsl:value-of select="number('-INF')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="number('NaN')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:lg     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument</para></doc:param>
		<para xml:id="lg">berechnet den dekadischen Logarithmus</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:lg" as="xs:double">
		<xsl:param name="arg" as="xs:double"/>
		<xsl:choose>
			<xsl:when test="$arg gt 0">
				<xsl:value-of select="round-half-to-even(xsb:ln($arg) div $intern:ln10, $intern:round)"/>
			</xsl:when>
			<xsl:when test="$arg eq 0">
				<xsl:value-of select="number('-INF')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="number('NaN')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fibonacci     __________ -->
	<doc:function>
		<doc:param name="n"><para>Argument (positive natürliche Zahl)</para></doc:param>
		<para xml:id="fibonacci">berechnet Fibonacci-Zahlen</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:fibonacci" as="xs:integer">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$n eq 0">0</xsl:when>
			<xsl:when test="$n eq 1">1</xsl:when>
			<xsl:when test="$n ge 2">
				<xsl:sequence select="xsb:fibonacci($n - 2) + xsb:fibonacci($n - 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="xs:integer(number('NaN') )"/>
			</xsl:otherwise>
		</xsl:choose>
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
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
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
		<xsl:call-template name="intern:math.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<intern:testliste xml:id="MathTests">
		<test>
			<!-- 0 (Null) -->
			<value>0</value>
			<xsb:fact>1</xsb:fact>
			<xsb:pow>1</xsb:pow>
			<xsb:exp>1</xsb:exp>
			<xsb:sin>0</xsb:sin>
			<xsb:cos>1</xsb:cos>
			<xsb:deg-to-rad>0</xsb:deg-to-rad>
			<xsb:rad-to-deg>0</xsb:rad-to-deg>
			<xsb:sqrt>0</xsb:sqrt>
			<xsb:nroot>NaN</xsb:nroot>
			<xsb:ln>-INF</xsb:ln>
			<xsb:lg>-INF</xsb:lg>
			<xsb:fibonacci>0</xsb:fibonacci>
		</test>
		<test>
			<!-- 1 -->
			<value>1</value>
			<xsb:fact>1</xsb:fact>
			<xsb:pow>2</xsb:pow>
			<xsb:exp>2.71828182845905</xsb:exp>
			<xsb:sin>0.841470984807897</xsb:sin>
			<xsb:cos>0.54030230586814</xsb:cos>
			<xsb:deg-to-rad>0.017453292519943295</xsb:deg-to-rad>
			<xsb:rad-to-deg>57.29577951308232</xsb:rad-to-deg>
			<xsb:sqrt>1</xsb:sqrt>
			<xsb:nroot>2</xsb:nroot>
			<xsb:ln>0</xsb:ln>
			<xsb:lg>0</xsb:lg>
			<xsb:fibonacci>1</xsb:fibonacci>
		</test>
		<test>
			<!-- 2 -->
			<value>2</value>
			<xsb:fact>2</xsb:fact>
			<xsb:pow>4</xsb:pow>
			<xsb:exp>7.38905609893065</xsb:exp>
			<xsb:sin>0.909297426825682</xsb:sin>
			<xsb:cos>-0.416146836547142</xsb:cos>
			<xsb:deg-to-rad>0.03490658503988659</xsb:deg-to-rad>
			<xsb:rad-to-deg>114.59155902616465</xsb:rad-to-deg>
			<xsb:sqrt>1.414213562373095</xsb:sqrt>
			<xsb:nroot>1.414213562373095</xsb:nroot>
			<xsb:ln>0.693147180559945</xsb:ln>
			<xsb:lg>0.301029995663981</xsb:lg>
			<xsb:fibonacci>1</xsb:fibonacci>
		</test>
		<test>
			<!-- 3 -->
			<value>3</value>
			<xsb:fact>6</xsb:fact>
			<xsb:pow>8</xsb:pow>
			<xsb:exp>20.08553692318765</xsb:exp>
			<xsb:sin>0.141120008059867</xsb:sin>
			<xsb:cos>-0.989992496600445</xsb:cos>
			<xsb:deg-to-rad>0.05235987755982988</xsb:deg-to-rad>
			<xsb:rad-to-deg>171.88733853924697</xsb:rad-to-deg>
			<xsb:sqrt>1.732050807568877</xsb:sqrt>
			<xsb:nroot>1.259921049894873</xsb:nroot>
			<xsb:ln>1.09861228866811</xsb:ln>
			<xsb:lg>0.477121254719662</xsb:lg>
			<xsb:fibonacci>2</xsb:fibonacci>
		</test>
		<test intern:skip="xsb:fact xsb:pow xsb:nroot xsb:fibonacci">
			<!-- Pi -->
			<value>3.141592653589793</value>
			<xsb:fact/>
			<xsb:pow/>
			<xsb:exp>23.14069263277925</xsb:exp>
			<xsb:sin>0</xsb:sin>
			<xsb:cos>-1</xsb:cos>
			<xsb:deg-to-rad>0.05483113556160754</xsb:deg-to-rad>
			<xsb:rad-to-deg>180</xsb:rad-to-deg>
			<xsb:sqrt>1.772453850905516</xsb:sqrt>
			<xsb:nroot/>
			<xsb:ln>1.1447298858494</xsb:ln>
			<xsb:lg>0.497149872694134</xsb:lg>
			<xsb:fibonacci/>
		</test>
		<test>
			<!-- 10 -->
			<value>10</value>
			<xsb:fact>3628800</xsb:fact>
			<xsb:pow>1024</xsb:pow>
			<xsb:exp>22026.46579480667</xsb:exp>
			<xsb:sin>-0.54402111088937</xsb:sin>
			<xsb:cos>-0.839071529076452</xsb:cos>
			<xsb:deg-to-rad>0.17453292519943295</xsb:deg-to-rad>
			<xsb:rad-to-deg>572.9577951308232</xsb:rad-to-deg>
			<xsb:sqrt>3.16227766016838</xsb:sqrt>
			<xsb:nroot>1.071773462536293</xsb:nroot>
			<xsb:ln>2.302585092994046</xsb:ln>
			<xsb:lg>1</xsb:lg>
			<xsb:fibonacci>55</xsb:fibonacci>
		</test>
		<test intern:skip="xsb:fibonacci">
			<!-- 100 -->
			<value>100</value>
			<xsb:fact>9.33262154439441E157</xsb:fact>
			<xsb:pow>1.2676506002282294e+30</xsb:pow>
			<xsb:exp>2.688117141816077e+43</xsb:exp>
			<xsb:sin>-0.506365641109759</xsb:sin>
			<xsb:cos>0.862318872287684</xsb:cos>
			<xsb:deg-to-rad>1.7453292519943295</xsb:deg-to-rad>
			<xsb:rad-to-deg>5729.5779513082325</xsb:rad-to-deg>
			<xsb:sqrt>10</xsb:sqrt>
			<xsb:nroot>1.006955550056719</xsb:nroot>
			<xsb:ln>4.605170185988092</xsb:ln>
			<xsb:lg>2</xsb:lg>
			<xsb:fibonacci>354224848179261997056</xsb:fibonacci>
		</test>
	</intern:testliste>
	<!-- für Funktionen mit zwei Argumenten gibt es hier eine zweite Testliste -->
	<intern:testliste xml:id="MathTests2">
		<test>
			<!-- 0 (Null) -->
			<value>0</value>
			<xsb:pow>0</xsb:pow>
			<xsb:nroot>0</xsb:nroot>
		</test>
		<test>
			<!-- 1 -->
			<value>1</value>
			<xsb:pow>1</xsb:pow>
			<xsb:nroot>1</xsb:nroot>
		</test>
		<test>
			<!-- 2 -->
			<value>2</value>
			<xsb:pow>16</xsb:pow>
			<xsb:nroot>1.148698354997035</xsb:nroot>
		</test>
		<test>
			<!-- 3 -->
			<value>3</value>
			<xsb:pow>81</xsb:pow>
			<xsb:nroot>1.245730939615517</xsb:nroot>
		</test>
		<test>
			<!-- 10 -->
			<value>10</value>
			<xsb:pow>10000</xsb:pow>
			<xsb:nroot>1.584893192461114</xsb:nroot>
		</test>
		<test>
			<!-- 100 -->
			<value>100</value>
			<xsb:pow>100000000</xsb:pow>
			<xsb:nroot>2.51188643150958</xsb:nroot>
		</test>
	</intern:testliste>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para xml:id="math.self-test">Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para>initiale Version</para>
					<para conformance="beta">Status: beta</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:math.self-test">
		<!-- damit es etwas übersichtlicher wird -->
		<xsl:variable name="seqMathTests" as="element()+" select="document( '' )//intern:testliste[@xml:id='MathTests']/test"/>
		<xsl:variable name="seqMathTests2" as="element()+" select="document( '' )//intern:testliste[@xml:id='MathTests2']/test"/>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fact     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:if test="not(xsb:listed(@intern:skip, 'xsb:fact') )">
				<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
					<xsl:with-param name="test-node" select="."/>
					<xsl:with-param name="function-name">xsb:fact</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:fact(./value/text())"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:pow     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:if test="not(xsb:listed(@intern:skip, 'xsb:pow') )">
				<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
					<xsl:with-param name="test-node" select="."/>
					<xsl:with-param name="function-name">xsb:pow</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:pow(2, ./value/text())"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="$seqMathTests2">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:pow</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:pow(./value/text(),4)"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:sin     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:sin</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:sin(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:cos     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:cos</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:cos(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:deg-to-rad     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:deg-to-rad</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:deg-to-rad(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:rad-to-deg     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:rad-to-deg</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:rad-to-deg(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:sqrt     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:sqrt</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:sqrt(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:nroot()     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:if test="not(xsb:listed(@intern:skip, 'xsb:nroot') )">
				<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
					<xsl:with-param name="test-node" select="."/>
					<xsl:with-param name="function-name">xsb:nroot</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:nroot(2, ./value/text())"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="$seqMathTests2">
			<xsl:if test="not(xsb:listed(@intern:skip, 'xsb:nroot') )">
				<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
					<xsl:with-param name="test-node" select="."/>
					<xsl:with-param name="function-name">xsb:nroot</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:nroot(./value/text(), 5)"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:ln     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:ln</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:ln(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:lg     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:lg</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:lg(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fibonacci     __________ -->
		<xsl:for-each select="$seqMathTests[not(xsb:listed(@intern:skip, 'xsb:fibonacci') )]">
			<xsl:if test="not(xsb:listed(@intern:skip, 'xsb:fibonacci') )">
				<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
					<xsl:with-param name="test-node" select="."/>
					<xsl:with-param name="function-name">xsb:fibonacci</xsl:with-param>
					<xsl:with-param name="actual-value" select="xsb:fibonacci(./value/text())"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:exp     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:exp</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:exp(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
