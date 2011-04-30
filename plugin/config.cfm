<cfsilent>
<cfif not structkeyexists(request, "pluginConfig")>
	<cfset package = listLast(listGetat(getDirectoryFromPath(getCurrentTemplatePath()),listLen(getDirectoryFromPath(getCurrentTemplatePath()),application.configBean.getFileDelim())-1,application.configBean.getFileDelim()),"_")>
	<cfset request.pluginConfig = application.pluginManager.getConfig(package)>
	<cfset hasPluginConfig = false>
<cfelse>
	<cfset hasPluginConfig = true>
</cfif>
<cfif ( not hasPluginConfig ) and ( not isUserInRole('S2') )>
	<cfif ( not structKeyExists(session, "siteID") ) or ( not application.permUtility.getModulePerm(request.pluginConfig.getValue('moduleID'), session.siteid) )>
		<cflocation url="#application.configBean.getContext()#/admin/" addtoken="false">
	</cfif>
</cfif>
<cfif not isdefined('$')>
	<cfset $ = application.serviceFactory.getBean("muraScope").init(session.siteID)>
</cfif>
</cfsilent>