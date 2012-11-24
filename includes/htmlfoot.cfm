<cfset shConfig = request.pluginConfig.getCustomSetting("shConfig",structNew()) />
<cfset shStrings = request.pluginConfig.getCustomSetting("shStrings",structNew()) />
<cfoutput>
<!--- only override config values if they don't equal the default value --->
<script type="text/javascript">
	brushPath = '/plugins/#request.pluginConfig.getDirectory()#/assets/syntaxhighlighter/scripts/';
	<cfif structKeyExists( shConfig,"collapse" ) and shConfig["collapse"] neq "false">
		SyntaxHighlighter.defaults['collapse'] = #shConfig["collapse"]#;
	</cfif>
	<cfif structKeyExists( shConfig,"gutter" ) and shConfig["gutter"] neq "true">
		SyntaxHighlighter.defaults['gutter'] = #shConfig["gutter"]#;
	</cfif>
	<cfif structKeyExists( shConfig,"html-script" ) and shConfig["html-script"] neq "false">
		SyntaxHighlighter.defaults['html-script'] = #shConfig["html-script"]#;
	</cfif>
	<cfif structKeyExists( shConfig,"smart-tabs" ) and shConfig["smart-tabs"] neq "true">
		SyntaxHighlighter.defaults['smart-tabs'] = #shConfig["smart-tabs"]#;
	</cfif>
	<cfif structKeyExists( shConfig,"tab-size" ) and shConfig["tab-size"] neq "4">
		SyntaxHighlighter.defaults['tab-size'] = #shConfig["tab-size"]#;
	</cfif>
	<cfif structKeyExists( shConfig,"auto-links" ) and shConfig["auto-links"] neq "true">
		SyntaxHighlighter.defaults['auto-links'] = #shConfig["auto-links"]#;
	</cfif>
	<cfif structKeyExists( shStrings,"expandSource" ) and shStrings["expandSource"] neq "+ expand source">
		SyntaxHighlighter.config.strings.expandSource = '#shStrings["expandSource"]#';
	</cfif>
	<cfif structKeyExists( shStrings,"help" ) and shStrings["help"] neq "?">
		SyntaxHighlighter.config.strings.help = '#shStrings["help"]#';
	</cfif>
	<cfif structKeyExists( shStrings,"noBrush" ) and shStrings["noBrush"] neq "Can't find brush for:">
		SyntaxHighlighter.config.strings.noBrush = '#shStrings["noBrush"]#';
	</cfif>
	<cfif structKeyExists( shStrings,"brushNotHtmlScript" ) and shStrings["brushNotHtmlScript"] neq "Brush wasn't made for html-script option:">
		SyntaxHighlighter.config.strings.brushNotHtmlScript = '#shStrings["brushNotHtmlScript"]#';
	</cfif>
</script>
<script type="text/javascript" src="/plugins/#request.pluginConfig.getDirectory()#/assets/js/shLoader.js"></script>
</cfoutput>