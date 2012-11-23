<cfinclude template="../plugin/config.cfm" />
<cfset theme = request.pluginConfig.getCustomSetting( "shTheme","Default" ) />
<cfoutput>
<link rel="stylesheet" id="theme" href="#pluginPath#assets/syntaxhighlighter/styles/shCore#theme#.css" type="text/css" media="screen" />
<script src="#pluginPath#assets/syntaxhighlighter/scripts/shCore.js" type="text/javascript"></script>
<script src="#pluginPath#assets/syntaxhighlighter/scripts/shAutoloader.js" type="text/javascript"></script>
</cfoutput>