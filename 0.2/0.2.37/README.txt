=== Abstract ===
XSLT-SB (XSLT-Standard-Bibliothek) is a collection of xslt functions and templates.
In addition, it shows examples of XSLT pattern and design principles.
It's main focus is to facilitate xslt development for beginners.


=== Getting Started ===
Include any of the library's stylesheets into your stylesheet.
You can start a new project by copy & paste from pattern+includes.xsl.


=== Revision ===
$Revision$, $Date$

--- Changes in 0.2.37 ---
* added asin(), acos(), atan(), atan2() to math.xsl
* dynamic typing: functions return now results with the type of 
  their argument instead of xs:decimal
* internals.stylecheck.xsl checks for the use of <xsl:message/>

--- Changes in 0.2.31 ---
* moved tests from standard.xsl to standard_tests.xsl
* improved documentation

--- Changes in 0.2.28 ---
* added math.xsl
* added tools/google_code
* some minor bugs fixed


=== Licence (dual licencing) ===
Copyright (c) 2010-2011 Stefan Krause, http://www.expedimentum.org/

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


This work is licensed under a Creative Commons Attribution 3.0 Unported License.
You can share and remix it, if you attribute the work in the manner specified 
by the author or licensor (but not in any way that suggests that they endorse 
you or your use of the work). 
For details see http://creativecommons.org/licenses/by/3.0/


=== Known Issues ===
* IntelSOA crashes while executing any test