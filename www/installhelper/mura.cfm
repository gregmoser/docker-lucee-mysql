<!--- Setup the Mura download url --->
<cfset downloadURL = "https://github.com/blueriver/MuraCMS/zipball/master" />
<cfset downloadFileName = "mura#createUUID()#.zip" />

<!--- Download & Unzip the Latest Mura --->
<cfhttp url="#downloadURL#" method="get" path="#getTempDirectory()#" file="#downloadFileName#" throwonerror="true" />
<cfzip action="unzip" destination="#getTempDirectory()#" file="#getTempDirectory()##downloadFileName#" />
<cfzip action="list" file="#getTempDirectory()##downloadFileName#" name="dirList" >
<cfset sourcePath = getTempDirectory() & "#listFirst(dirList.name[1],'/')#" />

<!--- Replace this helper app with mura --->
<cfdirectory action="copy" destination="/var/www" directory="#sourcePath#" recurse="true" />

<!--- Delete .zip & expanded --->
<cffile action="delete" file="#getTempDirectory()##downloadFileName#" >
<cfdirectory action="delete" recurse="true" directory="#sourcePath#" >

<cfoutput>
	<cfset env = createObject( "java", "java.lang.System" ).getENV() />
	
	<a href="/">Mura has been installed click here to launch</a>
	<br />
	<br />
	<h3>IMPORTANT: The datasource name for you mura setup is: '#env.MYSQL_DATABASE#'</h3>
	<h3>IMPORTANT: The database type for your mura setup is: MySQL</h3>
	<h3>IMPORTANT: The database username & password should be left blank</h3>
</cfoutput>