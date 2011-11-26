<cfinclude template="../plugin/config.cfm" />
<cfset theme = request.pluginConfig.getCustomSetting( "shTheme","Default" ) />
<cfset shLanguages = request.pluginConfig.getCustomSetting( "shLanguages" ) />
<cfoutput>
<link rel="stylesheet" href="#pluginPath#assets/styles/shCore.css" type="text/css" media="screen" />
<link rel="stylesheet" href="#pluginPath#assets/styles/shTheme#theme#.css" type="text/css" media="screen" />
<script src="#pluginPath#assets/scripts/shCore.js" type="text/javascript"></script>
<cfif listFindNoCase(shLanguages,"as3")>
	<script src="#pluginPath#assets/scripts/shBrushAS3.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"bash")>
	<script src="#pluginPath#assets/scripts/shBrushBash.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"coldfusion")>
	<script src="#pluginPath#assets/scripts/shBrushColdFusion.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"cpp")>
	<script src="#pluginPath#assets/scripts/shBrushCpp.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"cSharp")>
	<script src="#pluginPath#assets/scripts/shBrushCSharp.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"css")>
	<script src="#pluginPath#assets/scripts/shBrushCss.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"delphi")>
	<script src="#pluginPath#assets/scripts/shBrushDelphi.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"diff")>
	<script src="#pluginPath#assets/scripts/shBrushDiff.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"erlang")>
	<script src="#pluginPath#assets/scripts/shBrushErlang.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"groovy")>
	<script src="#pluginPath#assets/scripts/shBrushGroovy.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"java")>
	<script src="#pluginPath#assets/scripts/shBrushJava.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"javafx")>
	<script src="#pluginPath#assets/scripts/shBrushJavaFX.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"jscript")>
	<script src="#pluginPath#assets/scripts/shBrushJScript.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"perl")>
	<script src="#pluginPath#assets/scripts/shBrushPerl.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"php")>
	<script src="#pluginPath#assets/scripts/shBrushPhp.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"plain")>
	<script src="#pluginPath#assets/scripts/shBrushPlain.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"powershell")>
	<script src="#pluginPath#assets/scripts/shBrushPowerShell.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"python")>
	<script src="#pluginPath#assets/scripts/shBrushPython.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"ruby")>
	<script src="#pluginPath#assets/scripts/shBrushRuby.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"scala")>
	<script src="#pluginPath#assets/scripts/shBrushScala.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"sql")>
	<script src="#pluginPath#assets/scripts/shBrushSql.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"vb")>
	<script src="#pluginPath#assets/scripts/shBrushVb.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"xml")>
	<script src="#pluginPath#assets/scripts/shBrushXml.js" type="text/javascript"></script>
</cfif>
<script type="text/javascript">
SyntaxHighlighter.config.clipboardSwf = '#pluginPath#assets/scripts/clipboard.swf';
SyntaxHighlighter.all();
window.onload = function () {dp.SyntaxHighlighter.HighlightAll('code');}
</script>
<!-- This is included by the plugin: #request.pluginConfig.getName()# -->
</cfoutput>