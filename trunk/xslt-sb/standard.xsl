<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY license 'Copyright (c) 2009-2011 Stefan Krause

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
'>
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
	<!-- ====================     Auflistung der Dateien der XSLT-SB     ==================== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:import href="files.xsl"/>
	<xsl:import href="files_tests.xsl"/>
	<!--  -->
	<xsl:import href="internals.xsl"/>
	<xsl:import href="internals_tests.xsl"/>
	<!--  -->
	<xsl:import href="internals.testing.xsl"/>
	<xsl:import href="internals.testing_tests.xsl"/>
	<!--  -->
	<xsl:import href="internals.logging.xsl"/>
	<xsl:import href="internals.logging_tests.xsl"/>
	<!--  -->
	<xsl:import href="internals.stylecheck.xsl"/>
	<!--  -->
	<xsl:import href="numbers.xsl"/>
	<!--  -->
	<xsl:import href="strings.xsl"/>
	<xsl:import href="strings_tests.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Beschreibung, Design rules etc.     ==================== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="standard.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Standard-Funktionen</doc:title>
		<para xml:id="description">Die XSLT-Standard-Bibliothek (XSLT-SB) beinhaltet nützliche, immer wieder gebrauchte Funktionen und Templates. 
			Gleichzeitig dient sie als beispielhafte Inplementierung bestimmter Techniken. Sie wendet sich als Beispielsammlung vor allem an
			deutschsprachige Entwickler, um für diese die Einstiegshürden zu senken.</para>
		<para>Autor: <author>
			<firstname>Stefan</firstname>
			<surname>Krause</surname>
		</author>
		</para>
		<para>Homepage: <link xlink:href="http://www.expedimentum.org/">http://www.expedimentum.org/</link></para>
		<para><emphasis role="bold">Hinweise:</emphasis></para>
		<para>Die Stylesheets folgen dem Paradigma von "Convention over Configuration", 
			d.h. soweit sinnvoll, wird mit Voreinstellungen gearbeitet, die aber übeschrieben werden können.</para>
		<para>Ungültige Eingaben werden soweit wie möglich abgefangen und – unter Ausgabe einer Warnung – durch sinnvolle Werte ersetzt. 
		Diese Warnung kann abgeschaltet werden, das muss aber explizit erfolgen.</para>
		<para>Per Standard werden dafür folgende Fehlerlevel verwendet:
			<simplelist>
				<member><code>WARN</code>: Falsche Parameterwerte, ungültige Eingabewerte, es konnte zur Fehlerbehebung ein Standardwert zurückgegeben werden</member>
				<member><code>ERROR</code>: falsche Benutzung der XSB, Programmierfehler: in der Regel Abbruch der Verarbeitung</member>
				<member><code>FATAL</code> (sofortiger Abbruch der Verarbeitung): 
					a) Fehler hat eventuell externe Auswirkungen/Seiteneffekte, z.B. falsche Ermittlung eines Dateinamens, 
					b) Fataler Fehler innerhalb der XSB</member>
			</simplelist>
		</para>
		<para>Diese Bibliothek ist "work in progress". Templates und Funktionen entstehen nicht systematisch, sondern nach Bedarf. 
			Entsprechend ihrer Reife werden sie mit einem der Stati "alpha", "beta", "mature" versehen. Dabei werden folgende Kriterien zu Grunde gelegt:
			<simplelist>
				<member>alpha: Tests erfolgreich mit Saxon</member>
				<member>beta: Tests erfolgreich mit Saxon sowie AltovaXML oder Intel, außerdem haben alle aufgerufenen Funktionen/Templates den Status "beta"</member>
				<member>mature: Funktion bzw. Template ist seit mindestens einem Jahr Teil der Bibliothek und alle benutzen Funktionen/Templates haben den Status "mature"</member>
			</simplelist>
			Produktiv sollten nur mit "mature" gekennzeichnete Funktionen und Templates eingesetzt werden.</para>
		<para><emphasis role="bold">Namenskonventionen:</emphasis></para>
		<para>Es werden zwei Namespaces verwendet: <code>http://www.expedimentum.org/XSLT/SB</code> mit dem Präfix <code>xsb:</code> und 
			<code>http://www.expedimentum.org/XSLT/SB/intern</code> mit dem Präfix <code>intern:</code>. 
			Daneben kommen für spezielle Funktionen (wie der Aufruf von Java oder saxon-spezifischen Funktionen) weitere Namespaces zum Einsatz. Generell gilt: Funktionen und Templates, 
			die ausschließlich zum internen Gebrauch innerhalb der XSB gedacht sind, haben das Präfix <code>intern:</code>, alle anderen das Präfix <code>xsb:</code>. Natürlich
			gibt es immer einen Graubereich, so dass sich sicher leicht Inkonsistenzen finden lassen.
		</para>
		<para>Für Templates, Funktionen, Parameter und Variablen werden möglichst sprechende Namen gewählt, möglichst in Anlehnung an 
			XPath und XSLT.</para>
		<para>Templates werden in Klassennotation bezeichnet. Der lokale Template-Name beginnt mit einem Großbuchstaben, 
			z.B. "<code>intern:internals.logging.Output</code>"</para>
		<para>Funktionen werden durchgekoppelt mit Kleinbuchstaben bezeichnet, z.B. "<function>xsb:roman-numeral-to-integer()</function>".</para>
		<para>Stylesheet-Parameter (mit globaler Gültigkeit) werden in Klassennotation bezeichnet. Der lokale Name beginnt 
			mit einem Kleinbuchstaben, z.B. "<code>$internals.logging.output-target</code>". Sie sind in keinem Namespace.
			Stylesheet-Parameter werden jeweils nur einmal definiert, und zwar in dem Stylesheet, das in der Import-Hierarchie die niedrigste Priorität hat.</para>
		<para>Variablen, die von einem Parameter abgeleitet werden, beginnen mit einem Unterstrich, 
			z.B. "<code>$_internals.logging.write-to-console</code>".</para>
		<para>Lokale Variablen werden mit einem kurzen, sprechenden Namen bezeichnet, z.B. "<code>$temp</code>".</para>
		<para>Getunnelte Parameter werden mit der Endung "<code>.tunneld</code>" versehen, z.B. "<code>$log-entry.write-to-console.tunneld</code>".</para>
		<para>Getunnelte Parameter werden im empfangenden Stylesheet deklariert.</para>
		<para><emphasis render="bold">Typung</emphasis></para>
		<para>Ergebnisse von Funktionen und Templates werden – soweit möglich – getypt. Die Rückgabe einer empty sequence wird vermieden, 
			vielmehr werden dem Typ entsprechend 0, Leerstring o.ä. zurückgegeben.</para>
		<para>An Funktionen oder Templates übergebene Parameter sollen  – soweit möglich – empty sequences als Eingabe akzeptieren, um eine einfache Benutzbarkeit zu erreichen.</para>
		<para><emphasis render="bold">Tests</emphasis></para>
		<para>Templates und Funktionen werden – soweit möglich – getestet. Dazu gibt es am Ende jeden Stylesheets Test-Abschnitte oder externe Test-Stylesheets (nach dem Namensschema <code>xxxxx_tests.xsl</code>).</para>
		<para>Die Tests haben zwei Aufgaben: einerseits weisen sie das richtige Funktionieren der Templates/Funktionen nach, andererseits stellen sie bei späteren Änderungen
			an den Templates/Funktionen sicher, das die ursprüngliche Funktionalität nicht geändert wird.</para>
		<para>Daraus folgt, das bestehende Tests nicht nachträglich geändert, sondern nur ergänzt werden dürfen.</para>
		<para>Jede Funktion wird mindestens pro Argument mit einem erwartetem Positiv-/<code>true()</code>-Wert, einem erwarteten Negativ-/<code>false()</code>-Wert,
			einem Leerstring/0-Wert und der <code>empty sequence</code> getestet.</para>
		<para>Bei jeder Stylesheet-Datei werden die Tests in einem Template mit dem Namen <code>intern:${Dateiname_ohne_Erweiterung}.self-test</code> zusammengefasst.</para>
		<para xml:id="standard.license" role="license"><emphasis role="bold">Lizenz (duale Lizenzierung)</emphasis></para>
		<para role="license">Die XSLT-SB und alle dazugehörigen Stylesheets und Dokumentationen sind unter einer Creative Commons-Lizenz 
			(<link xlink:href="http://creativecommons.org/licenses/by/3.0/">CC-BY&#160;3.0</link>) lizenziert. 
			Die Weiternutzung ist bei Namensnennung erlaubt.</para>
		<para role="license">Die XSLT-SB und alle dazugehörigen Stylesheets und Dokumentationen sind unter der sogenannten Expat License (einer GPL-kompatiblen MIT License) lizensiert.
			Sie dürfen – als Ganzes oder auszugweise – unter Beibehaltung der Copyright-Notiz kopiert, verändert, veröffentlicht und verbreitet werden. 
			Der verbindliche Lizenztext:</para>
	<programlisting role="license">
&license;
</programlisting>
		<para role="license">Von dieser Lizenzierung ausgenommen sind Software, Stylesheets und andere Werke Dritter, die zum Erzeugen und Ausführen der XSLT
		eventuell notwendig, aber nicht Bestandteil der Distribution sind.</para>
		<itemizedlist>
			<title>Original-URLs</title>
			<listitem>
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/standard.xsl">&XSL-Base-Directory;/standard.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/standard.html">&doc-Base-Directory;/standard.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/standard.xsl">&XSL-Base-Directory;/standard.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/standard.html">&doc-Base-Directory;/standard.html</link></para>
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
				<revnumber>0.53</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Umstellung auf Namespaces <code>xsb:</code> und <code>intern:</code></revremark>
			</revision>
			<revision>
				<revnumber>0.36</revnumber>
				<date>2009-08-02</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Umstellung der Lizenz auf CC-BY&#160;3.0</revremark>
			</revision>
			<revision>
				<revnumber>0.26</revnumber>
				<date>2009-05-03</date>
				<authorinitials>Stf</authorinitials>
				<revremark>erste Version mit Dokumentation</revremark>
			</revision>
		</revhistory>
	</doc:doc>
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
		<!-- eigener Selbsttest -->
		<xsl:call-template name="intern:standard.self-test"/>
		<!-- fremde Selbsttests (in alphabetischer Reihenfolge der Dateinamen) -->
		<xsl:call-template name="intern:files.self-test"/>
		<xsl:call-template name="intern:internals.logging.self-test"/>
		<xsl:call-template name="intern:internals.stylecheck.self-test"/>
		<xsl:call-template name="intern:internals.testing.self-test"/>
		<xsl:call-template name="intern:internals.self-test"/>
		<xsl:call-template name="intern:numbers.self-test"/>
		<xsl:call-template name="intern:strings.self-test"/>
		<!-- Abgesang -->
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
	<xsl:template name="intern:standard.self-test">
		<!-- keine lokalen Templates oder Funktionen vorhanden -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
