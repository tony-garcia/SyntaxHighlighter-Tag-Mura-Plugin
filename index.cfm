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
			<dt class="first">Choose SyntaxHighligher Theme:</dt>
			<dd>
				<ul>
					<li><label for="default"><input type="radio" name="shTheme" value="Default" id="default" <cfif theme is "Default"> checked</cfif>> Default</label></li>
					<li><label for="django"><input type="radio" name="shTheme" value="Django" id="django" <cfif theme is "Django"> checked</cfif>> Django</label></li>
					<li><label for="eclipse"><input type="radio" name="shTheme" value="Eclipse" id="eclipse" <cfif theme is "Eclipse"> checked</cfif>> Eclipse</label></li>
					<li><label for="emacs"><input type="radio" name="shTheme" value="Emacs" id="emacs" <cfif theme is "Emacs"> checked</cfif>> Emacs</label></li>
					<li><label for="fadetogrey"><input type="radio" name="shTheme" value="FadeToGrey" id="fadetogrey" <cfif theme is "FadeToGrey"> checked</cfif>> Fade To Grey</label></li>
					<li><label for="mdultra"><input type="radio" name="shTheme" value="MDUltra" id="mdultra" <cfif theme is "MDUltra"> checked</cfif>> MD Ultra</label></li>
					<li><label for="midnight"><input type="radio" name="shTheme" value="Midnight" id="midnight" <cfif theme is "Midnight"> checked</cfif>> Midnight</label></li>
					<li><label for="rdark"><input type="radio" name="shTheme" value="RDark" id="rdark" <cfif theme is "RDark"> checked</cfif>> R Dark</label></li>
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