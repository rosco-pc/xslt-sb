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
<!ENTITY MonateNumerisch "(0?[1-9]|1[012])">
<!ENTITY Jahre4 "([0-9]{4})">
<!ENTITY ISO-Date "(&Jahre4;-[0-9]{2}-[0-9]{2})">
<!ENTITY JHDZiffern "[1-9][0-9]?\.">
<!ENTITY JHDToken "JHD">
<!ENTITY JHDTokenSearch "&JHDToken;\.">
<!ENTITY JHDTokenReplace "&JHDToken;.">
<!ENTITY JHD "&JHDZiffern;JHDToken">
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
	
	
	
	<xsl:function name="xsb:parse-dates" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="xsb:parse-dates(intern:normalize-date-string($input), true() )"/>
	</xsl:function>
	
	<xsl:function name="xsb:parse-dates" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:sequence select="intern:parse-dates(intern:normalize-date-string($input), $warn-if-wrong-input)"/>
	</xsl:function>
	
	
	
	<!-- Ausgabeformat: (yyyy-mm-dd/yyyy-mm-dd)?(, yyyy-mm-dd/yyyy-mm-dd)+ -->
	<xsl:function name="intern:parse-dates" as="xs:string+">
		<!-- normalisierter Datums-String -->
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:call-template name="xsb:internals.FunctionError">
			<xsl:with-param name="caller">intern:parse-dates</xsl:with-param>
			<xsl:with-param name="level">TRACE</xsl:with-param>
			<xsl:with-param name="message">ToDo********** start processing with $input: »<xsl:sequence select="$input"/>«</xsl:with-param>
		</xsl:call-template>
		<xsl:variable name="recursive-replacements" as="element()+">
			<p>
				<s>&Monate;[/\-]&Tage;&Monate;&Jahre4;</s>
				<r>$1$5-$2$3$4$5</r>
			</p>
			<p>
				<s>&Monate;[;]&Tage;&Monate;&Jahre4;</s>
				<r>$1$5;$2$3$4$5</r>
			</p>
			<p>
				<s>&Monate;[,]&Tage;&Monate;&Jahre4;</s>
				<r>$1$5,$2$3$4$5</r>
			</p>
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
			<p>
				<s>&Monate;[/\-]&Monate;&Jahre4;</s>
				<r>$1$3-$2$3</r>
			</p>
			<p>
				<s>&Monate;[;,]&Monate;&Jahre4;</s>
				<r>$1$3;$2$3</r>
			</p>
			<!-- ziemlich am Ende -->
			<p>
				<s>^&Jahre4;&Monate;&Tage;[/\-]&Monate;&Tage;(,&Tage;)*$</s>
				<r>$3$4$2$1-$6$7$5$1</r>
			</p>
			<p>
				<s>^&Jahre4;&Monate;&Tage;[;,]&Monate;&Tage;(,&Tage;)*$</s>
				<r>$3$4$2$1;$6$7$5$1</r>
			</p>
			<p>
				<s>^&Jahre4;&Monate;&Tage;[/\-]&Tage;(,&Tage;)*$</s>
				<r>$3$4$2$1-$5$6$2$1</r>
			</p>
			<p>
				<s>^&Jahre4;&Monate;&Tage;[;,]&Tage;(,&Tage;)*$</s>
				<r>$3$4$2$1;$5$6$2$1</r>
			</p>
			<p>
				<s>&Jahre4;&Monate;&Tage;</s>
				<r>$3$4$2$1</r>
			</p>
			<p>
				<s>&Jahre4;&Monate;</s>
				<r>$2$1</r>
			</p>
			<p>
				<s>(&JHDZiffern;)([/;:,\-])(&JHDZiffern;)(&JHDTokenSearch;)</s>
				<r>$1$4$2$3$4</r>
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
			<xsl:with-param name="level">TRACE</xsl:with-param>
			<xsl:with-param name="message">$input: »<xsl:sequence select="$input"/>«, $prepared: »<xsl:sequence select="$prepared"/>«</xsl:with-param>
		</xsl:call-template>
		<xsl:variable name="vorläufiges-ergebnis" as="xs:string*">
			<xsl:choose>
				<!-- die billigen Versuche zuerst -->
				<!-- einfache Daten -->
				<!-- YYYY -->
				<xsl:when test="matches($input, '^&Jahre4;$')">
					<xsl:sequence select="concat(intern:date-string($input, '1', '1'), '/', intern:date-string($input, '12', '31') )"/>
				</xsl:when>
				<!-- MMMYYYY -->
				<xsl:when test="matches($prepared, '^&Monate;&Jahre4;$')">
					<xsl:variable name="year" as="xs:string" select="translate($prepared, '^&Monate;', '')"/>
					<xsl:variable name="month" as="xs:string" select="replace(replace($prepared, '[1-9][0-9]{0,3}$', ''), '&Monate;', '$1')"/>
					<xsl:sequence select="concat(
							intern:date-string($year, intern:month-to-integer-string($month), '1'),
							'/',
							intern:date-string($year, intern:month-to-integer-string($month), xsb:last-day-of-month($year, $month, false()) )
						)"/>
				</xsl:when>
				<!-- D.MMMYYYY/DD.MMMYYYY/DMMMYYYY/DDMMMYYYY -->
				<xsl:when test="matches($prepared, '^&Tage;&Monate;&Jahre4;$')">
					<xsl:variable name="year" as="xs:string" select="replace($prepared, '^&Tage;&Monate;', '')"/>
					<xsl:variable name="month" as="xs:string" select="replace(replace($prepared, '^&Tage;|&Jahre4;$', ''), '&Monate;', '$1')"/>
					<xsl:variable name="day" as="xs:string" select="replace($prepared, '(\.)?&Monate;&Jahre4;$', '')"/>
					<xsl:sequence select="concat(
							intern:date-string($year, intern:month-to-integer-string($month), $day),
							'/',
							intern:date-string($year, intern:month-to-integer-string($month), $day)
						)"/>
				</xsl:when>
				<xsl:when test="string(intern:parse-date($prepared, false()) )">
					<xsl:variable name="temp" as="xs:string" select="string(intern:parse-date($prepared, false()) )"/>
					<xsl:sequence select="concat($temp, '/', $temp)"/>
				</xsl:when>
				<!-- zusammengesetzte Daten -->
				<!-- YYYY-YYYY, YYYY/YYYY -->
				<xsl:when test="matches($prepared, '^&Jahre4;-&Jahre4;$')">
					<xsl:variable name="temp" as="xs:string+" select="tokenize($prepared, '-')"/>
					<xsl:sequence select="concat(intern:date-string($temp[1], '1', '1'), '/', intern:date-string($temp[2], '12', '31') )"/>
				</xsl:when>
				<xsl:when test="matches($prepared, '^&Monate;&Jahre4;-&Monate;&Jahre4;$')">
					<xsl:sequence select="concat(
						intern:date-string(
							substring($prepared, 4,4),
							intern:month-to-integer-string(substring($prepared, 1, 3) ),
							'1'),
						'/',
						intern:date-string(
							substring($prepared, 12,4),
							intern:month-to-integer-string(substring($prepared, 9, 3) ),
							xsb:last-day-of-month(substring($prepared, 12,4), substring($prepared, 9, 3), false() ) )
						)"/>
				</xsl:when>
				<xsl:when test="matches($prepared, '^&Tage;&Monate;&Jahre4;-&Tage;&Monate;&Jahre4;$')">
					<xsl:variable name="temp" as="xs:string+" select="tokenize($prepared, '-')"/>
					<xsl:sequence select="concat(intern:parse-date($temp[1], false()), '/', intern:parse-date($temp[2], false()) )"/>
				</xsl:when>
				<!-- Jhdt./sec. usw. -->
				<xsl:when test="normalize-space(intern:century-to-normalized-date($prepared, false()))">
					<xsl:sequence select="intern:century-to-normalized-date($prepared, false())"/>
				</xsl:when>
				<xsl:when test="matches($prepared, '^&JHDZiffern;&JHDTokenSearch;-&JHDZiffern;&JHDTokenSearch;$')">
						<xsl:sequence select="concat(
											substring-before(intern:century-to-normalized-date(substring-before($prepared, '-'), false()), '/'),
											'/',
											substring-after(intern:century-to-normalized-date(substring-after($prepared, '-'), false()), '/')
										)"/>
				</xsl:when>
				<!-- vielleicht hilft Ersetzen von numerischen Monatsnamen durch literale -->
				<xsl:when test="$input ne intern:replace-month-integers-with-month-names($input) and normalize-space(intern:parse-dates(intern:replace-month-integers-with-month-names($input), false() ) )">
					<xsl:sequence select="intern:parse-dates(intern:replace-month-integers-with-month-names($input), false() )"/>
				</xsl:when>
				<!-- dann die aufwändigeren Versuche (oder eher eine Verzweiflungstat) -->
				<xsl:when test="contains($prepared, ';') and (every $i in tokenize($prepared, ';') satisfies intern:parse-dates($i, false()) )">
					<xsl:sequence select="string-join(for $i in tokenize($prepared, ';') return intern:parse-dates($i, false()), ', ')"/>
				</xsl:when>
				<!-- und noch verzweifelter: -->
				<xsl:when test="contains($prepared, ',') and (every $i in tokenize($prepared, ',') satisfies intern:parse-dates($i, false()) )">
					<xsl:sequence select="string-join(for $i in tokenize($prepared, ',') return intern:parse-dates($i, false()), ', ')"/>
				</xsl:when>
				<!-- und weil ich mich vielleicht verzettelt habe: -->
				<xsl:when test="matches($input, '[,;]') and (every $i in tokenize($input, '[,;]') satisfies intern:parse-dates($i, false()) )">
					<xsl:sequence select="string-join(for $i in tokenize($input, '[,;]') return intern:parse-dates($i, false()), ', ')"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="xsb:internals.FunctionError">
			<xsl:with-param name="caller">intern:parse-dates</xsl:with-param>
			<xsl:with-param name="level">TRACE</xsl:with-param>
			<xsl:with-param name="message">$vorläufiges-ergebnis: »<xsl:sequence select="$vorläufiges-ergebnis"/>«</xsl:with-param>
		</xsl:call-template>
		<xsl:choose>
			<xsl:when test="normalize-space(string-join($vorläufiges-ergebnis, '') ) and (every $i in (for $j in $vorläufiges-ergebnis return tokenize($j, '[,/]') ) satisfies ($i castable as xs:date) )">
				<xsl:sequence select="$vorläufiges-ergebnis"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="''"/>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">intern:parse-dates</xsl:with-param>
					<xsl:with-param name="level" select="if ($warn-if-wrong-input) then 'WARN' else 'TRACE'"/>
					<xsl:with-param name="message">kann »<xsl:sequence select="$input"/>« nicht parsen</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	<xsl:function name="xsb:parse-date" as="xs:date?">
		<xsl:param name="date-string" as="xs:string?"/>
		<xsl:sequence select="xsb:parse-date($date-string, true() )"/>
	</xsl:function>
	
	<xsl:function name="xsb:parse-date" as="xs:date?">
		<xsl:param name="date-string" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:sequence select="intern:parse-date(intern:normalize-date-string($date-string), $warn-if-wrong-input )"/>
	</xsl:function>
	
	<xsl:function name="intern:parse-date" as="xs:date?">
		<xsl:param name="input" as="xs:string?"/><!-- normalisierter Datums-String -->
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:if test="normalize-space($input)">
			<xsl:variable name="vorläufiges-ergebnis" as="xs:string?">
				<xsl:choose>
					<!-- eindeutige Fälle zuerst -->
					<!-- YYYY-MM-DD -->
					<xsl:when test="matches($input, '^&ISO-Date;$')">
						<xsl:sequence select="$input"/>
					</xsl:when>
					<!-- TT.MM.JJJJ -->
					<xsl:when test="matches($input, '^[0-9]{1,2}\.[0-9]{1,2}\.&Jahre4;$')">
						<xsl:variable name="temp" as="xs:string+" select="tokenize($input, '\.')"/>
						<xsl:sequence select="intern:date-string($temp[3], $temp[2], $temp[1])"/>
					</xsl:when>
					<!-- DD. Month YYYY -->
					<xsl:when test="matches($input, '^[0-9]{1,2}(\.)?&Monate;&Jahre4;$')">
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
				<xsl:with-param name="level">TRACE</xsl:with-param>
				<xsl:with-param name="message">$vorläufiges-ergebnis: »<xsl:sequence select="$vorläufiges-ergebnis"/>« für Eingabe »<xsl:sequence select="$input"/>«</xsl:with-param>
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="$vorläufiges-ergebnis castable as xs:date">
					<xsl:sequence select="xs:date($vorläufiges-ergebnis)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">intern:parse-date</xsl:with-param>
						<xsl:with-param name="level" select="if ($warn-if-wrong-input) then 'WARN' else 'TRACE'"/>
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
	
	<xsl:function name="intern:integer-string-to-month" as="xs:string">
		<xsl:param name="integer-string" as="xs:string"/>
		<xsl:choose>
			<xsl:when test="($integer-string castable as xs:integer) and ((xs:integer($integer-string) ge 1) and (xs:integer($integer-string) le 12) )">
				<xsl:sequence select="tokenize(translate('&Monate;', '()', ''), '\|')[xs:integer($integer-string)]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$integer-string"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	
	<xsl:function name="intern:replace-month-integers-with-month-names" as="xs:string">
		<xsl:param name="date-string" as="xs:string?"/><!-- normalisierter Datums-String -->
		<xsl:variable name="temp" as="xs:string*">
			<xsl:analyze-string select="$date-string" regex="\.(0?[1-9]|1[012])\.([0-9][0-9][0-9][0-9])">
				<xsl:matching-substring>
					<xsl:variable name="tokenized-matching-substring" as="xs:string+" select="tokenize(., '\.')"/>
					<xsl:sequence select="concat('.', intern:integer-string-to-month($tokenized-matching-substring[2]), $tokenized-matching-substring[3])"/>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<xsl:sequence select="."/>
				</xsl:non-matching-substring>
			</xsl:analyze-string>
		</xsl:variable>
		<xsl:sequence select="string-join($temp, '')"/>
	</xsl:function>
	
	
	
	<xsl:function name="xsb:last-day-of-month" as="xs:string">
		<xsl:param name="YYYY-year" as="xs:string?"/>
		<xsl:param name="month" as="xs:string?"/>
		<xsl:sequence select="xsb:last-day-of-month($YYYY-year, $month, true() )"/>
	</xsl:function>
	
	
	<xsl:function name="xsb:last-day-of-month" as="xs:string">
		<xsl:param name="YYYY-year" as="xs:string?"/>
		<xsl:param name="month" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
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
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:last-day-of-month</xsl:with-param>
					<xsl:with-param name="level" select="if ($warn-if-wrong-input) then 'WARN' else 'TRACE'"/>
					<xsl:with-param name="message">kann kein Ergebnis für Eingabe ($YYYY-year = »<xsl:sequence select="$YYYY-year"/>« und $month = »<xsl:sequence select="$month"/>«) ermitteln</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	<xsl:function name="intern:century-to-normalized-date" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:variable name="prepared" as="xs:string?" select="replace($input, '\.?&JHDTokenReplace;?', '')"/>
		<xsl:choose>
			<xsl:when test="$prepared castable as xs:integer">
				<xsl:sequence select="concat(
					intern:date-string(xs:string((xs:integer($prepared) - 1) * 100 + 1 ), '1', '1'),
					'/',
					intern:date-string(xs:string(xs:integer($prepared)*100 ), '12', '31')
					)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="''"/>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">intern:century-to-normalized-date</xsl:with-param>
					<xsl:with-param name="level" select="if ($warn-if-wrong-input) then 'WARN' else 'TRACE'"/>
					<xsl:with-param name="message">kann Eingabe »<xsl:sequence select="$input"/>« nicht in Datum umwandeln</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	
	<xsl:function name="xsb:earliest-day" as="xs:string">
		<xsl:param name="sequence-of-ISO-dates" as="xs:string*"/>
		<xsl:choose>
			<xsl:when test="$sequence-of-ISO-dates[2] or contains($sequence-of-ISO-dates, ',')">
				<xsl:sequence select="string(min( (for $i in $sequence-of-ISO-dates return tokenize($i, '[,/] ?') )[. castable as xs:date] ) )"/>
			</xsl:when>
			<xsl:when test="matches($sequence-of-ISO-dates, '^&ISO-Date;/&ISO-Date;$')">
				<xsl:sequence select="substring-before($sequence-of-ISO-dates, '/')"/>
			</xsl:when>
			<xsl:when test="matches($sequence-of-ISO-dates, '^&ISO-Date;$')">
				<xsl:sequence select="$sequence-of-ISO-dates"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	
	
	<xsl:function name="xsb:latest-day" as="xs:string">
		<xsl:param name="sequence-of-ISO-dates" as="xs:string*"/>
		<xsl:choose>
			<xsl:when test="$sequence-of-ISO-dates[2] or contains($sequence-of-ISO-dates, ',')">
				<xsl:sequence select="string(max( (for $i in $sequence-of-ISO-dates return tokenize($i, '[,/] ?') )[. castable as xs:date] ) )"/>
			</xsl:when>
			<xsl:when test="matches($sequence-of-ISO-dates, '^&ISO-Date;/&ISO-Date;$')">
				<xsl:sequence select="substring-after($sequence-of-ISO-dates, '/')"/>
			</xsl:when>
			<xsl:when test="matches($sequence-of-ISO-dates, '^&ISO-Date;$')">
				<xsl:sequence select="$sequence-of-ISO-dates"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	
	<xsl:function name="intern:date-range" as="xs:string">
		<xsl:param name="sequence-of-ISO-dates" as="xs:string*"/>
		<xsl:choose>
			<xsl:when test="xsb:earliest-day($sequence-of-ISO-dates) and xsb:latest-day($sequence-of-ISO-dates)">
				<xsl:sequence select="concat(xsb:earliest-day($sequence-of-ISO-dates), '/', xsb:latest-day($sequence-of-ISO-dates) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
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
				<s>JH(DT)?\.</s>
				<r>&JHDTokenReplace;</r>
			</p>
			<p>
				<s>SAEC\.</s>
				<r>SEC.</r>
			</p>
			<p>
				<s>SÄC\.</s>
				<r>SEC.</r>
			</p>
			<p>
				<s>SEC\.([0-9]+)</s>
				<r>$1.&JHDTokenReplace;</r>
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
