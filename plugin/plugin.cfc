<cfcomponent output="false" extends="mura.plugin.plugincfc">

	<cfscript>
	variables.pluginConfig = "";
	variables.author = "Azadi Saryev | azadi.saryev@gmail.com";
	variables.pluginVersion = "1.3.20111112";
	variables.dateCreated = createDateTime(2011,02,13,0,0,0);
	variables.packageName = "MuraGCal";
	variables.extendedType = "Component";
	variables.extendSetContainer = "default";
	</cfscript>
	
	<cffunction name="init" returntype="any" access="public" output="false">
		<cfargument name="pluginConfig" type="any" default="" />
		<cfset variables.pluginConfig = arguments.pluginConfig>
	</cffunction>
	
	<cffunction name="install" returntype="void" access="public" output="no">
		<cfscript>
		var moduleid = variables.pluginConfig.getModuleID();
		if ( val(isGCalPluginInstalled()) eq 1 ) {
			upstallGCalSubType();
		} else {
			variables.pluginConfig.getPluginManager().deletePlugin(moduleid);
		};
		application.appInitialized = false;
		</cfscript>
	</cffunction>
	
	<cffunction name="update" returntype="void" access="public" output="false">
		<cfset upstallGCalSubType()>
		<cfset application.appInitialized = false>
	</cffunction>
	
	<cffunction name="delete" returntype="void" access="public" output="false">
		<cfscript>
		var reloadKey = variables.pluginConfig.getConfigBean().getAppReloadKey();
		// don't delete the subTypes if this is being invoked by the deletePlugin() from install()
		if ( val(isGCalPluginInstalled()) eq 1 ) {
			deleteSubType(type=variables.extendedType, subType=variables.packageName);
		};
		application.appInitialized = false;
		</cfscript>
	</cffunction>
	
