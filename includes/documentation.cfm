<!--- 
	LICENSE INFORMATION:
	
	Copyright (c) 2012 Tony Garcia
	Licensed under the MIT License (http://mit-license.org)
	
	VERSION INFORMATION:
	
	This file is part of SyntaxHighlighter Tag Mura Plugin
	Version 1.0 (November 23, 2012)
 --->
 
<h3>Documentation</h3>

<p>The SyntaxHighlighter Tag plugin allows you to easily include code snippets in your content using <a href="http://alexgorbatchev.com/SyntaxHighlighter/">Alex Gorbatchev's 
SyntaxHighligher 3.083 Script.</a></p>
<p>The tag can be used in pages (body and summary sections) as well as in Mura components or pretty much any display object (even within other plugins).</p>
<p>The format for the SyntaxHighlighter tag is as follows:
<p>[code lang='{language}' <em>title='{title}' highlight='{list of highlighted lines}' collapse='{true|false}' first-line='{first line number}' gutter='{true|false}' 
class-name='{class name}' html-script='{true|false}' smart-tabs='{true|false}' tab-size='{tab size}' auto-links='{true|false}'</em>]</p>
<p>IMPORTANT: Attribute values <u>must</u> be surrounded by <strong>single</strong> quotes.</p>
<h4>Tag Attributes</h4>
<p>Also check out the <a href="http://alexgorbatchev.com/SyntaxHighlighter/manual/configuration/">SyntaxHighlighter Manual</a> for more info. This version of the 
SyntaxHighlighter script includes various improvements over previous versions, such as dynamic script (brush) loading (which is handled by the plugin), improved code
selecting and copy-to-clipboard, and more. <a href="http://alexgorbatchev.com/SyntaxHighlighter/whatsnew.html">More details here.</a></p>
<table<cfif muraVersion lt 6> class="mura-table-grid stripe"<cfelse> class="table table-striped table-bordered table-condensed"</cfif>>
  <tr>
    <th scope="col">Attribute</th>
    <th scope="col">Required?</th>
    <th scope="col">Default*</th>
    <th scope="col" class="varWidth">Explanation</th>
  </tr>
  <tr>
    <td>lang</td>
    <td>yes</td>
    <td>&nbsp;</td>
    <td class="varWidth">Language brush to use. <a href="#languages">Click to see list of abbreviations for languages.</a>
    </td>
  </tr>
  <tr>
    <td>title</td>
    <td>no</td>
    <td>&nbsp;</td>
    <td class="varWidth">Title of the script.</td>
  </tr>
  <tr>
    <td>highlight</td>
    <td>no</td>
    <td>&nbsp;</td>
    <td class="varWidth">Line number to highlight in the script.(comma-delimited list)</td>
  </tr>
  <tr>
    <td>collapse</td>
    <td>no</td>
    <td>false</td>
    <td class="varWidth">Whether to initially show the code block collapsed. If so, a link saying "expand source" or the code
		title (if given) will display which will show the code when clicked on.</td>
  </tr>
  <tr>
    <td>first-line</td>
    <td>no</td>
    <td>1</td>
    <td class="varWidth">Line number for the first line of the code block.</td>
  </tr>
  <tr>
    <td>gutter</td>
    <td>no</td>
    <td>true</td>
    <td class="varWidth">Allows you to turn gutter with line numbers on and off.</td>
  </tr>
  <tr>
    <td>class-name</td>
    <td>no</td>
    <td></td>
    <td class="varWidth">Allows you to add a custom class (or multiple classes) to every highlighter element that will be created on the page.</td>
  </tr>
  <tr>
    <td>html-script</td>
    <td>no</td>
    <td>false</td>
    <td class="varWidth">Allows you to highlight a mixture of HTML/XML code and a script which is very common in web development. Setting this value 
	to true requires that you have shBrushXml.js loaded and that the brush you are using supports this feature.</td>
  </tr>
  <tr>
    <td>smart-tabs</td>
    <td>no</td>
    <td>true</td>
    <td class="varWidth">Allows you to turn smart tabs feature on and off. The tabs are converted to spaces and smart tabs are used to preserve column 
	layout with assumption that each column is a fixed number of spaces (as determined by the tab-size) parameter.</td>
  </tr>
  <tr>
    <td>tab-size</td>
    <td>no</td>
    <td>4</td>
    <td class="varWidth">Allows you to adjust tab size.</td>
  </tr>
  <tr>
    <td>auto-links</td>
    <td>no</td>
    <td>true</td>
    <td class="varWidth">Allows you to turn detection of links in the highlighted element on and off. If the option is turned off, URLs won't be clickable.</td>
  </tr>
</table>
<p>* defaults can be changed globally in the tag settings and overridden for each code block by using the appropriate tag attributes.</p>
<h3>Examples</h3>
<p><strong>Basic Example</strong>: Here is an basic example in which only the language is designated in the [code/] tag (default options, "lang" is the only required attribute). 
Paste any code in between the [code] start and end tags directly into the content editor (without going into html mode). Mura's CKEditor will convert angle brackets to html 
entities, but we want that. For example:</p>
<pre>
[code lang='cf']
&lt;cffunction name=&quot;onRenderStart&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;any&quot;&gt;
  &lt;cfargument name=&quot;$&quot;&gt;
  &lt;cfset pluginConfig.addToHTMLHeadQueue(&quot;includes/htmlhead.cfm&quot;) /&gt;
  &lt;cfset pluginConfig.addToHTMLFootQueue(&quot;includes/htmlfoot.cfm&quot;) /&gt;
&lt;/cffunction&gt;

&lt;cffunction name=&quot;onRenderEnd&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;void&quot;&gt;
  &lt;cfargument name=&quot;$&quot;&gt;
  &lt;cfset var output = &quot;&quot; /&gt;
  &lt;cfset output = $.event( &quot;__MuraResponse__&quot; )&gt;
  &lt;cfset output = highlightCode( output ) /&gt;
  &lt;cfset $.event( &quot;__MuraResponse__&quot;, output ) /&gt
&lt;/cffunction&gt;		
[/code]
</pre><br />
				
<p>This will render like so in the front end:</p>
				
<pre class="brush: cf">
&lt;cffunction name=&quot;onRenderStart&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;any&quot;&gt;
	&lt;cfargument name=&quot;$&quot;&gt;
	&lt;cfset pluginConfig.addToHTMLHeadQueue(&quot;includes/htmlhead.cfm&quot;) /&gt;
	&lt;cfset pluginConfig.addToHTMLFootQueue(&quot;includes/htmlfoot.cfm&quot;) /&gt;
&lt;/cffunction&gt;

&lt;cffunction name=&quot;onRenderEnd&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;void&quot;&gt;
	&lt;cfargument name=&quot;$&quot;&gt;
	&lt;cfset var output = &quot;&quot; /&gt;
	&lt;cfset output = $.event( &quot;__MuraResponse__&quot; )&gt;
	&lt;cfset output = highlightCode( output ) /&gt;
	&lt;cfset $.event( &quot;__MuraResponse__&quot;, output ) /&gt
&lt;/cffunction&gt;
</pre><br />
				
<p><strong>Line Highlighting</strong>: By specifying line numbers in the "higlight" attribute, you can highlight specific lines:</p>

<pre>
[code lang='cf' highlight='3,10']
&lt;cffunction name=&quot;onRenderStart&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;any&quot;&gt;
  &lt;cfargument name=&quot;$&quot;&gt;
  &lt;cfset pluginConfig.addToHTMLHeadQueue(&quot;includes/htmlhead.cfm&quot;) /&gt;
  &lt;cfset pluginConfig.addToHTMLFootQueue(&quot;includes/htmlfoot.cfm&quot;) /&gt;
&lt;/cffunction&gt;

&lt;cffunction name=&quot;onRenderEnd&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;void&quot;&gt;
  &lt;cfargument name=&quot;$&quot;&gt;
  &lt;cfset var output = &quot;&quot; /&gt;
  &lt;cfset output = $.event( &quot;__MuraResponse__&quot; )&gt;
  &lt;cfset output = highlightCode( output ) /&gt;
  &lt;cfset $.event( &quot;__MuraResponse__&quot;, output ) /&gt
&lt;/cffunction&gt;		
[/code]
</pre><br />

<p>Lines 3 and 10 will be highlighted in the output.</p>
<pre class="brush: cf; highlight: [3,10]">
&lt;cffunction name=&quot;onRenderStart&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;any&quot;&gt;
	&lt;cfargument name=&quot;$&quot;&gt;
	&lt;cfset pluginConfig.addToHTMLHeadQueue(&quot;includes/htmlhead.cfm&quot;) /&gt;
	&lt;cfset pluginConfig.addToHTMLFootQueue(&quot;includes/htmlfoot.cfm&quot;) /&gt;
&lt;/cffunction&gt;

&lt;cffunction name=&quot;onRenderEnd&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;void&quot;&gt;
	&lt;cfargument name=&quot;$&quot;&gt;
	&lt;cfset var output = &quot;&quot; /&gt;
	&lt;cfset output = $.event( &quot;__MuraResponse__&quot; )&gt;
	&lt;cfset output = highlightCode( output ) /&gt;
	&lt;cfset $.event( &quot;__MuraResponse__&quot;, output ) /&gt
&lt;/cffunction&gt;
</pre><br />
			
<p><strong>Collapsed Code Blocks</strong>: By specifying collapse='true' you can have code snippets which are collapsed by default and can be expanded by clicking on some
text (either the title of the code block, if specified, or default text:</p>
<pre>
[code lang='cf' highlight='3' title='OnRenderStart Code' collapse='true']
&lt;cffunction name=&quot;onRenderStart&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;any&quot;&gt;
  &lt;cfargument name=&quot;$&quot;&gt;
  &lt;cfset pluginConfig.addToHTMLHeadQueue(&quot;includes/htmlhead.cfm&quot;) /&gt;
  &lt;cfset pluginConfig.addToHTMLFootQueue(&quot;includes/htmlfoot.cfm&quot;) /&gt;
&lt;/cffunction&gt;
[/code]

[code lang='cf' collapse='true']
&lt;cffunction name=&quot;onRenderEnd&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;void&quot;&gt;
  &lt;cfargument name=&quot;$&quot;&gt;
  &lt;cfset var output = &quot;&quot; /&gt;
  &lt;cfset output = $.event( &quot;__MuraResponse__&quot; )&gt;
  &lt;cfset output = highlightCode( output ) /&gt;
  &lt;cfset $.event( &quot;__MuraResponse__&quot;, output ) /&gt
&lt;/cffunction&gt;		
[/code]
</pre><br />

<p>Code blocks will appear collapsed (click on titles to expand.)</p>		
<pre class="brush: cf; highlight: 3; title: 'OnRenderStart Code';collapse: true">
&lt;cffunction name=&quot;onRenderStart&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;any&quot;&gt;
	&lt;cfargument name=&quot;$&quot;&gt;
	&lt;cfset pluginConfig.addToHTMLHeadQueue(&quot;includes/htmlhead.cfm&quot;) /&gt;
	&lt;cfset pluginConfig.addToHTMLFootQueue(&quot;includes/htmlfoot.cfm&quot;) /&gt;
&lt;/cffunction&gt;
	</pre>
	<pre class="brush: cf;collapse: true">
&lt;cffunction name=&quot;onRenderEnd&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;void&quot;&gt;
	&lt;cfargument name=&quot;$&quot;&gt;
	&lt;cfset var output = &quot;&quot; /&gt;
	&lt;cfset output = $.event( &quot;__MuraResponse__&quot; )&gt;
	&lt;cfset output = highlightCode( output ) /&gt;
	&lt;cfset $.event( &quot;__MuraResponse__&quot;, output ) /&gt
&lt;/cffunction&gt;
</pre><br />
			
<p><strong>Other Options</strong>: You can also control things like the first line number and whether the gutter with line numbers shows at all:</p>
<pre>
[code lang='cf' title='OnRenderStart Code' first-line='6']
&lt;!--- The first line is 6 instead of 1 ---&gt;
&lt;cffunction name=&quot;onRenderStart&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;any&quot;&gt;
  &lt;cfargument name=&quot;$&quot;&gt;
  &lt;cfset pluginConfig.addToHTMLHeadQueue(&quot;includes/htmlhead.cfm&quot;) /&gt;
  &lt;cfset pluginConfig.addToHTMLFootQueue(&quot;includes/htmlfoot.cfm&quot;) /&gt;
&lt;/cffunction&gt;
[/code]

[code lang='cf' gutter='false']
&lt;!--- No line numbers ---&gt;
&lt;cffunction name=&quot;onRenderEnd&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;void&quot;&gt;
  &lt;cfargument name=&quot;$&quot;&gt;
  &lt;cfset var output = &quot;&quot; /&gt;
  &lt;cfset output = $.event( &quot;__MuraResponse__&quot; )&gt;
  &lt;cfset output = highlightCode( output ) /&gt;
  &lt;cfset $.event( &quot;__MuraResponse__&quot;, output ) /&gt
&lt;/cffunction&gt;		
[/code]
</pre><br />
			
<pre class="brush: cf; title: 'OnRenderStart Code';first-line: 6">
&lt;!--- The first line is 6 instead of 1 ---&gt;
&lt;cffunction name=&quot;onRenderStart&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;any&quot;&gt;
	&lt;cfargument name=&quot;$&quot;&gt;
	&lt;cfset pluginConfig.addToHTMLHeadQueue(&quot;includes/htmlhead.cfm&quot;) /&gt;
	&lt;cfset pluginConfig.addToHTMLFootQueue(&quot;includes/htmlfoot.cfm&quot;) /&gt;
&lt;/cffunction&gt;
</pre><br />

<pre class="brush: cf;gutter: false;">
&lt;!--- No line numbers ---&gt;
&lt;cffunction name=&quot;onRenderEnd&quot; access=&quot;public&quot; output=&quot;false&quot; returntype=&quot;void&quot;&gt;
	&lt;cfargument name=&quot;$&quot;&gt;
	&lt;cfset var output = &quot;&quot; /&gt;
	&lt;cfset output = $.event( &quot;__MuraResponse__&quot; )&gt;
	&lt;cfset output = highlightCode( output ) /&gt;
	&lt;cfset $.event( &quot;__MuraResponse__&quot;, output ) /&gt
&lt;/cffunction&gt;
</pre><br />
			
<h3>Important</h3>
<p>Please follow the syntax of the examples above exactly. Do not put spaces after or before the square brackets, leave one space between each attribute, and surround attribute
values with <strong>single</strong> quotes.</p>

