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
	exclude-result-prefixes="doc docv"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:import href="standard.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="pattern+includes.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Pattern und Includes</doc:title>
		<para>Dieses Stylesheet enthält Pattern und Templates, die häufig verwendet werden können, aber nicht immer verwendet werden müssen. Es dient außerdem als Beispiel zur Verwendung der XSLT-SB.</para>
		<para>Die Templates sind dazu gedacht, in eigene Stylesheets kopiert zu werden, es kann aber auch direkt inkludiert werden.</para>
		<para><emphasis role="bold">Achtung!</emphasis> Das Stylesheet muss zur korrekten Funktion mit <function>&lt;xsl:include/&gt;</function> eingebunden werden!</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/pattern+includes.xsl">&XSL-Base-Directory;/pattern+includes.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/pattern+includes.html">&doc-Base-Directory;/pattern+includes.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/pattern+includes.xsl">&XSL-Base-Directory;/pattern+includes.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/pattern+includes.html">&doc-Base-Directory;/pattern+includes.html</link></para>
			</listitem>
			<listitem>
				<para>XSLT-SB: <link xlink:href="&XSL-Base-Directory;/">&XSL-Base-Directory;/</link></para>
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
				<revnumber>0.116</revnumber>
				<date>2010-07-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>erste Selbstests eingebaut</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.89</revnumber>
				<date>2010-04-18</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:internals.Error     __________ -->
	<doc:template>
		<para>Dieses Template überschreibt <link xlink:href="internals.html#internals.Error">das gleichnamige Template</link> aus <code>internals.xsl</code>.</para>
		<para>Es gibt zusätzlich den aktuellen Mode aus.</para>
		<para>Dazu bedient es sich des Templates <function>xsb:mode-name</function>, wobei die <link linkend="mode-name">dort genannten Einschränkungen</link> hier auch gelten.</para>
		<revhistory>
			<revision>
				<revnumber>0.89</revnumber>
				<date>2010-04-18</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
		<doc:param name="message"><para>Fehlermeldung</para></doc:param>
		<doc:param name="level"><para>Level der Fehlermeldung. In Anlehnung an <code>Log4j</code> werden per Vorgabe die Stufen 
			»<code>ALL</code>« > »<code>TRACE</code>« > »<code>DEBUG</code>« > »<code>INFO</code>« > »<code>WARN</code>« > »<code>ERROR</code>« > »<code>FATAL</code>« 
			(in aufsteigender Reihenfolge der Dringlichkeit) verwendet.</para>
			<para>Default: <code>ALL</code>.</para></doc:param>
		<doc:param name="caller"><para>Aufrufende(s) Funktion/Template, z.B. <function>xsb:get-context-as-string()</function></para></doc:param>
		<doc:param name="show-context"><para>Falls <code>true()</code>, wird zum Kontextkonten der Kontext angezeigt. 
			<emphasis role="bold">Achtung!</emphasis> Das schlägt fehl, wenn es keinen Kontextknoten gibt, z.B. innerhalb von Funktionen oder innerhalb 
			von <function>xsl:for-each</function>-Schleifen über dokumentenexterne Sequenzen. Deshalb gibt es auch ein Template 
			<link linkend="internals.FunctionError"><code>xsb:internals.FunctionError</code></link>, das dieses Problem umgeht.</para></doc:param>
		<doc:param name="write-to-file"><para>Falls <code>true()</code>, wird die Ausgabe in die Datei geschrieben. 
			Standardwert: <code>$_internals.logging.write-to-file</code>. In bestimmten Umgebungen, z.B. innerhalb einer Funktion, darf das Template keinen Rückgabewert liefern. 
			Über diesen Parameter kan der stylesheet-weite Standardwert überschrieben werden.</para></doc:param>
	</doc:template>
	<xsl:template name="xsb:internals.Error">
		<xsl:param name="message" as="xs:string?" required="no"/>
		<xsl:param name="level" as="xs:string?" required="no">ALL</xsl:param>
		<xsl:param name="caller" as="xs:string?" required="no"/>
		<xsl:param name="show-context" as="xs:boolean" select="false()" required="no"/>
		<xsl:param name="write-to-file" as="xs:boolean" select="$_internals.logging.write-to-file" required="no"/>
		<!--  -->
		<xsl:variable name="_level" as="xs:string" 
			select="xsb:return-default-if-empty(
			upper-case(normalize-space($level)),
			'ALL'
			)"/>
		<xsl:call-template name="xsb:internals.Logging">
			<!-- Content -->
			<xsl:with-param name="log-entry.preText" as="xs:string?">
				<xsl:variable name="mode" as="xs:string">
					<xsl:choose>
						<xsl:when test="$show-context">
							<xsl:call-template name="xsb:mode-name"/>
						</xsl:when>
						<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:sequence select="concat(
					intern:render-level-to-pretext($_level),
					if ($show-context) 
						then concat(
							if ($mode = '#default') then ('') else concat('[Mode: ', $mode, ']' ),
							intern:render-context-and-parent-as-string(.), 
							': '
							)
					 else ('')
					)"/>
			</xsl:with-param>
			<xsl:with-param name="log-entry.level" as="xs:string" select="$level"/>
			<xsl:with-param name="log-entry.text" as="xs:string">
				<xsl:sequence select="concat( (if (normalize-space($caller)) then concat ('[', $caller, '] ' ) else '') , $message)"/>
			</xsl:with-param>
			<!-- Ausgabemedium -->
			<xsl:with-param name="log-entry.write-to-file" as="xs:boolean" select="$write-to-file"/>
			<!-- Steuerung der auzugebenden Elemente -->
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
		</xsl:call-template>
		<xsl:if test="(xsb:lax-string-compare($_level, 'ERROR' ) and $_internals.errors.die-on-critical-errors) or xsb:lax-string-compare($_level, 'FATAL' )">
			<xsl:message terminate="yes">Verarbeitung abgebrochen</xsl:message>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:mode-name     __________ -->
	<doc:template>
		<para xml:id="mode-name">Dieses Template ermittelt den aktuellen Mode des Stylesheets. Es kann nicht als Funktion realisiert werden, weil innerhalb von Funktionen der aktuelle Mode nicht bekannt ist.</para>
		<para>Es benötigt für benutzerdefinierte Modes ein passendes Matching Template auf das Element <code>intern:detect</code>, z.B. <function>&lt;xsl:template match="intern:detect" mode="Mode_A"&gt;Mode_A&lt;/xsl:template&gt;</function>;
			fehlt es, wird eine entsprechende Fehlermeldung ausgegeben.</para>
		<para><emphasis role="bold">Achtung!</emphasis> Damit dieses Template funktioniert, darf es kein Template mit höherer Importing Precedence oder höherer Priority geben, dass auf <code>intern:detect</code> matcht.</para>
		<revhistory>
			<revision>
				<revnumber>0.89</revnumber>
				<date>2010-04-19</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>ausgelagert aus <code><link xlink:href="internals.html">internals.xsl</link></code></para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.85</revnumber>
				<date>2010-04-11</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="xsb:mode-name" as="xs:string">
		<xsl:variable name="temp_element" as="element()">
			<intern:detect/>
		</xsl:variable>
		<xsl:apply-templates select="$temp_element" mode="#current"/>
	</xsl:template>
	<!--  mode #default -->
	<doc:template>
		<para>Dieses Template dient der Ermittlung des aktuellen Modes im Mode »<code>#default</code>«.</para>
		<para>Es matcht auf <code>intern:detect</code>-Elemente (die natürlich nicht im Eingabe-XML vorkommen dürfen), 
			und gibt dann den Text <code>#default</code> aus.</para>
	</doc:template>
	<xsl:template match="intern:detect" mode="#default" priority="0.5">#default</xsl:template>
	<!-- mode internals.self-test -->
	<doc:template>
		<para>Dieses Template dient der Ermittlung des aktuellen Modes im Mode »<code>internals.self-test</code>«.</para>
		<para>Es matcht auf <code>intern:detect</code>-Elemente (die natürlich nicht im Eingabe-XML vorkommen dürfen), 
			und gibt dann den Text <code>internals.self-test</code> aus.</para>
	</doc:template>
	<xsl:template match="intern:detect" mode="internals.self-test" priority="0.5">internals.self-test</xsl:template>
	<!-- Beispiel für ein benutzerdefiniertes Matching-Template -->
	<!--<xsl:template match="intern:detect" mode="Mode_A">Mode_A</xsl:template>-->
	<!-- Fehler -->
	<doc:template>
		<para>Dieses Template gibt bei der Ermittlung des aktuellen Modes einen Fehler aus, wenn kein passendes Template
			für <code>intern:detect</code>-Elemente gefunden wurde.</para>
	</doc:template>
	<xsl:template match="intern:detect" mode="#all">
		<xsl:sequence select=" '#not_detected' "/>
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="caller">xsb:detect-mode</xsl:with-param>
			<xsl:with-param name="level">ERROR</xsl:with-param>
			<xsl:with-param name="message">aktueller Mode konnte nicht ermittelt werden, weil ein matching template auf das Element "intern:detect" für den aktuellen Mode fehlt.</xsl:with-param>
			<xsl:with-param name="show-context" select="false()"/>
		</xsl:call-template>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ==========     Pattern     ========== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- __________     Catch für vom Stylesheet nicht berücksichtigte Elemente     __________ -->
	<doc:template>
		<para>Dieses Template matcht auf alle Elemente (allerding mit der recht geringen Standard-Priority von -0.5) und gibt eine Fehlermeldung aus. Es überschreibt die Built-in Template Rules für Elemente.</para>
		<para>Dieses Pattern kann verwendet werden, um sicherzustellen, dass alle Elemente des Quelldokumentes im Stylesheet berücksichtigt werden.</para>
		<para>Es benötigt für benutzerdefinierte Modes ein passendes Matching Template auf das Element <code>intern:detect</code>, z.B. <function>&lt;xsl:template match="intern:detect" mode="Mode_A"&gt;Mode_A&lt;/xsl:template&gt;</function>;
			fehlt es, wird eine entsprechende Fehlermeldung ausgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.89</revnumber>
				<date>2010-04-19</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>ausgelagert aus <code><link xlink:href="internals.html">internals.xsl</link></code></para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.85</revnumber>
				<date>2010-04-11</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template match="*" mode="#all" priority="-0.5">
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="level">ERROR</xsl:with-param>
			<xsl:with-param name="message">Element nicht berücksichtigt</xsl:with-param>
			<xsl:with-param name="show-context" select="true()"/>
		</xsl:call-template>
	</xsl:template>
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
		<xsl:call-template name="intern:pattern-includes.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<doc:template>
		<para>Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>0.116</revnumber>
				<date>2010-07-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:pattern-includes.self-test">
		<xsl:variable name="current-mode" as="xs:string">
			<xsl:call-template name="xsb:mode-name"/>
		</xsl:variable>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">$current-mode</xsl:with-param>
			<xsl:with-param name="actual-value" select="$current-mode"/>
			<xsl:with-param name="reference-value" select=" 'internals.self-test' "/>
		</xsl:call-template>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
