<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	
	<cffunction name="onApplicationLoad" access="public" returntype="void" output="false">
		<cfargument name="$" type="any" />
		<cfset initSettings() />
		<cfset pluginConfig.addEventhandler(this) />
	</cffunction>
	
	<cffunction name="onSiteRequestStart" access="public" returntype="void" output="false">
		<cfargument name="$" type="any" />
		<!--- make sure settings are always available --->
		<cfif structIsEmpty( pluginConfig.getCustomSetting( "shConfig",structNew() ) ) or structIsEmpty( pluginConfig.getCustomSetting( "shConfig",structNew() ) )>
			<cfset initSettings() />
		</cfif>
	</cffunction>
	
	<cffunction name="onRenderStart" access="public" output="false" returntype="any">
		<cfargument name="$">
		<cfset pluginConfig.addToHTMLHeadQueue("includes/htmlhead.cfm") />
		<cfset pluginConfig.addToHTMLFootQueue("includes/htmlfoot.cfm") />
	</cffunction>
	
	<cffunction name="onRenderEnd" access="public" output="false" returntype="void">
		<cfargument name="$">
		<cfset var output = "" />
		<cfset output = $.event( "__MuraResponse__" )>
		<cfset output = highlightCode( output ) />
		<cfset $.event( "__MuraResponse__", output ) />
	</cffunction>
	
	<cffunction name="highlightCode" access="private" returntype="any" output="false">
		<cfargument name="contentBody" required="true" />
		<cfset var retStr = arguments.contentBody />
		<cfset var break = chr(13) & chr(10) />
		<cfset var codeBody = "" />
		<cfset var highlightedCode = "" />
		<cfset var noMoreMatches = false />
		<cfset var startPosition = 1 />
		<cfset var attributes = "" />
		<cfset var title = "" />
		<cfset var tagAttribs = structNew() />
		<cfset var startMatch = "" />
		<cfset var endMatch = "" />
		<cfset var attributeList = "lang,title,highlight,auto-links,class-name,collapse,first-line,gutter,html-script,smart-tabs,tab-size" />
		<cfset var thisAttrib = "" />
		<cfset var pretag = "" />
		
		<cfloop condition="noMoreMatches is false">
			<cfset startMatch = reFindNoCase("\[code([ ]*.+?)\]", arguments.contentBody, startPosition, true) />
			<cfif startMatch.len[1] eq 0>
				<cfset noMoreMatches = true />
			<cfelse>
				<!--- get the end [/code] tag position --->
				<cfset endMatch = findNoCase("[/code]",arguments.contentBody,startMatch.pos[1] + startMatch.len[1]) />
				<!--- get code body between (and including) [code/] tags --->
				<cfset codeBody = mid(arguments.contentBody,startMatch.pos[1],(endMatch - startMatch.pos[1]) + 7) />
				<!--- get the tag attributes --->
				<cfset attributes = mid(arguments.contentBody, startMatch.pos[2], startMatch.len[2]) />
				<!--- parse the attributes --->
				<cfloop list="#attributeList#" index="thisAttrib">
					<cfset tagAttribs[thisAttrib] = reFindNoCase( "#thisAttrib#='[^']+'[ ]*",attributes,1,true ) />
					<cfif tagAttribs[thisAttrib]["pos"][1] neq 0>
						<cfset tagAttribs[thisAttrib] = listLast( mid( attributes,tagAttribs[thisAttrib]["pos"][1],tagAttribs[thisAttrib]["len"][1] ),"=" ) />
						<!--- remove quotes from attribute value --->
						<cfset tagAttribs[thisAttrib] = trim(replace( tagAttribs[thisAttrib],"'","","all" )) />
					<cfelse>
						<cfset structDelete( tagAttribs,thisAttrib ) />	
					</cfif>
				</cfloop>
				<!---<cfdump var="#tagAttribs#" abort="true" />--->
				<cfif structKeyExists( tagAttribs,"title" )>
					<cfset title = tagAttribs.title>
				<cfelse>
					<cfset title = "">
				</cfif>
				<!--- strip <br /> and <p> tags --->
				<cfset highlightedCode = replaceNoCase(codeBody,"<br />","","all") />
				<cfset highlightedCode = replaceList(highlightedCode,"<p>,</p>,<p></p>,<p> </p>", break) />
				<!--- replace [code] tags with <pre> tags --->
				<cfset pretag = buildPretag( tagAttribs ) />
				<!---<cfset pretag = '<pre class="brush: #language#">' />--->
				<cfif len(title)>
					<cfset pretag = replace( pretag,">",' title="#title#">',"one" ) />
				</cfif>
				<cfset highlightedCode = rereplaceNoCase(highlightedCode,"\[code([ ]*.+?)\]",pretag,"one") />
				<cfset highlightedCode = replaceNoCase(highlightedCode,"[/code]","</pre>","one") />
				<!--- put the processed code block back into the content body --->
				<cfset retStr = replaceNoCase(retStr,codeBody,highlightedCode,"all") />
				<cfset startPosition = startMatch.pos[1] + len(codeBody) />
			</cfif>
		</cfloop>
		<cfreturn retStr />
	</cffunction>
	
	<cffunction name="buildPretag" access="private" output="false" returntype="String">
		<cfargument name="tagAttribs" type="struct" required="true" />
		
		<cfset var  thisAttrib = "" />
		<cfset var language = arguments.tagAttribs["lang"] />
		<cfset var pretag = '<pre class="brush: #language#' />
		<cfif structKeyExists( arguments.tagAttribs,"highlight" ) and listLen( arguments.tagAttribs.highlight ) gt 0>
			<cfif listLen( arguments.tagAttribs["highlight"] ) eq 1>
				<cfset pretag = listAppend( pretag," highlight: #arguments.tagAttribs.highlight#",";" ) />
			<cfelse>
				<cfset pretag = listAppend( pretag," highlight: [#arguments.tagAttribs.highlight#]",";" ) />
			</cfif>
		</cfif>
		<cfloop collection="#arguments.tagAttribs#" item="thisAttrib">
			<cfif not listFindNoCase( "lang,title,highlight",thisAttrib )>
				<cfset pretag = listAppend( pretag," #thisAttrib#: #arguments.tagAttribs[thisAttrib]#",";" ) />
			</cfif>
		</cfloop>
		<cfset pretag &= '">' />
		<cfreturn pretag />
	</cffunction>
	
	<cffunction name="initSettings" access="public" returntype="void" output="false">
		<cfset var shConfig = pluginConfig.getCustomSetting( "shConfig",structNew() ) />
		<cfset var shStrings = pluginConfig.getCustomSetting( "shStrings",structNew() ) />
		<cfif structIsEmpty( shConfig )>
			<cfset shConfig = {
				'collapse' = "false",
				'gutter' = "true",
				'html-script' = "false",
				'smart-tabs' = "true",
				'tab-size' = "4",
				'auto-links' = "true"
			} />
			<cfset pluginConfig.setCustomSetting("shConfig",shConfig) />
		</cfif>
		<cfif structIsEmpty( shStrings )>
			<cfset shStrings = {
				'expandSource' = "+ expand source",
				'help' = "?",
				'alert' = "SyntaxHighlighter\n\n",
				'noBrush' = "Can't find brush for:",
				'brushNotHtmlScript' = "Brush wasn't made for html-script option:"
			} />
			<cfset pluginConfig.setCustomSetting("shStrings",shStrings) />
		</cfif>

	</cffunction>

</cfcomponent>