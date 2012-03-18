<cfoutput>
<plugin>

<name>MuraGCal Plugin</name>
<package>MuraGCal</package>
<version>1.3.20120318</version>
<provider>Azadi Saryev</provider>
<providerURL>https://github.com/azadisaryev/mura-gcal-plugin</providerURL>
<category>Utility</category>

<settings>
	<setting>
		<name>GCalID</name>
		<label>Google Calendar ID</label>
		<hint>ID(s) of Google Calendar(s) to render. This can be found on Calendar Details tab in Google Calendar settings. Separate multiple IDs with | (pipe).</hint>
		<type>textBox</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message>Calendar ID is required</message>
		<defaultvalue></defaultvalue>
		<optionlist></optionlist>
		<optionlabellist></optionlabellist>
	</setting>
	<setting>
		<name>GCalName</name>
		<label>Calendar Title</label>
		<hint>Title of this Calendar. Control display using 'Show Calendar Title?' option below.</hint>
		<type>textBox</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message>Calendar Title is required</message>
		<defaultvalue></defaultvalue>
		<optionlist></optionlist>
		<optionlabellist></optionlabellist>
	</setting>
	<setting>
		<name>GCalWidth</name>
		<label>Width</label>
		<hint>Width of calendar container, in px.</hint>
		<type>textBox</type>
		<required>true</required>
		<validation>numeric</validation>
		<regex></regex>
		<message>Calendar width must be a number</message>
		<defaultvalue>300</defaultvalue>
		<optionlist></optionlist>
		<optionlabellist></optionlabellist>
	</setting>
	<setting>
		<name>GCalHeight</name>
		<label>Height</label>
		<hint>Height of calendar container in px.</hint>
		<type>textBox</type>
		<required>true</required>
		<validation>numeric</validation>
		<regex></regex>
		<message>Calendar height must be a number</message>
		<defaultvalue>300</defaultvalue>
		<optionlist></optionlist>
		<optionlabellist></optionlabellist>
	</setting>
	<setting>
		<name>GCalMode</name>
		<label>Calendar Mode</label>
		<hint>Select the way calendar data is displayed</hint>
		<type>selectBox</type>
		<required>true</required>
		<validation></validation>
		<regex></regex>
		<message>Select Calendar mode</message>
		<defaultvalue>AGENDA</defaultvalue>
		<optionlist>AGENDA^MONTH^WEEK</optionlist>
		<optionlabellist>Agenda view^Month view^Week view</optionlabellist>
	</setting>
	<setting>
		<name>GCalPosition</name>
		<label>Calendar Position</label>
		<hint>Select calendar container's alignment on page</hint>
		<type>selectBox</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue>Center</defaultvalue>
		<optionlist>Center^Left^Right</optionlist>
		<optionlabellist>Center^Float Left^Float Right</optionlabellist>
	</setting>
	<setting>
		<name>GCalTitle</name>
		<label>Show Calendar Title?</label>
		<hint>Select to show or hide calendar's name (default: show)</hint>
		<type>radioGroup</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue>1</defaultvalue>
		<optionlist>1^0</optionlist>
		<optionlabellist>Yes^No</optionlabellist>
	</setting>
	<setting>
		<name>GCalDate</name>
		<label>Show Date?</label>
		<hint>Select to show or hide date selector (default: hide)</hint>
		<type>radioGroup</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue>0</defaultvalue>
		<optionlist>1^0</optionlist>
		<optionlabellist>Yes^No</optionlabellist>
	</setting>
	<setting>
		<name>GCalTabs</name>
		<label>Show Tabs?</label>
		<hint>Select to show or hide calendar mode tabs (default: hide)</hint>
		<type>radioGroup</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue>0</defaultvalue>
		<optionlist>1^0</optionlist>
		<optionlabellist>Yes^No</optionlabellist>
	</setting>
	<setting>
		<name>GCalNavButtons</name>
		<label>Show Navigation Buttons?</label>
		<hint>Select to show or hide prev/next buttons (default: hide)</hint>
		<type>radioGroup</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue>0</defaultvalue>
		<optionlist>1^0</optionlist>
		<optionlabellist>Yes^No</optionlabellist>
	</setting>
	<setting>
		<name>GCalPrintIcon</name>
		<label>Show Print Icon?</label>
		<hint>Select to show or hide print icon (default: hide)</hint>
		<type>radioGroup</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue>0</defaultvalue>
		<optionlist>1^0</optionlist>
		<optionlabellist>Yes^No</optionlabellist>
	</setting>
	<setting>
		<name>GCalBorder</name>
		<label>Show Border?</label>
		<hint>Select to show or hide border around calendar container (default: hide)</hint>
		<type>radioGroup</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue>0</defaultvalue>
		<optionlist>1^0</optionlist>
		<optionlabellist>Yes^No</optionlabellist>
	</setting>
	<setting>
		<name>GCalWeekStart</name>
		<label>Week starts on</label>
		<hint>Select week start day</hint>
		<type>selectBox</type>
		<required>true</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue>1</defaultvalue>
		<optionlist>1^2^3^4^5^6^7</optionlist>
		<optionlabellist>Sunday^Monday^Tuesday^Wednesday^Thursday^Friday^Saturday</optionlabellist>
	</setting>
	<setting>
		<name>GCalColor</name>
		<label>Event Colors</label>
		<hint>Hex code of calendar events' color in ##xxx or ##xxxxxx format. If using multiple calendars, separate colors for each with | (pipe). First color is assumed as default and will be used for any calendar which does not have a color specified (i.e. if you specified 3 calendar IDs but only 2 colors, the 3rd calendar will be displayed using the first color code here).</hint>
		<type>textBox</type>
		<required>no</required>
		<validation>regex</validation>
		<regex>^(##([0-9a-fA-F]{3}){1,2}\|?)+$</regex>
		<message>Color must be a valid Hex code in ##xxx or ##xxxxxx format, or a |-delimited list of these.</message>
		<defaultvalue>##36C</defaultvalue>
		<optionlist></optionlist>
		<optionlabellist></optionlabellist>
	</setting>
	<setting>
		<name>GCalBgColor</name>
		<label>Background Color</label>
		<hint>Type Hex code of calendar' background color in ##xxx or ##xxxxxx format.</hint>
		<type>textBox</type>
		<required>no</required>
		<validation>regex</validation>
		<regex>^##([0-9a-fA-F]{3}){1,2}$</regex>
		<message>Background Color must be a valid Hex code in ##xxx or ##xxxxxx format.</message>
		<defaultvalue>##FFF</defaultvalue>
		<optionlist></optionlist>
		<optionlabellist></optionlabellist>
	</setting>
	<setting>
		<name>GCalFooter</name>
		<label>Calendar Footer</label>
		<hint>Text/html to display below the calendar widget</hint>
		<type>textArea</type>
		<required>false</required>
		<validation></validation>
		<regex></regex>
		<message></message>
		<defaultvalue></defaultvalue>
		<optionlist></optionlist>
		<optionlabellist></optionlabellist>
	</setting>
</settings>

<eventHandlers>
	<eventHandler event="onApplicationLoad" component="eventHandlers.gcal" persist="false"/>
</eventHandlers>

<displayobjects location="global"/>

</plugin>
</cfoutput>