<!---
	MuraGCal Plugin event handler cfc.
	@version: 1.3.20111112
	@author: Azadi Sayev azadi.saryev@gmail.com
	@url: https://github.com/azadisaryev/mura-gcal-plugin
--->
<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onApplicationLoad">
		<cfargument name="$">
		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
	
	<cffunction name="onRenderStart">
		<cfargument name="$">
		<cfset $.muraGCal = this>
	</cffunction>
	
	<cffunction name="onComponentMuraGCalBodyRender" output="no" returntype="string">
		<cfargument name="$">
		<cfscript>
		var cBean = $.component();
		var str = "";
		str = '<iframe class="MuraGCal_iframe" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="true" src="https://www.google.com/calendar/embed?src=' & urlencodedformat($.component('GCalID')) & '&amp;showCalendars=0&amp;showTz=0&amp;mode=' & $.component('GCalMode') & '&amp;width=' & $.component('GCalWidth') & '&amp;height=' & $.component('GCalHeight') & '&amp;wkst=' & $.component('GCalWeekStart') & '&amp;bgcolor=' & urlencodedformat($.component('GCalBgColor')) & '&amp;color=' & urlencodedformat($.component('GCalColor'));
		if ( not val($.component('GCalTitle')) ) {
			str = str & '&amp;showTitle=0';
		}
		else {
			if ( len(trim($.component('GCalName'))) ) { str = str & '&amp;title=' & urlencodedformat(trim($.component('GCalName'))); }
		}
		if ( not val($.component('GCalDate')) ) { str = str & '&amp;showDate=0'; }
		if ( not val($.component('GCalTabs')) ) { str = str & '&amp;showTabs=0'; }
		if ( not val($.component('GCalNavButtons')) ) { str = str & '&amp;showNav=0'; }
		if ( not val($.component('GCalPrintIcon')) ) { str = str & '&amp;showPrint=0'; }
		str = str & '" width="' & $.component('GCalWidth') & '" height="' & $.component('GCalHeight') & '" frameborder="0" scrolling="no" style="margin:0;';
		if ( val($.component('GCalBorder')) ) {
			str = str & 'border:1px solid ##777;';
		}
		else {
			str = str & 'border-width:0;';
		}
		str = str & 'float:';
		if ( $.component('GCalPosition') eq 'Left' or $.component('GCalPosition') eq 'Right' ) {
			str = str & lcase($.component('GCalPosition')) & ';';
		}
		else {
			str = str & 'none !important;';
		}
		str = str & '"></iframe>';
		if ( len(trim($.component('GCalFooter'))) ) str = str & '<div class="MuraGCal_footer" style="clear:both;">' & trim($.component('GCalFooter')) & '</div>';
		if ( $.component('GCalPosition') eq 'Center' ) { str = '<div class="MuraGCal" style="margin:0 auto;">' & trim(str) & '</div>' }
		</cfscript>
		<cfreturn str />
	</cffunction>
	
</cfcomponent>