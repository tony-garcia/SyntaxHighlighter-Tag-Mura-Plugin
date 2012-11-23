
<!--- prevent direct access to this include --->
<cfif not isDefined("form") or structIsEmpty(form)>
	<cflocation url="/" addtoken="false" />
</cfif>
<cfinclude template="../plugin/config.cfm" />

<cfset shConfig = {
	'collapse' = form.collapse,
	'gutter' = form.gutter,
	'html-script' = form.htmlScript,
	'smart-tabs' = form.smartTabs,
	'tab-size' = form.tabSize,
	'auto-links' = form.autoLinks
} />

<!---<cfset shStrings = {
'expandSource' = form.expandSource,
'help' = form.help,
'alert' = form.alert,
'noBrush' = form.noBrush,
'brushNotHtmlScript' = form.brushNotHtmlScript
} />--->

<cfset request.pluginConfig.setCustomSetting( "shConfig",shConfig ) />
<!---<cfset request.pluginConfig.setCustomSetting( "shStrings",shStrings ) />--->
<cfset request.pluginConfig.setCustomSetting( "shTheme",form.shTheme ) />
<cflocation url="/plugins/#request.pluginConfig.getDirectory()#/index.cfm?updated=true" >
