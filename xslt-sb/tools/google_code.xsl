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
	xmlns:saxon="http://saxon.sf.net/"
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
	<xsl:output method="xml" encoding="UTF-8" name="wiki-doku" omit-xml-declaration="yes" exclude-result-prefixes="#all"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:param name="wiki-verzeichnis" as="xs:anyURI">../../wiki/</xsl:param>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:param name="xsl-stylesheet-href-prefix" as="xs:anyURI">http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/</xsl:param>
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
		'../math.xsl',
		'../numbers.xsl',
		'../standard.xsl',
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
		<!-- dann die Seiten für die einzelnen Templates/Funktionen -->
		<xsl:call-template name="intern:process-top-level-items">
			<xsl:with-param name="stylesheets" select="$stylesheets"/>
		</xsl:call-template>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:create-overview">
		<xsl:text>#summary Überblick der Funktionen und Templates der XSL-SB</xsl:text>&crt;
		<xsl:text>#labels Dokumentation</xsl:text>&crt;
		<xsl:text>#sidebar TableOfContents</xsl:text>&crt;
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
	<xsl:template name="intern:process-top-level-items">
		<!-- weil Funktionen mit identischem Namen über mehrere Stylesheets verteilt sein können -->
		<xsl:param name="stylesheets" as="document-node()+" required="yes"/>
		<xsl:for-each-group select="$stylesheets//xsl:function" group-by="@name">
			<xsl:call-template name="intern:process-single-top-level-item"/>
		</xsl:for-each-group>
		<xsl:for-each-group select="$stylesheets//xsl:template[@name]" group-by="@name">
			<xsl:call-template name="intern:process-single-top-level-item"/>
		</xsl:for-each-group>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:process-single-top-level-item">
		<!-- Kontext ist ein xsl:function oder xsl:template -->
		<xsl:variable name="wikifile" as="xs:anyURI" select="resolve-uri(concat($wiki-verzeichnis, intern:name-to-wikilink(@name), '.wiki' ), base-uri(.) )"/>
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="show-context" select="false()"/>
			<xsl:with-param name="level">INFO</xsl:with-param>
			<xsl:with-param name="message">Schreibe <xsl:sequence select="$wikifile"/></xsl:with-param>
		</xsl:call-template>
		<xsl:result-document href="{$wikifile}" method="text" encoding="UTF-8">
			<xsl:text>#summary Details für »</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:if test="self::xsl:function">
				<xsl:text>()</xsl:text>
			</xsl:if>
			<xsl:text>«</xsl:text>&crt;
			<xsl:text>#labels Dokumentation</xsl:text>&crt;
			<xsl:text>#sidebar TableOfContents</xsl:text>&crt;
			&crt;
			<xsl:for-each select="current-group()">
				<xsl:text>=</xsl:text>
					<xsl:call-template name="intern:make-top-level-item-string">
						<xsl:with-param name="link-name" select="false()"/>
						<xsl:with-param name="bold-name" select="false()"/>
					</xsl:call-template>
				<xsl:text>=</xsl:text>&crt;
				&crt;
				<xsl:text>Stylesheet: [</xsl:text>
				<xsl:value-of select="concat($xsl-stylesheet-href-prefix, xsb:fileName-and-fileExtention-from-url(base-uri(.) ) )"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="xsb:fileName-and-fileExtention-from-url(base-uri(.) )"/>
				<xsl:text>]</xsl:text>&crt;
				&crt;
				<xsl:variable name="doc" as="element()?" select="preceding-sibling::doc:function[1]"/>
				<xsl:if test="$doc/doc:param">
					<xsl:text>==Parameter==</xsl:text>&crt;
					<xsl:apply-templates select="$doc/doc:param" mode="parse_docbook"/>
					&crt;
				</xsl:if>
				<xsl:text>==Beschreibung==</xsl:text>&crt;
				<xsl:apply-templates select="$doc/*[not(self::doc:param)]" mode="parse_docbook"/>
				<xsl:text>==Implementierung==</xsl:text>&crt;
				<xsl:text>{{{</xsl:text>&crt;
				<xsl:value-of select="saxon:serialize(., 'wiki-doku')"/>
				&crt;
				<xsl:text>}}}</xsl:text>
				&crt;
				<!-- benutzte Funktionen -->
				<xsl:variable name="benutzteFunktionen" as="xs:string*" select="distinct-values(for $i in (.//@select|.//@test) return intern:extract-function-names($i, '') )[matches(., '^(xsb:|intern:)')]"/>
				<xsl:if test="$benutzteFunktionen[1]">
					&crt;
					<xsl:text>===Benutzte Funktionen===</xsl:text>&crt;
					<xsl:for-each select="$benutzteFunktionen">
						<xsl:sort select="substring-before(., ':')"/>
						<xsl:sort select="substring-after(., ':')"/>
						<xsl:sequence select="concat(' * [', intern:name-to-wikilink(.) ,' ', ., '()]')"/>&crt;
					</xsl:for-each>
				</xsl:if>	
				<!-- benutzte Templates -->
				<xsl:if test=".//xsl:call-template">
					&crt;
					<xsl:variable name="knoten" as="node()">
						<xsl:copy-of select="."/>
					</xsl:variable>
					<xsl:text>===Benutzte Templates===</xsl:text>&crt;
					<xsl:for-each select="$knoten//xsl:call-template[every $i in . satisfies not($i/preceding::xsl:call-template[@name eq $i/@name])]">
						<xsl:sequence select="concat(' * [', intern:name-to-wikilink(@name), ' ', @name, ']')"/>&crt;
					</xsl:for-each>
				</xsl:if>
				&crt;
				<xsl:text>----</xsl:text>
				&crt;
			</xsl:for-each>
			&crt;
			<xsl:text>_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._</xsl:text>
			&crt;
			<xsl:call-template name="intern:make-footer"/>
		</xsl:result-document>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:make-header">
		<xsl:param name="stylesheet" as="document-node()" required="yes"/>
		<xsl:text>#summary Überblick der Funktionen und Templates von »</xsl:text>
		<xsl:value-of select="xsb:fileName-and-fileExtention-from-url(base-uri(.))"/>
		<xsl:text>«</xsl:text>&crt;
		<xsl:text>#labels Dokumentation</xsl:text>&crt;
		<xsl:text>#sidebar TableOfContents</xsl:text>&crt;
		&crt;
		<xsl:text>= {{{</xsl:text>
		<xsl:value-of select="xsb:fileName-and-fileExtention-from-url(base-uri($stylesheet) )"/>
		<xsl:text>}}} =</xsl:text>&crt;
		&crt;
		<xsl:text>Stylesheet: {{{</xsl:text>
		<xsl:value-of select="xsb:fileName-and-fileExtention-from-url(base-uri($stylesheet) )"/>
		<xsl:text>}}}</xsl:text>&crt;
		&crt;
		<xsl:apply-templates select="$stylesheet//doc:doc/para[not( (@role eq 'license') or matches(., '^(Autor:|Autoren:|Homepage:)') )]" mode="parse_docbook"/>
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
			<!-- Gruppe: gleicher Anfangsbuchstabe -->
			<xsl:for-each-group select="$Funktionen" group-by="lower-case(substring(substring-after(@name, ':'), 1, 1) )">
				<xsl:sort select="lower-case(substring-after(@name, ':') )" order="ascending"/>
				<!-- Item: Funktion -->
				<xsl:for-each select="current-group()">
					<xsl:sort select="lower-case(substring-after(@name, ':') )" order="ascending"/>
					<xsl:call-template name="intern:table-row">
						<xsl:with-param name="col1">
							<xsl:if test="position() eq 1">
								<xsl:value-of select="concat('*', upper-case(current-grouping-key() ), '*')"/>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col2">
							<xsl:call-template name="intern:make-top-level-item-string">
								<xsl:with-param name="bold-name" select="true()"/>
								<xsl:with-param name="link-name" select="true()"/>
							</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="col3">
							<xsl:if test="$make-links">
								<xsl:value-of select="intern:URI-to-wikilink(base-uri(.) )"/>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col4">
							<xsl:apply-templates select="$stylesheet//para[@xml:id eq substring-after(current()/@name, ':')]/node()" mode="parse_docbook-line"/>
						</xsl:with-param>
					</xsl:call-template>
					<xsl:if test="($stylesheet//para[@xml:id eq substring-after(current()/@name, ':')])[2]">
						<xsl:call-template name="xsb:internals.Error">
							<xsl:with-param name="level">WARN</xsl:with-param>
							<xsl:with-param name="message">
								<xsl:text>Mehrfache //@xml:id[. eq "</xsl:text>
								<xsl:sequence select="substring-after(current()/@name, ':')"/>
								<xsl:text>"] (in </xsl:text>
								<xsl:value-of select="concat(xsb:fileName-and-fileExtention-from-url(base-uri() ), ')')"/>
							</xsl:with-param>
							<xsl:with-param name="show-context" select="false()"/>
						</xsl:call-template>
					</xsl:if>
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
					<xsl:sort select="lower-case(substring-after(@name, ':') )" order="ascending"/>
					<xsl:call-template name="intern:table-row">
						<xsl:with-param name="col1">
							<xsl:if test="position() eq 1">
								<xsl:value-of select="concat('*', upper-case(current-grouping-key() ), '*')"/>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col2">
							<xsl:call-template name="intern:make-top-level-item-string">
								<xsl:with-param name="bold-name" select="true()"/>
								<xsl:with-param name="link-name" select="true()"/>
							</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="col3">
							<xsl:if test="$make-links">
								<xsl:value-of select="intern:URI-to-wikilink(base-uri(.) )"/>
							</xsl:if>
						</xsl:with-param>
						<xsl:with-param name="col4">
							<xsl:apply-templates select="$stylesheet//para[@xml:id eq substring-after(current()/@name, ':')]/node()" mode="parse_docbook-line"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:for-each-group>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template name="intern:make-top-level-item-string">
		<!-- Kontext ist eine einzelne xsl:function oder ein einzelnes xsl:template -->
		<xsl:param name="bold-name" as="xs:boolean" required="yes"/>
		<xsl:param name="link-name" as="xs:boolean" required="yes"/>
		<xsl:if test="$bold-name">
			<xsl:text>*</xsl:text>
		</xsl:if>
		<xsl:if test="$link-name">
			<xsl:text>[</xsl:text>
			<xsl:value-of select="intern:name-to-wikilink(@name)"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="@name"/>
		<xsl:if test="$link-name">
			<xsl:text>]</xsl:text>
		</xsl:if>
		<xsl:if test="$bold-name">
			<xsl:text>*</xsl:text>
		</xsl:if>
		<xsl:if test="xsl:param">
			<xsl:if test="self::xsl:template">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:text>(</xsl:text>
			<xsl:for-each select="xsl:param">
				<xsl:choose>
					<xsl:when test="parent::xsl:function"><!-- bei Funktionen sind alle Parameter zwingend --></xsl:when>
					<xsl:when test="(@required eq 'yes')">_required_ </xsl:when>
					<xsl:otherwise>_optional_ </xsl:otherwise>
				</xsl:choose>
				<xsl:text>{{{</xsl:text>
				<xsl:value-of select="@name"/>
				<xsl:text>}}}</xsl:text>
				<xsl:if test="normalize-space(@as)">
					<xsl:text> _as_ {{{</xsl:text>
					<xsl:value-of select="normalize-space(@as)"/>
					<xsl:text>}}}</xsl:text>
				</xsl:if>
				<xsl:if test="position() lt last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>)</xsl:text>
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
	<!-- ====================     mode parse_docbook / parse_docbook-line    ==================== -->
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="intern:detect" mode="parse_docbook">parse_docbook</xsl:template>
	<xsl:template match="intern:detect" mode="parse_docbook-line">parse_docbook-line</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="*" mode="parse_docbook parse_docbook-line">
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="level">WARN</xsl:with-param>
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
		<xsl:apply-templates mode="#current"/>&crt;&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="para" mode="parse_docbook-line">
		<xsl:apply-templates mode="#current"/>
		<xsl:if test="following-sibling::para">
			<xsl:text>; </xsl:text>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="itemizedlist | orderedlist" mode="parse_docbook">
		&crt;
		<xsl:apply-templates select="*" mode="#current"/>
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="itemizedlist | orderedlist" mode="parse_docbook-line">
		<xsl:apply-templates select="*" mode="#current"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="itemizedlist/title|orderedlist/title" mode="parse_docbook">
		<xsl:text>*</xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:text>*</xsl:text>
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="itemizedlist/listitem" mode="parse_docbook">
		<xsl:text> * </xsl:text>
		<xsl:apply-templates mode="#current"/>
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="itemizedlist/listitem" mode="parse_docbook-line">
		<xsl:text>• </xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:if test="following-sibling::listitem">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="orderedlist/listitem" mode="parse_docbook">
		<xsl:text># </xsl:text>
		<xsl:apply-templates mode="#current"/>
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="doc:param" mode="parse_docbook">
		<xsl:text>`</xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:text>`: </xsl:text>
		<xsl:apply-templates mode="#current"/>
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="revhistory" mode="parse_docbook">
		<xsl:text>===Versionen===</xsl:text>
		&crt;
		<xsl:text>|| Revision || Datum || Autor || Beschreibung ||</xsl:text>
		&crt;
		<xsl:apply-templates select="*" mode="#current"/>
		&crt;
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="revision" mode="parse_docbook">
		<xsl:apply-templates select="*" mode="#current"/>
		<xsl:text> ||</xsl:text>
		&crt;
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="revision/revnumber | revision/date | revision/authorinitials" mode="parse_docbook">
		<xsl:text>|| </xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="revision/revdescription" mode="parse_docbook">
		<xsl:text>|| </xsl:text>
		<xsl:apply-templates select="node()" mode="parse_docbook-line"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="orderedlist/listitem" mode="parse_docbook-line">
		<xsl:value-of select="1 + count(preceding-sibling::listitem)"/>
		<xsl:text>) </xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:if test="following-sibling::listitem">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="listitem/para" mode="parse_docbook parse_docbook-line">
		<xsl:apply-templates mode="#current"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="link|ulink" mode="parse_docbook-line">
		<xsl:text>`</xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:text>`</xsl:text>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="link|ulink" mode="parse_docbook">
		<xsl:choose>
			<xsl:when test="xsb:url-has-authority(@xlink:href|href)">
				<xsl:text>[</xsl:text>
				<xsl:value-of select="@xlink:href|href"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates mode="#current"/>
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>{{{</xsl:text>
				<xsl:apply-templates mode="#current"/>
				<xsl:text>}}}</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="code|function" mode="parse_docbook parse_docbook-line">
		<xsl:text>`</xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:text>`</xsl:text>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="emphasis[@role eq 'bold']" mode="parse_docbook parse_docbook-line">
		<xsl:text>*</xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:text>*</xsl:text>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="emphasis[not(@role)]" mode="parse_docbook parse_docbook-line">
		<xsl:text>_</xsl:text>
		<xsl:apply-templates mode="#current"/>
		<xsl:text>_</xsl:text>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:template match="text()" mode="parse_docbook parse_docbook-line">
		<xsl:if test="matches(., '^\s')">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="replace(normalize-space(.), '\*', '{{{*}}}')"/>
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
		<para xml:id="URI-to-wikilink">wandelt den Namen eines XSL-SB-Stylesheets in einen Wikilink (für Google Code). Dazu wird im Stylesheet <code>$uri</code> //doc:doc/doc:title ausgelesen.</para>
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
	<xsl:function name="intern:URI-to-wikilink" as="xs:string?">
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
					<xsl:with-param name="caller">intern:URI-to-wikilink</xsl:with-param>
					<xsl:with-param name="message">kein Link für »<xsl:sequence select="$file"/>« definiert</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:function>
		<doc:param name="name"><para>Name der Funktion oder des Templates, das verlinkt werden soll</para></doc:param>
		<para xml:id="name-to-wikilink">wandelt den Namen einer Funktion oder eines Templates in einen Wikilink (für Google Code).</para>
		<para>Bei einer leeren <code>$name</code> wird eine Leersequenz zurückgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.48</revnumber>
				<date>2012-05-26</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:name-to-wikilink" as="xs:string">
		<xsl:param name="name" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($name)">
				<xsl:sequence select="replace(xsb:encode-for-id($name), 'x3A|-|\.', '_')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
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
			<xsl:choose>
				<!-- Sonderfall für schönere Seitennamen -->
				<xsl:when test="xsb:fileName-and-fileExtention-from-url($uri) eq 'standard.xsl'">
					<xsl:sequence select=" 'XSLT_SB' "/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:sequence select="doc($uri)//doc:doc/doc:title"/>
				</xsl:otherwise>
			</xsl:choose>
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
	<!-- extrahiert aus einem string, der wie ein funktionsaufruf aussieht, die qualifizierten Namen der Funktionen -->
	<xsl:function name="intern:extract-function-names" as="xs:string*">
		<xsl:param name="string" as="xs:string?"/>
		<xsl:param name="vortrag" as="xs:string*"/>
		<xsl:choose>
			<xsl:when test="intern:looks-like-a-function-call($string)">
				<xsl:sequence select="distinct-values(($vortrag, intern:function-name($string), for $i in intern:function-arguments($string) return intern:extract-function-names($i, '') ) )[normalize-space(.)]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="distinct-values($vortrag)[normalize-space(.)]"/>
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
	</doc:template>
	<xsl:template match="/" mode="internals.self-test" priority="1">
		<xsl:call-template name="xsb:internals.MakeHeader"/>
		<xsl:call-template name="intern:internals.Stylecheck"/>
		<xsl:call-template name="intern:google_code.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
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
	<!--  -->
	<!--  -->
	<intern:testliste xml:id="FileTests">
		<test>
			<value></value>
			<intern:doc-title></intern:doc-title>
			<intern:wikifile-name></intern:wikifile-name>
			<intern:URI-to-wikilink></intern:URI-to-wikilink>
		</test>
		<test>
			<value>../files.xsl</value>
			<intern:doc-title>Dateien und Dateisystem</intern:doc-title>
			<intern:wikifile-name>Dateien_und_Dateisystem.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[Dateien_und_Dateisystem]</intern:URI-to-wikilink>
		</test>
		<test>
			<value>../internals.logging.xsl</value>
			<intern:doc-title>Logging-System</intern:doc-title>
			<intern:wikifile-name>LoggingSystem.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[LoggingSystem]</intern:URI-to-wikilink>
		</test>
		<test>
			<value>../internals.meta.xsl</value>
			<intern:doc-title>Meta-Funktionen</intern:doc-title>
			<intern:wikifile-name>MetaFunktionen.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[MetaFunktionen]</intern:URI-to-wikilink>
		</test>
		<test>
			<value>../internals.stylecheck.xsl</value>
			<intern:doc-title>StyleCheck</intern:doc-title>
			<intern:wikifile-name>StyleCheck.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[StyleCheck]</intern:URI-to-wikilink>
		</test>
		<test>
			<value>../internals.testing.xsl</value>
			<intern:doc-title>Testen von Stylesheets</intern:doc-title>
			<intern:wikifile-name>Testen_von_Stylesheets.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[Testen_von_Stylesheets]</intern:URI-to-wikilink>
		</test>
		<test>
			<value>../internals.xsl</value>
			<intern:doc-title>Interne Funktionen</intern:doc-title>
			<intern:wikifile-name>Interne_Funktionen.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[Interne_Funktionen]</intern:URI-to-wikilink>
		</test>
		<test>
			<value>../numbers.xsl</value>
			<intern:doc-title>Zahlen und Rechnen</intern:doc-title>
			<intern:wikifile-name>Zahlen_und_Rechnen.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[Zahlen_und_Rechnen]</intern:URI-to-wikilink>
		</test>
		<test>
			<value>../standard.xsl</value>
			<intern:doc-title>XSLT_SB</intern:doc-title>
			<intern:wikifile-name>XSLT_SB.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[XSLT_SB]</intern:URI-to-wikilink>
		</test>
		<test>
			<value>../strings.xsl</value>
			<intern:doc-title>Strings und Texte</intern:doc-title>
			<intern:wikifile-name>Strings_und_Texte.wiki</intern:wikifile-name>
			<intern:URI-to-wikilink>[Strings_und_Texte]</intern:URI-to-wikilink>
		</test>
	</intern:testliste>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- __________     Tests     __________ -->
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
		<!-- __________     intern:URI-to-wikilink     __________ -->
		<xsl:for-each select="$seqFileTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:URI-to-wikilink</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:URI-to-wikilink(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     intern:URI-to-wikilink     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:name-to-wikilink(())</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:name-to-wikilink(())"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:name-to-wikilink('')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:name-to-wikilink('')"/>
			<xsl:with-param name="reference-value" select=" '' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:name-to-wikilink('xsb:e')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:name-to-wikilink('xsb:e')"/>
			<xsl:with-param name="reference-value" select=" 'xsb_e' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:name-to-wikilink('xsb:Ende')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:name-to-wikilink('xsb:Ende')"/>
			<xsl:with-param name="reference-value" select=" 'xsb_Ende' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:name-to-wikilink('intern:e')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:name-to-wikilink('intern:e')"/>
			<xsl:with-param name="reference-value" select=" 'intern_e' "/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     intern:extract-function-names()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:extract-function-names('', '')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:extract-function-names('', '')"/>
			<xsl:with-param name="reference-value" select="()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:extract-function-names('name(666)', '')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:extract-function-names('name(666)', '')"/>
			<xsl:with-param name="reference-value" select="'name'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:extract-function-names('intern:name(666)', '')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:extract-function-names('intern:name(666)', '')"/>
			<xsl:with-param name="reference-value" select="'intern:name'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:extract-function-names('intern:name-to-wikilink(log(intern:hund(dec(1), dec(2), dec(3) ) ), xs:string(2) )', '')</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:extract-function-names('intern:name-to-wikilink(log(intern:hund(dec(1), dec(2), dec(3) ) ), xs:string(2) )', '')"/>
			<xsl:with-param name="reference-value" select="'intern:name-to-wikilink', 'log', 'intern:hund', 'dec', 'xs:string'"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
