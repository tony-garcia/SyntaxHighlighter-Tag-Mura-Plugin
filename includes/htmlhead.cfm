<!--- 
	LICENSE INFORMATION:
	
	Copyright (c) 2012 Tony Garcia
	Licensed under the MIT License (http://mit-license.org)
	
	VERSION INFORMATION:
	
	This file is part of SyntaxHighlighter Tag Mura Plugin
	Version 1.0 (November 23, 2012)
 --->
 
 <cfinclude template="../plugin/config.cfm" />
<cfset theme = request.pluginConfig.getCustomSetting( "shTheme","Default" ) />
<cfoutput>
<link rel="stylesheet" id="theme" href="#pluginPath#assets/syntaxhighlighter/styles/shCore#theme#.css" type="text/css" media="screen" />
<script src="#pluginPath#assets/syntaxhighlighter/scripts/shCore.js" type="text/javascript"></script>
<script src="#pluginPath#assets/syntaxhighlighter/scripts/shAutoloader.js" type="text/javascript"></script>
</cfoutput>