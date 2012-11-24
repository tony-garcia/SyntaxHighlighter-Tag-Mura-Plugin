<!--- 
	LICENSE INFORMATION:
	
	Copyright (c) 2012 Tony Garcia
	Licensed under the MIT License (http://mit-license.org)
	
	VERSION INFORMATION:
	
	This file is part of SyntaxHighlighter Tag Mura Plugin
	Version 1.0 (November 23, 2012)
 --->

<cfcomponent extends="mura.plugin.plugincfc">

	<cffunction name="init" returntype="any" access="public" output="false">
		<cfargument name="pluginConfig" type="any" default="" />

		<cfset variables.pluginConfig = arguments.pluginConfig />

		<cfreturn this />
	</cffunction>

	<cffunction name="install" returntype="void" access="public" output="false">
		<cfset pluginConfig.setCustomSetting("shTheme","Default") />
	</cffunction>

	<cffunction name="update" returntype="void" access="public" output="false">
		
	</cffunction>

	<cffunction name="delete" returntype="void" access="public" output="false">
		
	</cffunction>

</cfcomponent>