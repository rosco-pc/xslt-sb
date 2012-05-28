<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	Copyright (c) 2011, 2012 Stefan Krause
	
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
<!ENTITY xsdecimalINF "<para>Ein lästiges Problem ist, dass <code>xs:decimal</code> nicht die Werte <code>-INF</code> und <code>INF</code> abbilden kann. Die aktuelle Implementierung (Revision <code>0.2.25</code>) wirft in diesen Fällen ein Exception (Verarbeitung wird mit Fehler abgebrochen). Eine zukünftige Lösung könnte darin bestehen, das Ergebnis dynamisch auf <code>xs:double</code> oder <code>xs:decimal</code> zu casten.</para>">
<!ENTITY internMax-internRound "<para>Die Anzahl der Iterationen resp. Genauigkeit wird von <function><link linkend='max_var'>$intern:max</link></function> 
			und <function><link linkend='iround_var'>$intern:iround</link></function> beeinflusst.</para>">
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
	<xsl:import href="internals.stylecheck.xsl"/>
	<xsl:import href="math.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="math_tests.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Tests für math.xsl</doc:title>
		<para>Dieses Stylesheet testet <code>math.xsl</code></para>
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
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/math.xsl">&XSL-Base-Directory;/math.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/math.html">&doc-Base-Directory;/math.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/math.xsl">&XSL-Base-Directory;/math_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/math.html">&doc-Base-Directory;/math_tests.html</link></para>
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
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
					<revdescription>
					<para conformance="alpha">Status: alpha</para>
						<para>Ausgliederung aus <code>math.xsl</code></para>
				</revdescription>
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
	<!-- __________     xsb:internals.test.function.withTestItem.NumericResult.rounded     __________ -->
	<doc:template>
		<doc:param name="test-node"><para>ein <link linkend="internals.testing.test-node">Testknoten</link></para></doc:param>
		<doc:param name="function-name"><para>Name der getesteten Funktion. Der Funktionsname wird sowohl zur Ermittlung des Referenzwertes aus dem Testknoten als
			auch zur Ausgabe der Resultate an das Logging-System verwendet.</para></doc:param>
		<doc:param name="actual-value"><para>aktuelles Ergebnis der getesteten Funktion. Im <code>select</code>-Attribut des <function>&lt;xsl:with-param/&gt;</function>-Elements 
			sollte die getestete Funktion mit dem Inhalt des <function>&lt;value/&gt;</function>-Elements des Testknotens als Argument aufgerufen werden.</para></doc:param>
		<para xml:id="internals.test.function.withTestItem.NumericResult.rounded">abgewandelte Fassung von
			<function><link linkend="internals.test.function.withTestItem.NumericResult">xsb:internals.test.function.withTestItem.NumericResult</link></function>,
			um das Runden mit <function>intern:round</function> einfach berücksichtigen zu können</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
		<!-- $test-node muss ein intern:test-element sein -->
		<xsl:param name="test-node" as="element()" required="yes"/>
		<xsl:param name="function-name" as="xs:string" required="yes"/>
		<xsl:param name="actual-value" required="yes" intern:solved="MissingTypes"/>
		<xsl:if test="intern:validate-test-node($test-node, $function-name)">
			<xsl:choose>
				<xsl:when test="xsb:listed($test-node/@intern:skip, $_internals.testing.current-vendor-hash) or xsb:listed($test-node/*[name() eq $function-name]/@intern:skip, $_internals.testing.current-vendor-hash)">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.Function" intern:solved="CallTemplateTestFunction">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
						<xsl:with-param name="actual-value" select="intern:round($actual-value)"/>
						<xsl:with-param name="reference-value" select="intern:round(xsb:cast($test-node/*[name() eq $function-name]/text(), xsb:type-annotation($actual-value) ) )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:internals.test.function.withTestItem.NumericResult.irounded     __________ -->
	<doc:template>
		<doc:param name="test-node"><para>ein <link linkend="internals.testing.test-node">Testknoten</link></para></doc:param>
		<doc:param name="function-name"><para>Name der getesteten Funktion. Der Funktionsname wird sowohl zur Ermittlung des Referenzwertes aus dem Testknoten als
			auch zur Ausgabe der Resultate an das Logging-System verwendet.</para></doc:param>
		<doc:param name="actual-value"><para>aktuelles Ergebnis der getesteten Funktion. Im <code>select</code>-Attribut des <function>&lt;xsl:with-param/&gt;</function>-Elements 
			sollte die getestete Funktion mit dem Inhalt des <function>&lt;value/&gt;</function>-Elements des Testknotens als Argument aufgerufen werden.</para></doc:param>
		<para xml:id="internals.test.function.withTestItem.NumericResult.irounded">abgewandelte Fassung von
			<function><link linkend="internals.test.function.withTestItem.NumericResult">xsb:internals.test.function.withTestItem.NumericResult</link></function>,
			um das Runden mit <function>intern:iround</function> einfach berücksichtigen zu können</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-25</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="xsb:internals.test.function.withTestItem.NumericResult.irounded">
		<!-- $test-node muss ein intern:test-element sein -->
		<xsl:param name="test-node" as="element()" required="yes"/>
		<xsl:param name="function-name" as="xs:string" required="yes"/>
		<xsl:param name="actual-value" required="yes" intern:solved="MissingTypes"/>
		<xsl:if test="intern:validate-test-node($test-node, $function-name)">
			<xsl:choose>
				<xsl:when test="xsb:listed($test-node/@intern:skip, $_internals.testing.current-vendor-hash) or xsb:listed($test-node/*[name() eq $function-name]/@intern:skip, $_internals.testing.current-vendor-hash)">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.Function" intern:solved="CallTemplateTestFunction">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
						<xsl:with-param name="actual-value" select="intern:iround($actual-value)"/>
						<xsl:with-param name="reference-value" select="intern:iround(xsb:cast($test-node/*[name() eq $function-name]/text(), xsb:type-annotation($actual-value) ) )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<intern:testliste xml:id="MathTests">
		<test>
			<!-- 1 -->
			<value>1</value>
			<xsb:fact>1</xsb:fact>
			<xsb:pow>2</xsb:pow>
			<xsb:exp>2.718281828459045235360287471352662497757247093699959574967</xsb:exp>
			<intern:exp>2.718281828459045235360287471352662497757247093699959574967</intern:exp>
			<intern:normalize-rad>1</intern:normalize-rad>
			<xsb:sin>0.841470984807896507</xsb:sin><!-- 0,8414709848078965066525023216303 -->
			<xsb:cos>0.54030230586813971740</xsb:cos>
			<xsb:deg-to-rad>0.0174532925199433</xsb:deg-to-rad>
			<xsb:rad-to-deg>57.295779513082320876798154814105170332405472466564321549</xsb:rad-to-deg>
			<xsb:sqrt>1</xsb:sqrt>
			<intern:sqrt>1</intern:sqrt>
			<xsb:nroot>2</xsb:nroot>
			<intern:nroot>2</intern:nroot>
			<xsb:log>0</xsb:log>
			<xsb:log10>0</xsb:log10>
			<xsb:fibonacci>1</xsb:fibonacci>
			<xsb:exp10>10</xsb:exp10>
			<xsb:tan>1.557407724654902230506974807458360173087250772381520038384</xsb:tan>
			<xsb:cot>0.642092615934330703006419986594265620230278113918171379101</xsb:cot>
			<intern:log-m-iterator>0</intern:log-m-iterator>
			<xsb:atan>0.785398163397448309615660845819875721049292349843776455244</xsb:atan>
			<xsb:atan2>0.463647609000806116214256231461214402028537054286120263811</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin>1.570796326794896619231321691639751442098584699687552910487</xsb:asin>
			<xsb:acos>0</xsb:acos>
		</test>
		<test intern:skip="xsb:fact xsb:fibonacci xsb:nroot xsb:tan">
			<!-- Pi/2 -->
			<value>1.570796326794896619231321691639751442098584699687552910487</value>
			<xsb:fact>1</xsb:fact>
			<xsb:pow intern:skip="AltovaXML_CE_2010.3sp1 AltovaXML_CE_2012.sp1 AltovaXML_CE_2012.2">2.970686423552019336197657011453594895503487279888690815736</xsb:pow>
			<xsb:exp>4.810477380965351655473035666703833126390170874664534940021</xsb:exp>
			<intern:exp>4.810477380965351655473035666703833126390170874664534940021</intern:exp>
			<intern:normalize-rad>1.570796326794896619231321691639751442098584699687552910487</intern:normalize-rad>
			<xsb:sin>1</xsb:sin>
			<xsb:cos>0</xsb:cos>
			<xsb:deg-to-rad>0.0274155677808037739412069194441004198203158316867799739623</xsb:deg-to-rad>
			<xsb:rad-to-deg>90</xsb:rad-to-deg>
			<xsb:sqrt>1.253314137315500251207882642405522626503493370304969158315</xsb:sqrt>
			<intern:sqrt>1.253314137315500251207882642405522626503493370304969158315</intern:sqrt>
			<xsb:nroot>2</xsb:nroot>
			<intern:nroot>2</intern:nroot>
			<xsb:log>0.451582705289454864726195229894882143571794678555056317393</xsb:log>
			<xsb:log10>0.196119877030152659137529393566405846883488442918333904822</xsb:log10>
			<xsb:fibonacci>0</xsb:fibonacci>
			<xsb:exp10>37.22171048416516670949576580503503341327551404091465815711</xsb:exp10>
			<xsb:tan>INF</xsb:tan>
			<xsb:cot>0</xsb:cot>
			<intern:log-m-iterator>1</intern:log-m-iterator>
			<xsb:atan>1.00388482185388721414842394491713228829210446059487057473</xsb:atan>
			<xsb:atan2>0.665773750028353863590517708512175209194269875620066408542</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test>
			<!-- 2 -->
			<value>2</value>
			<xsb:fact>2</xsb:fact>
			<xsb:pow>4</xsb:pow>
			<xsb:exp>7.389056098930650227230427460575007813180315570551847324087</xsb:exp>
			<intern:exp>7.389056098930650227230427460575007813180315570551847324087</intern:exp>
			<intern:normalize-rad>2</intern:normalize-rad>
			<xsb:sin>0.909297426825681695</xsb:sin><!-- 0,909297426825681695 39601986591174 -->
			<xsb:cos>-0.4161468365471423869975682295007621897660007710755448908</xsb:cos>
			<xsb:deg-to-rad>0.03490658503988659</xsb:deg-to-rad>
			<xsb:rad-to-deg>114.5915590261646417535963096282103406648109449331286430983</xsb:rad-to-deg>
			<xsb:sqrt>1.414213562373095048801688724209698078569671875376948073</xsb:sqrt>
			<intern:sqrt>1.414213562373095048801688724209698078569671875376948073</intern:sqrt>
			<xsb:nroot>1.414213562373095048801688724209698078569671875376948073</xsb:nroot>
			<intern:nroot>1.414213562373095048801688724209698078569671875376948073</intern:nroot>
			<xsb:log>0.69314718055994530941723212145817656807550013436025525412</xsb:log>
			<xsb:log10>0.301029995663981195213738894724493026768189881462108541310</xsb:log10>
			<xsb:fibonacci>1</xsb:fibonacci>
			<xsb:exp10>100</xsb:exp10>
			<xsb:tan>-2.18503986326151899164330610231368254343201774622766316456</xsb:tan>
			<xsb:cot>-0.45765755436028576375027741043204727642848632923167432964</xsb:cot>
			<intern:log-m-iterator>1</intern:log-m-iterator>
			<xsb:atan>1.1071487177940905030170654601785370400700476454014326467</xsb:atan>
			<xsb:atan2>0.785398163397448309615660845819875721049292349843776455244</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test>
			<!-- 3 -->
			<value>3</value>
			<xsb:fact>6</xsb:fact>
			<xsb:pow>8</xsb:pow>
			<xsb:exp>20.085536923187667740928529654581717896987907838554150144378934229698845878</xsb:exp>
			<intern:exp>20.085536923187667740928529654581717896987907838554150144378934229698845878</intern:exp>
			<intern:normalize-rad>3</intern:normalize-rad>
			<xsb:sin>0.14112000805986722210074480280811</xsb:sin>
			<xsb:cos>-0.98999249660044545727157279473126130239367909661558832881</xsb:cos>
			<xsb:deg-to-rad>0.05235987755982988730771072305465838140328615665625176368</xsb:deg-to-rad>
			<xsb:rad-to-deg>171.887338539246962630394464442315510997216417399692964647</xsb:rad-to-deg>
			<xsb:sqrt>1.732050807568877293527446341505872366942805253810380628056</xsb:sqrt>
			<intern:sqrt>1.732050807568877293527446341505872366942805253810380628056</intern:sqrt>
			<xsb:nroot>1.25992104989487316476721060727822835057025146470150798</xsb:nroot>
			<intern:nroot>1.25992104989487316476721060727822835057025146470150798</intern:nroot>
			<xsb:log>1.09861228866810969139524523692252570464749055782274945173</xsb:log>
			<xsb:log10>0.47712125471966243729502790325511530920012886419069586483</xsb:log10>
			<xsb:fibonacci>2</xsb:fibonacci>
			<xsb:exp10>1000</xsb:exp10>
			<xsb:tan>-0.14254654307427780529563541053391349322609228490180464763</xsb:tan>
			<xsb:cot intern:skip="Saxon-PE_9.3 Saxon-HE_9.3 Saxon-HE_9.4 AltovaXML_CE_2010.3sp1 AltovaXML_CE_2012.2 Saxon-B_9.1 Saxon-EE_9.3">-7.01525255143453346942855137952647657829310335209635383816</xsb:cot>
			<intern:log-m-iterator>2</intern:log-m-iterator>
			<xsb:atan>1.249045772398254425829917077281090123077829404129896719055</xsb:atan>
			<xsb:atan2>0.982793723247329067985710611014666014496877453631628556761</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test intern:skip="xsb:fact xsb:fibonacci xsb:nroot xsb:cot">
			<!-- Pi -->
			<value>3.1415926535897932384626433832795</value>
			<xsb:fact/>
			<xsb:pow>8.824977827076287623856429604208001581704410815271484926669</xsb:pow>
			<xsb:exp>23.1406926327792690057290863679485473802661062426002119934</xsb:exp>
			<intern:exp>23.1406926327792690057290863679485473802661062426002119934</intern:exp>
			<intern:normalize-rad>3.1415926535897932384626433832795</intern:normalize-rad>
			<xsb:sin>0</xsb:sin>
			<xsb:cos>-1</xsb:cos>
			<xsb:deg-to-rad>0.0548311355616075478824138388882</xsb:deg-to-rad><!-- 0.05483113556160754788241383888820083964063166337355994792 -->
			<xsb:rad-to-deg>180</xsb:rad-to-deg>
			<xsb:sqrt>1.77245385090551602729816748334114518279754945612238712821</xsb:sqrt>
			<intern:sqrt>1.77245385090551602729816748334114518279754945612238712821</intern:sqrt>
			<xsb:nroot>1.24686898890063830549737063612557700547254563439112570363</xsb:nroot>
			<intern:nroot>1.24686898890063830549737063612557700547254563439112570363</intern:nroot>
			<xsb:log>1.14472988584940017414342735135305871164729481291531157151</xsb:log>
			<xsb:log10>0.497149872694133854351268288290898873651678324380442446134</xsb:log10>
			<xsb:fibonacci/>
			<xsb:exp10>1385.455731367011089140919936879688065066565539444998214842</xsb:exp10>
			<xsb:tan>0</xsb:tan>
			<xsb:cot>-INF</xsb:cot>
			<intern:log-m-iterator>2</intern:log-m-iterator>
			<xsb:atan>1.262627255678911683444322083605698343508947670424383596974</xsb:atan>
			<xsb:atan2>1.003884821853887214148423944917132288292104460594870574729</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test intern:skip="xsb:fact xsb:fibonacci xsb:nroot xsb:cot">
			<!-- Tau -->
			<value>6.283185307179586476925286766559</value>
			<xsb:fact/>
			<xsb:pow>77.8802336483881151070208347785976597963218987692005087464</xsb:pow>
			<xsb:exp>535.4916555247647365030493295890471814778057976032949155072</xsb:exp>
			<intern:exp>535.4916555247647365030493295890471814778057976032949155072</intern:exp>
			<intern:normalize-rad>6.283185307179586476925286766559</intern:normalize-rad>
			<xsb:sin>0</xsb:sin>
			<xsb:cos>1</xsb:cos>
			<xsb:deg-to-rad>0.109662271123215095764827677776</xsb:deg-to-rad>
			<xsb:rad-to-deg>360</xsb:rad-to-deg>
			<xsb:sqrt>2.50662827463100050241576528481104525300698674060993831663</xsb:sqrt>
			<intern:sqrt>2.50662827463100050241576528481104525300698674060993831663</intern:sqrt>
			<xsb:nroot>1.11663288009114181981147814884648079442403971913807087138</xsb:nroot>
			<intern:nroot>1.11663288009114181981147814884648079442403971913807087138</intern:nroot>
			<xsb:log>1.837877066409345483560659472811235279722794947275566825634</xsb:log>
			<xsb:log10>0.798179868358115049565007183015391900419868205842550987444</xsb:log10>
			<xsb:fibonacci/>
			<xsb:exp10>1919487.5835776995947163759258766484544894578323133001</xsb:exp10>
			<xsb:tan>0</xsb:tan>
			<xsb:cot>INF</xsb:cot>
			<intern:log-m-iterator>3</intern:log-m-iterator>
			<xsb:atan>1.412965136506737759063712949856932518493513459088501850072</xsb:atan>
			<xsb:atan2>1.262627255678911683444322083605698343508947670424383596974</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test>
			<!-- 10 -->
			<value>10</value>
			<xsb:fact>3628800</xsb:fact>
			<xsb:pow>1024</xsb:pow>
			<xsb:exp>22026.465794806716516957900645312</xsb:exp>
			<intern:exp>22026.465794806716516957900645312</intern:exp>
			<intern:normalize-rad>3.7168146928204135230747132334409942</intern:normalize-rad><!-- 3.716814692820413523074713233440994231605661201249788358050 -->
			<xsb:sin>-0.544021110889369813</xsb:sin><!-- -0.54402111088936981340474766185137728 -->
			<xsb:cos>-0.839071529076452452258863947824</xsb:cos><!-- -0.8390715290764524522588639478240648345199301651331685468 -->
			<xsb:deg-to-rad>0.17453292519943295</xsb:deg-to-rad>
			<xsb:rad-to-deg>572.9577951308232087679815481410517033240547246656432154916</xsb:rad-to-deg>
			<xsb:sqrt>3.16227766016837933199889354443271853371955513932521682686</xsb:sqrt>
			<intern:sqrt>3.16227766016837933199889354443271853371955513932521682686</intern:sqrt>
			<xsb:nroot>1.07177346253629316421300632502334202290638460497755678348</xsb:nroot>
			<intern:nroot>1.07177346253629316421300632502334202290638460497755678348</intern:nroot>
			<xsb:intern>1.07177346253629316421300632502334202290638460497755678348</xsb:intern>
			<xsb:log>2.302585092994045684017991454684364207601101488628772976033</xsb:log>
			<xsb:log10>1</xsb:log10>
			<xsb:fibonacci>55</xsb:fibonacci>
			<xsb:exp10>10000000000</xsb:exp10>
			<xsb:tan>0.648360827459086671259124933009808676816874342983724975634</xsb:tan>
			<xsb:cot>1.542351045356920048277469355682429311320667206401962490919</xsb:cot>
			<intern:log-m-iterator>3</intern:log-m-iterator>
			<xsb:atan>1.471127674303734591852875571761730851855306377183238262472</xsb:atan>
			<xsb:atan2>1.373400766945015860861271926444961148650999595899700808970</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test>
			<!-- 100 -->
			<value>100</value>
			<xsb:fact>93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000</xsb:fact>
			<xsb:pow>1267650600228229401496703205376</xsb:pow>
			<xsb:exp intern:skip="Saxon-PE_9.3 Saxon-HE_9.3 Saxon-HE_9.4 AltovaXML_CE_2010.3sp1 AltovaXML_CE_2012.sp1 AltovaXML_CE_2012.2 Saxon-B_9.1 Saxon-EE_9.3">26881171418161354484126255515800135873611118.773741922415191608615280287034909564914</xsb:exp>
			<intern:exp>26881171418161354484126255515800135873611118.773741922415191608615280287034909564914</intern:exp>
			<intern:normalize-rad>5.7522203923062028461206985016149135</intern:normalize-rad><!-- 5.752220392306202846120698501614913474084918018746825370752 -->
			<xsb:sin>-0.5063656411097588</xsb:sin><!-- -0,50636564110975879365655761045979 -->
			<xsb:cos>0.86231887228768393</xsb:cos> <!-- 0.86231887228768393410193851395084253551008400853551082928 -->
			<xsb:deg-to-rad>1.7453292519943295769</xsb:deg-to-rad><!-- 1.745329251994329576923690768488612713442871888541725456097 -->
			<xsb:rad-to-deg>5729.577951308232087679815481410517033240547246656432154916</xsb:rad-to-deg>
			<xsb:sqrt>10</xsb:sqrt>
			<intern:sqrt>10</intern:sqrt>
			<xsb:nroot>1.0069555500567188088326982141132397854535407405341259051</xsb:nroot>
			<intern:nroot>1.0069555500567188088326982141132397854535407405341259051</intern:nroot>
			<xsb:log>4.605170185988091368035982909368728415202202977257545952067</xsb:log>
			<xsb:log10>2</xsb:log10>
			<xsb:fibonacci>354224848179261915075</xsb:fibonacci>
			<xsb:exp10>10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000</xsb:exp10>
			<xsb:tan>-0.58721391515692907667780963564458789425876598687291954413</xsb:tan>
			<xsb:cot>-1.70295691942646921609873145955728386284991896360177739850</xsb:cot>
			<intern:log-m-iterator>7</intern:log-m-iterator>
			<xsb:atan>1.56079666010823138102498157543047189353721534714317627086</xsb:atan>
			<xsb:atan2>1.550798992821746086170568494738154954149351501001044426582</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
	</intern:testliste>
	<!-- nicht alle Funktionen axzeptieren Null als Eingabe -->
	<intern:testliste xml:id="MathTestsNull">
		<test>
			<!-- 0 (Null) -->
			<value>0</value>
			<xsb:fact>1</xsb:fact>
			<xsb:pow>1</xsb:pow>
			<xsb:exp>1</xsb:exp>
			<intern:exp>1</intern:exp>
			<intern:normalize-rad>0</intern:normalize-rad>
			<xsb:sin>0</xsb:sin>
			<xsb:cos>1</xsb:cos>
			<xsb:deg-to-rad>0</xsb:deg-to-rad>
			<xsb:rad-to-deg>0</xsb:rad-to-deg>
			<xsb:sqrt>0</xsb:sqrt>
			<intern:sqrt>0</intern:sqrt>
			<xsb:nroot>0</xsb:nroot>
			<intern:nroot>0</intern:nroot>
			<xsb:log>-INF</xsb:log>
			<xsb:log10>-INF</xsb:log10>
			<xsb:fibonacci>0</xsb:fibonacci>
			<xsb:exp10>1</xsb:exp10>
			<xsb:tan>0</xsb:tan>
			<xsb:cot>INF</xsb:cot>
			<xsb:atan>0</xsb:atan>
			<xsb:atan2>0</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin>0</xsb:asin>
			<xsb:acos>1.570796326794896619231321691639751442098584699687552910487</xsb:acos>
		</test>
	</intern:testliste>
	<!-- nicht alle Funktionen axzeptieren negative Zahlen als Eingabe -->
	<intern:testliste xml:id="MathTestsNeg">
		<test>
			<!-- -42 -->
			<value>-42</value>
			<xsb:pow>0.0000000000002273736754432320594787597656</xsb:pow>
			<xsb:exp>0.000000000000000000574952226429355980666438088057342342494755797432374</xsb:exp>
			<intern:exp>0.000000000000000000574952226429355980666438088057342342494755797432374</intern:exp>
			<intern:normalize-rad>-4.30088815692248113844827940064596538963396720749873014830</intern:normalize-rad>
			<xsb:sin>0.916521547915633785898989158069671501748146718165188808928</xsb:sin>
			<xsb:cos>-0.39998531498835129395470733717720202838042287914241906062</xsb:cos>
			<xsb:deg-to-rad>-0.73303828583761842230795012276521733964600619318752469156</xsb:deg-to-rad>
			<xsb:rad-to-deg>-2406.42273954945747682552250219241715396102984359570150506</xsb:rad-to-deg>
			<xsb:exp10>0.000000000000000000000000000000000000000001</xsb:exp10>
			<xsb:tan>-2.29138799243748608885455387439788153851442850194729645344</xsb:tan>
			<xsb:cot>-0.43641670607527289605711673823895793299115845885203998977</xsb:cot>
			<xsb:atan>-1.54699130060982667577745363628196067741930455660382242403</xsb:atan>
			<xsb:atan2>-1.52321322351791322342928897562326592463202570509422094488</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test>
			<!-- -5 -->
			<value>-5</value>
			<xsb:pow>0.03125</xsb:pow>
			<xsb:exp>0.006737946999085467096636048423148424248849585027355085430</xsb:exp>
			<intern:exp>0.006737946999085467096636048423148424248849585027355085430</intern:exp>
			<intern:normalize-rad>-5</intern:normalize-rad>
			<xsb:sin>0.95892427466313846889315440615599397335246154396460177813</xsb:sin>
			<xsb:cos>0.283662185463226264466639171513557308334422592252215944930</xsb:cos>
			<xsb:deg-to-rad>-0.08726646259971647884618453842443063567214359442708627280</xsb:deg-to-rad>
			<xsb:rad-to-deg>-286.478897565411604383990774070525851662027362332821607746</xsb:rad-to-deg>
			<xsb:exp10>0.00001</xsb:exp10>
			<xsb:tan>3.380515006246585636982705879447343908709569208285459877177</xsb:tan>
			<xsb:cot>0.295812915532745540427767168082485286068234795481534895337</xsb:cot>
			<xsb:atan>-1.37340076694501586086127192644496114865099959589970080897</xsb:atan>
			<xsb:atan2>-1.19028994968253173292773377482931833760117898602945207291</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test intern:skip="xsb:cot">
			<!-- -Pi -->
			<value>-3.1415926535897932384626433832795</value>
			<xsb:pow>0.113314732296760873020282172213329377896121456442127822633</xsb:pow>
			<xsb:exp>0.043213918263772249774417737171728011275728109810633082981</xsb:exp>
			<intern:exp>0.04321391826377224977441773717172801127572810981063308298</intern:exp>
			<intern:normalize-rad>-3.1415926535897932384626433832795</intern:normalize-rad>
			<xsb:sin>0</xsb:sin>
			<xsb:cos>-1</xsb:cos>
			<xsb:deg-to-rad>-0.05483113556160754788241383888820083964063166337355994792</xsb:deg-to-rad>
			<xsb:rad-to-deg>-180</xsb:rad-to-deg>
			<xsb:exp10>0.000721784159074727743612993983349810056457751540559222952</xsb:exp10>
			<xsb:tan>0</xsb:tan>
			<xsb:cot>-INF</xsb:cot>
			<xsb:atan>-1.26262725567891168344432208360569834350894767042438359697</xsb:atan>
			<xsb:atan2>-1.00388482185388721414842394491713228829210446059487057473</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test intern:skip="xsb:tan">
			<!-- -Pi/2 -->
			<value>-1.570796326794896619231321691639751442098584699687552910487</value>
			<xsb:pow intern:skip="AltovaXML_CE_2010.3sp1 AltovaXML_CE_2012.sp1 AltovaXML_CE_2012.2">0.336622536822419055662852396037963825078978448456553529606</xsb:pow>
			<xsb:exp>0.207879576350761908546955619834978770033877841631769608075</xsb:exp>
			<intern:exp>0.207879576350761908546955619834978770033877841631769608075</intern:exp>
			<intern:normalize-rad>-1.570796326794896619231321691639751442098584699687552910487</intern:normalize-rad>
			<xsb:sin>-1</xsb:sin>
			<xsb:cos>0</xsb:cos>
			<xsb:deg-to-rad>-0.0274155677808037739412069194441004198203158316867799739623</xsb:deg-to-rad>
			<xsb:rad-to-deg>-90</xsb:rad-to-deg>
			<intern:nroot>2</intern:nroot>
			<xsb:exp10>0.026866041001136132108405983359849317421437525218955605181</xsb:exp10>
			<xsb:tan>-INF</xsb:tan>
			<xsb:cot>0</xsb:cot>
			<xsb:atan>-1.00388482185388721414842394491713228829210446059487057473</xsb:atan>
			<xsb:atan2>-0.66577375002835386359051770851217520919426987562006640854</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
		<test>
			<!-- -1 -->
			<value>-1</value>
			<xsb:pow>0.5</xsb:pow>
			<xsb:exp>0.367879441171442321595523770161460867445811131031767834508</xsb:exp>
			<intern:exp>0.367879441171442321595523770161460867445811131031767834508</intern:exp>
			<intern:normalize-rad>-1</intern:normalize-rad>
			<xsb:sin>-0.841470984807896507</xsb:sin><!-- -0,8414709848078965066525023216303 -->
			<xsb:cos>0.54030230586813971740</xsb:cos><!-- 0.540302305868139717400936607442976603732310420617922227670 -->
			<xsb:deg-to-rad>-0.0174532925199433</xsb:deg-to-rad>
			<xsb:rad-to-deg>-57.295779513082320876798154814105170332405472466564321549</xsb:rad-to-deg>
			<xsb:exp10>0.1</xsb:exp10>
			<xsb:tan>-1.55740772465490223050697480745836017308725077238152003838</xsb:tan>
			<xsb:cot>-0.64209261593433070300641998659426562023027811391817137910</xsb:cot>
			<xsb:atan>-0.78539816339744830961566084581987572104929234984377645524</xsb:atan>
			<xsb:atan2>-0.46364760900080611621425623146121440202853705428612026381</xsb:atan2><!-- y-Wert, für x=2 -->
			<xsb:asin></xsb:asin>
			<xsb:acos></xsb:acos>
		</test>
	</intern:testliste>
	<!-- für Funktionen mit zwei Argumenten gibt es hier eine zweite Testliste -->
	<intern:testliste xml:id="MathTests2">
		<test>
			<!-- 0 (Null) -->
			<value>0</value>
			<xsb:pow>0</xsb:pow>
			<xsb:nroot>0</xsb:nroot>
			<intern:nroot>0</intern:nroot>
			<xsb:atan2>-1.57079632679489661923132169163975144209858469968755291049</xsb:atan2><!-- x-Wert, für y=-1 -->
		</test>
		<test>
			<!-- 1 -->
			<value>1</value>
			<xsb:pow>1</xsb:pow>
			<xsb:nroot>1</xsb:nroot>
			<intern:nroot>1</intern:nroot>
			<xsb:atan2>-0.78539816339744830961566084581987572104929234984377645524</xsb:atan2><!-- x-Wert, für y=-1 -->
		</test>
		<test>
			<!-- 2 -->
			<value>2</value>
			<xsb:pow>16</xsb:pow>
			<xsb:nroot>1.14869835499703500679862694677792758944385088909779750551</xsb:nroot>
			<intern:nroot>1.14869835499703500679862694677792758944385088909779750551</intern:nroot>
			<xsb:atan2>-0.46364760900080611621425623146121440202853705428612026381</xsb:atan2><!-- x-Wert, für y=-1 -->
		</test>
		<test>
			<!-- 3 -->
			<value>3</value>
			<xsb:pow>81</xsb:pow>
			<xsb:nroot>1.245730939615517325966680336640305080939309993068779811046</xsb:nroot>
			<intern:nroot>1.245730939615517325966680336640305080939309993068779811046</intern:nroot>
			<xsb:atan2>-0.32175055439664219340140461435866131902075529555765619143</xsb:atan2><!-- x-Wert, für y=-1 -->
		</test>
		<test>
			<!-- 10 -->
			<value>10</value>
			<xsb:pow>10000</xsb:pow>
			<xsb:nroot>1.584893192461113485202101373391507013269442133825039068316</xsb:nroot>
			<intern:nroot>1.584893192461113485202101373391507013269442133825039068316</intern:nroot>
			<xsb:atan2>-0.09966865249116202737844611987802059024327832250431464802</xsb:atan2><!-- x-Wert, für y=-1 -->
		</test>
		<test>
			<!-- 100 -->
			<value>100</value>
			<xsb:pow>100000000</xsb:pow>
			<xsb:nroot>2.511886431509580111085032067799327394158518100782475428679</xsb:nroot>
			<intern:nroot>2.511886431509580111085032067799327394158518100782475428679</intern:nroot>
			<xsb:atan2>-0.00999966668666523820634011620927954856136935254437663963</xsb:atan2><!-- x-Wert, für y=-1 -->
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
		<!-- erstmal schauen, ob grundlegende Arithmetik klappt -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xs:double(18446744073709551615 div 16)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xs:double(18446744073709551615 div 16)"/>
			<xsl:with-param name="reference-value" select="xs:double(1152921504606846975.9375)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xs:decimal(18446744073709551615 div 16)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xs:decimal(18446744073709551615 div 16)"/>
			<xsl:with-param name="reference-value" select="xs:decimal(1152921504606846975.9375)"/>
		</xsl:call-template>
		<xsl:choose>
			<xsl:when test="xsb:listed('AltovaXML_CE_2012.2', $_internals.testing.current-vendor-hash)">
				<xsl:call-template name="xsb:internals.testing.SkippedTests">
					<xsl:with-param name="caller">floor(xs:decimal(4294967295.999999999999) )</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">floor(xs:decimal(4294967295.999999999999) )</xsl:with-param>
					<xsl:with-param name="actual-value" select="floor(xs:decimal(4294967295.999999999999) )"/>
					<xsl:with-param name="reference-value" select="xs:decimal(4294967295)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="xsb:listed('AltovaXML_CE_2012.2', $_internals.testing.current-vendor-hash)">
				<xsl:call-template name="xsb:internals.testing.SkippedTests">
					<xsl:with-param name="caller">floor(xs:decimal(1152921504606846975.9375) )</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.test.Function">
					<xsl:with-param name="caller">floor(xs:decimal(1152921504606846975.9375) )</xsl:with-param>
					<xsl:with-param name="actual-value" select="floor(xs:decimal(1152921504606846975.9375) )"/>
					<xsl:with-param name="reference-value" select="xs:decimal(1152921504606846975)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<!-- damit es etwas übersichtlicher wird -->
		<xsl:variable name="seqMathTests" as="element()+" select="document( '' )//intern:testliste[@xml:id eq 'MathTests']/test"/>
		<xsl:variable name="seqMathTestsNull" as="element()+" select="document( '' )//intern:testliste[@xml:id eq 'MathTestsNull']/test"/>
		<xsl:variable name="seqMathTestsNeg" as="element()+" select="document( '' )//intern:testliste[@xml:id eq 'MathTestsNeg']/test"/>
		<xsl:variable name="seqMathTests2" as="element()+" select="document( '' )//intern:testliste[@xml:id eq 'MathTests2']/test"/>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fact     __________ -->
		<xsl:for-each select="$seqMathTestsNull, $seqMathTests">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:fact')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:fact', number(./value/text() ) )"/>
						<xsl:with-param name="level">DEBUG</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:fact</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:fact(./value/text())"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:pow     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:pow')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:pow', number(./value/text() ) )"/>
						<xsl:with-param name="level">DEBUG</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:pow</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:pow(2, xs:decimal(./value/text()))"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="$seqMathTests2">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:pow</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:pow(xs:decimal(./value/text() ), 4)"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     intern:normalize-rad     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:normalize-rad</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:normalize-rad(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:sin     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:sin</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:sin(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:cos     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:cos</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:cos(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:tan     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTests">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:tan')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:tan', number(./value/text() ) )"/>
						<xsl:with-param name="level">INFO</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:tan</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:tan(xs:decimal(./value/text() ) )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<!-- und noch ein paar Spezialwerte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:tan(xs:double(-0.0e0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:tan(xs:double(-0.0e0) )"/>
			<xsl:with-param name="reference-value" select="xs:double('-0.0e0')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:tan(xs:double(+0.0e0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:tan(xs:double(+0.0e0) )"/>
			<xsl:with-param name="reference-value" select="xs:double('+0.0e0')"/>
		</xsl:call-template>
		<!-- ToDo: xsb:tan(): das mathematisch korrekte Ergebnis -/+INF wird von XPath 3.0 nicht erwartet, deshalb Wiederevorlage, wenn Standard verabschiedet (Stf, 2011-06-26) -->
		<!--<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:tan(xs:double(- intern:half-pi() ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:tan(xs:double(- intern:half-pi() ) )"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:tan(xs:double(intern:half-pi() ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:tan(xs:double(intern:half-pi() ) )"/>
			<xsl:with-param name="reference-value" select="xs:double('INF')"/>
		</xsl:call-template>-->
		<!--  -->
		<!--  -->
		<!-- __________     xsb:cot     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTests">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:cot')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:cot', number(./value/text() ) )"/>
						<xsl:with-param name="level">INFO</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:cot</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:cot(xs:decimal(./value/text() ) )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<!-- und noch ein paar Spezialwerte -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:cot(xs:double(-0.0e0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:cot(xs:double(-0.0e0) )"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:cot(xs:double(0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:cot(xs:double(0) )"/>
			<xsl:with-param name="reference-value" select="xs:double('INF')"/>
		</xsl:call-template>
		<!-- ToDo: entsprechend dem Verhalten von xsb:tan() liefert xsb:cot() nicht -/+INF, sondern "sehr große"/"sehr kleine" Zahlen, Wiedervorlage (Stf, 2011-06-26)-->
		<!--<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:cot(xs:double(- xsb:pi() ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:cot(xs:double(- xsb:pi() ) )"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:cot(xs:double(xsb:pi() ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:cot(xs:double(xsb:pi() ) )"/>
			<xsl:with-param name="reference-value" select="xs:double('INF')"/>
		</xsl:call-template>-->
		<!--  -->
		<!--  -->
		<!-- __________     xsb:deg-to-rad     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:deg-to-rad</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:deg-to-rad(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:rad-to-deg     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:rad-to-deg</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:rad-to-deg(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:sqrt     __________ -->
		<xsl:for-each select="$seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:sqrt</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:sqrt(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     intern:sqrt     __________ -->
		<xsl:for-each select="$seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:sqrt</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:sqrt(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:nroot()     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:nroot')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:nroot{Test1}, arg', number(./value/text() ) )"/>
						<xsl:with-param name="level">DEBUG</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:nroot</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:nroot(xs:decimal(2), xs:integer(./value/text() ) )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="$seqMathTests2">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:nroot')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:nroot{Test2}', number(./value/text() ) )"/>
						<xsl:with-param name="level">INFO</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:nroot</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:nroot(xs:decimal(xs:decimal(./value/text() ) ), 5)"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:log     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:log')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:log', number(./value/text() ) )"/>
						<xsl:with-param name="level">INFO</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:log</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:log(xs:decimal(./value/text() ) )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:log(xs:double(0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:log(xs:double(0) )"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:log10     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:log10')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:log10', number(./value/text() ) )"/>
						<xsl:with-param name="level">INFO</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:log10</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:log10(xs:decimal(./value/text()))"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:log10(xs:double(0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:log10(xs:double(0) )"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fibonacci     __________ -->
		<xsl:for-each select="$seqMathTestsNull, $seqMathTests[not(xsb:listed(@intern:skip, 'xsb:fibonacci') )]">
			<xsl:choose>
				<xsl:when test="xsb:listed(@intern:skip, 'xsb:fibonacci')">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller" select="intern:format-INF-caller('xsb:fibonacci', number(./value/text() ) )"/>
						<xsl:with-param name="level">DEBUG</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult">
						<xsl:with-param name="test-node" select="."/>
						<xsl:with-param name="function-name">xsb:fibonacci</xsl:with-param>
						<xsl:with-param name="actual-value" select="xsb:fibonacci(./value/text())"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:fibonacci-sequence     __________ -->
		<!--<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:fibonacci-sequence(-1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:fibonacci-sequence(-1)"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer+"/>
			</xsl:call-template>-->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:fibonacci-sequence(0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:fibonacci-sequence(0)"/>
			<xsl:with-param name="reference-value" select="0" as="xs:integer+"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:fibonacci-sequence(1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:fibonacci-sequence(1)"/>
			<xsl:with-param name="reference-value" select="0, 1" as="xs:integer+"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:fibonacci-sequence(2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:fibonacci-sequence(2)"/>
			<xsl:with-param name="reference-value" select="0, 1, 1" as="xs:integer+"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:fibonacci-sequence(10)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:fibonacci-sequence(10)"/>
			<xsl:with-param name="reference-value" select="0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55" as="xs:integer+"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:exp     __________ -->
		<!--<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.irounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:exp</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:exp(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>-->
		<!--  -->
		<!--  -->
		<!-- __________     xsb:exp     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:exp</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:exp(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     intern:log-m-iterator     __________ -->
		<xsl:for-each select="$seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:log-m-iterator</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:log-m-iterator(./value/text(), 0)"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:exp10     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:exp10</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:exp10(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:atan     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:atan</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:atan(xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!-- und ein paar Spezialwerte, siehe http://www.w3.org/TR/xpath-functions-30/#func-math-atan -->
		<!-- 3 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan(xs:double(-0.0e0))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan(xs:double(-0.0e0))"/>
			<xsl:with-param name="reference-value" select="xs:double(-0.0e0)"/>
		</xsl:call-template>
		<!-- 6 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!-- 7 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:double(1.570796326794896619231321691639751442098584699687552910487) )"/>
		</xsl:call-template>
		<!-- 8 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan(xs:double('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan(xs:double('-INF'))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:double(- 1.570796326794896619231321691639751442098584699687552910487) )"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:atan2     __________ -->
		<xsl:for-each select="$seqMathTestsNeg, $seqMathTestsNull, $seqMathTests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:atan2</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:atan2(xs:decimal(./value/text() ), xs:decimal(2) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="$seqMathTests2">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.NumericResult.rounded">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:atan2</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:atan2(xs:decimal(-1), xs:decimal(./value/text() ) )"/>
			</xsl:call-template>
		</xsl:for-each>
		<!-- und ein paar Spezialwerte, siehe http://www.w3.org/TR/xpath-functions-30/#func-math-atan2 -->
		<!-- 1 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(+0.0e0, +0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(+0.0e0, +0.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:double(+0.0e0)"/>
		</xsl:call-template>
		<!-- 2 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(-0.0e0, +0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(-0.0e0, +0.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:double(-0.0e0)"/>
		</xsl:call-template>
		<!-- 3 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(number(+0.0e0), number(-0.0e0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(number(+0.0e0), number(-0.0e0) )"/>
			<xsl:with-param name="reference-value" select="xs:double(intern:round(xsb:pi() ) )"/>
		</xsl:call-template>
		<!-- 4 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(-0.0e0, -0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(-0.0e0, -0.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:double(- intern:round(xsb:pi() ) )"/>
		</xsl:call-template>
		<!-- 5 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(xs:decimal(-1), +0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(xs:decimal(-1), +0.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:decimal(- intern:round(xsb:pi() div 2) )"/>
		</xsl:call-template>
		<!-- 6 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(xs:double(+1), +0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(xs:double(+1), +0.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:double(intern:round(xsb:pi() div 2) )"/>
		</xsl:call-template>
		<!-- 7 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(-0.0e0, -1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(-0.0e0, -1)"/>
			<xsl:with-param name="reference-value" select="- intern:round(xsb:pi() )"/>
		</xsl:call-template>
		<!-- 8 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(+0.0e0, -1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(+0.0e0, -1)"/>
			<xsl:with-param name="reference-value" select="intern:round(xsb:pi() )"/>
		</xsl:call-template>
		<!-- 9 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(-0.0e0, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(-0.0e0, 1)"/>
			<xsl:with-param name="reference-value" select="xs:double(-0.0e0)"/>
		</xsl:call-template>
		<!-- 10 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(+0.0e0, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(+0.0e0, 1)"/>
			<xsl:with-param name="reference-value" select="xs:double(+0.0e0)"/>
		</xsl:call-template>
		<!-- 5' -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(-0.5, +0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(-0.5, +0.0e0)"/>
			<xsl:with-param name="reference-value" select="- intern:round(xsb:pi() div 2)"/>
		</xsl:call-template>
		<!-- 6' -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(+0.5, +0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(+0.5, +0.0e0)"/>
			<xsl:with-param name="reference-value" select="intern:round(xsb:pi() div 2)"/>
		</xsl:call-template>
		<!-- 7' -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(-0.0e0, -0.5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(-0.0e0, -0.5)"/>
			<xsl:with-param name="reference-value" select="- intern:round(xsb:pi() )"/>
		</xsl:call-template>
		<!-- 8' -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(+0.0e0, -0.5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(+0.0e0, -0.5)"/>
			<xsl:with-param name="reference-value" select="intern:round(xsb:pi() )"/>
		</xsl:call-template>
		<!-- 9' -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(-0.0e0, 0.5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(-0.0e0, 0.5)"/>
			<xsl:with-param name="reference-value" select="-0.0e0"/>
		</xsl:call-template>
		<!-- 10' -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(+0.0e0, 0.5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(+0.0e0, 0.5)"/>
			<xsl:with-param name="reference-value" select="+0.0e0"/>
		</xsl:call-template>
		<!-- ohne im Standard erwähnt zu werden -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(xs:double('NaN'), 0.5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(xs:double('NaN'), 0.5)"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:atan2(+0.0e0, xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:atan2(+0.0e0, xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:sgn()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:sgn(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:sgn(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:sgn(xs:double('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:sgn(xs:double('-INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double(-1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:sgn(xs:integer(-10))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:sgn(xs:integer(-10))"/>
			<xsl:with-param name="reference-value" select="xs:integer(-1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:sgn(xs:double('-0.0e0'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:sgn(xs:double('-0.0e0'))"/>
			<xsl:with-param name="reference-value" select="xs:double(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:sgn(xs:double('+0.0e0'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:sgn(xs:double('+0.0e0'))"/>
			<xsl:with-param name="reference-value" select="xs:double(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:sgn(xs:integer(0))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:sgn(xs:integer(0))"/>
			<xsl:with-param name="reference-value" select="xs:integer(0)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:sgn(xs:double(10))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:sgn(xs:double(10))"/>
			<xsl:with-param name="reference-value" select="xs:double(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:sgn(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:sgn(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double(1)"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:sgn()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:sgn(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:sgn(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:sgn(xs:double('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:sgn(xs:double('-INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double(-1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:sgn(xs:decimal(-10))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:sgn(xs:decimal(-10))"/>
			<xsl:with-param name="reference-value" select="xs:decimal(-1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:sgn(xs:double('-0.0e0'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:sgn(xs:double('-0.0e0'))"/>
			<xsl:with-param name="reference-value" select="xs:double(-1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:sgn(xs:double('+0.0e0'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:sgn(xs:double('+0.0e0'))"/>
			<xsl:with-param name="reference-value" select="xs:double(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:sgn(xs:float(0))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:sgn(xs:float(0))"/>
			<xsl:with-param name="reference-value" select="xs:float(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:sgn(xs:integer(10))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:sgn(xs:integer(10))"/>
			<xsl:with-param name="reference-value" select="xs:integer(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:sgn(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:sgn(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double(1)"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-NaN()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-NaN(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-NaN(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-NaN(xs:float('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-NaN(xs:float('NaN'))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-NaN(xs:float('3'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-NaN(xs:float('3'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-NaN(xs:float('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-NaN(xs:float('INF'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-NaN(xs:float('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-NaN(xs:float('-INF'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-INF()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-INF(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-INF(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-INF(xs:float('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-INF(xs:float('INF'))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-INF(xs:float('3'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-INF(xs:float('3'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-INF(xs:float('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-INF(xs:float('NaN'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-negative-INF()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-INF(xs:double('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-INF(xs:double('-INF'))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-INF(xs:float('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-INF(xs:float('-INF'))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-INF(xs:float('3'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-INF(xs:float('3'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-INF(xs:float('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-INF(xs:float('NaN'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-negative-0()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-0(xs:double('-0.0e0'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-0(xs:double('-0.0e0'))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-0(xs:float('-0.0e0'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-0(xs:float('-0.0e0'))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-0(xs:decimal(xs:float('-0.0e0')))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-0(xs:decimal(xs:float('-0.0e0')))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-0(xs:float('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-0(xs:float('-INF'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-0(xs:float('3'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-0(xs:float('3'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-negative-0(xs:float('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-negative-0(xs:float('NaN'))"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:cast-negative-INF     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-INF(xs:double('-1'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-INF(xs:double('-1'))"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-INF(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-INF(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-INF(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-INF(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-INF(xs:float('11'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-INF(xs:float('11'))"/>
			<xsl:with-param name="reference-value" select="xs:float('-INF')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:cast-INF     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-INF(xs:double('-1'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-INF(xs:double('-1'))"/>
			<xsl:with-param name="reference-value" select="xs:double('INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-INF(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-INF(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double('INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-INF(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-INF(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-INF(xs:float('11'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-INF(xs:float('11'))"/>
			<xsl:with-param name="reference-value" select="xs:float('INF')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:cast-NaN     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-NaN(xs:double('-1'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-NaN(xs:double('-1'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-NaN(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-NaN(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-NaN(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-NaN(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-NaN(xs:float('11'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-NaN(xs:float('11'))"/>
			<xsl:with-param name="reference-value" select="xs:float('NaN')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:cast-negative-0     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-0(xs:double('-1'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-0(xs:double('-1'))"/>
			<xsl:with-param name="reference-value" select="xs:double('-0.0e0')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-0(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-0(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double('-0.0e0')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-0(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-0(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('-0.0e0')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-0(xs:float('11'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-0(xs:float('11'))"/>
			<xsl:with-param name="reference-value" select="xs:float('-0.0e0')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:cast-negative-0(xs:decimal('11'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:cast-negative-0(xs:decimal('11'))"/>
			<xsl:with-param name="reference-value" select="xs:decimal(0)"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:asin     __________ -->
		<!-- da sinnvolle Werte für asin()-Argumente nur zwischen -1 und 1 liegen, wird hier nicht mit den Testlisten gearbeitet -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(xs:decimal(0.5))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(xs:decimal(0.5))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(0.523598775598298873077107230546583814032861566562517636829))"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(xs:decimal(-0.2))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(xs:decimal(-0.2))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(-0.20135792079033079145512555221762341024003808140222838626))"/>
		</xsl:call-template>
		<!-- 2 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(0.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:double(0.0e0)"/>
		</xsl:call-template>
		<!-- 4 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(xs:decimal(1))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(xs:decimal(1))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(1.570796326794896619231321691639751442098584699687552910487))"/>
		</xsl:call-template>
		<!-- 5 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(xs:decimal(-1))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(xs:decimal(-1))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(-1.570796326794896619231321691639751442098584699687552910487))"/>
		</xsl:call-template>
		<!-- und ein paar Spezialwerte, siehe http://www.w3.org/TR/xpath-functions-30/#func-math-asin -->
		<!-- 3 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(-0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(-0.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:double(-0.0e0)"/>
		</xsl:call-template>
		<!-- 6 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(2.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(2.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!-- 7 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!-- 8 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!-- 9 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:asin(xs:double('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:asin(xs:double('-INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:acos     __________ -->
		<!-- da sinnvolle Werte für acos()-Argumente nur zwischen -1 und 1 liegen, wird hier nicht mit den Testlisten gearbeitet -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(xs:decimal(-0.5))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(xs:decimal(-0.5))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(2.094395102393195492308428922186335256131446266250070547317))"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(xs:decimal(0.2))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(xs:decimal(0.2))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(1.369438406004565827776196139422128031858546618285324524230))"/>
		</xsl:call-template>
		<!-- 4 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(xs:decimal(1))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(xs:decimal(1))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(0))"/>
		</xsl:call-template>
		<!-- 5 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(xs:decimal(-1))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(xs:decimal(-1))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(3.14159265358979323846264338327950288419716939937511))"/>
		</xsl:call-template>
		<!-- und ein paar Spezialwerte, siehe http://www.w3.org/TR/xpath-functions-30/#func-math-acos -->
		<!-- 3 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(-0.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(-0.0e0)"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:double(-1.570796326794896619231321691639751442098584699687552910487))"/>
		</xsl:call-template>
		<!-- 6 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(2.0e0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(2.0e0)"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!-- 7 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(xs:double('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(xs:double('NaN'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!-- 8 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(xs:double('INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(xs:double('INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!-- 9 -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:acos(xs:double('-INF'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:acos(xs:double('-INF'))"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<!-- intern:round() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:round(xs:double(-0.5) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:round(xs:double(-0.5) )"/>
			<xsl:with-param name="reference-value" select="xs:double(-0.5)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:round(xs:double('NaN') )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:round(xs:double('NaN') )"/>
			<xsl:with-param name="reference-value" select="xs:double('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:round(xs:double('INF') )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:round(xs:double('INF') )"/>
			<xsl:with-param name="reference-value" select="xs:double('INF')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:round(xs:double('-INF') )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:round(xs:double('-INF') )"/>
			<xsl:with-param name="reference-value" select="xs:double('-INF')"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:is-in-range()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range((), 0, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range((), 0, 1)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range('0', 0, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range('0', 0, 1)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range('xslt', 0, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range('xslt', 0, 1)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range(xs:double('NaN'), 0, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range(xs:double('NaN'), 0, 1)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range(0, 1, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range(0, 1, 1)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range(0.5, 0, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range(0.5, 0, 1)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range(0, 1.5, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range(0, 1.5, 1)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range(0.5, 1, 0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range(0.5, 1, 0)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     Statistik-Funktionen arbeiten über Sequenzen     __________ -->
		<xsl:variable name="seq1" as="xs:double+" select="xs:double(0), xs:double(1), xs:double(2)"/>
		<xsl:variable name="seq2" as="xs:decimal+" select="xs:decimal(1.21), xs:decimal(3.4), xs:decimal(2), xs:decimal(4.66), xs:decimal(1.5), xs:decimal(5.61), xs:decimal(7.22)"/>
		<xsl:variable name="seq3" as="xs:decimal+" select="xs:decimal(4), xs:decimal(7), xs:decimal(13), xs:decimal(16)"/>
		<xsl:variable name="seq4" as="xs:decimal+" select="xs:decimal(1000000000000004), xs:decimal(1000000000000007), xs:decimal(1000000000000013), xs:decimal(1000000000000016)"/>
		<!--  -->
		<!--  -->
		<!-- __________     intern:variance     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:variance(number('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:variance(number('NaN'))"/>
			<xsl:with-param name="reference-value" select="number('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:variance($seq1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:variance($seq1)"/>
			<xsl:with-param name="reference-value" select="xs:double(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:round(intern:variance($seq2))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:round(intern:variance($seq2))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(5.161223809523809523809523809523809524))"/><!-- dieser Wert ist das Ergebnis der Berechnung mit Saxon mangels Vefügbarkeit geeignet genauer Referenzwerte -->
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:variance($seq3)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:variance($seq3)"/>
			<xsl:with-param name="reference-value" select="xs:decimal(30)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:variance($seq4)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:variance($seq4)"/>
			<xsl:with-param name="reference-value" select="xs:decimal(30)"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:variance     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:variance(number('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:variance(number('NaN'))"/>
			<xsl:with-param name="reference-value" select="number('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:variance($seq1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:variance($seq1)"/>
			<xsl:with-param name="reference-value" select="xs:double(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:variance($seq2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:variance($seq2)"/>
			<xsl:with-param name="reference-value" select="xs:decimal(5.1612238095238095)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:variance($seq3)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:variance($seq3)"/>
			<xsl:with-param name="reference-value" select="xs:decimal(30)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:variance($seq4)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:variance($seq4)"/>
			<xsl:with-param name="reference-value" select="xs:decimal(30)"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:standard-deviation()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:standard-deviation(number('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:standard-deviation(number('NaN'))"/>
			<xsl:with-param name="reference-value" select="number('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:standard-deviation($seq1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:standard-deviation($seq1)"/>
			<xsl:with-param name="reference-value" select="xs:double(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:round(intern:standard-deviation($seq2))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:round(intern:standard-deviation($seq2))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(2.271832698400964895269931307742138708755))"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:round(intern:standard-deviation($seq3))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:round(intern:standard-deviation($seq3))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(5.47722557505166113457))"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:round(intern:standard-deviation($seq4))</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:round(intern:standard-deviation($seq4))"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(5.47722557505166113457))"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:standard-deviation()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:standard-deviation(number('NaN'))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:standard-deviation(number('NaN'))"/>
			<xsl:with-param name="reference-value" select="number('NaN')"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:standard-deviation($seq1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:standard-deviation($seq1)"/>
			<xsl:with-param name="reference-value" select="xs:double(1)"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:standard-deviation($seq2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:standard-deviation($seq2)"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(2.271832698400964895269931307742138708755) )"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:standard-deviation($seq3)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:standard-deviation($seq3)"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(5.47722557505166113457) )"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:standard-deviation($seq4)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:standard-deviation($seq4)"/>
			<xsl:with-param name="reference-value" select="intern:round(xs:decimal(5.47722557505166113457) )"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:linear-congruential-generator()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:linear-congruential-generator(1, 0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:linear-congruential-generator(1, 0)"/>
			<xsl:with-param name="reference-value" select="12345"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:linear-congruential-generator(5, 0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:linear-congruential-generator(5, 0)"/>
			<xsl:with-param name="reference-value" select="12345, 3554416254, 2802067423, 3596950572, 229283573"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">intern:linear-congruential-generator(3, (12345, 3554416254) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="intern:linear-congruential-generator(3, (12345, 3554416254) )"/>
			<xsl:with-param name="reference-value" select="3554416254, 2802067423, 3596950572, 229283573"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     Zufallswerte können nicht normal getestet werden     __________ -->
		<!--  -->
		<!--  -->
		<!-- __________     intern:random-seed()     __________ -->
		<xsl:variable name="random-value-1" as="xs:integer" select="intern:random-seed(1)"/>
		<xsl:variable name="random-value-2" as="xs:integer" select="intern:random-seed(2)"/>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">$random-value-1 ne 0</xsl:with-param>
			<xsl:with-param name="actual-value" select="$random-value-1 ne 0"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">$random-value-2 ne 0</xsl:with-param>
			<xsl:with-param name="actual-value" select="$random-value-2 ne 0"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">$random-value-1 ne 1</xsl:with-param>
			<xsl:with-param name="actual-value" select="$random-value-1 ne 1"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">$random-value-2 ne 1</xsl:with-param>
			<xsl:with-param name="actual-value" select="$random-value-2 ne 1"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">$random-value-1 ne $random-value-2</xsl:with-param>
			<xsl:with-param name="actual-value" select="$random-value-1 ne $random-value-2"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     intern:random-sequence()     __________ -->
		<!-- Länge der Zufalls-Sequencen -->
		<xsl:variable name="laenge" as="xs:integer" select="1000"/>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">Länge der Zufalls-Sequenzen: <xsl:value-of select="$laenge"/></xsl:with-param>
		</xsl:call-template>
		<!-- Breite oberer und unterer Bereiche TODO: mathematisch/statistisch "richtigen" Wert finden -->
		<!-- (hinter der aktuellen Formel steckt keine Logik, nur durch Probieren entstanden) -->
		<xsl:variable name="breite" as="xs:double" select="$intern:random-max div intern:nroot($laenge, 3) * 0.25"/>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">Intervall (Breite) und min-Grenze: <xsl:value-of select="$breite"/>/normalisiert <xsl:value-of select="$breite div $intern:random-max"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">max-Grenze: <xsl:value-of select="$intern:random-max - $breite"/>/normalisiert <xsl:value-of select="($intern:random-max - $breite) div $intern:random-max"/></xsl:with-param>
		</xsl:call-template>
		<!-- Durchschnitt kalkulatorisch -->
		<xsl:variable name="kalkulatorischer_durchschnitt" as="xs:double" select="$intern:random-max div 2"/>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">Durchschnitt (Erwartungswert): <xsl:value-of select="$kalkulatorischer_durchschnitt"/>/normalisiert <xsl:value-of select="$kalkulatorischer_durchschnitt div $intern:random-max"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">min-max-Durchschnitt: <xsl:value-of select="$kalkulatorischer_durchschnitt - 2 * $breite"/> - <xsl:value-of select="$kalkulatorischer_durchschnitt + 2 * $breite"/>/normalisiert <xsl:value-of select="($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max"/> - <xsl:value-of select="($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max"/></xsl:with-param>
		</xsl:call-template>
		<!-- Standardabweichung kalkulatorisch, siehe http://www.matheboard.de/archive/197833/thread.html -->
		<xsl:variable name="kalkulatorische_standardabweichung" as="xs:double" select="intern:sqrt($intern:random-max * $intern:random-max div 12)"/>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">Standardabweichung (Erwartungswert): <xsl:value-of select="$kalkulatorische_standardabweichung"/>/normalisiert <xsl:value-of select="$kalkulatorische_standardabweichung div $intern:random-max"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">min-max-Standardabweichung: <xsl:value-of select="$kalkulatorische_standardabweichung - $breite"/> - <xsl:value-of select="$kalkulatorische_standardabweichung + $breite"/>/normalisiert <xsl:value-of select="($kalkulatorische_standardabweichung - $breite) div $intern:random-max"/> - <xsl:value-of select="($kalkulatorische_standardabweichung + $breite) div $intern:random-max"/></xsl:with-param>
		</xsl:call-template>
		<!-- Ermittlung der Test-Werte -->
		<xsl:variable name="random-sequence-1" as="xs:integer+" select="intern:random-sequence($laenge, 1)"/>
		<xsl:variable name="random-sequence-1-min" as="xs:integer" select="min($random-sequence-1)"/>
		<xsl:variable name="random-sequence-1-max" as="xs:integer" select="max($random-sequence-1)"/>
		<xsl:variable name="random-sequence-1-avg" as="xs:decimal" select="avg($random-sequence-1)"/>
		<xsl:variable name="random-sequence-1-stddev" as="xs:decimal" select="xsb:standard-deviation($random-sequence-1)"/>
		<xsl:variable name="random-sequence-2" as="xs:integer+" select="intern:random-sequence($laenge, 2)"/>
		<xsl:variable name="random-sequence-2-min" as="xs:integer" select="min($random-sequence-2)"/>
		<xsl:variable name="random-sequence-2-max" as="xs:integer" select="max($random-sequence-2)"/>
		<xsl:variable name="random-sequence-2-avg" as="xs:decimal" select="avg($random-sequence-2)"/>
		<xsl:variable name="random-sequence-2-stddev" as="xs:decimal" select="xsb:standard-deviation($random-sequence-2)"/>
		<!--  -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">deep-equal($random-sequence-1, $random-sequence-2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="deep-equal($random-sequence-1, $random-sequence-2)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">count(distinct-values($random-sequence-1)) eq $laenge</xsl:with-param>
			<!-- in seltenen Fällen geht das schief, dann sollte bei einem erneuten Testdurchlauf aber Ruhe sein -->
			<xsl:with-param name="actual-value" select="count(distinct-values($random-sequence-1)) eq $laenge"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">count(distinct-values($random-sequence-2)) eq $laenge</xsl:with-param>
			<!-- in seltenen Fällen geht das schief, dann sollte bei einem erneuten Testdurchlauf aber Ruhe sein -->
			<xsl:with-param name="actual-value" select="count(distinct-values($random-sequence-2)) eq $laenge"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequence-1-min, 0, $breite)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequence-1-min, 0, $breite)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequence-2-min, 0, $breite)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequence-2-min, 0, $breite)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequence-1-max, ($intern:random-max - $breite), $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequence-1-max, ($intern:random-max - $breite), $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequence-2-max, ($intern:random-max - $breite), $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequence-2-max, ($intern:random-max - $breite), $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-sequence-1-avg: <xsl:value-of select="$random-sequence-1-avg"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequence-1-avg, ($kalkulatorischer_durchschnitt - 2 * $breite), ($kalkulatorischer_durchschnitt + 2 * $breite))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequence-1-avg, ($kalkulatorischer_durchschnitt - 2 * $breite), ($kalkulatorischer_durchschnitt + 2 * $breite))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-sequence-2-avg: <xsl:value-of select="$random-sequence-2-avg"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequence-2-avg, ($kalkulatorischer_durchschnitt - 2 * $breite), ($kalkulatorischer_durchschnitt + 2 * $breite))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequence-2-avg, ($kalkulatorischer_durchschnitt - 2 * $breite), ($kalkulatorischer_durchschnitt + 2 * $breite))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-sequence-1-stddev: <xsl:value-of select="$random-sequence-1-stddev"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequence-1-stddev, ($kalkulatorische_standardabweichung - $breite), ($kalkulatorische_standardabweichung + $breite))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequence-1-stddev, ($kalkulatorische_standardabweichung - $breite), ($kalkulatorische_standardabweichung + $breite))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-sequence-2-stddev: <xsl:value-of select="$random-sequence-2-stddev"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequence-2-stddev, ($kalkulatorische_standardabweichung - $breite), ($kalkulatorische_standardabweichung + $breite))</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequence-2-stddev, ($kalkulatorische_standardabweichung - $breite), ($kalkulatorische_standardabweichung + $breite))"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:random()     __________ -->
		<xsl:variable name="laenge" as="xs:integer" select="1000"/>
		<xsl:variable name="random-seq-1" as="xs:decimal+" select="for $i in 1 to $laenge return xsb:random($i)"/>
		<xsl:variable name="random-seq-1-min" as="xs:decimal" select="min($random-seq-1)"/>
		<xsl:variable name="random-seq-1-max" as="xs:decimal" select="max($random-seq-1)"/>
		<xsl:variable name="random-seq-1-avg" as="xs:decimal" select="avg($random-seq-1)"/>
		<xsl:variable name="random-seq-1-stddev" as="xs:decimal" select="xsb:standard-deviation($random-seq-1)"/>
		<xsl:variable name="random-seq-2" as="xs:decimal+" select="for $i in 1 to $laenge return xsb:random($i*2)"/><!-- Saxon EE optimiert hier zu $random-seq-1, deshalb Faktor 2-->
		<xsl:variable name="random-seq-2-min" as="xs:decimal" select="min($random-seq-2)"/>
		<xsl:variable name="random-seq-2-max" as="xs:decimal" select="max($random-seq-2)"/>
		<xsl:variable name="random-seq-2-avg" as="xs:decimal" select="avg($random-seq-2)"/>
		<xsl:variable name="random-seq-2-stddev" as="xs:decimal" select="xsb:standard-deviation($random-seq-2)"/>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">deep-equal($random-seq-1, $random-seq-2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="deep-equal($random-seq-1, $random-seq-2)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">count(distinct-values($random-seq-1)) eq $laenge</xsl:with-param>
			<!-- in seltenen Fällen geht das schief, dann sollte bei einem erneuten Testdurchlauf aber Ruhe sein -->
			<xsl:with-param name="actual-value" select="count(distinct-values($random-seq-1)) eq $laenge"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">count(distinct-values($random-seq-2)) eq $laenge</xsl:with-param>
			<!-- in seltenen Fällen geht das schief, dann sollte bei einem erneuten Testdurchlauf aber Ruhe sein -->
			<xsl:with-param name="actual-value" select="count(distinct-values($random-seq-2)) eq $laenge"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-seq-1-min, 0, $breite div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-seq-1-min, 0, $breite div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-seq-2-min, 0, $breite div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-seq-2-min, 0, $breite div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-seq-1-max, ($intern:random-max - $breite) div $intern:random-max, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-seq-1-max, ($intern:random-max - $breite) div $intern:random-max, 1)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-seq-2-max, ($intern:random-max - $breite) div $intern:random-max, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-seq-2-max, ($intern:random-max - $breite) div $intern:random-max, 1)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-seq-1-avg: <xsl:value-of select="$random-seq-1-avg"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-seq-1-avg, ($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max, ($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-seq-1-avg, ($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max, ($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-seq-2-avg: <xsl:value-of select="$random-seq-2-avg"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-seq-2-avg, ($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max, ($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-seq-2-avg, ($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max, ($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-seq-1-stddev: <xsl:value-of select="$random-seq-1-stddev"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-seq-1-stddev, ($kalkulatorische_standardabweichung - $breite) div $intern:random-max, ($kalkulatorische_standardabweichung + $breite) div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-seq-1-stddev, ($kalkulatorische_standardabweichung - $breite) div $intern:random-max, ($kalkulatorische_standardabweichung + $breite) div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-seq-2-stddev: <xsl:value-of select="$random-seq-2-stddev"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-seq-2-stddev, ($kalkulatorische_standardabweichung - $breite) div $intern:random-max, ($kalkulatorische_standardabweichung + $breite) div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-seq-2-stddev, ($kalkulatorische_standardabweichung - $breite) div $intern:random-max, ($kalkulatorische_standardabweichung + $breite) div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:random-sequence()     __________ -->
		<xsl:variable name="laenge" as="xs:integer" select="1000"/>
		<xsl:variable name="random-sequenz-1" as="xs:decimal+" select="xsb:random-sequence($laenge, 123456789)"/>
		<xsl:variable name="random-sequenz-1-min" as="xs:decimal" select="min($random-sequenz-1)"/>
		<xsl:variable name="random-sequenz-1-max" as="xs:decimal" select="max($random-sequenz-1)"/>
		<xsl:variable name="random-sequenz-1-avg" as="xs:decimal" select="avg($random-sequenz-1)"/>
		<xsl:variable name="random-sequenz-1-stddev" as="xs:decimal" select="xsb:standard-deviation($random-sequenz-1)"/>
		<xsl:variable name="random-sequenz-2" as="xs:decimal+" select="xsb:random-sequence($laenge, 'Mitternacht')"/>
		<xsl:variable name="random-sequenz-2-min" as="xs:decimal" select="min($random-sequenz-2)"/>
		<xsl:variable name="random-sequenz-2-max" as="xs:decimal" select="max($random-sequenz-2)"/>
		<xsl:variable name="random-sequenz-2-avg" as="xs:decimal" select="avg($random-sequenz-2)"/>
		<xsl:variable name="random-sequenz-2-stddev" as="xs:decimal" select="xsb:standard-deviation($random-sequenz-2)"/>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">deep-equal($random-sequenz-1, $random-sequenz-2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="deep-equal($random-sequenz-1, $random-sequenz-2)"/>
			<xsl:with-param name="reference-value" select="false()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">count(distinct-values($random-sequenz-1)) eq $laenge</xsl:with-param>
			<!-- in seltenen Fällen geht das schief, dann sollte bei einem erneuten Testdurchlauf aber Ruhe sein -->
			<xsl:with-param name="actual-value" select="count(distinct-values($random-sequenz-1)) eq $laenge"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">count(distinct-values($random-sequenz-2)) eq $laenge</xsl:with-param>
			<!-- in seltenen Fällen geht das schief, dann sollte bei einem erneuten Testdurchlauf aber Ruhe sein -->
			<xsl:with-param name="actual-value" select="count(distinct-values($random-sequenz-2)) eq $laenge"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequenz-1-min, 0, $breite div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequenz-1-min, 0, $breite div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequenz-2-min, 0, $breite div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequenz-2-min, 0, $breite div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequenz-1-max, ($intern:random-max - $breite) div $intern:random-max, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequenz-1-max, ($intern:random-max - $breite) div $intern:random-max, 1)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequenz-2-max, ($intern:random-max - $breite) div $intern:random-max, 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequenz-2-max, ($intern:random-max - $breite) div $intern:random-max, 1)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequenz-1-avg, ($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max, ($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequenz-1-avg, ($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max, ($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequenz-2-avg, ($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max, ($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequenz-2-avg, ($kalkulatorischer_durchschnitt - 2 * $breite) div $intern:random-max, ($kalkulatorischer_durchschnitt + 2 * $breite) div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-sequenz-1-stddev: <xsl:value-of select="$random-sequenz-1-stddev"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequenz-1-stddev, ($kalkulatorische_standardabweichung - $breite) div $intern:random-max, ($kalkulatorische_standardabweichung + $breite) div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequenz-1-stddev, ($kalkulatorische_standardabweichung - $breite) div $intern:random-max, ($kalkulatorische_standardabweichung + $breite) div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.level">TRACE</xsl:with-param>
			<xsl:with-param name="log-entry.text">$random-sequenz-2-stddev: <xsl:value-of select="$random-sequenz-2-stddev"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:is-in-range($random-sequenz-2-stddev, ($kalkulatorische_standardabweichung - $breite) div $intern:random-max, ($kalkulatorische_standardabweichung + $breite) div $intern:random-max)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:is-in-range($random-sequenz-2-stddev, ($kalkulatorische_standardabweichung - $breite) div $intern:random-max, ($kalkulatorische_standardabweichung + $breite) div $intern:random-max)"/>
			<xsl:with-param name="reference-value" select="true()"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     und noch ein paar Tests zur Stabilität der Typung     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:pow(xs:integer(3), xs:integer(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:pow(xs:integer(3), xs:integer(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:integer' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:pow(xs:integer(3), xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:pow(xs:integer(3), xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:integer' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:pow(xs:decimal(3), xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:pow(xs:decimal(3), xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:pow(xs:double(3), xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:pow(xs:double(3), xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:log(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:log(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:log(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:log(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:log(xs:float(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:log(xs:float(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:float' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:root-iterator(xs:integer(2), xs:decimal(4), 0, xs:decimal(4), 0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:root-iterator(xs:integer(2), xs:decimal(4), 0, xs:decimal(4), 0) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:root-iterator(xs:integer(2), xs:double(4), 0, xs:double(4), 0) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:root-iterator(xs:integer(2), xs:double(4), 0, xs:double(4), 0) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:nroot(xs:double(3), xs:integer(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:nroot(xs:double(3), xs:integer(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:nroot(xs:decimal(3), xs:integer(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:nroot(xs:decimal(3), xs:integer(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:sqrt(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:sqrt(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:sqrt(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:sqrt(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:sqrt(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:sqrt(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:sqrt(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:sqrt(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:exp(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:exp(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:exp(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:exp(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:exp(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:exp(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:exp(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:exp(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:fact(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:fact(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:fact(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:fact(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:fact(xs:integer(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:fact(xs:integer(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:integer' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:sin(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:sin(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:sin(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:sin(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cos(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cos(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cos(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cos(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cos(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cos(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:tan() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:tan(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:tan(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:tan(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:tan(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:cot() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cot(xs:decimal(intern:half-pi() ) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cot(xs:decimal(intern:half-pi() ) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/><!-- das kann nicht funktionieren, weil das Ergebnis INF ist -->
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cot(xs:double(intern:half-pi() ) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cot(xs:double(intern:half-pi() ) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:cot() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cot(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cot(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cot(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cot(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<!--<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cot(xs:decimal(xsb:tau() ) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cot(xs:decimal(xsb:tau() ) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/><!-\- das kann nicht funktionieren, weil das Ergebnis INF ist -\->
		</xsl:call-template>-->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:cot(xs:double(xsb:tau() ) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:cot(xs:double(xsb:tau() ) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:atan() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:atan(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:atan(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:atan(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:atan(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:atan2(y,x) -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:atan2(xs:double(3), xs:double(1) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:atan2(xs:double(3), xs:double(1) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:atan2(xs:decimal(3), xs:decimal(2) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:atan2(xs:decimal(3), xs:decimal(2) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:atan2(xs:double(3), xs:decimal(1) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:atan2(xs:double(3), xs:decimal(1) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:atan2(xs:decimal(3), xs:double(2) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:atan2(xs:decimal(3), xs:double(2) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<!-- intern:sgn() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:sgn(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:sgn(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:sgn(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:sgn(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:sgn() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:sgn(xs:double(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:sgn(xs:double(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:sgn(xs:decimal(3) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:sgn(xs:decimal(3) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:asin() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:asin(xs:double(0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:asin(xs:double(0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:asin(xs:decimal(0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:asin(xs:decimal(0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:asin(xs:float(0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:asin(xs:float(0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:float' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:asin(xs:integer(0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:asin(xs:integer(0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:integer' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:acos() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:acos(xs:double(-0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:acos(xs:double(-0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:acos(xs:decimal(-0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:acos(xs:decimal(-0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<!-- intern:round() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:round(xs:double(-0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:round(xs:double(-0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:round(xs:double('NaN') ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:round(xs:double('NaN') ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:round(xs:decimal(-0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:round(xs:decimal(-0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(intern:round(xs:integer(-0.5) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(intern:round(xs:integer(-0.5) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:integer' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:variance() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:variance( (xs:double(-0.5), xs:double(-0.5) ) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:variance( (xs:double(-0.5), xs:double(-0.5) ) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:variance( (xs:decimal(-0.5), xs:decimal(-0.5) ) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:variance( (xs:decimal(-0.5), xs:decimal(-0.5) ) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<!-- xsb:standard-deviation() -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:standard-deviation( (xs:double(-0.5), xs:double(-0.5) ) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:standard-deviation( (xs:double(-0.5), xs:double(-0.5) ) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:double' " as="xs:string"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:type-annotation(xsb:standard-deviation( (xs:decimal(-0.5), xs:decimal(-0.5) ) ) )</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:type-annotation(xsb:standard-deviation( (xs:decimal(-0.5), xs:decimal(-0.5) ) ) )"/>
			<xsl:with-param name="reference-value" select=" 'xs:decimal' " as="xs:string"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:integer-to-hex()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(0)"/>
			<xsl:with-param name="reference-value" select="'0'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(-0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(-0)"/>
			<xsl:with-param name="reference-value" select="'0'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(9)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(9)"/>
			<xsl:with-param name="reference-value" select="'9'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(10)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(10)"/>
			<xsl:with-param name="reference-value" select="'A'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(-10)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(-10)"/>
			<xsl:with-param name="reference-value" select="'-A'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(15)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(15)"/>
			<xsl:with-param name="reference-value" select="'F'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(255)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(255)"/>
			<xsl:with-param name="reference-value" select="'FF'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(-65535)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(-65535)"/>
			<xsl:with-param name="reference-value" select="'-FFFF'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(18446744073709551615)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(18446744073709551615)"/>
			<xsl:with-param name="reference-value" select="'FFFFFFFFFFFFFFFF'"/>
		</xsl:call-template>
		<!--
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(0, 0)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(0, 0)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(5, 2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(5, 2)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(-8, 2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(-8, 2)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(128, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(128, 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		-->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(0, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(0, 8)"/>
			<xsl:with-param name="reference-value" select=" '00' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(10, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(10, 8)"/>
			<xsl:with-param name="reference-value" select="'0A'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(-24, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(-24, 8)"/>
			<xsl:with-param name="reference-value" select="'E8'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(-1, 64)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(-1, 64)"/>
			<xsl:with-param name="reference-value" select="'FFFFFFFFFFFFFFFF'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(0, 3)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(0, 3)"/>
			<xsl:with-param name="reference-value" select=" '0' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(0, 4)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(0, 4)"/>
			<xsl:with-param name="reference-value" select=" '0' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(0, 5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(0, 5)"/>
			<xsl:with-param name="reference-value" select=" '00' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(10, 5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(10, 5)"/>
			<xsl:with-param name="reference-value" select=" '0A' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(-10, 5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(-10, 5)"/>
			<xsl:with-param name="reference-value" select=" '16' "/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(18446744073709551615, 65)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(18446744073709551615, 65)"/>
			<xsl:with-param name="reference-value" select="'0FFFFFFFFFFFFFFFF'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(-18446744073709551616, 65)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(-18446744073709551616, 65)"/>
			<xsl:with-param name="reference-value" select="'10000000000000000'"/>
		</xsl:call-template>
		<!-- fehlerhaft -->
		<!--
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(16, 5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(16, 5)"/>
			<xsl:with-param name="reference-value" select=" 'NaN' "/>
		</xsl:call-template>
		-->
		<!--
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:integer-to-hex(128, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:integer-to-hex(128, 8)"/>
			<xsl:with-param name="reference-value" select="'NaN'"/>
		</xsl:call-template>
		-->
		<!--  -->
		<!--  -->
		<!-- __________     xsb:twos-complement()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(0, 2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(0, 2)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(0, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(0, 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(127, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(127, 8)"/>
			<xsl:with-param name="reference-value" select="127"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(-128, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(-128, 8)"/>
			<xsl:with-param name="reference-value" select="128"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(-1, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(-1, 8)"/>
			<xsl:with-param name="reference-value" select="255"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(-64, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(-64, 8)"/>
			<xsl:with-param name="reference-value" select="192"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(-2567447, 32)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(-2567447, 32)"/>
			<xsl:with-param name="reference-value" select="4292399849"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(2567447, 32)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(2567447, 32)"/>
			<xsl:with-param name="reference-value" select="2567447"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(-64, 64)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(-64, 64)"/>
			<xsl:with-param name="reference-value" select="18446744073709551552"/><!-- with courtesy to Wolfram Alpha -->
		</xsl:call-template>
		<!-- fehlerhaft, Abbruch -->
		<!--
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(128, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(128, 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:twos-complement(-129, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:twos-complement(-129, 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		-->
		<!--  -->
		<!--  -->
		<!-- __________     xsb:reverse-twos-complement()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(0, 2)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(0, 2)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(0, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(0, 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(127, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(127, 8)"/>
			<xsl:with-param name="reference-value" select="127"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(255, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(255, 8)"/>
			<xsl:with-param name="reference-value" select="-1"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(128, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(128, 8)"/>
			<xsl:with-param name="reference-value" select="-128"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(192, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(192, 8)"/>
			<xsl:with-param name="reference-value" select="-64"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(4292399849, 32)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(4292399849, 32)"/>
			<xsl:with-param name="reference-value" select="-2567447"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(2567447, 32)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(2567447, 32)"/>
			<xsl:with-param name="reference-value" select="2567447"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(18446744073709551552, 64)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(18446744073709551552, 64)"/>
			<xsl:with-param name="reference-value" select="-64"/>
		</xsl:call-template>
		<!-- fehlerhaft, Abbruch -->
		<!--
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(-1, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(-1, 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(256, 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(256, 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		-->
		<!-- roundtrip -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(xsb:twos-complement(0, 8), 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(xsb:twos-complement(0, 8), 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(xsb:twos-complement(127, 8), 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(xsb:twos-complement(127, 8), 8)"/>
			<xsl:with-param name="reference-value" select="127"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(xsb:twos-complement(12345, 32), 32)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(xsb:twos-complement(12345, 32), 32)"/>
			<xsl:with-param name="reference-value" select="12345"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:reverse-twos-complement(xsb:twos-complement(-12345, 32), 32)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:reverse-twos-complement(xsb:twos-complement(-12345, 32), 32)"/>
			<xsl:with-param name="reference-value" select="-12345"/>
		</xsl:call-template>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:hex-to-integer()     __________ -->
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('0', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('0', 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('00', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('00', 8)"/>
			<xsl:with-param name="reference-value" select="0"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('1', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('1', 8)"/>
			<xsl:with-param name="reference-value" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('A', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('A', 8)"/>
			<xsl:with-param name="reference-value" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('7F', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('7F', 8)"/>
			<xsl:with-param name="reference-value" select="127"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('FF', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('FF', 8)"/>
			<xsl:with-param name="reference-value" select="-1"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('80', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('80', 8)"/>
			<xsl:with-param name="reference-value" select="-128"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('E8', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('E8', 8)"/>
			<xsl:with-param name="reference-value" select="-24"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('FFFFFFFF', 32)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('FFFFFFFF', 32)"/>
			<xsl:with-param name="reference-value" select="-1"/>
		</xsl:call-template>
		<!-- fehlerhaft -->
		<!--
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('-E8', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('-E8', 8)"/>
			<xsl:with-param name="reference-value" select="'NaN'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('E8', 1)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('E8', 1)"/>
			<xsl:with-param name="reference-value" select="'NaN'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('2E8', 8)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('2E8', 8)"/>
			<xsl:with-param name="reference-value" select="'NaN'"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.test.Function">
			<xsl:with-param name="caller">xsb:hex-to-integer('2E8', 5)</xsl:with-param>
			<xsl:with-param name="actual-value" select="xsb:hex-to-integer('2E8', 5)"/>
			<xsl:with-param name="reference-value" select="'NaN'"/>
		</xsl:call-template>
		-->
		<!--  -->
		<!--  -->
		<!--  -->
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
