<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	Copyright (c) 2012 Stefan Krause
	
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
<!ENTITY Tage "([0-9]{1,2})(\.)?">
<!ENTITY Monate "(JAN|FEB|MRZ|APR|MAI|JUN|JUL|AUG|SEP|OKT|NOV|DEZ)">
<!ENTITY Jahre4 "([0-9]{4})">
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
	<xsl:import href="internals.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="date-time.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>ToDo</doc:title>
		<para>Dieses Stylesheet enthält Funktionen rund um Datum und Uhrzeit.</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/date-time.xsl">&XSL-Base-Directory;/date-time.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/date-time.html">&doc-Base-Directory;/date-time.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/date-time_tests.xsl">&XSL-Base-Directory;/date-time_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/date-time_tests.html">&doc-Base-Directory;/date-time_tests.html</link></para>
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
				<revnumber>0.2.63</revnumber>
				<date>2012-06-11</date>
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
	<!-- __________     ToDo()     __________ -->
	<doc:function>
		<doc:param name="ToDo"><para>ToDo</para></doc:param>
		<para xml:id="ToDo">Diese Funktion ToDo.</para>
		<itemizedlist>
			<title>Beispiele</title>
			<listitem>
				<para><function>ToDo</function> ergibt »<code>ToDo</code>«</para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>ToDo</revnumber>
				<date>2012-ToDo-ToDo</date>
				<authorinitials>ToDo</authorinitials>
				<revdescription>
					<para conformance="ToDo">Status: ToDo</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	
	
	
	<xsl:function name="xsb:parse-dates">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="intern:parse-dates(intern:normalize-date-string($input))"/>
	</xsl:function>
	
	<!-- Ausgabeformat: (yyyy-mm-dd/yyyy-mm-dd)?(, yyyy-mm-dd/yyyy-mm-dd)+ -->
	<xsl:function name="intern:parse-dates" as="xs:string*">
		<!-- normalisierter Datums-String -->
		<xsl:param name="input" as="xs:string?"/>
		<xsl:message>*********************************************************************************************</xsl:message>
		<xsl:message>entering intern:parse-dates()</xsl:message>
		<xsl:variable name="recursive-replacements" as="element()+">
			<p>
				<s>(^|[^0-9])(&Tage;)[/\-](&Tage;)(&Monate;&Jahre4;)</s>
				<r>$1$2$8-$5$8</r>
			</p>
			<p>
				<s>(^|[^0-9])(&Tage;)[;,](&Tage;)(&Monate;&Jahre4;)</s>
				<r>$1$2$8;$5$8</r>
			</p>
			<p>
				<s>(^|[^0-9])&Tage;&Monate;[/\-]&Tage;&Monate;&Jahre4;</s>
				<r>$1$2$3$4$8-$5$6$7$8</r>
				<!-- ##1#.#SEP#17#.#OKT#2002# (von #$1#$2#$3#$4#$5#$6#$7#$8#$9) -->
			</p>
			<p>
				<s>(^|[^0-9])&Tage;&Monate;[;,]&Tage;&Monate;&Jahre4;</s>
				<r>$1$2$3$4$8;$5$6$7$8</r>
			</p>
			<!-- zum Schluss -->
			<p>
				<s>/</s>
				<r>-</r>
			</p>
			<p>
				<s>,</s>
				<r>;</r>
			</p>
		</xsl:variable>
		<xsl:variable name="prepared" as="xs:string?" select="xsb:recursive-replace($input, $recursive-replacements/s/string(), $recursive-replacements/r/string())"/>
		<xsl:call-template name="xsb:internals.FunctionError">
			<xsl:with-param name="caller">intern:parse-dates</xsl:with-param>
			<xsl:with-param name="level">ALL</xsl:with-param>
			<xsl:with-param name="message">$input: »<xsl:sequence select="$input"/>«, $prepared: »<xsl:sequence select="$prepared"/>«</xsl:with-param>
		</xsl:call-template>
		<xsl:if test="normalize-space($input)">
			<xsl:variable name="vorläufiges-ergebnis" as="xs:string*">
				<xsl:choose>
					<!-- die billigen Versuche zuerst -->
					<!-- einfache Daten -->
					<!-- hier noch $input, damit $prepared nicht zwingend evaluiert wird -->
					<!-- YYYY -->
					<xsl:when test="matches($input, '^&Jahre4;$')">
						<xsl:sequence select="concat(intern:date-string($input, '1', '1'), '/', intern:date-string($input, '12', '31') )"/>
					</xsl:when>
					<!-- MMMYYYY -->
					<xsl:when test="matches($input, '^&Monate;&Jahre4;$')">
						<xsl:variable name="year" as="xs:string" select="translate($input, '^&Monate;', '')"/>
						<xsl:variable name="month" as="xs:string" select="replace(replace($input, '[1-9][0-9]{0,3}$', ''), '&Monate;', '$1')"/>
						<xsl:sequence select="concat(
								intern:date-string($year, intern:month-to-integer-string($month), '1'),
								'/',
								intern:date-string($year, intern:month-to-integer-string($month), xsb:last-day-of-month($year, $month) )
							)"/>
					</xsl:when>
					<!-- D.MMMYYYY/DD.MMMYYYY/DMMMYYYY/DDMMMYYYY -->
					<xsl:when test="matches($input, '^&Tage;&Monate;&Jahre4;$')">
						<xsl:variable name="year" as="xs:string" select="replace($input, '^&Tage;&Monate;', '')"/>
						<xsl:variable name="month" as="xs:string" select="replace(replace($input, '^&Tage;|&Jahre4;$', ''), '&Monate;', '$1')"/>
						<xsl:variable name="day" as="xs:string" select="replace($input, '(\.)?&Monate;&Jahre4;$', '')"/>
						<xsl:sequence select="concat(
								intern:date-string($year, intern:month-to-integer-string($month), $day),
								'/',
								intern:date-string($year, intern:month-to-integer-string($month), $day)
							)"/>
					</xsl:when>
					<!-- zusammengesetzte Daten -->
					<!-- YYYY-YYYY, YYYY/YYYY -->
					<xsl:when test="matches($prepared, '^&Jahre4;-&Jahre4;$')">
						<xsl:variable name="temp" as="xs:string+" select="tokenize($prepared, '-')"/>
						<xsl:sequence select="concat(intern:date-string($temp[1], '1', '1'), '/', intern:date-string($temp[2], '12', '31') )"/>
					</xsl:when>
					<xsl:when test="matches($prepared, '^&Tage;&Monate;&Jahre4;-&Tage;&Monate;&Jahre4;$')">
						<xsl:variable name="temp" as="xs:string+" select="tokenize($prepared, '-')"/>
						<xsl:sequence select="concat(intern:parse-date($temp[1]), '/', intern:parse-date($temp[2]) )"/>
					</xsl:when>
					<!-- dann die aufwändigeren Versuche (oder eher eine Verzweiflungstat) -->
					<xsl:when test="contains($prepared, ';') and (every $i in tokenize($prepared, ';') satisfies intern:parse-dates($i) )">
						<xsl:sequence select="string-join(for $i in tokenize($prepared, ';') return intern:parse-dates($i), ', ')"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="xsb:internals.FunctionError">
				<xsl:with-param name="caller">intern:parse-dates</xsl:with-param>
				<xsl:with-param name="level">DEBUG</xsl:with-param>
				<xsl:with-param name="message">$vorläufiges-ergebnis: »<xsl:sequence select="$vorläufiges-ergebnis"/>«</xsl:with-param>
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="every $i in (for $j in $vorläufiges-ergebnis return tokenize($j, '[,/]') ) satisfies ($i castable as xs:date) ">
					<xsl:sequence select="$vorläufiges-ergebnis"/>
				</xsl:when>
				<xsl:otherwise>
					<!-- ToDo: WarnIfIllegalInput -->
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">intern:parse-dates</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="message">kann »<xsl:sequence select="$input"/>« nicht parsen</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:function>
	
	<xsl:function name="xsb:parse-date" as="xs:date?">
		<xsl:param name="date-string" as="xs:string?"/>
		<xsl:sequence select="intern:parse-date(intern:normalize-date-string($date-string) )"/>
	</xsl:function>
	
	<xsl:function name="intern:parse-date" as="xs:date?">
		<!-- normalisierter Datums-String -->
		<xsl:param name="input" as="xs:string?"/>
		<xsl:if test="normalize-space($input)">
			<xsl:variable name="vorläufiges-ergebnis" as="xs:string?">
				<xsl:choose>
					<!-- eindeutige Fälle zuerst -->
					<!-- YYYY-MM-DD -->
					<xsl:when test="matches($input, '^&Jahre4;-[0-9]{2}-[0-9]{2}$')">
						<xsl:sequence select="$input"/>
					</xsl:when>
					<!-- TT.MM.JJJJ -->
					<xsl:when test="matches($input, '^[0-9]{1,2}\.[0-9]{1,2}\.&Jahre4;$')">
						<xsl:variable name="temp" as="xs:string+" select="tokenize($input, '\.')"/>
						<xsl:sequence select="intern:date-string($temp[3], $temp[2], $temp[1])"/>
					</xsl:when>
					<!-- DD. Month YYYY -->
					<xsl:when test="matches($input, '^[0-9]{1,2}\.&Monate;&Jahre4;$')">
						<xsl:variable name="temp" as="xs:string+">
							<xsl:analyze-string select="$input" regex="&Monate;">
								<xsl:matching-substring>
									<xsl:sequence select="intern:month-to-integer-string(.)"/>
								</xsl:matching-substring>
								<xsl:non-matching-substring>
									<xsl:sequence select="translate(., '.', '')"/>
								</xsl:non-matching-substring>
							</xsl:analyze-string>
						</xsl:variable>
						<xsl:sequence select="intern:date-string($temp[3], $temp[2], $temp[1])"/>
					</xsl:when>
					<!-- YYYY Month DD -->
					<xsl:when test="matches($input, '^&Jahre4;&Monate;[0-9]{1,2}$')">
						<xsl:variable name="temp" as="xs:string+">
							<xsl:analyze-string select="$input" regex="&Monate;">
								<xsl:matching-substring>
									<xsl:sequence select="intern:month-to-integer-string(.)"/>
								</xsl:matching-substring>
								<xsl:non-matching-substring>
									<xsl:sequence select="."/>
								</xsl:non-matching-substring>
							</xsl:analyze-string>
						</xsl:variable>
						<xsl:sequence select="intern:date-string($temp[1], $temp[2], $temp[3])"/>
					</xsl:when>
					<!-- dann die weniger klaren Fälle -->
					<xsl:when test="matches($input, '^[0-9]{1,4}-[0-9]{1,2}-[0-9]{1,2}$')">
						<xsl:variable name="temp" as="xs:string+" select="tokenize($input, '-')"/>
						<xsl:sequence select="intern:date-string($temp[1], $temp[2], $temp[3])"/>
					</xsl:when>
					<xsl:when test="matches($input, '^[0-9]{1,2}\.&Monate;[0-9]{1,4}$')">
						<xsl:variable name="temp" as="xs:string+">
							<xsl:analyze-string select="$input" regex="&Monate;">
								<xsl:matching-substring>
									<xsl:sequence select="intern:month-to-integer-string(.)"/>
								</xsl:matching-substring>
								<xsl:non-matching-substring>
									<xsl:sequence select="translate(., '.', '')"/>
								</xsl:non-matching-substring>
							</xsl:analyze-string>
						</xsl:variable>
						<xsl:sequence select="intern:date-string($temp[3], $temp[2], $temp[1])"/>
					</xsl:when>
					<xsl:when test="matches($input, '^[0-9]{1,4}&Monate;[0-9]{1,2}$')">
						<xsl:variable name="temp" as="xs:string+">
							<xsl:analyze-string select="$input" regex="&Monate;">
								<xsl:matching-substring>
									<xsl:sequence select="intern:month-to-integer-string(.)"/>
								</xsl:matching-substring>
								<xsl:non-matching-substring>
									<xsl:sequence select="."/>
								</xsl:non-matching-substring>
							</xsl:analyze-string>
						</xsl:variable>
						<xsl:sequence select="intern:date-string($temp[1], $temp[2], $temp[3])"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="xsb:internals.FunctionError">
				<xsl:with-param name="caller">intern:parse-date</xsl:with-param>
				<xsl:with-param name="level">DEBUG</xsl:with-param>
				<xsl:with-param name="message">$vorläufiges-ergebnis: »<xsl:sequence select="$vorläufiges-ergebnis"/>« für Eingabe »<xsl:sequence select="$input"/>«</xsl:with-param>
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="$vorläufiges-ergebnis castable as xs:date">
					<xsl:sequence select="xs:date($vorläufiges-ergebnis)"/>
				</xsl:when>
				<xsl:otherwise>
					<!-- ToDo: WarnIfIllegalInput -->
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">intern:parse-date</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="message">kann »<xsl:sequence select="$input"/>« nicht parsen</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:function>
	
	<xsl:function name="intern:date-string" as="xs:string">
		<xsl:param name="year" as="xs:string"/>
		<xsl:param name="month" as="xs:string"/>
		<xsl:param name="day" as="xs:string"/>
		<xsl:sequence select="concat(
			format-number(xs:integer($year), '0000'), '-',
			format-number(xs:integer($month), '00'), '-',
			format-number(xs:integer($day), '00') )"/>
	</xsl:function>
	
	<xsl:function name="intern:month-to-integer-string" as="xs:string">
		<xsl:param name="month-string" as="xs:string"/>
		<xsl:sequence select="format-number((index-of(tokenize(translate('&Monate;', '()', ''), '\|'), $month-string) ), '00')"/>
	</xsl:function>
	
	<xsl:function name="xsb:last-day-of-month" as="xs:string">
		<xsl:param name="YYYY-year" as="xs:string?"/>
		<xsl:param name="month" as="xs:string?"/>
		<xsl:variable name="temp-month" as="xs:string?" select="intern:normalize-date-string($month)"/>
		<xsl:choose>
			<xsl:when test="$temp-month = ('JAN', 'MRZ', 'MAI', 'JUL', 'AUG', 'OKT', 'DEZ')">
				<xsl:sequence select=" '31' "/>
			</xsl:when>
			<xsl:when test="$temp-month = ('APR', 'JUN', 'SEP', 'NOV')">
				<xsl:sequence select=" '30' "/>
			</xsl:when>
			<xsl:when test="$temp-month = ('FEB')">
				<xsl:choose>
					<xsl:when test="concat($YYYY-year, '-', intern:month-to-integer-string($month), '-29') castable as xs:date">
						<xsl:sequence select=" '29' "/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:sequence select=" '28' "/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
				<!-- ToDo WarnIfIllegalInput -->
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	
	<xsl:function name="intern:normalize-date-string" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="prepared" select="upper-case(translate(normalize-space($input), ' ', '') )"/>
		<xsl:variable name="replace-list" as="element()+">
			<p>
				<s>JANUARY|JAN\.|JANUAR</s>
				<r>JAN</r>
			</p>
			<p>
				<s>FEBRUARY|FEB\.|FEBRUAR</s>
				<r>FEB</r>
			</p>
			<p>
				<s>MÄRZ|MARCH</s>
				<r>MRZ</r>
			</p>
			<p>
				<s>APRIL|APR\.</s>
				<r>APR</r>
			</p>
			<p>
				<s>MAY</s>
				<r>MAI</r>
			</p>
			<p>
				<s>JUNI|JUNE</s>
				<r>JUN</r>
			</p>
			<p>
				<s>JULI|JULY</s>
				<r>JUL</r>
			</p>
			<p>
				<s>AUGUST|AUG\.</s>
				<r>AUG</r>
			</p>
			<p>
				<s>SEPTEMBER|SEP\.|SEPT\.</s>
				<r>SEP</r>
			</p>
			<p>
				<s>OKTOBER|OKT\.|OCTOBER|OCT\.</s>
				<r>OKT</r>
			</p>
			<p>
				<s>NOVEMBER|NOV\.</s>
				<r>NOV</r>
			</p>
			<p>
				<s>DEZEMBER|DEZ\.|DECEMBER|DEC\.</s>
				<r>DEZ</r>
			</p>
			<p>
				<s>UM</s>
				<r>CA</r>
			</p>
			<p>
				<s>CA\.</s>
				<r>CA</r>
			</p>
			<p>
				<s>1ST</s>
				<r>1.</r>
			</p>
			<p>
				<s>2ND</s>
				<r>2.</r>
			</p>
			<p>
				<s>(0|[3-9])TH</s>
				<r>$1.</r>
			</p>
			<p>
				<s>OF</s>
				<r></r>
			</p>
			<p>
				<s>UND|U\.</s>
				<r>;</r>
			</p>
			<p>
				<s>BIS</s>
				<r>-</r>
			</p>
			<p>
				<s></s>
				<r></r>
			</p>
			<!-- zum Schluss -->
			<p>
				<s>\(|\)|\[|\]</s>
				<r>;</r>
			</p>
			<p>
				<s>^;+|;+$</s>
				<r></r>
			</p>
			<p>
				<s>;+</s>
				<r>;</r>
			</p>
		</xsl:variable>
		<xsl:sequence select="xsb:replace($prepared,
				$replace-list/s/string(),
				$replace-list/r/string()
			)"/>
	</xsl:function>
	
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
