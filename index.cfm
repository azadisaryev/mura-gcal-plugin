<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="body">
<cfoutput>
<p>GCal Mura plugin v1.3.20110213</p>
<p>Azadi Saryev | azadi.saryev@gmail.com</p>
<p>@license: CC Attribution Sharealike</p>
<p>Configurable Plugin to display a public Google Calendar.</p>
<p>Creates an Extended Component Class Component/GCal.</p>
<p>&nbsp;</p>
<p>Plugin config setting:</p>
<p>
[TODO: list of settings with descriptions]
</p>
</cfoutput>
</cfsavecontent>
<cfoutput>
#application.pluginManager.renderAdminTemplate(body=body,pageTitle=request.pluginConfig.getName())#
</cfoutput>

