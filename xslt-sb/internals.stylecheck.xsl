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
	<xsl:import href="files.xsl"/>
	<xsl:import href="internals.testing.xsl"/>
	<xsl:import href="internals.meta.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="internals.stylecheck.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Interne Funktionen/StyleCheck</doc:title>
		<para>Dieses Stylesheet enthält interne Templates und Funktionen, um XSLT-Dateien auf gängige Probleme zu testen.</para>
		<para>Eine Spezialität dieses Stylesheets sind die <code>intern:solved</code>-Attribute. Sie können Token enthalten, die Stylesheet-Elemente von Tests ausschließen.</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/internals.stylecheck.xsl">&XSL-Base-Directory;/internals.stylecheck.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/internals.stylecheck.html">&doc-Base-Directory;/internals.stylecheck.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/internals.stylecheck.xsl">&XSL-Base-Directory;/internals.stylecheck.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/internals.stylecheck.html">&doc-Base-Directory;/internals.stylecheck.html</link></para>
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
				<revnumber>0.139</revnumber>
				<date>2011-04-24</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Justierung der Fehlerlevel</revremark>
			</revision>
			<revision>
				<revnumber>0.129</revnumber>
				<date>2011-02-27</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Erweiterung der Lizenz auf Expath/MIT license</revremark>
			</revision>
			<revision>
				<revnumber>0.114</revnumber>
				<date>2010-07-18</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Dokumentation ausgebaut</revremark>
			</revision>
			<revision>
				<revnumber>0.93</revnumber>
				<date>2010-05-30</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Einbindung von <code><link xlink:href="internals.meta.html">internals.meta.xsl</link></code> und Verwendung von <function>intern:function-name()</function>, Tests der arity bei <function>intern:internals.Stylecheck.MissingTests</function></revremark>
			</revision>
			<revision>
				<revnumber>0.85</revnumber>
				<date>2010-04-10</date>
				<authorinitials>Stf</authorinitials>
				<revremark>Einbindung von externen Test-Stylesheets</revremark>
			</revision>
			<revision>
				<revnumber>0.63</revnumber>
				<date>2009-11-22</date>
				<authorinitials>Stf</authorinitials>
				<revremark>initiale Version</revremark>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Templates     ==================== -->
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck     __________ -->
	<doc:template>
		<para xml:id="internals.Stylecheck">Dieses Template ist der zentrale Einstieg zur Realisierung der Style-Checks.</para>
		<para>Es wird auf die zu untersuchende XSL-Datei und eventuelle Test-Stylesheets angewendet.</para>
		<para>Test-Stylesheets beinhalten nur die Tests zu einem Stylesheet.
			Sie haben den selben Dateinamen wie das zu testende Stylesheet, ergänzt um <code>_tests</code>
			(Beispiel: "<code>files.xsl</code>" und "<code>files_tests.xsl</code>").</para>
		<para>Es sind drei Fälle vorgesehen:
			<orderedlist>
				<listitem><para>Stylesheet und Tests in der selben Datei, Anwendung auf diese Datei.</para></listitem>
				<listitem><para>Stylesheet und Tests in getrennten Dateien, Anwendung auf Stylesheet-Datei</para></listitem>
				<listitem><para>Stylesheet und Tests in getrennten Dateien, Anwendung auf Test-Datei</para></listitem>
			</orderedlist>
		</para>
		<para>Schwerwiegende Fehler werden mit Level »<code>WARN</code>« ausgegeben, Hinweise mit Level »<code>INFO</code>«</para>
		<revhistory>
			<revision>
				<revnumber>0.85</revnumber>
				<date>2010-04-10</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Einbindung von externen Test-Stylesheets</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.63</revnumber>
				<date>2009-11-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.Stylecheck">
		<!-- zuerst Berechnung des zu untersuchenden Stylesheets-Knotens -->
		<xsl:variable name="stylesheet-node" as="document-node()">
			<xsl:variable name="AnalyzedStylesheetURL" as="xs:anyURI" select="document-uri(/)"/>
			<xsl:variable name="AnalyzedStylesheetURLActualExtention" as="xs:string?" select="xsb:fileExtention-from-url($AnalyzedStylesheetURL)"/>
			<xsl:variable name="AnalyzedStylesheetURLCalculatedExtention" as="xs:string">
				<xsl:choose>
					<xsl:when test="not(normalize-space($AnalyzedStylesheetURLActualExtention) )"><xsl:sequence select=" '' "/></xsl:when>
					<!-- Oxygen schreibt bei externen Transformations-Engines temporäre Dateien mit der Endung "_xml" und bearbeitet diese -->
					<!-- z.B. TestStylesheetURL: "file:///c:/temp/expedimentum/org/www/example/xslt/xslt-sb/strings_tests.xsl_xml"; 
						$MainDocumentURL: "file:///c:/temp/expedimentum/org/www/example/xslt/xslt-sb/strings.xsl_xml" -->
					<xsl:when test="ends-with($AnalyzedStylesheetURLActualExtention, '_xml')">
						<xsl:sequence select="concat('.', string-join(tokenize($AnalyzedStylesheetURLActualExtention, '_xml')[position() lt last()], '_xml' ) )"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:sequence select="concat('.', $AnalyzedStylesheetURLActualExtention)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<!-- ist "_tests"-Stylesheet -->
				<xsl:when test="ends-with(xsb:fileName-from-url(document-uri(/)), '_tests')">
					<xsl:variable name="MainDocumentURL" as="xs:anyURI" select="xs:anyURI(concat(
						xsb:path-from-url($AnalyzedStylesheetURL), 
						string-join(tokenize(xsb:fileName-from-url($AnalyzedStylesheetURL), '_tests')[position() lt last()], '_tests'),
						$AnalyzedStylesheetURLCalculatedExtention
					) )"/>
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="level">ALL</xsl:with-param>
						<xsl:with-param name="caller">intern:internals.Stylecheck</xsl:with-param>
						<xsl:with-param name="message" select="concat('$AnalyzedStylesheetURL: &quot;', $AnalyzedStylesheetURL, '&quot;; $MainDocumentURL: &quot;', $MainDocumentURL, '&quot;')"/>
					</xsl:call-template>
					<xsl:choose>
						<xsl:when test="doc-available($MainDocumentURL)">
							<xsl:document>
								<xsl:for-each select="/*">
									<xsl:copy>
										<xsl:sequence select="/*/node()"/>
										<xsl:sequence select="doc($MainDocumentURL)/*/node()"/>
									</xsl:copy>
								</xsl:for-each>
							</xsl:document>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="xsb:internals.FunctionError">
								<xsl:with-param name="caller">intern:internals.Stylecheck</xsl:with-param>
								<xsl:with-param name="level">ERROR</xsl:with-param>
								<xsl:with-param name="message">Fehler bei Ermittlung der Stylesheet-URI aus der Test-Stylesheet-URI. Test-Stylesheet: "<xsl:sequence select="$AnalyzedStylesheetURL"/>", ermitteltes Stylesheet: "<xsl:sequence select="$MainDocumentURL"/>"</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<!-- ist kein "_tests"-Stylesheet -->
				<xsl:otherwise>
					<xsl:variable name="TestDocumentURL" as="xs:anyURI" select="xs:anyURI(concat(
						xsb:path-from-url($AnalyzedStylesheetURL), 
						xsb:fileName-from-url($AnalyzedStylesheetURL), 
						'_tests',
						$AnalyzedStylesheetURLCalculatedExtention
						) )"/>
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="level">TRACE</xsl:with-param>
						<xsl:with-param name="caller">intern:internals.Stylecheck</xsl:with-param>
						<xsl:with-param name="message" select="concat('$AnalyzedStylesheetURL: &quot;', $AnalyzedStylesheetURL, '&quot;; $TestDocumentURL: &quot;', $TestDocumentURL, '&quot;')"/>
					</xsl:call-template>
					<xsl:choose>
						<!-- ... aber es gibt ein Test-Stylesheet -->
						<xsl:when test="doc-available($TestDocumentURL)">
							<xsl:document>
								<xsl:for-each select="/*">
									<xsl:copy>
										<xsl:sequence select="/*/node()"/>
										<xsl:sequence select="doc($TestDocumentURL)/*/node()"/>
									</xsl:copy>
								</xsl:for-each>
							</xsl:document>
						</xsl:when>
						<!-- ... oder es gibt kein Test-Stylesheet -->
						<xsl:otherwise>
							<xsl:document>
								<xsl:sequence select="/*"/>
							</xsl:document>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     ab hier Aufruf der einzelnen Stylechecks     ____________ -->
		<!--  -->
		<!--  -->
		<!--  -->
		<xsl:call-template name="intern:internals.Stylecheck.CallTemplateTestFunction">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.CallTemplateTestFunctionWithTestItem">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.MissingTypes">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.EmptySequenceAllowed">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.RequiredParameter">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.MissingTests">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.DocumentationTests">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.ListTO_DOs">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck.CallTemplateTestFunction     __________ -->
	<doc:template>
		<doc:param name="Dokument"><para>XSL-Dokument-Knoten, auf den die Tests angewendet werden.</para></doc:param>
		<para xml:id="internals.Stylecheck.CallTemplateTestFunction">Dieses Template überprüft die Syntax von Funktionstests mit <function>xsl:call-template name="xsb:internals.test.Function"</function>.</para>
		<para>Konkret getestet wird, ob der Inhalt der Parameter <code>caller</code> und <code>actual-value</code> übereinstimmt (weil sonst falsche,
			verwirrende Fehlermeldungen angezeigt werden.)</para>
		<para>solved-Token: "<code>CallTemplateTestFunction</code>"</para>
		<revhistory>
			<revision>
				<revnumber>0.63</revnumber>
				<date>2009-11-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.Stylecheck.CallTemplateTestFunction">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//xsl:call-template[@name='xsb:internals.test.Function'][(xsl:with-param[@name='caller']/text()[1]) ne (xsl:with-param[@name='actual-value']/concat(@select, text()))]">
			<xsl:if test="not(xsb:listed(@intern:solved, 'CallTemplateTestFunction'))">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">internals.Stylecheck.CallTemplateTestFunction</xsl:with-param>
					<xsl:with-param name="message">Inkonsistenz zwischen caller und actual-value: //<xsl:sequence select="xsb:render-context-as-string(.)"/>[(<xsl:sequence select="xsb:render-context-as-string(xsl:with-param[@name='caller'])"/>) and (<xsl:sequence select="xsb:render-context-as-string(xsl:with-param[@name='actual-value'])"/>)] </xsl:with-param>
					<xsl:with-param name="level">WARN</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck.CallTemplateTestFunctionWithTestItem     __________ -->
	<doc:template>
		<doc:param name="Dokument"><para>XSL-Dokument-Knoten, auf den die Tests angewendet werden.</para></doc:param>
		<para xml:id="internals.Stylecheck.CallTemplateTestFunctionWithTestItem">Dieses Template testet den Aufruf von Funktionstests mit <function>xsb:internals.test.function.withTestItem.BooleanResult"</function>, 
			<function>xsb:internals.test.function.withTestItem.StringResult"</function> usw..</para>
		<para>solved-Token: "<code>CallTemplateTestFunction</code>"</para>
		<revhistory>
			<revision>
				<revnumber>0.63</revnumber>
				<date>2009-11-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.Stylecheck.CallTemplateTestFunctionWithTestItem">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//xsl:call-template[starts-with(@name, 'xsb:internals.test.function.withTestItem')][(xsl:with-param[@name='function-name']/text()[1]) ne (xsl:with-param[@name='actual-value']/substring-before(concat(@select, text()), '('))]">
			<xsl:if test="not(xsb:listed(@intern:solved, 'CallTemplateTestFunction'))">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">internals.Stylecheck.CallTemplateTestFunctionWithTestItem</xsl:with-param>
					<xsl:with-param name="message">Inkonsistenz zwischen function-name und actual-value: //<xsl:sequence select="xsb:render-context-as-string(.)"/>[(<xsl:sequence select="xsb:render-context-as-string(xsl:with-param[@name='function-name'])"/>) and (<xsl:sequence select="xsb:render-context-as-string(xsl:with-param[@name='actual-value'])"/>)] </xsl:with-param>
					<xsl:with-param name="level">WARN</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck.MissingTypes     __________ -->
	<doc:template>
		<doc:param name="Dokument"><para>XSL-Dokument-Knoten, auf den die Tests angewendet werden.</para></doc:param>
		<para xml:id="internals.Stylecheck.MissingTypes">Dieses Template testet, ob alle Variablen, Parameter und Funktionen getypt sind.</para>
		<para>solved-Token: "<code>MissingTypes</code>"</para>
		<revhistory>
			<revision>
				<revnumber>0.2.8</revnumber>
				<date>2011-05-14</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Typung von Funktionen hinzugefügt</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.63</revnumber>
				<date>2009-11-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.Stylecheck.MissingTypes">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//( xsl:param | xsl:variable | xsl:function)[not(@as)]">
			<xsl:if test="not(xsb:listed(@intern:solved, 'MissingTypes'))">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">internals.Stylecheck.MissingTypes</xsl:with-param>
					<xsl:with-param name="message">Ungetypte Variable, ungetypter Parameter oder ungetypte Funktion: <xsl:sequence select="intern:render-context-and-parent-as-string(.)"/></xsl:with-param>
					<xsl:with-param name="level">INFO</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck.EmptySequenceAllowed     __________ -->
	<doc:template>
		<doc:param name="Dokument"><para>XSL-Dokument-Knoten, auf den die Tests angewendet werden.</para></doc:param>
		<para xml:id="internals.Stylecheck.EmptySequenceAllowed">Dieses Template testet, ob Funktionen oder Templates eine <code>empty sequence</code> als Resultat liefern dürfen.</para>
		<para>Hintergrund: Funktionen und Templates sollten einen definierten Rückgabewert haben, also z.B. "0" oder 
			den Leerstring ("") statt einer Leersequenz. Damit werden Typ-Fehler im aufrufenden Code reduziert.</para>
		<para>solved-Token: "<code>EmptySequenceAllowed</code>"</para>
		<revhistory>
			<revision>
				<revnumber>0.63</revnumber>
				<date>2009-11-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.Stylecheck.EmptySequenceAllowed">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//( xsl:function | xsl:template )[ends-with(@as, '?') or ends-with(@as, '*')]">
			<xsl:if test="not(xsb:listed(@intern:solved, 'EmptySequenceAllowed'))">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">internals.Stylecheck.EmptySequenceAllowed</xsl:with-param>
					<xsl:with-param name="message">Funktion oder Template erlaubt die Rückgabe einer empty sequence: //<xsl:sequence select="xsb:render-context-as-string(.)"/></xsl:with-param>
					<xsl:with-param name="level">INFO</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck.MissingTests     __________ -->
	<doc:template>
		<doc:param name="Dokument"><para>XSL-Dokument-Knoten, auf den die Tests angewendet werden.</para></doc:param>
		<para xml:id="internals.Stylecheck.MissingTests">Dieses Template testet, ob alle Funktionen mit Test versehen sind.</para>
		<para>solved-Token: "<code>MissingTests</code>"</para>
		<revhistory>
			<revision>
				<revnumber>0.70</revnumber>
				<date>2009-13-08</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.Stylecheck.MissingTests">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//xsl:function[not(xsb:listed(@intern:solved, 'MissingTests'))]">
			<xsl:variable name="FunktionsName" as="xs:string" select="./@name"/>
			<xsl:variable name="FunktionsArity" as="xs:integer" select="count(./xsl:param)"/>
			<!-- TODO: Anzahl Tests bei ...withTestItem... ermitteln. Da das Argument von withTestItem eine Varianle oder ein XPath sein kann, sind zur Lösung higher order functions oder eine evaluate()-Funktion notwendig, deshalb wohl erst mit XSLT 2.1+ möglich -->
			<xsl:choose>
				<!-- keine Tests -->
				<xsl:when test="not(
						//xsl:call-template[@name = 'xsb:internals.test.function.withTestItem.StringResult']/xsl:with-param[(@name='actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |
						//xsl:call-template[@name = 'xsb:internals.test.function.withTestItem.BooleanResult']/xsl:with-param[(@name='actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |
						//xsl:call-template[@name = 'xsb:internals.test.function.withTestItem.NumericResult']/xsl:with-param[(@name='actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |
						//xsl:call-template[@name = 'xsb:internals.test.Function']/xsl:with-param[(@name='actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)]
					)">
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">internals.Stylecheck.MissingTests</xsl:with-param>
						<xsl:with-param name="message">Funktion ohne Test: //<xsl:sequence select="xsb:render-context-as-string(.)"/>[count(xsl:param) = <xsl:sequence select="$FunktionsArity"/>]</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<!-- weniger als 3 Tests (Null, gültig, ungültig als Eingabe empfohlen) -->
				<xsl:otherwise>
					<xsl:if test="(
						count( //xsl:call-template[@name = 'xsb:internals.test.Function']/xsl:with-param[(@name='actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)]) lt 3)
						and not(
							//xsl:call-template[@name = 'xsb:internals.test.function.withTestItem.StringResult']/xsl:with-param[(@name='actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |
							//xsl:call-template[@name = 'xsb:internals.test.function.withTestItem.NumericResult']/xsl:with-param[(@name='actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |
							//xsl:call-template[@name = 'xsb:internals.test.function.withTestItem.BooleanResult']/xsl:with-param[(@name='actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)]
						)">
						<xsl:call-template name="xsb:internals.Error">
							<xsl:with-param name="caller">internals.Stylecheck.MissingTests</xsl:with-param>
							<xsl:with-param name="message">Weniger als 3 Tests für: //<xsl:sequence select="xsb:render-context-as-string(.)"/>[count(xsl:param) = <xsl:sequence select="$FunktionsArity"/>]</xsl:with-param>
							<xsl:with-param name="level">WARN</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck.RequiredParameter     __________ -->
	<doc:template>
		<doc:param name="Dokument"><para>XSL-Dokument-Knoten, auf den die Tests angewendet werden.</para></doc:param>
		<para xml:id="internals.Stylecheck.RequiredParameter">Dieses Template testet, ob bei Template-Parametern das required-Attribute gesetzt ist.</para>
		<para>solved-Token: "<code>RequiredParameter</code>"</para>
		<revhistory>
			<revision>
				<revnumber>0.63</revnumber>
				<date>2009-11-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.Stylecheck.RequiredParameter">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//xsl:template/xsl:param[not(@required)]">
			<xsl:if test="not(xsb:listed(@intern:solved, 'RequiredParameter'))">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">internals.Stylecheck.RequiredParameter</xsl:with-param>
					<xsl:with-param name="message">Template-Parameter ohne required-Attribut: <xsl:sequence select="intern:render-context-and-parent-as-string(.)"/></xsl:with-param>
					<xsl:with-param name="level">INFO</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck.DocumentationTests     __________ -->
	<doc:template>
		<doc:param name="Dokument"><para>XSL-Dokument-Knoten, auf den die Tests angewendet werden.</para></doc:param>
		<para xml:id="internals.Stylecheck.DocumentationTests">Dieses Template testet verschiedene Aspekte der Qualität der Dokumentation.</para>
		<para>Die Dokumentation mit XSLStyle™ und DocBook wird in <link xlink:href="standard.html#dokumentation">standard.html</link> erläutert.</para>
		<para>solved-Token: "<code>TODO: solved-Token für intern:internals.Stylecheck.DocumentationTests definieren und einarbeiten</code>"</para>
		<revhistory>
			<revision>
				<revnumber>0.2.11</revnumber>
				<date>2011-05-15</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Test auf @xml:id hinzugefügt</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.111</revnumber>
				<date>2010-07-11</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.Stylecheck.DocumentationTests">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//( xsl:function | xsl:template[normalize-space(@name)] )">
			<xsl:variable name="possible-doc" as="element()?" select="preceding-sibling::*[1]"/>
			<xsl:choose>
				<xsl:when test="(namespace-uri($possible-doc) eq 'http://www.CraneSoftwrights.com/ns/xslstyle') and (
					   ( (local-name(.) eq 'function') and (local-name($possible-doc) eq 'function') )
					or ( (local-name(.) eq 'template') and (local-name($possible-doc) eq 'template') )
					) ">
					<!-- fehlende Dokumentation für Parameter -->
					<xsl:for-each select="xsl:param">
						<xsl:if test="not($possible-doc/doc:param[@name eq current()/@name])">
							<xsl:call-template name="xsb:internals.Error">
								<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
								<xsl:with-param name="message">fehlende Dokumentation für: <xsl:sequence select="intern:render-context-and-parent-as-string(.)"/></xsl:with-param>
								<xsl:with-param name="level">INFO</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
					<!-- Versionsgeschichte -->
					<xsl:choose>
						<xsl:when test="$possible-doc/revhistory">
							<xsl:for-each select="$possible-doc/revhistory/revision">
								<xsl:choose>
									<xsl:when test="revdescription/para[@conformance = ('alpha', 'beta', 'mature')]">
										<xsl:variable name="revdescription-para" as="element()" select="revdescription/para[@conformance = ('alpha', 'beta', 'mature')][1]"/>
										<xsl:if test="not(matches(xs:string($revdescription-para), concat('Status: ', $revdescription-para/@conformance) ) )">
											<xsl:call-template name="xsb:internals.Error">
												<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
												<xsl:with-param name="message">Inkonsistenz zwischen @conformance und Beschreibungstext: <xsl:sequence select="intern:render-context-and-parent-as-string($revdescription-para)"/></xsl:with-param>
												<xsl:with-param name="level">WARN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="xsb:internals.Error">
											<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
											<xsl:with-param name="message">fehlerhafte oder fehlende revdescription: <xsl:sequence select="intern:render-context-and-parent-as-string(.)"/>[revnumber eq '<xsl:sequence select="revnumber"/>']</xsl:with-param>
											<xsl:with-param name="level">INFO</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="xsb:internals.Error">
								<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
								<xsl:with-param name="message">Dokumentation ohne Versionsgeschichte (revhistory) bei: //<xsl:sequence select="xsb:render-context-as-string(.)"/></xsl:with-param>
								<xsl:with-param name="level">INFO</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<!-- fehlendes xml:id-Attribut -->
					<xsl:choose>
						<!-- passt genau -->
						<xsl:when test="$possible-doc/para[@xml:id eq substring-after(current()/@name, ':') ]"/>
						<!-- es gibt einen passenden para, aber der hier heißt aus irgendeinem Grund anders -->
						<xsl:when test="$Dokument//para[@xml:id eq substring-after(current()/@name, ':') ] and $possible-doc/para[starts-with(@xml:id, substring-after(current()/@name, ':') ) ]"/>
						<!-- sonst Fehlermeldung -->
						<xsl:otherwise>
							<xsl:call-template name="xsb:internals.Error">
								<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
								<xsl:with-param name="message">kein para-Element mit @xml:id="<xsl:sequence select="substring-after(current()/@name, ':')"/>" für <xsl:sequence select="intern:render-context-and-parent-as-string(.)"/></xsl:with-param>
								<xsl:with-param name="level">INFO</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<!-- Dokumentation fehlt ganz -->
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
						<xsl:with-param name="message">xsl:<xsl:sequence select="local-name(.)"/> ohne Dokumentation: //<xsl:sequence select="xsb:render-context-as-string(.)"/></xsl:with-param>
						<xsl:with-param name="level">INFO</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     intern:internals.Stylecheck.ListTO_DOs     __________ -->
	<doc:template>
		<doc:param name="Dokument"><para>XSL-Dokument-Knoten, auf den die Tests angewendet werden.</para></doc:param>
		<para xml:id="internals.Stylecheck.ListTO_DOs" intern:solved="ListTO_DOs">Dieses Template listet Texte und Kommentare, die "TODO" enthalten. Die Groß-/Kleinschreibung wird nicht berücksichtigt.</para>
		<para>solved-Token: "<code intern:solved="ListTO_DOs">ListTO_DOs</code>"</para>
		<revhistory>
			<revision>
				<revnumber>0.65</revnumber>
				<date>2009-11-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<!-- TO_DO mit Unterstrich, um nicht permanent falsche TO*DOs gemeldet zu bekommen -->
	<xsl:template name="intern:internals.Stylecheck.ListTO_DOs">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//(comment() | text() )[contains(lower-case(.), 'todo' )]">
			<xsl:if test="not(ancestor::*[xsb:listed(@intern:solved, 'ListTO_DOs') ] )">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="level">INFO</xsl:with-param>
					<xsl:with-param name="caller">internals.Stylecheck.ListTO_DOs</xsl:with-param>
					<xsl:with-param name="message">
						<xsl:choose>
							<xsl:when test="./self::comment()"><xsl:value-of select="."/></xsl:when>
							<xsl:otherwise><xsl:value-of select=".."/></xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
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
		<xsl:call-template name="intern:internals.stylecheck.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para xml:id="internals.stylecheck.self-test">Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>0.63</revnumber>
				<date>2009-11-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:internals.stylecheck.self-test">
		<!--  -->
		<!--  -->
		<!--  -->

		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