<!--- ********** HELPERS ********** --->

	<cffunction name="isGCalPluginInstalled" returntype="any" access="private" output="false">
		<cfscript>
			var qoq = "";
			var rs = variables.pluginConfig.getConfigBean().getPluginManager().getAllPlugins();
			var result = 0;
		</cfscript>
		<cfif rs.recordcount>
			<cfquery name="qoq" dbtype="query">
				SELECT *
				FROM rs
				WHERE package = <cfqueryparam value="#variables.packageName#" cfsqltype="cf_sql_varchar" maxlength="100" />
			</cfquery>
			<cfif qoq.recordcount>
				<cfreturn val(qoq.recordcount) />
			</cfif>
		<cfelse>
			<cfreturn result />
		</cfif>
	</cffunction>

	<cffunction name="upstallGCalSubType" returntype="void" access="private" output="false">
		<cfscript>
		var qSites = variables.pluginConfig.getAssignedSites();
		var extendSet = "";
		var attr = "";
		var subType = "";
		var subTypeID = "";
		var parentType = variables.packageName & ' Settings';
		</cfscript>
		<cfloop query="qSites">
			<cfscript>
			// create a new subType //
			subtype = application.classExtensionManager.getSubTypeBean();
			subType.setType( variables.extendedType );
			subType.setSubType( variables.packageName );
			subType.setSiteID( qSites.siteid );
			subType.load();
			subType.setBaseTable( "tcontent" );
			subType.setbaseKeyField( "contentHistID" );
			subType.save();
			subTypeID = subType.getSubTypeID();
			
			// get rid of the 'Default' extendSet
			//subType.getExtendSetByName('Default').delete();
			
			// extendSet: Settings
			extendSet = subType.getExtendSetBean();
			extendSet.setName(parentType);
			extendSet.load();
			extendSet.setContainer(variables.extendSetContainer); //default, basic, custom
			extendSet.save();

			// ATTRIBUTE SETUP
			// create a new attribute for the "default" extend set //
			// none of the extended attributes exist yet, but getAttributeByName({attrName}) will look for one and, since not found, return a new bean to use //
			attr = extendSet.getAttributeByName( "GCalID" );
			attr.setOrderNo(1);
			attr.setLabel( "Google Calendar ID" );
			attr.setHint( "ID of Google Calendar to render. This can be found on Calendar Details tab in Google Calendar settings." );
			attr.setType( "TextBox" );
			attr.setRequired( true );
			attr.setMessage( "Google Calendar ID is required" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalName" );
			attr.setOrderNo(2);
			attr.setLabel( "Google Calendar Title" );
			attr.setHint( "Title of Google Calendar. If blank, default name of selected Calendar will be used. Control display using 'Show Calendar Title?' option below." );
			attr.setType( "TextBox" );
			attr.setRequired( false );
			attr.setDefaultValue( "" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalWidth" );
			attr.setOrderNo(3);
			attr.setLabel( "Calendar Width (px)" );
			attr.setHint( "Width of calendar container, in pixels." );
			attr.setType( "TextBox" );
			attr.setRequired( true );
			attr.setValidation( "Numeric" );
			attr.setMessage( "Calendar width must be a number" );
			attr.setDefaultValue( 300 );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalHeight" );
			attr.setOrderNo(4);
			attr.setLabel( "Calendar Height (px)" );
			attr.setHint( "Height of calendar container, in pixels." );
			attr.setType( "TextBox" );
			attr.setRequired( true );
			attr.setValidation( "Numeric" );
			attr.setMessage( "Calendar height must be a number" );
			attr.setDefaultValue( 300 );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalMode" );
			attr.setOrderNo(5);
			attr.setLabel( "Calendar Mode" );
			attr.setHint( "Select calendar displayed mode." );
			attr.setType( "SelectBox" );
			attr.setRequired( true );
			attr.setMessage( "Select Calendar mode" );
			attr.setDefaultValue( "Agenda" );
			attr.setOptionList( "Agenda^Month^Week" );
			attr.setOptionLabelList( "Agenda view^Month view^Week view" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalPosition" );
			attr.setOrderNo(6);
			attr.setLabel( "Calendar Position" );
			attr.setHint( "Select calendar alignment on page." );
			attr.setType( "SelectBox" );
			attr.setRequired( false );
			attr.setDefaultValue( "Center" );
			attr.setOptionList( "Center^Left^Right" );
			attr.setOptionLabelList( "Center^Float Left^Float Right" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalTitle" );
			attr.setOrderNo(7);
			attr.setLabel( "Show Calendar Title?" );
			attr.setHint( "Select to show or hide calendar's name (default: show)." );
			attr.setType( "RadioGroup" );
			attr.setDefaultValue( 1 );
			attr.setOptionList( "1^0" );
			attr.setOptionLabelList( "Yes^No" );
			attr.save();
	
			attr = extendSet.getAttributeByName( "GCalDate" );
			attr.setOrderNo(8);
			attr.setLabel( "Show Date Selector?" );
			attr.setHint( "Select to show or hide date selector (default: show)." );
			attr.setType( "RadioGroup" );
			attr.setDefaultValue( 0 );
			attr.setOptionList( "1^0" );
			attr.setOptionLabelList( "Yes^No" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalTabs" );
			attr.setOrderNo(9);
			attr.setLabel( "Show Tabs?" );
			attr.setHint( "Select to show or hide calendar mode tabs (default: hide)." );
			attr.setType( "RadioGroup" );
			attr.setDefaultValue( 0 );
			attr.setOptionList( "1^0" );
			attr.setOptionLabelList( "Yes^No" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalNavButtons" );
			attr.setOrderNo(10);
			attr.setLabel( "Show Navigation Buttons?" );
			attr.setHint( "Select to show or hide prev/next day navigation buttons (default: hide)." );
			attr.setType( "RadioGroup" );
			attr.setDefaultValue( 0 );
			attr.setOptionList( "1^0" );
			attr.setOptionLabelList( "Yes^No" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalPrintIcon" );
			attr.setOrderNo(11);
			attr.setLabel( "Show Print Icon?" );
			attr.setHint( "Select to show or hide print icon (default: hide)." );
			attr.setType( "RadioGroup" );
			attr.setDefaultValue( 0 );
			attr.setOptionList( "1^0" );
			attr.setOptionLabelList( "Yes^No" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalBorder" );
			attr.setOrderNo(12);
			attr.setLabel( "Show Border?" );
			attr.setHint( "Select to show or hide border around calendar container (default: hide)." );
			attr.setType( "RadioGroup" );
			attr.setDefaultValue( 0 );
			attr.setOptionList( "1^0" );
			attr.setOptionLabelList( "Yes^No" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalWeekStart" );
			attr.setOrderNo(13);
			attr.setLabel( "Week start day" );
			attr.setHint( "Select first day of week (default: Sunday)." );
			attr.setType( "SelectBox" );
			attr.setDefaultValue( 1 );
			attr.setOptionList( "1^2^3^4^5^6^7" );
			attr.setOptionLabelList( "Sunday^Monday^Tuesday^Wednesday^Thursday^Friday^Saturday" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalColor" );
			attr.setOrderNo(14);
			attr.setLabel( "Color" );
			attr.setHint( "Enter HEX code of calendar events' color." );
			attr.setType( "TextBox" );
			attr.setDefaultValue( "##36C" );
			attr.setValidation( "Regex" );
			attr.setRegex( "^##([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" );
			attr.setMessage( "Color must be a valid Hex code in ##XXX or ##XXXXXX format" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalBgColor" );
			attr.setOrderNo(15);
			attr.setLabel( "Background Color" );
			attr.setHint( "Enter HEX code of calendar's background color." );
			attr.setType( "TextBox" );
			attr.setDefaultValue( "##FFF" );
			attr.setValidation( "Regex" );
			attr.setRegex( "^##([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" );
			attr.setMessage( "Background Color must be a valid Hex code in ##XXX or ##XXXXXX format" );
			attr.save();
			
			attr = extendSet.getAttributeByName( "GCalFooter" );
			attr.setOrderNo(16);
			attr.setLabel( "Calendar Footer" );
			attr.setHint( "Enter text/html to display below the calendar." );
			attr.setType( "TextArea" );
			attr.setDefaultValue( "" );
			attr.save();
			</cfscript>
		</cfloop>
		<cfset application.appInitialized = false>
	</cffunction>
	
	<cffunction name="deleteSubType" returntype="any" access="private" output="false">
		<cfargument name="type" required="true" type="string" />
		<cfargument name="subType" required="true" type="string" />
		<cfset var qSites = variables.pluginConfig.getAssignedSites()>
		<cfset var subTypeBean = application.classExtensionManager.getSubTypeBean()>
		<cfloop query="qSites">
			<cfscript>				
			subTypeBean.setType(arguments.type);
			subTypeBean.setSubType(arguments.subType);
			subTypeBean.setSiteID(qSites.siteid);
			subTypeBean.load();
			subTypeBean.delete();
			</cfscript>
		</cfloop>
	</cffunction>

</cfcomponent>