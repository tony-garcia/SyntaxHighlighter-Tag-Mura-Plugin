<!--- 
	LICENSE INFORMATION:
	
	Copyright (c) 2012 Tony Garcia
	Licensed under the MIT License (http://mit-license.org)
	
	VERSION INFORMATION:
	
	This file is part of SyntaxHighlighter Tag Mura Plugin
	Version 1.0 (November 23, 2012)
 --->

<cfsilent>
<cfif not structKeyExists(request,"pluginConfig")>
	<cfset pluginID=listLast(listGetat(getDirectoryFromPath(getCurrentTemplatePath()),listLen(getDirectoryFromPath(getCurrentTemplatePath()),application.configBean.getFileDelim())-1,application.configBean.getFileDelim()),"_")>
	<cfset request.pluginConfig=application.pluginManager.getConfig(pluginID)>
	<cfset request.pluginConfig.setSetting("pluginMode","Admin")/>
</cfif>

<cfif request.pluginConfig.getSetting("pluginMode") eq "Admin" and not isUserInRole('S2')>
	<cfif not structKeyExists(session,"siteID") or not application.permUtility.getModulePerm(request.pluginConfig.getValue('moduleID'),session.siteid)>
		<cflocation url="#application.configBean.getContext()#/admin/" addtoken="false">
	</cfif>
</cfif>
</cfsilent>