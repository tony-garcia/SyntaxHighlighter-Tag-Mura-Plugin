<!--- 
	Plugin: SyntaxHighlighter
 --->

<cfinclude template="plugin/config.cfm" />
<cfset request.pluginConfig.addToHTMLHeadQueue("includes/htmlhead.cfm") />
<cfset muraVersion = application.configBean.getVersion() />

<cfsavecontent variable="variables.body">
	<cfoutput>
	<cfif muraVersion lt 6>
		<style type="text/css">
			.ui-widget-content a {
			color: ##FF3A00;
			}
		</style>
	</cfif>
	<h2>#request.pluginConfig.getName()#</h2>

	<div class="tabs initActiveTab">
		<ul class="nav nav-tabs">
			<li><a href="##tabSettings"<cfif muraVersion lt 6> onclick="return false;"<cfelse> data-toggle="tabs"</cfif>><span>Settings</span></a></li>
			<li><a href="##tabDocumentation"<cfif muraVersion lt 6> onclick="return false;"<cfelse> data-toggle="tabs"</cfif>><span>Documentation</span></a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane" id="tabSettings">
				<cfinclude template="includes/settings.cfm" />
			</div>
			<div class="tab-pane" id="tabDocumentation">
				<cfinclude template="includes/documentation.cfm" >		
			</div>
		</div>
	</div>


	<script type="text/javascript">
		(function($){
			// theme preview css switcher
			$('##selTheme').on('change',function(){
				var selectedTheme = $(this).val();
				$('link##theme').attr('href','assets/syntaxhighlighter/styles/shCore' + selectedTheme + '.css')
			});
		})(jQuery);
	</script>
	<cfinclude template="includes/htmlfoot.cfm" >	
	</cfoutput>
</cfsavecontent>

<cfoutput>#application.pluginManager.renderAdminTemplate(body=variables.body,pageTitle=request.pluginConfig.getName())#</cfoutput>