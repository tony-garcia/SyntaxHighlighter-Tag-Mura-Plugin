
<cfparam name="url.updated" default="false" />
<cfset theme = request.pluginConfig.getCustomSetting( "shTheme","Default" ) />
<cfset shConfig = request.pluginConfig.getCustomSetting("shConfig") />
<h3>Settings</h3>
<cfif url.updated>
	<div class="success alert alert-success">
		Settings Updated
		<cfif muraVersion gte 6>
			<a href="#" type="button" class="close alert-dismiss" data-dismiss="alert">
				<i class="icon-remove-sign"></i>
			</a>
		</cfif>
	</div>
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
			Show SyntaxHighlighter Info Tooltip ('Toolbar'):
		</dt>
		<dd>
			<label class="radio inline" for="rdShowToolbarTrue"><input type="radio" id="rdShowToolbarTrue" name="toolbar" value="true"<cfif shConfig["toolbar"] eq "true"> checked</cfif> /> Yes</label>
			<label class="radio inline" for="rdShowToolbarFalse"><input type="radio" id="rdShowToolbarFalse" name="toolbar" value="false"<cfif shConfig["toolbar"] eq "false"> checked</cfif> /> No</label>
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
	</dl>
	<input type="hidden" name="action" value="updateSettings" />		
	<div id="actionButtons">
		<button type="submit" class="btn">Save Settings</button>
	</div>
</form>		