<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	Copyright (c) 2011 Stefan Krause
	
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
	exclude-result-prefixes="doc docv"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:include href="../pattern+includes.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="generate_documentation_for_google_code.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Dokumentation für Google Code</doc:title>
		<para>Dieses Stylesheet erzeugt aus den Stylesheets der XSL-SB Dokumentationsseiten für Google Code.</para>
		<para>Im Detail entsteht eine Übersichtsseite mit Listen der Funktionen und Templates und je Stylesheet eine Einzelseite.</para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/tools/google_code.xsl">&XSL-Base-Directory;/tools/google_code.xsl</link></para>
			</listitem>
			<!--<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/tools/google_code.html">&doc-Base-Directory;/generate_documentation_for_google_code.html</link></para>
			</listitem>-->
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/tools/google_code.xsl">&XSL-Base-Directory;/tools/google_code.xsl</link></para>
			</listitem>
			<!--<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/tools/google_code.html">&doc-Base-Directory;/generate_documentation_for_google_code.html</link></para>
			</listitem>-->
			<listitem>
				<para>XSLT-SB: <link xlink:href="&XSL-Base-Directory;/">&XSL-Base-Directory;/</link></para>
			</listitem>
			<listitem>
				<para>Google Code: <link xlink:href="http://code.google.com/p/xslt-sb/">http://code.google.com/p/xslt-sb/</link></para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>2.0.12</revnumber>
				<date>2011-05-21</date>
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
	<!--  -->
	<xsl:output method="text" encoding="UTF-8"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:param name="wiki-verzeichnis" as="xs:anyURI">../../wiki/</xsl:param>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:variable name="stylesheets" as="document-node()+" select=" document( (
		'../files.xsl',
		'../internals.logging.xsl',
		'../internals.meta.xsl',
		'../internals.stylecheck.xsl',
		'../internals.testing.xsl',
		'../internals.xsl',
		'../numbers.xsl',
		'../strings.xsl'
		) ) "/>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Start     ==================== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="/">
		<!-- erst die Übersichtsseite -->
		<xsl:call-template name="intern:create-overview"/>
		<!-- dann die Einzelseiten der Stylesheets -->
		<xsl:for-each select="$stylesheets">
			<xsl:call-template name="intern:process-single-stylesheet">
				<xsl:with-param name="stylesheet" select="."></xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:create-overview">
		<xsl:text>#summary Überblick der Funktionen und Templates der XSL-SB</xsl:text>&crt;
		<xsl:text>#labels Dokumentation</xsl:text>&crt;
		<xsl:call-template name="intern:list-functions">
			<xsl:with-param name="stylesheet" select="$stylesheets"/>
			<xsl:with-param name="make-links" select="true()"/>
		</xsl:call-template>
		&crt;
		<xsl:call-template name="intern:list-templates">
			<xsl:with-param name="stylesheet" select="$stylesheets"/>
			<xsl:with-param name="make-links" select="true()"/>
		</xsl:call-template>
		&crt;
		<xsl:call-template name="intern:make-footer"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:process-single-stylesheet">
		<xsl:param name="stylesheet" as="document-node()" required="yes"/>
		<xsl:variable name="wikifile" as="xs:anyURI" select="resolve-uri(concat($wiki-verzeichnis, intern:wikifile-name(base-uri(.) ) ), base-uri(.) )"/>
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="show-context" select="false()"/>
			<xsl:with-param name="level">INFO</xsl:with-param>
			<xsl:with-param name="message">Schreibe <xsl:sequence select="$wikifile"/></xsl:with-param>
		</xsl:call-template>
		<xsl:result-document href="{$wikifile}" method="text" encoding="UTF-8">
			<xsl:call-template name="intern:make-header">
				<xsl:with-param name="stylesheet" select="$stylesheet"/>
			</xsl:call-template>
			<xsl:call-template name="intern:list-functions">
				<xsl:with-param name="stylesheet" select="$stylesheet"/>
			</xsl:call-template>
			<xsl:call-template name="intern:list-templates">
				<xsl:with-param name="stylesheet" select="$stylesheet"/>
			</xsl:call-template>
			<xsl:call-template name="intern:make-footer"/>
		</xsl:result-document>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:make-header">
		<xsl:param name="stylesheet" as="document-node()" required="yes"/>
		<xsl:text>#summary Überblick der Funktionen und Templates von `</xsl:text>
		<xsl:value-of select="xsb:fileName-and-fileExtention-from-url(base-uri(.))"/>
		<xsl:text>`</xsl:text>&crt;
		<xsl:text>#labels Dokumentation</xsl:text>&crt;
		&crt;
		<xsl:text>= `</xsl:text>
		<xsl:value-of select="xsb:fileName-and-fileExtention-from-url(base-uri($stylesheet) )"/>
		<xsl:text>` =</xsl:text>&crt;
		&crt;
		<xsl:text>Stylesheet: `</xsl:text>
		<xsl:value-of select="xsb:fileName-and-fileExtention-from-url(base-uri($stylesheet) )"/>
		<xsl:text>`</xsl:text>&crt;
		&crt;
		<xsl:apply-templates select="$stylesheet//doc:doc/para[not( (@role eq 'license') or matches(., '^(Autor:|Homepage:)') )]" mode="parse_docbook"/>
		&crt;
		<xsl:text>_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._</xsl:text>
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:make-footer">
		&crt;
		<xsl:text>_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._</xsl:text>&crt;
		&crt;
		<xsl:text>_Seite erstellt am </xsl:text><xsl:value-of select="format-date(current-date(), '[D01].[M01].[Y0001]' )"/><xsl:text>_</xsl:text>&crt;
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:list-functions">
		<xsl:param name="stylesheet" as="document-node()+" required="yes"/>
		<xsl:param name="make-links" as="xs:boolean" required="no" select="false()"/>
		<xsl:variable name="Funktionen" as="element()*" select="$stylesheet//xsl:function"/>
		<xsl:if test="$Funktionen">
			&crt;
			<xsl:text>= Liste der Funktionen =</xsl:text>&crt;
			&crt;
			<xsl:for-each-group select="$Funktionen" group-by="lower-case(substring(substring-after(@name, ':'), 1, 1) )">
				<xsl:sort select="lower-case(substring-after(@name, ':') )" order="ascending"/>
				<xsl:for-each select="current-group()">
					<xsl:sort select="lower-case(@name)" order="ascending"/>
					<xsl:call-template name="intern:table-row">
						<xsl:with-param name="col1">
							<xsl:if test="position() eq 1">
								<xsl:value-of select="concat('*', upper-case(current-grouping-key() ), '*')"/>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col2">
							<xsl:text>*</xsl:text>
							<xsl:value-of select="@name"/>
							<xsl:text>*</xsl:text>
							<xsl:text>(</xsl:text>
							<xsl:for-each select="xsl:param">
								<xsl:value-of select="@name"/>
								<xsl:if test="normalize-space(@as)">
									<xsl:text> _as_ </xsl:text>
									<xsl:value-of select="normalize-space(@as)"/>
								</xsl:if>
								<xsl:if test="position() lt last()">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
							<xsl:text>)</xsl:text>
						</xsl:with-param>
						<xsl:with-param name="col3">
							<xsl:if test="$make-links">
								<xsl:value-of select="intern:wikilink(base-uri(.) )"/>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col4">
							<xsl:apply-templates select="$stylesheet//para[@xml:id eq substring-after(current()/@name, ':')]/node()" mode="parse_docbook"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:for-each-group>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:list-templates">
		<xsl:param name="stylesheet" as="document-node()+" required="yes"/>
		<xsl:param name="make-links" as="xs:boolean" required="no" select="false()"/>
		<xsl:variable name="Templates" as="element()*" select="$stylesheet//xsl:template[normalize-space(@name)]"/>
		<xsl:if test="$Templates">
			&crt;
			<xsl:text>= Liste der benannten Templates =</xsl:text>&crt;
			&crt;
			<xsl:for-each-group select="$Templates" group-by="lower-case(substring(substring-after(@name, ':'), 1, 1) )">
				<xsl:sort select="lower-case(substring-after(@name, ':') )" order="ascending"/>
				<xsl:for-each select="current-group()">
					<xsl:sort select="lower-case(@name)" order="ascending"/>
					<xsl:call-template name="intern:table-row">
						<xsl:with-param name="col1">
							<xsl:if test="position() eq 1">
								<xsl:value-of select="concat('*', upper-case(current-grouping-key() ), '*')"/>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col2">
							<xsl:text>*</xsl:text>
							<xsl:value-of select="@name"/>
							<xsl:text>*</xsl:text>
							<xsl:if test="xsl:param">
								<xsl:text> (</xsl:text>
								<xsl:for-each select="xsl:param">
									<xsl:choose>
										<xsl:when test="@required eq 'yes' ">_required_ </xsl:when>
										<xsl:otherwise>_optional_ </xsl:otherwise>
									</xsl:choose>
									<xsl:value-of select="@name"/>
									<xsl:if test="normalize-space(@as)">
										<xsl:text> _as_ </xsl:text>
										<xsl:value-of select="normalize-space(@as)"/>
									</xsl:if>
									<xsl:if test="position() lt last()">
										<xsl:text>; </xsl:text>
									</xsl:if>
								</xsl:for-each>
								<xsl:text>)</xsl:text>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col3">
							<xsl:if test="$make-links">
								<xsl:value-of select="intern:wikilink(base-uri(.) )"/>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col4">
							<xsl:apply-templates select="$stylesheet//para[@xml:id eq substring-after(current()/@name, ':')]/node()" mode="parse_docbook"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:for-each-group>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:table-row">
		<xsl:param name="col1" as="xs:string*" required="no"/>
		<xsl:param name="col2" as="xs:string*" required="no"/>
		<xsl:param name="col3" as="xs:string*" required="no"/>
		<xsl:param name="col4" as="xs:string*" required="no"/>
		<xsl:text>|| </xsl:text>
		<xsl:value-of select="xsb:return-default-if-empty(string-join($col1, ''), '&#160;')"/>
		<xsl:text> || </xsl:text>
		<xsl:value-of select="xsb:return-default-if-empty(string-join($col2, ''), '&#160;')"/>
		<xsl:text> || </xsl:text>
		<xsl:value-of select="xsb:return-default-if-empty(string-join($col3, ''), '&#160;')"/>
		<xsl:text> || </xsl:text>
		<xsl:value-of select="xsb:return-default-if-empty(string-join($col4, ''), '&#160;')"/>
		<xsl:text> ||</xsl:text>
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     mode parse_docbook     ==================== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="intern:detect" mode="parse_docbook">parse_docbook</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="*" mode="parse_docbook">
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="level">INFO</xsl:with-param>
			<xsl:with-param name="message">
				<xsl:text>Element nicht berücksichtigt. (in </xsl:text>
				<xsl:value-of select="concat(xsb:fileName-and-fileExtention-from-url(base-uri() ), ')')"/>
			</xsl:with-param>
			<xsl:with-param name="show-context" select="true()"/>
		</xsl:call-template>
		<xsl:apply-templates mode="#current"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="para" mode="parse_docbook">
		<xsl:apply-templates mode="#current"/>&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="listitem/para" mode="parse_docbook">
		<xsl:apply-templates mode="#current"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="link|ulink" mode="parse_docbook">
		<xsl:text>`</xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:text>`</xsl:text>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="code|function" mode="parse_docbook">
		<xsl:text>`</xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:text>`</xsl:text>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="text()" mode="parse_docbook">
		<xsl:if test="matches(., '^\s')">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="normalize-space(.)"/>
		<xsl:if test="matches(., '\s$')">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Funktionen     ==================== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:function>
		<doc:param name="uri"><para>URI zum Stylesheet, das verlinkt werden soll.</para></doc:param>
		<para xml:id="wikilink">erzeugt einen Wikilink (für Google Code). Dazu wird im Stylesheet <code>$uri</code> //doc:doc/doc:title ausgelesen.</para>
		<para>Bei einer leeren <code>$uri</code> wird eine Leersequenz zurückgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:wikilink" as="xs:string?">
		<xsl:param name="uri" as="xs:anyURI?"/>
		<xsl:variable name="file" as="xs:string?" select="xsb:fileName-and-fileExtention-from-url($uri)"/>
		<xsl:choose>
			<xsl:when test="not(normalize-space($file) )"/>
			<xsl:when test="doc-available($uri)">
				<xsl:value-of select="concat('[', intern:wikipage-name(intern:doc-title($uri) ), ']')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="caller">intern:wikilink</xsl:with-param>
					<xsl:with-param name="message">kein Link für »<xsl:sequence select="$file"/>« definiert</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:function>
		<doc:param name="Stylesheet-Title"><para>Titel des Stylesheets, wird in der Regel mit <code>intern:doc-title</code> ermittelt</para></doc:param>
		<para xml:id="wikipage-name">Ermittelt den Titel eines Stylesheets. Es kommen verschiedene Regeln zum Einsatz, um aus dem Titel einen gültigen WikiFile-Name zu ermitteln..</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:wikipage-name" as="xs:string?">
		<xsl:param name="Stylesheet-Title" as="xs:string?"/>
		<xsl:sequence select="translate(xsb:encode-for-id($Stylesheet-Title), '-', '')"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:function>
		<doc:param name="uri"><para>URI zum Stylesheet, zu dem der Titel ermittelt werden soll.</para></doc:param>
		<para xml:id="doc-title">Ermittelt den Titel eines Stylesheets. Dazu wird im Stylesheet <code>$uri</code> //doc:doc/doc:title ausgelesen.</para>
		<para>Bei einer leeren <code>$uri</code> wird eine Leersequenz zurückgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:doc-title" as="xs:string?">
		<xsl:param name="uri" as="xs:string?"/>
		<xsl:if test="doc-available($uri)">
			<xsl:sequence select="doc($uri)//doc:doc/doc:title"/>
		</xsl:if>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:function>
		<doc:param name="uri"><para>URI zum Stylesheet, zu dem der Google-Code-Wiki-Dateiname ermittelt werden soll.</para></doc:param>
		<para xml:id="wikifile-name">Ermittelt den Dateinamen im Google-Code-Wiki.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-22</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:wikifile-name" as="xs:string?">
		<xsl:param name="uri" as="xs:anyURI?"/>
		<xsl:sequence select="if (normalize-space($uri) ) then concat(intern:wikipage-name(intern:doc-title($uri) ), '.wiki') else ()"/>
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
	</doc:template>
	<xsl:template match="/" mode="internals.self-test" priority="1">
		<xsl:call-template name="xsb:internals.MakeHeader"/>
		<xsl:call-template name="intern:internals.Stylecheck"/>
		<xsl:call-template name="intern:google_code.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<doc:template>
		<para xml:id="google_code.self-test">Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>2.0.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:google_code.self-test">
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     Tests     __________ -->
		<intern:testliste xml:id="StringTests">
			<test>
				<value></value>
				<intern:wikipage-name></intern:wikipage-name>
			</test>
			<test>
				<value>StyleCheck</value>
				<intern:wikipage-name>StyleCheck</intern:wikipage-name>
			</test>
			<test>
				<value>Meta-Funktionen</value>
				<intern:wikipage-name>MetaFunktionen</intern:wikipage-name>
			</test>
			<test>
				<value>Dateien und Dateisystem</value>
				<intern:wikipage-name>Dateien_und_Dateisystem</intern:wikipage-name>
			</test>
		</intern:testliste>
		<!--  -->
		<intern:testliste xml:id="FileTests">
			<test>
				<value></value>
				<intern:doc-title></intern:doc-title>
				<intern:wikifile-name></intern:wikifile-name>
				<intern:wikilink></intern:wikilink>
			</test>
			<test>
				<value>../files.xsl</value>
				<intern:doc-title>Dateien und Dateisystem</intern:doc-title>
				<intern:wikifile-name>Dateien_und_Dateisystem.wiki</intern:wikifile-name>
				<intern:wikilink>[Dateien_und_Dateisystem]</intern:wikilink>
			</test>
			<test>
				<value>../internals.logging.xsl</value>
				<intern:doc-title>Logging-System</intern:doc-title>
				<intern:wikifile-name>LoggingSystem.wiki</intern:wikifile-name>
				<intern:wikilink>[LoggingSystem]</intern:wikilink>
			</test>
			<test>
				<value>../internals.meta.xsl</value>
				<intern:doc-title>Meta-Funktionen</intern:doc-title>
				<intern:wikifile-name>MetaFunktionen.wiki</intern:wikifile-name>
				<intern:wikilink>[MetaFunktionen]</intern:wikilink>
			</test>
			<test>
				<value>../internals.stylecheck.xsl</value>
				<intern:doc-title>StyleCheck</intern:doc-title>
				<intern:wikifile-name>StyleCheck.wiki</intern:wikifile-name>
				<intern:wikilink>[StyleCheck]</intern:wikilink>
			</test>
			<test>
				<value>../internals.testing.xsl</value>
				<intern:doc-title>Testen von Stylesheets</intern:doc-title>
				<intern:wikifile-name>Testen_von_Stylesheets.wiki</intern:wikifile-name>
				<intern:wikilink>[Testen_von_Stylesheets]</intern:wikilink>
			</test>
			<test>
				<value>../internals.xsl</value>
				<intern:doc-title>Interne Funktionen</intern:doc-title>
				<intern:wikifile-name>Interne_Funktionen.wiki</intern:wikifile-name>
				<intern:wikilink>[Interne_Funktionen]</intern:wikilink>
			</test>
			<test>
				<value>../numbers.xsl</value>
				<intern:doc-title>Zahlen und Rechnen</intern:doc-title>
				<intern:wikifile-name>Zahlen_und_Rechnen.wiki</intern:wikifile-name>
				<intern:wikilink>[Zahlen_und_Rechnen]</intern:wikilink>
			</test>
			<test>
				<value>../strings.xsl</value>
				<intern:doc-title>Strings und Texte</intern:doc-title>
				<intern:wikifile-name>Strings_und_Texte.wiki</intern:wikifile-name>
				<intern:wikilink>[Strings_und_Texte]</intern:wikilink>
			</test>
		</intern:testliste>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- damit es etwas übersichtlicher wird -->
		<xsl:variable name="seqStringTests" as="element()+" select="document( '' )//intern:testliste[@xml:id='StringTests']/test"/>
		<xsl:variable name="seqFileTests" as="element()+" select="document( '' )//intern:testliste[@xml:id='FileTests']/test"/>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     intern:wikipage-name     __________ -->
		<xsl:for-each select="$seqStringTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:wikipage-name</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:wikipage-name(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     intern:wikifile-name     __________ -->
		<xsl:for-each select="$seqFileTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:wikifile-name</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:wikifile-name(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     intern:doc-title     __________ -->
		<xsl:for-each select="$seqFileTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:doc-title</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:doc-title(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     intern:wikilink     __________ -->
		<xsl:for-each select="$seqFileTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:wikilink</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:wikilink(./value/text())"/>
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
