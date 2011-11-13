<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="readme"><cfinclude template="README" /></cfsavecontent>
<cfsavecontent variable="body">
<cfoutput>
<p>MuraGCal Mura plugin v1.3.20111112</p>
<p>Azadi Saryev | azadi.saryev@gmail.com</p>
<p>@license: CC Attribution Sharealike</p>
<p>Configurable Plugin to display a public Google Calendar.</p>
<p>Creates an Extended Component Class Component/MuraGCal.</p>
<!---<p>#listchangedelims(readme, '<br />', chr(10)&chr(13))#</p>--->
<textarea style="width:100%; height:300px">#readme#</textarea>
</cfoutput>
</cfsavecontent>
<cfoutput>
#application.pluginManager.renderAdminTemplate(body=body,pageTitle=request.pluginConfig.getName())#
</cfoutput>

