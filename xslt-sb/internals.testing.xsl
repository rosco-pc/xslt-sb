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
	exclude-result-prefixes="doc docv xsb intern"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:import href="internals.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="internals.testing.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Testen von Stylesheets</doc:title>
		<para>Dieses Stylesheet enthält interne Templates und Funktionen zum Testen von Funktionen und Templates in XSLT-Stylesheets.</para>
		<para>Test können im Stylesheet selbst oder in einem externen Test-Stylesheet (nach dem Namensschema <code>xxxxx_tests.xsl</code>) eingebunden werden.</para>
		<itemizedlist>
			<title>Vorteile interner Tests sind:</title>
			<listitem><para>Tests sind unmittelbar mit dem zu testenden Code in einer Datei verbunden.</para></listitem>
			<listitem><para>Tests können schnell und unkompliziert beim Entwickeln erstellt und ausgeführt werden.</para></listitem>
		</itemizedlist>
		<itemizedlist>
			<title>Vorteile externer Tests sind:</title>
			<listitem>Stylesheets werden kleiner</listitem>
			<listitem><para>Fehler in den Tests führen nicht zu Fehlern im Stylesheet</para></listitem>
			<listitem><para>Die Test-Stylesheets werden aus der Stylesheet-Hierarchie ausgekoppelt. Deshalb können für die Tests 
				Stylesheets eingebunden werden, die aufgrund der Stylesheet-Hierarchie (zirkuläres <function>&lt;xsl:include/&gt;</function>/<function>&lt;xsl:import/&gt;</function>) 
				nicht in das zu testende Stylesheet selbst eingebunden werden können. Ein Beispiel dafür ist <code><link xlink:href="strings.html">strings.xsl</link></code>, 
				das (über <code><link xlink:href="internals.html">internals.xsl</link></code> und <code><link xlink:href="internals.logging.html">internals.logging.xsl</link></code>) 
				in <code><link xlink:href="internals.testing.html">internals.testing.xsl</link></code> eingebunden wird. Die Tests für <code>strings.xsl</code> wurden
				deshalb nach <code><link xlink:href="strings_tests.html">strings_tests.xsl</link></code> ausgelagert.</para></listitem>
		</itemizedlist>
		<para>In der XSLT-SB kommen beide Techniken zum Einsatz, wobei es keine festen Regeln gibt. In der Praxis wird man meist mit Tests innerhalb des Stylesheets anfangen und diese bei einem bestimmten Umfang auslagern.</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/internals.testing.xsl">&XSL-Base-Directory;/internals.testing.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/internals.testing.html">&doc-Base-Directory;/internals.testing.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/internals.testing_tests.xsl">&XSL-Base-Directory;/internals.testing_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/internals.testing_tests.html">&doc-Base-Directory;/internals.testing_tests.html</link></para>
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
				<revnumber>0.82</revnumber>
				<date>2010-03-28</date>
				<authorinitials>Stf</authorinitials>
				<revremark>initiale Version, ausgelagert aus <code>internals.xsl</code></revremark>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:variable ignore-ns="yes">
		<para>Hilfsvariable, da dieser Wert häufig benötigt wird.</para>
	</doc:variable>
	<xsl:variable name="_internals.testing.current-vendor-hash"
		as="xs:string" 
		select="xsb:current-vendor-hash()"/>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:internals.test.Function     __________ -->
	<doc:template>
		<doc:param name="caller"><para>aufrufende Funktion, wenn möglich inklusive der konkreten Parameter</para></doc:param>
		<doc:param name="actual-value"><para>Ergebnis der getesteten Funktion. Im <code>select</code>-Attribut des <function>&lt;xsl:with-param/&gt;</function>-Elements 
			sollte die Funktion aufgerufen werden.</para></doc:param>
		<doc:param name="reference-value"><para>erwarteter Rückgabewert der getesteten Funktion</para></doc:param>
		<para xml:id="internals.test.Function">Dieses Template dient zum Testen einer Funktion. Es nimmt den Namen der Funktion sowie Ist- und Soll-Wert
			entgegen und vergleicht sie. Je nach Ergebnis wird ein Bericht an das Logging-System ausgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.57</revnumber>
				<date>2009-10-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="xsb:internals.test.Function">
		<xsl:param name="caller" as="xs:string" required="yes"/>
		<xsl:param name="actual-value" required="yes" intern:solved="MissingTypes"/>
		<xsl:param name="reference-value" required="yes" intern:solved="MissingTypes"/>
		<xsl:choose>
			<xsl:when test="xsb:is($actual-value, $reference-value)">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller" select="$caller"/>
					<xsl:with-param name="message">OK (erwartet und geliefert »<xsl:value-of select="$actual-value"/>«)</xsl:with-param>
					<xsl:with-param name="level">DEBUG</xsl:with-param>
					<xsl:with-param name="show-context" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller" select="$caller"/>
					<xsl:with-param name="message">FEHLER (erwartet  »<xsl:value-of select="$reference-value"/>«, geliefert »<xsl:value-of select="$actual-value"/>«)</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="show-context" select="false()"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<doc:param name="test-node"><para>ein <link linkend="internals.testing.test-node">Testknoten</link></para></doc:param>
		<doc:param name="function-name"><para>Name der getesteten Funktion. Der Funktionsname wird sowohl zur Ermittlung des Referenzwertes aus dem Testknoten als
			auch zur Ausgabe der Resultate an das Logging-System verwendet.</para></doc:param>
		<doc:param name="actual-value"><para>aktuelles Ergebnis der getesteten Funktion. Im <code>select</code>-Attribut des <function>&lt;xsl:with-param/&gt;</function>-Elements 
			sollte die getestete Funktion mit dem Inhalt des <function>&lt;value/&gt;</function>-Elements des Testknotens als Argument aufgerufen werden.</para></doc:param>
		<para xml:id="internals.test.function.withTestItem.BooleanResult">Dieses Template unterstützt das <link linkend="internals.testing.test-node-system">Testen von Funktionen mit Testlisten</link>,
			indem es einen <link linkend="internals.testing.test-node">Testknoten</link> für das Template 
			<link linkend="internals.test.Function">xsb:internals.test.Function</link> aufbereitet.</para>
		<para xml:id="internals.testing.test-node-system">Manchmal sollen mehrere Funktionen mit einer größeren Anzahl von Parametern getestet werden.
			Ein Beispiel sind die <code><link xlink:href="files_tests.html">Tests</link></code> für <code><link xlink:href="files.html">files.xsl</link></code>,
			wo die meisten Funktionen gegen Dutzende gültige und ungültige URLs geprüft werden. <code>Test-Knoten</code> und die Templates 
			<function><link linkend="internals.test.function.withTestItem.BooleanResult">xsb:internals.test.function.withTestItem.BooleanResult</link></function>, 
			<function><link linkend="internals.test.function.withTestItem.StringResult">xsb:internals.test.function.withTestItem.StringResult</link></function> und
			<function><link linkend="internals.test.function.withTestItem.NumericResult">xsb:internals.test.function.withTestItem.NumericResult</link></function> 
			vereinfachen solche Massentests.</para>
		<para>Grundidee ist, in einer Liste von Testknoten jeweils Funktionsargumente und erwartetes Ergebnis abzulegen. 
			Eine <function>&lt;xsl:for-each/&gt;</function>-Schleife kann dann über die Sequenz der Testknoten gehen, 
			das Funktionsergebnis berechnen, es mit dem Vorgabewert vergleichen und positive und negative Ergebnisse loggen. 
			Testknoten und <function>internals.test.function.withTestItem…</function>-Templates implementieren dafür eine Infrastruktur.</para>
		<para xml:id="internals.testing.test-node">Ein <emphasis role="bold">Testknoten</emphasis> ist ein Element (der Name ist egal), das mindestens zwei Kind-Elemente haben muss: 
			eine Element mit dem Namen <code>value</code>, und ein Element mit dem qualifizierten Namen
			der zu testenden Funktion (das <emphasis role="bold">Test-Item</emphasis>). Mehrere Testknoten können in einer <emphasis role="bold">Testliste</emphasis> 
			(Name ist wieder egal) zusammengefasst werden. Da Kinder von <function>&lt;xsl:stylesheet/&gt;</function> in einem beliebigen Namensraum ignoriert werden,
			kann man die Liste dort ablegen. Ein Beispiel:</para>
		<programlisting>
