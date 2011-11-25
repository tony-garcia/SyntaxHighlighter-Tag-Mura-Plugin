<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	
	<cffunction name="onApplicationLoad" access="public" returntype="void" output="false">
		<cfargument name="$" type="any" />
		<cfset pluginConfig.addEventhandler(this) />
	</cffunction>
	
	<cffunction name="onRenderStart" access="public" output="false" returntype="any">
		<cfargument name="$">
		<cfset pluginConfig.addToHTMLHeadQueue("includes/htmlhead.cfm") />
	</cffunction>

	<cffunction name="onRenderEnd" access="public" output="false" returntype="void">
		<cfargument name="$">
		<cfset var output = "" />
<!---		<cfif pluginConfig.getSetting( "isEnabled" ) eq "yes">
			<cfset output = $.event( "__MuraResponse__" )>
			<cfset output = highlightCode( output ) />
			<cfset $.event( "__MuraResponse__", output ) />
		</cfif>--->
	</cffunction>
	
	<cffunction name="highlightCode" access="private" returntype="any" output="false">
		<cfargument name="contentBody" required="true" />
		<cfset var retStr = arguments.contentBody />
		<cfset var codeBody = "" />
		<cfset var highlightedCode = "" />
		<cfset var noMoreMatches = false />
		<cfset var startPosition = 1 />
		<cfset var language = "" />
		<cfset var startMatch = "" />
		<cfset var endMatch = "" />
		
		<cfloop condition="noMoreMatches is false">
			<cfset startMatch = reFindNoCase("\[code=([-_[:alnum:]]+)\]", arguments.contentBody, startPosition, true) />
			<cfif startMatch.len[1] eq 0>
				<cfset noMoreMatches = true />
			<cfelse>
				<!--- get the end [/code] tag position --->
				<cfset endMatch = findNoCase("[/code]",arguments.contentBody,startMatch.pos[1] + startMatch.len[1]) />
				<!--- get code body between (and including) [code/] tags --->
				<cfset codeBody = mid(arguments.contentBody,startMatch.pos[1],(endMatch - startMatch.pos[1]) + 7) />
				<!--- get the syntax language specified --->
				<cfset language = mid(arguments.contentBody, startMatch.pos[2], startMatch.len[2]) />
				<!--- replace <br /> and <p> tags with line breaks in the code block --->
				<cfset highlightedCode = replaceNoCase(codeBody,"<br />",variables.break,"all") />
				<cfset highlightedCode = replaceList(highlightedCode,"<p>,</p>,<p></p>,<p> </p>","#variables.break##variables.break#") />
				<!--- replace [code] tags with <pre> tags --->
				<cfset highlightedCode = rereplaceNoCase(highlightedCode,"\[code=([-_[:alnum:]]+)\]",'<pre class="brush: #language#">',"one") />
				<cfset highlightedCode = replaceNoCase(highlightedCode,"[/code]","</pre>","one") />
				<!--- put the processed code block back into the content body --->
				<cfset retStr = replaceNoCase(retStr,codeBody,highlightedCode,"all") />
				<cfset startPosition = startMatch.pos[1] + len(codeBody) />
			</cfif>
		</cfloop>
		<cfreturn retStr />
	</cffunction>

</cfcomponent>