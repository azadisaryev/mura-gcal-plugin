<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="readme"><cfinclude template="README" /></cfsavecontent>
<cfsavecontent variable="body">
<p>MuraGCal Mura plugin v1.3.20120318</p>
<p>Configurable Plugin to display a public Google Calendars.</p>
<p>Creates an Extended Component Class Component/MuraGCal.</p>
<p>@author: Azadi Saryev | azadi.saryev@gmail.com</p>
<p>@license: CC Attribution Sharealike</p>
<p>@source: <a href="https://github.com/azadisaryev/mura-gcal-plugin" target="_blank">https://github.com/azadisaryev/mura-gcal-plugin</a></p>
<p>@readme: <a href="https://github.com/azadisaryev/mura-gcal-plugin#readme" target="_blank">https://github.com/azadisaryev/mura-gcal-plugin#readme</a></p>
<p><strong>IMPORTANT:</strong><br />
Version 1.3.20120318 and later of this plugin no longer use <em>'Default'</em> extended attributes set of the Component/MuraGCal component class. <em>'Default'</em> extendset is deleted on install/update of the plugin.<br /><br />
<!---If you are updating previous version of this plugin, and you used the 'Default' extended attributes set of the components you created based on this plugin - they will be deleted.--->
Before updatng the plugin, make sure you update any components you created based on this plugin and configure the 'MuraGCal Settings' extended attributes set in them (on the Extended Attributes tab).</p>
<textarea style="width:100%; height:600px"><cfoutput>#readme#</cfoutput></textarea>
</cfsavecontent>
<cfoutput>#application.pluginManager.renderAdminTemplate(body=body,pageTitle=request.pluginConfig.getName())#</cfoutput>