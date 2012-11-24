<!--- 
	LICENSE INFORMATION:
	
	Copyright (c) 2012 Tony Garcia
	Licensed under the MIT License (http://mit-license.org)
	
	VERSION INFORMATION:
	
	This file is part of SyntaxHighlighter Tag Mura Plugin
	Version 1.0 (November 23, 2012)
 --->
 
<!--- prevent direct access to this include --->
<cfif not isDefined("form") or structIsEmpty(form)>
	<cflocation url="/" addtoken="false" />
</cfif>
<cfinclude template="../plugin/config.cfm" />

<!--- make sure we have a numeric value for tabSize (if not, defaults to current value) --->
<cfif !isNumeric(form.tabSize)>
	<cfset form.tabSize = request.pluginConfig.getCustomSetting( "shConfig" )["tab-size"] />
</cfif>

<cfset shConfig = {
	'collapse' = form.collapse,
	'gutter' = form.gutter,
	'html-script' = form.htmlScript,
	'smart-tabs' = form.smartTabs,
	'tab-size' = round(form.tabSize),
	'auto-links' = form.autoLinks
} />

<cfset shStrings = {
'expandSource' = form.expandSource,
'help' = form.help,
'noBrush' = form.noBrush,
'brushNotHtmlScript' = form.brushNotHtmlScript
} />

<cfset request.pluginConfig.setCustomSetting( "shConfig",shConfig ) />
<cfset request.pluginConfig.setCustomSetting( "shStrings",shStrings ) />
<cfset request.pluginConfig.setCustomSetting( "shTheme",form.shTheme ) />
<cfset request.pluginConfig.getSession().setValue("message","Settings Updated") />
<cflocation url="/plugins/#request.pluginConfig.getDirectory()#/index.cfm" addtoken="false" />