<![CDATA[<intern:testliste>
	<test>
		<value>file:///server/path/test.txt</value>
		<xsb:is-absolute-url>true</xsb:is-absolute-url>
		<xsb:fileName-and-fileExtention-from-url>test.txt</xsb:fileName-and-fileExtention-from-url>
	</test>
	<test>
		<value>file:///server/path/test.txt/test</value>
		<xsb:is-absolute-url>true</xsb:is-absolute-url>
		<xsb:fileName-and-fileExtention-from-url>test</xsb:fileName-and-fileExtention-from-url>
	</test>
</intern:testliste>]]>
		</programlisting>
		<para>Diese Testliste besteht aus zwei Testknoten. Jeder Testknoten hat ein <function>&lt;value/&gt;</function>-Element, dessen Inhalt 
			(beim ersten Testkonten also »<code>file:///server/path/test.txt</code>«) von den Testroutinen als Parameter benutzt wird. 
			In den beiden Test-Items <function>&lt;xsb:is-absolute-url/&gt;</function> und <function>&lt;xsb:fileName-and-fileExtention-from-url/&gt;</function> 
			stehen die erwarteten Ergebnisse, wobei <code>true</code>
			von <function><link linkend="internals.test.function.withTestItem.BooleanResult">xsb:internals.test.function.withTestItem.BooleanResult</link></function>
			als Wahrheitswert geparst und <code>test.txt</code> von
			<function><link linkend="internals.test.function.withTestItem.StringResult">xsb:internals.test.function.withTestItem.StringResult</link></function>
			als String interpretiert wird. Die eigentliche Testroutine nimmt eine Sequenz von Testknoten und gibt diese einzeln an die
			Test-Templates weiter, etwa so:</para>
		<programlisting>
<![CDATA[<xsl:for-each select="document( '' )//intern:testliste/test">
	<xsl:call-template name="xsb:internals.test.function.withTestItem.BooleanResult">
		<xsl:with-param name="test-node" select="."/>
		<xsl:with-param name="function-name">xsb:is-absolute-url</xsl:with-param>
		<xsl:with-param name="actual-value" select="xsb:is-absolute-url(./value/text())"/>
	</xsl:call-template>
	<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
		<xsl:with-param name="test-node" select="."/>
		<xsl:with-param name="function-name">xsb:fileName-and-fileExtention-from-url</xsl:with-param>
		<xsl:with-param name="actual-value" select="xsb:fileName-and-fileExtention-from-url(./value/text())"/>
	</xsl:call-template>
</xsl:for-each>]]>
		</programlisting>
		<para>Die <code>internals.test.function.withTestItem…</code>-Templates nehmen einen Testknoten (im Template-Parameter <code>test-node</code>) und 
			einen aktuellen Wert (im Template-Parameter <code>actual-value</code>) entgegen. Der Testknoten hat ein Kindelement mit dem Namen der zu
			testenden Funktion, das das erwartete Resultat als Textknoten enthält. An Hand des Template-Parameters <code>function-name</code>
			wird dieses Kind-Element ausgewählt, in einen Wert vom gewünschten Typ (<code>boolean</code>, <code>string</code>) ungewandelt und mit
			<code>actual-value</code> verglichen. Das Ergebnis des Vergleichs – OK- oder Fehlermeldung – wird an das Logging-System übergeben.</para>
		<para xml:id="internals.testing.intern-skip">Testknoten und Test-Items können für einen oder mehrere XSLT-Prozessoren ausgeschlossen werden. Dazu erhält der Testknoten oder das Test-Item ein
			<code>intern:skip</code>-Attribut, das eine leerzeichen-getrennte Liste der betreffenden Vendor-Hashs 
			(siehe <link linkend="current-vendor-hash"><function>xsb:current-vendor-hash()</function></link>) enthält. Auf betroffenen XSLT-Prozessoren
			wird der gesamte Testknoten oder das entsprechende Test-Item übersprungen und eine Warnung
			(per Template <link linkend="internals.testing.SkippedTests"><function>xsb:internals.testing.SkippedTests</function></link>) ausgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.145</revnumber>
				<date>2011-05-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para><code>intern:skip</code>-Attribut eingebaut</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.78</revnumber>
				<date>2010-03-06</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>ausgelagert aus <code>files_temp_uri.xsl</code></para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.70</revnumber>
				<date>2009-12-07</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version in <code>files_temp_uri.xsl</code></para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="xsb:internals.test.function.withTestItem.BooleanResult">
		<!-- $test-node muss ein intern:test-element sein -->
		<xsl:param name="test-node" as="element()" required="yes"/>
		<xsl:param name="function-name" as="xs:string" required="yes"/>
		<xsl:param name="actual-value" as="xs:boolean" required="yes"/>
		<xsl:if test="intern:validate-test-node($test-node, $function-name)">
			<xsl:choose>
				<xsl:when test="xsb:listed($test-node/@intern:skip, $_internals.testing.current-vendor-hash) or xsb:listed($test-node/*[name()=$function-name]/@intern:skip, $_internals.testing.current-vendor-hash)">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.Function" intern:solved="CallTemplateTestFunction">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
						<xsl:with-param name="actual-value" select="$actual-value"/>
						<xsl:with-param name="reference-value" select="xsb:parse-string-to-boolean($test-node/*[name()=$function-name] )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<doc:param name="test-node"><para>ein <link linkend="internals.testing.test-node">Testknoten</link></para></doc:param>
		<doc:param name="function-name"><para>Name der getesteten Funktion. Der Funktionsname wird sowohl zur Ermittlung des Referenzwertes aus dem Testknoten als
			auch zur Ausgabe der Resultate an das Logging-System verwendet.</para></doc:param>
		<doc:param name="actual-value"><para>aktuelles Ergebnis der getesteten Funktion. Im <code>select</code>-Attribut des <function>&lt;xsl:with-param/&gt;</function>-Elements 
			sollte die getestete Funktion mit dem Inhalt des <function>&lt;value/&gt;</function>-Elements des Testknotens als Argument aufgerufen werden.</para></doc:param>
		<para xml:id="internals.test.function.withTestItem.StringResult">Dieses Template unterstützt das <link linkend="internals.testing.test-node-system">Testen von Funktionen mit Testlisten</link>,
			indem es einen <link linkend="internals.testing.test-node">Testknoten</link> für das Template 
			<link linkend="internals.test.Function">xsb:internals.test.Function</link> aufbereitet.</para>
		<revhistory>
			<revision>
				<revnumber>0.145</revnumber>
				<date>2011-05-03</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para><code>intern:skip</code>-Attribut eingebaut</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.78</revnumber>
				<date>2010-03-06</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>ausgelagert aus <code>files_temp_uri.xsl</code></para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.70</revnumber>
				<date>2009-12-07</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version in <code>files_temp_uri.xsl</code></para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="xsb:internals.test.function.withTestItem.StringResult">
		<!-- $test-node muss ein intern:test-element sein -->
		<xsl:param name="test-node" as="element()" required="yes"/>
		<xsl:param name="function-name" as="xs:string" required="yes"/>
		<xsl:param name="actual-value" as="xs:string?" required="yes"/>
		<xsl:if test="intern:validate-test-node($test-node, $function-name)">
			<xsl:choose>
				<xsl:when test="xsb:listed($test-node/@intern:skip, $_internals.testing.current-vendor-hash) or xsb:listed($test-node/*[name()=$function-name]/@intern:skip, $_internals.testing.current-vendor-hash)">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.Function" intern:solved="CallTemplateTestFunction">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
						<xsl:with-param name="actual-value" select="string( $actual-value )"/>
						<xsl:with-param name="reference-value" select="string( $test-node/*[name()=$function-name]/text() )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<doc:param name="test-node"><para>ein <link linkend="internals.testing.test-node">Testknoten</link></para></doc:param>
		<doc:param name="function-name"><para>Name der getesteten Funktion. Der Funktionsname wird sowohl zur Ermittlung des Referenzwertes aus dem Testknoten als
			auch zur Ausgabe der Resultate an das Logging-System verwendet.</para></doc:param>
		<doc:param name="actual-value"><para>aktuelles Ergebnis der getesteten Funktion. Im <code>select</code>-Attribut des <function>&lt;xsl:with-param/&gt;</function>-Elements 
			sollte die getestete Funktion mit dem Inhalt des <function>&lt;value/&gt;</function>-Elements des Testknotens als Argument aufgerufen werden.</para></doc:param>
		<para xml:id="internals.test.function.withTestItem.NumericResult">Dieses Template unterstützt das <link linkend="internals.testing.test-node-system">Testen von Funktionen mit Testlisten</link>,
			indem es einen <link linkend="internals.testing.test-node">Testknoten</link> für das Template 
			<link linkend="internals.test.Function">xsb:internals.test.Function</link> aufbereitet.</para>
			<para>Um bei Umwandlung und Vergleich der vermeintlich numerischen <code>actual-value</code> bzw. <code>$test-node/value/text()</code>
				einen Abbruch bei gescheiterten Cast auf z.B. <code>xs:double</code> zu vermeiden (wie es etwa bei einem Leerstring der Fall wäre), 
				wird auf <code>string</code> gecastet und dann die String-Werte verglichen.</para>
		<revhistory>
			<revision>
				<revnumber>0.0.25</revnumber>
				<date>2011-05-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>cast von reference-value auf type von actual-value eingebaut</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.94</revnumber>
				<date>2010-05-30</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="xsb:internals.test.function.withTestItem.NumericResult">
		<!-- $test-node muss ein intern:test-element sein -->
		<xsl:param name="test-node" as="element()" required="yes"/>
		<xsl:param name="function-name" as="xs:string" required="yes"/>
		<xsl:param name="actual-value" required="yes"/>
		<xsl:if test="intern:validate-test-node($test-node, $function-name)">
			<xsl:choose>
				<xsl:when test="xsb:listed($test-node/@intern:skip, $_internals.testing.current-vendor-hash) or xsb:listed($test-node/*[name()=$function-name]/@intern:skip, $_internals.testing.current-vendor-hash)">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.Function" intern:solved="CallTemplateTestFunction">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
						<xsl:with-param name="actual-value" select="$actual-value"/>
						<xsl:with-param name="reference-value" select="xsb:cast($test-node/*[name()=$function-name]/text(), xsb:type-annotation($actual-value) )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:validate-test-node     __________ -->
	<doc:function>
		<doc:param name="test-node"><para>zu testender test-node</para></doc:param>
		<doc:param name="function-name"><para>qualifizierter Name der Funktion, für die <code>$test-node</code> das erwartete Testergebnis beinhalten soll.</para></doc:param>
		<para xml:id="validate-test-node">Diese Funktion testet ein Element auf seine Eignung als Eingabe-Knoten für Funktionen wie <function>xsb:internals.test.function.withTestItem.BooleanResult</function>.</para>
		<revhistory>
			<revision>
				<revnumber>0.82</revnumber>
				<date>2010-03-28</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:validate-test-node" as="xs:boolean" intern:solved="MissingTests">
		<!-- $test-node muss ein intern:test-element sein -->
		<xsl:param name="test-node" as="element()"/>
		<xsl:param name="function-name" as="xs:string"/>
		<xsl:variable name="test-result" as="xs:string?">
			<!-- mehrere parallele xsl:if statt xsl:choose, um mehrere Fehlermeldungen anzeigen zu können -->
			<xsl:if test="not($test-node/value)">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:internals.test.function.withTestItem.Test-Node.Test, function-name="<xsl:sequence select="$function-name"/>"</xsl:with-param>
					<xsl:with-param name="message">test-Element ohne value-Element</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
				</xsl:call-template>
				<!-- Dummy-Text als Fehler-Signal -->
				<xsl:text>Fehler</xsl:text>
			</xsl:if>
			<xsl:if test="not($test-node/*[name()=$function-name] )">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:internals.test.function.withTestItem.Test-Node.Test, function-name="<xsl:sequence select="$function-name"/>"</xsl:with-param>
					<xsl:with-param name="message">test-Element ohne <xsl:sequence select="$function-name"/>-Element</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
				</xsl:call-template>
				<!-- Dummy-Text als Fehler-Signal -->
				<xsl:text>Fehler</xsl:text>
			</xsl:if>
			<xsl:if test="count($test-node/*[name()=$function-name]) gt 1 ">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:internals.test.function.withTestItem.Test-Node.Test, function-name="<xsl:sequence select="$function-name"/>"</xsl:with-param>
					<xsl:with-param name="message">test-Element mit mehr als einem <xsl:sequence select="$function-name"/>-Element</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
				</xsl:call-template>
				<!-- Dummy-Text als Fehler-Signal -->
				<xsl:text>Fehler</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<!-- Auswertung der Dummy-Texte -->
			<xsl:when test="normalize-space($test-result)">
				<xsl:sequence select="false()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="true()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<doc:param name="caller"><para>Name und ggfs. arity der Funktion, für die der Test übersprungen wurde.</para></doc:param>
		<doc:param name="level"><para>Level für die Fehlerausgabe, Vorgabe: WARN</para></doc:param>
		<para xml:id="internals.testing.SkippedTests">Ausgabe einer Warnung für übersprungene Tests</para>
		<para>Bestimmte Funktionen erfordern Erweiterungen wie JAVA oder prozessorspezifische Funktionen, d.h. sie arbeiten nicht
			mit allen XSLT-Prozessoren zusammen. Andere Funktionen scheitern an prozessorspezifischen Inkompatibilitäten.</para>
		<para>Solche Tests müsen im Test-Template an Hand des Vendor-Hashs 
			(siehe <link linkend="current-vendor-hash"><function>xsb:current-vendor-hash()</function></link>)
			unterdrückt werden. Dies kann hart über eine <function>xsl:if</function>-Abfrage im Testtemplate oder einfacher über
			<link linkend="internals.testing.intern-skip"><code>intern:skip</code>-Attribute</link> an Testknoten und Test-Items geschehen.</para>
			<para>Dieses Template gibt in diesen Fällen eine standardisierte Meldung aus.</para>
			<para>Ein Beispiel für die Verwendung (hart ausgeschlossen und per <code>intern:skip</code>-Attribut) findet sich in <code>files_tests.xsl</code>.</para>
		<revhistory>
			<revision>
				<revnumber>0.143</revnumber>
				<date>2011-04-26</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="xsb:internals.testing.SkippedTests">
		<xsl:param name="caller" as="xs:string" required="yes"/>
		<xsl:param name="level" as="xs:string" required="no">WARN</xsl:param>
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="caller" select="$caller"/>
			<xsl:with-param name="message">ein oder mehrere Tests wurden übersprungen</xsl:with-param>
			<xsl:with-param name="level" select="$level"/>
		</xsl:call-template>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
