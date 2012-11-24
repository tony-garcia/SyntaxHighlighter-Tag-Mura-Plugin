<!--- 
	LICENSE INFORMATION:
	
	Copyright (c) 2012 Tony Garcia
	Licensed under the MIT License (http://mit-license.org)
	
	VERSION INFORMATION:
	
	This file is part of SyntaxHighlighter Tag Mura Plugin
	Version 1.0 (November 23, 2012)
 --->
 
<cfset pSession = request.pluginConfig.getSession() />
<cfset theme = request.pluginConfig.getCustomSetting( "shTheme","Default" ) />
<cfset shConfig = request.pluginConfig.getCustomSetting("shConfig") />
<cfset shStrings = request.pluginConfig.getCustomSetting("shStrings") />
<h3>Settings</h3>
<cfif pSession.valueExists("message") and pSession.getValue("message") neq "">
	<div class="success alert alert-success">
		<cfoutput>#pSession.getValue("message")#</cfoutput>
		<cfif muraVersion gte 6>
			<a href="#" type="button" class="close alert-dismiss" data-dismiss="alert">
				<i class="icon-remove-sign"></i>
			</a>
		</cfif>
	</div>
	<cfset pSession.removeValue("message") />
</cfif>
<form method="post" action="includes/saveSettings.cfm">
	<dl class="oneColumn">
		<dt class="first"><label for="selTheme">Choose SyntaxHighligher Theme:</label></dt>
		<dd>
			<select name="shTheme" id="selTheme">
				<option value="Default"<cfif theme is "Default"> selected</cfif>>Default</option>
				<option value="Django"<cfif theme is "Django"> selected</cfif>>Django</option>
				<option value="Eclipse"<cfif theme is "Eclipse"> selected</cfif>>Eclipse</option>
				<option value="Emacs"<cfif theme is "Emacs"> selected</cfif>>Emacs</option>
				<option value="FadeToGrey"<cfif theme is "FadeToGrey"> selected</cfif>>Fade To Grey</option>
				<option value="MDUltra"<cfif theme is "MDUltra"> selected</cfif>>MD Ultra</option>
				<option value="Midnight"<cfif theme is "Midnight"> selected</cfif>>Midnight</option>
				<option value="RDark"<cfif theme is "RDark"> selected</cfif>>R Dark</option>
			</select>
			<p></p>
			<strong>Preview:</strong><br />
			<div id="themePreview">		
				<pre class="brush: cf; collapse: false;">
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
				</pre>							
			</div>
		</dd>
		<dt>
			Collapse Code Blocks by Default:
		</dt>
		<dd>
			<label class="radio inline" for="rdCollapseTrue"><input type="radio" id="rdCollapseTrue" name="collapse" value="true"<cfif shConfig["collapse"] eq "true"> checked</cfif> /> Yes</label>
			<label class="radio inline" for="rdCollapseFalse"><input type="radio" id="rdCollapseFalse" name="collapse" value="false"<cfif shConfig["collapse"] eq "false"> checked</cfif> /> No</label>
		</dd>
		<dt>
			Show Gutter and Line Numbers:
		</dt>
		<dd>
			<label class="radio inline" for="rdShowGutterTrue"><input type="radio" id="rdShowGutterTrue" name="gutter" value="true"<cfif shConfig["gutter"] eq "true"> checked</cfif> /> Yes</label>
			<label class="radio inline" for="rdShowGutterFalse"><input type="radio" id="rdShowGutterFalse" name="gutter" value="false"<cfif shConfig["gutter"] eq "false"> checked</cfif> /> No</label>
		</dd>
		<dt>
			Enable HTML-Script Highlighting (not all brushes support this feature):
		</dt>
		<dd>
			<label class="radio inline" for="rdHTMLScriptTrue"><input type="radio" id="rdHTMLScriptTrue" name="htmlScript" value="true"<cfif shConfig["html-script"] eq "true"> checked</cfif> /> Yes</label>
			<label class="radio inline" for="rdHTMLScriptFalse"><input type="radio" id="rdHTMLScriptFalse" name="htmlScript" value="false"<cfif shConfig["html-script"] eq "false"> checked</cfif>  /> No</label>
		</dd>
		<dt>
			Enable Smart Tabs:
		</dt>
		<dd>
			<label class="radio inline" for="rdSmartTabsTrue"><input type="radio" id="rdSmartTabsTrue" name="smartTabs" value="true"<cfif shConfig["smart-tabs"] eq "true"> checked</cfif> /> Yes</label>
			<label class="radio inline" for="rdSmartTabsFalse"><input type="radio" id="rdSmartTabsFalse" name="smartTabs" value="false"<cfif shConfig["smart-tabs"] eq "false"> checked</cfif> /> No</label>
		</dd>
		<dt>
			<label for="txtTabSize">Tab Size:</label>
		</dt>
		<dd>
			<cfoutput>
				<input type="text" id="txtTabSize" name="tabSize" value="#shConfig['tab-size']#"  />
			</cfoutput>
		</dd>
		<dt>
			Enable Auto Links:
		</dt>
		<dd>
			<label class="radio inline" for="rdAutoLinksTrue"><input type="radio" id="rdAutoLinksTrue" name="autoLinks" value="true"<cfif shConfig["auto-links"] eq "true"> checked</cfif> /> Yes</label>
			<label class="radio inline" for="rdAutoLinksFalse"><input type="radio" id="rdAutoLinksFalse" name="autoLinks" value="false"<cfif shConfig["auto-links"] eq "false"> checked</cfif> /> No</label>
		</dd>
		<dt>
			Strings (localize/change displayed strings):
		</dt>
		<dd>
			<cfoutput>
				Expand Source:<br /> 
				<input type="text" name="expandSource" value="#shStrings['expandSource']#" /><br />
				Info Link:<br />
				<input type="text" name="help" value="#shStrings['help']#" /><br />
				No Brush:<br />
				<input type="text" name="noBrush" value="#shStrings['noBrush']#" size="40" /><br />
				Brush not HTML-Script Enabled:<br />
				<input type="text" name="brushNotHtmlScript" value="#shStrings['brushNotHtmlScript']#" size="50" />
			</cfoutput>
		</dd>
	</dl>
	<input type="hidden" name="action" value="updateSettings" />		
	<div id="actionButtons">
		<button type="submit" class="btn">Save Settings</button>
	</div>
</form>		