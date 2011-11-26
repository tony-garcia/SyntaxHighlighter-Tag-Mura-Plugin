<!--- 
	Plugin: SyntaxHighlighter
 --->

<cfinclude template="plugin/config.cfm" />
<cfhtmlhead text='<link href="/plugins/#request.pluginConfig.getDirectory()#/assets/css/shadmin.css" rel="stylesheet" type="text/css" />' />
<cfsilent>
	<cfset updated = false />
	<cfif structKeyExists(form,"action") and form.action eq "updateSettings">
		<cfset updated = true />
		<cfset request.pluginConfig.setCustomSetting( "shLanguages",form.shLanguages ) />
		<cfset request.pluginConfig.setCustomSetting( "shTheme",form.shTheme ) />
	</cfif>
	<cfset shLanguages = request.pluginConfig.getCustomSetting( "shLanguages" ) />
	<cfset theme = request.pluginConfig.getCustomSetting( "shTheme" ) />
</cfsilent>

<cfsavecontent variable="variables.body">
	<cfoutput>
	<h2>#request.pluginConfig.getName()#</h2>
	<cfif updated>
		<div class="success">Settings Updated</div>
	</cfif>
	<form method="post">
		<input type="hidden" name="action" value="updateSettings" />		
		<dl class="oneColumn">
			<dt class="first">Select Languages for which to include syntax brushes:</dt>
			<dd>
				<ul>			
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="as3" id="as3" <cfif listFind(shLanguages,"as3")> checked</cfif>> ActionScript 3</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="bash" id="bash" <cfif listFind(shLanguages,"bash")> checked</cfif>> Bash</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="coldfusion" id="coldFusion" <cfif listFind(shLanguages,"coldfusion")> checked</cfif>> ColdFusion</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="cpp" id="cpp" <cfif listFind(shLanguages,"cpp")> checked</cfif>> C++</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="cSharp" id="cSharp" <cfif listFind(shLanguages,"cSharp")> checked</cfif>> C##</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="css" id="css" <cfif listFind(shLanguages,"css")> checked</cfif>> CSS</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="delphi" id="delphi" <cfif listFind(shLanguages,"delphi")> checked</cfif>> Delphi</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="diff" id="diff" <cfif listFind(shLanguages,"diff")> checked</cfif>> Diff</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="erlang" id="erlang" <cfif listFind(shLanguages,"erlang")> checked</cfif>> Erlang</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="groovy" id="groovy" <cfif listFind(shLanguages,"groovy")> checked</cfif>> Groovy</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="java" id="java" <cfif listFind(shLanguages,"java")> checked</cfif>> Java</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="javafx" id="javafx" <cfif listFind(shLanguages,"javafx")> checked</cfif>> JavaFX</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="jscript" id="jscript" <cfif listFind(shLanguages,"jscript")> checked</cfif>> JavaScript/JScript</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="perl" id="perl" <cfif listFind(shLanguages,"perl")> checked</cfif>> Perl</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="php" id="php" <cfif listFind(shLanguages,"php")> checked</cfif>> PHP</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="plain" id="plain" <cfif listFind(shLanguages,"plain")> checked</cfif>> Plain</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="powershell" id="powershell" <cfif listFind(shLanguages,"powershell")> checked</cfif>> PowerShell</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="python" id="python" <cfif listFind(shLanguages,"python")> checked</cfif>> Python</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="ruby" id="ruby" <cfif listFind(shLanguages,"ruby")> checked</cfif>> Ruby</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="scala" id="scala" <cfif listFind(shLanguages,"scala")> checked</cfif>> Scala</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="sql" id="sql" <cfif listFind(shLanguages,"sql")> checked</cfif>> SQL</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="vb" id="vb" <cfif listFind(shLanguages,"vb")> checked</cfif>> VBScript</li>
					<li class="checkbox"><input type="checkbox" name="shLanguages" value="xml" id="xml" <cfif listFind(shLanguages,"xml")> checked</cfif>> XML/XHTML</li>
				</ul>		
			</dd>
		
			<dt>Choose SyntaxHighligher Theme:</dt>
			<dd>
				<ul>
					<li><input type="radio" name="shTheme" value="Default" id="default" <cfif theme is "Default"> checked</cfif>> Default</li>
					<li><input type="radio" name="shTheme" value="Django" id="django" <cfif theme is "Django"> checked</cfif>> Django</li>
					<li><input type="radio" name="shTheme" value="Eclipse" id="eclipse" <cfif theme is "Eclipse"> checked</cfif>> Eclipse</li>
					<li><input type="radio" name="shTheme" value="Emacs" id="emacs" <cfif theme is "Emacs"> checked</cfif>> Emacs</li>
					<li><input type="radio" name="shTheme" value="FadeToGrey" id="fadetogrey" <cfif theme is "FadeToGrey"> checked</cfif>> Fade To Grey</li>
					<li><input type="radio" name="shTheme" value="MD Ultra" id="midnight" <cfif theme is "MDUltra"> checked</cfif>> MD Ultra</li>
					<li><input type="radio" name="shTheme" value="Midnight" id="midnight" <cfif theme is "Midnight"> checked</cfif>> Midnight</li>
					<li><input type="radio" name="shTheme" value="RDark" id="rdark" <cfif theme is "RDark"> checked</cfif>> R Dark</li>
				</ul>
			</dd>
		</dl>
		<div id="actionButtons">
			<input type="submit" class="submit" value="Save Settings"/>
		</div>
	</form>
	</cfoutput>
</cfsavecontent>

<cfoutput>#application.pluginManager.renderAdminTemplate(body=variables.body,pageTitle=request.pluginConfig.getName())#</cfoutput>