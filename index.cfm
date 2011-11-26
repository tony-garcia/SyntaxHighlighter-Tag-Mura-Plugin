<!--- 
	Plugin: SyntaxHighlighter
 --->

<cfinclude template="plugin/config.cfm" />
<cfsilent>
	<cfset updated = false />
	<cfif structKeyExists(form,"action") and form.action eq "updateSettings">
		<cfset updated = true />
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
			<dt>Choose SyntaxHighligher Theme:</dt>
			<dd>
				<ul>
					<li><input type="radio" name="shTheme" value="Default" id="default" <cfif theme is "Default"> checked</cfif>> Default</li>
					<li><input type="radio" name="shTheme" value="Django" id="django" <cfif theme is "Django"> checked</cfif>> Django</li>
					<li><input type="radio" name="shTheme" value="Eclipse" id="eclipse" <cfif theme is "Eclipse"> checked</cfif>> Eclipse</li>
					<li><input type="radio" name="shTheme" value="Emacs" id="emacs" <cfif theme is "Emacs"> checked</cfif>> Emacs</li>
					<li><input type="radio" name="shTheme" value="FadeToGrey" id="fadetogrey" <cfif theme is "FadeToGrey"> checked</cfif>> Fade To Grey</li>
					<li><input type="radio" name="shTheme" value="MDUltra" id="midnight" <cfif theme is "MDUltra"> checked</cfif>> MD Ultra</li>
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