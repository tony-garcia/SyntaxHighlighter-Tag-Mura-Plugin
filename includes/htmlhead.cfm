<cfinclude template="../plugin/config.cfm" />
<cfset theme = request.pluginConfig.getCustomSetting( "shTheme","Default" ) />
<cfset shLanguages = request.pluginConfig.getCustomSetting( "shLanguages" ) />
<cfoutput>
<link rel="stylesheet" href="#pluginPath#assets/syntaxhighlighter/styles/shCore#theme#.css" type="text/css" media="screen" />
<script src="#pluginPath#assets/syntaxhighlighter/scripts/shCore.js" type="text/javascript"></script>
<cfif listFindNoCase(shLanguages,"as3")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushAS3.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"bash")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushBash.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"coldfusion")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushColdFusion.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"cpp")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushCpp.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"cSharp")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushCSharp.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"css")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushCss.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"delphi")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushDelphi.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"diff")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushDiff.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"erlang")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushErlang.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"groovy")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushGroovy.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"java")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushJava.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"javafx")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushJavaFX.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"jscript")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushJScript.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"perl")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushPerl.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"php")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushPhp.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"plain")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushPlain.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"powershell")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushPowerShell.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"python")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushPython.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"ruby")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushRuby.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"scala")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushScala.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"sql")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushSql.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"vb")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushVb.js" type="text/javascript"></script>
</cfif>
<cfif listFindNoCase(shLanguages,"xml")>
	<script src="#pluginPath#assets/syntaxhighlighter/scripts/shBrushXml.js" type="text/javascript"></script>
</cfif>
</cfoutput>