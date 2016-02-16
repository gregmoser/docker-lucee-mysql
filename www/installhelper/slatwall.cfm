<!--- Setup the Slatwall download url --->
<cfset downloadURL = "https://github.com/ten24/slatwall/zipball/master" />
<cfset downloadFileName = "slatwall#createUUID()#.zip" />

<!--- Download & Unzip the Latest Slatwall --->
<cfhttp url="#downloadURL#" method="get" path="#getTempDirectory()#" file="#downloadFileName#" throwonerror="true" />
<cfzip action="unzip" destination="#getTempDirectory()#" file="#getTempDirectory()##downloadFileName#" />
<cfzip action="list" file="#getTempDirectory()##downloadFileName#" name="dirList" >
<cfset sourcePath = getTempDirectory() & "#listFirst(dirList.name[1],'/')#" />

<!--- Replace this helper app with slatwall --->
<cfdirectory action="copy" destination="/var/www" directory="#sourcePath#" recurse="true" />

<!--- Delete .zip & expanded --->
<cffile action="delete" file="#getTempDirectory()##downloadFileName#" >
<cfdirectory action="delete" recurse="true" directory="#sourcePath#" >

<!--- Update the config with the correct datasource name --->
<cfset env = createObject( "java", "java.lang.System" ).getENV() />
<cffile action="write" file="/var/www/custom/config/configApplication.cfm" output="<cfset this.datasource.name = '#env.MYSQL_DATABASE#' />" />

<cfoutput><a href="/">Slatwall has been installed click here to launch</a></cfoutput>