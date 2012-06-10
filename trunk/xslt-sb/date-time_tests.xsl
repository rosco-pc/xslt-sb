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
	<!--  -->
	<xsl:import href="internals.stylecheck.xsl"/>
	<xsl:import href="date-time.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="date-time_tests.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Tests für date-time.xsl</doc:title>
		<para>Dieses Stylesheet enthält Tests für <code>date-time.xsl</code>.</para>
		<para>Autor: <author>
			<firstname>Stefan</firstname>
			<surname>Krause</surname>
			</author>
		</para>
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
				<date>2011-06-11</date>
				<authorinitials>Stf</authorinitials>
				<revremark>initiale Version</revremark>
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
				<revnumber>0.2.63</revnumber>
				<date>2011-06-11</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template match="/" mode="internals.self-test">
		<xsl:call-template name="xsb:internals.MakeHeader"/>
		<xsl:call-template name="intern:internals.Stylecheck"/>
		<xsl:call-template name="intern:date-time.self-test"/>
		<xsl:call-template name="xsb:internals.MakeFooter"/>
	</xsl:template>
	<!--  -->
	<!--  -->
	<!--  -->
	<intern:testliste xml:id="datumsangaben">
		<test>
			<value/>
			<intern:parse-date/>
			<intern:normalize-date-string/>
			<xsb:parse-date/>
		</test>
	
		<test>
			<value>2012-06-09</value>
			<intern:parse-date>2012-06-09</intern:parse-date>
			<intern:normalize-date-string>2012-06-09</intern:normalize-date-string>
			<xsb:parse-date>2012-06-09</xsb:parse-date>
		</test>
		<test>
			<value>12-6-9</value>
			<intern:parse-date>0012-06-09</intern:parse-date>
			<intern:normalize-date-string>12-6-9</intern:normalize-date-string>
			<xsb:parse-date>0012-06-09</xsb:parse-date>
		</test>
		<test>
			<value>1. Januar 2000</value>
			<intern:parse-date/>
			<intern:normalize-date-string>1.JAN2000</intern:normalize-date-string>
			<xsb:parse-date>2000-01-01</xsb:parse-date>
		</test>
		<test>
			<value>1.MRZ2012</value>
			<intern:parse-date>2012-03-01</intern:parse-date>
			<intern:normalize-date-string>1.MRZ2012</intern:normalize-date-string>
			<xsb:parse-date>2012-03-01</xsb:parse-date>
		</test>
		<test>
			<value>19.MRZ2012</value>
			<intern:parse-date>2012-03-19</intern:parse-date>
			<intern:normalize-date-string>19.MRZ2012</intern:normalize-date-string>
			<xsb:parse-date>2012-03-19</xsb:parse-date>
		</test>
		<test>
			<value>1781 Feb. 23</value>
			<intern:parse-date/>
			<intern:normalize-date-string>1781FEB23</intern:normalize-date-string>
			<xsb:parse-date>1781-02-23</xsb:parse-date>
		</test>
		<test>
			<value>9 Jan. 7</value>
			<intern:parse-date/>
			<intern:normalize-date-string>9JAN7</intern:normalize-date-string>
			<xsb:parse-date>0009-01-07</xsb:parse-date>
		</test>
		<test>
			<value>1st May 1931</value>
			<intern:parse-date/>
			<intern:normalize-date-string>1.MAI1931</intern:normalize-date-string>
			<xsb:parse-date>1931-05-01</xsb:parse-date>
		</test>
		<test>
			<value>21st December 1921</value>
			<intern:parse-date/>
			<intern:normalize-date-string>21.DEZ1921</intern:normalize-date-string>
			<xsb:parse-date>1921-12-21</xsb:parse-date>
		</test>
		<test>
			<value>2nd of October 1587</value>
			<intern:parse-date/>
			<intern:normalize-date-string>2.OKT1587</intern:normalize-date-string>
			<xsb:parse-date>1587-10-02</xsb:parse-date>
		</test>
		<test>
			<value>22nd of October 1587</value>
			<intern:parse-date/>
			<intern:normalize-date-string>22.OKT1587</intern:normalize-date-string>
			<xsb:parse-date>1587-10-22</xsb:parse-date>
		</test>
		<test>
			<value>5th January 2001</value>
			<intern:parse-date/>
			<intern:normalize-date-string>5.JAN2001</intern:normalize-date-string>
			<xsb:parse-date>2001-01-05</xsb:parse-date>
		</test>
		<test>
			<value>1.9.1970</value>
			<intern:parse-date>1970-09-01</intern:parse-date>
			<intern:normalize-date-string>1.9.1970</intern:normalize-date-string>
			<xsb:parse-date>1970-09-01</xsb:parse-date>
		</test>
		<test>
			<value>21.9.1970</value>
			<intern:parse-date>1970-09-21</intern:parse-date>
			<intern:normalize-date-string>21.9.1970</intern:normalize-date-string>
			<xsb:parse-date>1970-09-21</xsb:parse-date>
		</test>
		<test>
			<value>(21.9.1970)</value>
			<intern:parse-date/>
			<intern:normalize-date-string>21.9.1970</intern:normalize-date-string>
			<xsb:parse-date>1970-09-21</xsb:parse-date>
		</test>
		<test>
			<value></value>
			<intern:parse-date/>
			<intern:normalize-date-string></intern:normalize-date-string>
			<xsb:parse-date></xsb:parse-date>
		</test>
		
	</intern:testliste>
	
	
	<intern:testliste xml:id="datumsstrings">
		<test>
			<value/>
			<xsb:parse-dates/>
		</test>
		<test>
			<value>o. Dat.</value>
			<xsb:parse-dates/>
		</test>
		<test>
			<value>o.Dat.</value>
			<xsb:parse-dates/>
		</test>
		<test>
			<value>1948</value>
			<xsb:parse-dates>1948-01-01/1948-12-31</xsb:parse-dates>
		</test>
		<test>
			<value>1948-1949</value>
			<xsb:parse-dates>1948-01-01/1949-12-31</xsb:parse-dates>
		</test>
		<test>
			<value> 1948 - 1949 </value>
			<xsb:parse-dates>1948-01-01/1949-12-31</xsb:parse-dates>
		</test>
		<test>
			<value>1933/1949</value>
			<xsb:parse-dates>1933-01-01/1949-12-31</xsb:parse-dates>
		</test>
		<test>
			<value> 1933 / 1949 </value>
			<xsb:parse-dates>1933-01-01/1949-12-31</xsb:parse-dates>
		</test>
		<test>
			<value>1948, 1949</value>
			<xsb:parse-dates>1948-01-01/1948-12-31, 1949-01-01/1949-12-31</xsb:parse-dates>
		</test>
		<test>
			<value>(1913) 1948-1949</value>
			<xsb:parse-dates>1913-01-01/1913-12-31, 1948-01-01/1949-12-31</xsb:parse-dates>
		</test>
		<test>
			<value>1948,1949 (1957)</value>
			<xsb:parse-dates>1948-01-01/1948-12-31, 1949-01-01/1949-12-31, 1957-01-01/1957-12-31</xsb:parse-dates>
		</test>
		<test>
			<value>1948;1949 ;1957</value>
			<xsb:parse-dates>1948-01-01/1948-12-31, 1949-01-01/1949-12-31, 1957-01-01/1957-12-31</xsb:parse-dates>
		</test>
		<test>
			<value>Jan. 1982</value>
			<xsb:parse-dates>1982-01-01/1982-01-31</xsb:parse-dates>
		</test>
		<test>
			<value>Mai 1982</value>
			<xsb:parse-dates>1982-05-01/1982-05-31</xsb:parse-dates>
		</test>
		<test>
			<value>Feb. 1983</value>
			<xsb:parse-dates>1983-02-01/1983-02-28</xsb:parse-dates>
		</test>
		<test>
			<value>Feb. 1984</value>
			<xsb:parse-dates>1984-02-01/1984-02-29</xsb:parse-dates>
		</test>
		<test>
			<value>Feb. 2000</value>
			<xsb:parse-dates>2000-02-01/2000-02-29</xsb:parse-dates>
		</test>
		<test>
			<value>Feb. 1900</value>
			<xsb:parse-dates>1900-02-01/1900-02-28</xsb:parse-dates>
		</test>
		<!--<test>
			<value>Apr. - Juni 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>Apr./Juni 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>Apr., Juni 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>Apr. 1997 - Juni 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>Apr. 1997/Juni 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>Apr. 1997, Juni 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1./2. Apr. 1997, Juni 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1./2. Apr. 1997; Juni 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1./2. Apr. 1997; Juni, Aug. 1998</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>-->
		<test>
			<value>1. Feb. 1982</value>
			<xsb:parse-dates>1982-02-01/1982-02-01</xsb:parse-dates>
		</test>
		<test>
			<value>13. Feb. 1982</value>
			<xsb:parse-dates>1982-02-13/1982-02-13</xsb:parse-dates>
		</test>
		<test>
			<value>13 February 1982</value>
			<xsb:parse-dates>1982-02-13/1982-02-13</xsb:parse-dates>
		</test>
		<test>
			<value>[1882] 1907-1930</value>
			<xsb:parse-dates>1882-01-01/1882-12-31, 1907-01-01/1930-12-31</xsb:parse-dates>
		</test>
		<test>
			<value>1.-7. Okt. 2002</value>
			<xsb:parse-dates>2002-10-01/2002-10-07</xsb:parse-dates>
		</test>
		<test>
			<value>1.-17. Okt. 2002</value>
			<xsb:parse-dates>2002-10-01/2002-10-17</xsb:parse-dates>
		</test>
		<test>
			<value>13.-17. Okt. 2002</value>
			<xsb:parse-dates>2002-10-13/2002-10-17</xsb:parse-dates>
		</test>
		<test>
			<value>13./17. Okt. 2002</value>
			<xsb:parse-dates>2002-10-13/2002-10-17</xsb:parse-dates>
		</test>
		<test>
			<value>1. Sept. - 17. Okt. 2002</value>
			<xsb:parse-dates>2002-09-01/2002-10-17</xsb:parse-dates>
		</test>
		<test>
			<value>13. Sept. - 17. Okt. 2002</value>
			<xsb:parse-dates>2002-09-13/2002-10-17</xsb:parse-dates>
		</test>
		<test>
			<value>13. Sept./17. Okt. 2002</value>
			<xsb:parse-dates>2002-09-13/2002-10-17</xsb:parse-dates>
		</test>
		<test>
			<value>14. Dez. 2001 - 18. Feb. 2002</value>
			<xsb:parse-dates>2001-12-14/2002-02-18</xsb:parse-dates>
		</test>
		<test>
			<value>Sept.. - Okt. 1957</value>
			<xsb:parse-dates/>
		</test>
		<test>
			<value>Sept.. 1969 - Okt. 1979</value>
			<xsb:parse-dates/>
		</test>
		<test>
			<value>1970 - 197</value>
			<xsb:parse-dates/>
		</test>
		<test>
			<value>24. u. 25. März 1959</value>
			<xsb:parse-dates>1959-03-24/1959-03-24, 1959-03-25/1959-03-25</xsb:parse-dates>
		</test>
		<test>
			<value>24., 25. März 1959</value>
			<xsb:parse-dates>1959-03-24/1959-03-24, 1959-03-25/1959-03-25</xsb:parse-dates>
		</test>
		<test>
			<value>24. und 25. März 1959</value>
			<xsb:parse-dates>1959-03-24/1959-03-24, 1959-03-25/1959-03-25</xsb:parse-dates>
		</test>
		<test>
			<value>24. bis 25. März 1959</value>
			<xsb:parse-dates>1959-03-24/1959-03-25</xsb:parse-dates>
		</test>
		<test>
			<value>24. Feb. bis 25. März 1959</value>
			<xsb:parse-dates>1959-02-24/1959-03-25</xsb:parse-dates>
		</test>
		<test>
			<value>24. Feb., 25. März 1959</value>
			<xsb:parse-dates>1959-02-24/1959-02-24, 1959-03-25/1959-03-25</xsb:parse-dates>
		</test>
		<test>
			<value>9., 15. Januar 1948; 4.-7. Mai 1949; 24. Feb. bis 25. März 1959</value>
			<xsb:parse-dates>1948-01-09/1948-01-09, 1948-01-15/1948-01-15, 1949-05-04/1949-05-07, 1959-02-24/1959-03-25</xsb:parse-dates>
		</test>
		<test>
			<value>9., 15. Januar 1948, 4.-7. Mai 1949, 24. Feb. bis 25. März 1959</value>
			<xsb:parse-dates>1948-01-09/1948-01-09, 1948-01-15/1948-01-15, 1949-05-04/1949-05-07, 1959-02-24/1959-03-25</xsb:parse-dates>
		</test>
		<test>
			<value>9., 15. Januar 1948, 4.-7. Mai 1949; 24. Feb. bis 25. März 1959</value>
			<xsb:parse-dates>1948-01-09/1948-01-09, 1948-01-15/1948-01-15, 1949-05-04/1949-05-07, 1959-02-24/1959-03-25</xsb:parse-dates>
		</test>
		<!--<test>
			<value>1245 Oktober</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>945 Februar</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>925 Sept. 1</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1784 Oktober 20, 30</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1784 Oktober 30, November 5</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>984 Jan. 30, Mai 5</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1700 Mai 28/Juni 3</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1765 Februar 1 u. 23</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1686 Januar 20/30</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>sec. 11</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>sec. 16</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>sec. 19</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>saec. 19</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>säc. 19</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>Säc. 19</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>20. Jhdt.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>17. Jhdt.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>16./17. Jhdt.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>02.05.1308</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>02.05.1308 - 01.06.2010</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>30. Feb. 1308 - 31. Nov. 1309</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>1949-1948</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>9. Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>10. Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>11.Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>12. Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>13.Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>14. Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>15.Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>16. Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>17.Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>18. Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>19.Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>
		<test>
			<value>20. Jh.</value>
			<xsb:parse-dates></xsb:parse-dates>
		</test>-->
	</intern:testliste>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:template>
		<para xml:id="date-time.self-test">Dieses Template führt die lokalen Selbst-Tests aus.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.63</revnumber>
				<date>2011-06-11</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:template>
	<xsl:template name="intern:date-time.self-test">
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- damit es etwas übersichtlicher wird -->
		<xsl:variable name="Datums-Tests" as="element()+" select="document( '' )//intern:testliste[@xml:id='datumsangaben']/test"/>
		<xsl:variable name="Datums-Strings" as="element()+" select="document( '' )//intern:testliste[@xml:id='datumsstrings']/test"/>
		<!--  -->
		<!--  -->
		<!-- __________     intern:normalize-date-string()     __________ -->
		<xsl:for-each select="$Datums-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:normalize-date-string</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:normalize-date-string(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     intern:parse-date()     __________ -->
		<xsl:for-each select="$Datums-Tests">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.DateResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">intern:parse-date</xsl:with-param>
				<xsl:with-param name="actual-value" select="intern:parse-date(./value/text())"/>
			</xsl:call-template>
		</xsl:for-each>
		<!--  -->
		<!--  -->
		<!-- __________     xsb:parse-dates()     __________ -->
		<xsl:for-each select="$Datums-Strings">
			<xsl:call-template name="xsb:internals.test.function.withTestItem.StringResult">
				<xsl:with-param name="test-node" select="."/>
				<xsl:with-param name="function-name">xsb:parse-dates</xsl:with-param>
				<xsl:with-param name="actual-value" select="xsb:parse-dates(./value/text())"/>
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
