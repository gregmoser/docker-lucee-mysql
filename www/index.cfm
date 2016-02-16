<!--- HUNT FOR AN APP TO INSTALL --->
<cfset env = createObject( "java", "java.lang.System" ).getENV() />
<cfset installable = "mura,slatwall" />
<cfset appToInstall = "" />

<cfif structKyeExists(url, "install") and listFindNoCase(installableList, url.install) >
	<cfset appToInstall = url.install />	
<cfelseif structKeyExists(env, "BASE_APP_INSTALL") and listFindNoCase(installableList, env.BASE_APP_INSTALL)>
	<cfset appToInstall = env.BASE_APP_INSTALL />
</cfif>

<!--- IF ONE IS FOUND, THE DO IT! --->
<cfif len(appToInstall)>
	<!--- RUN THE INSTALL SCRIPT WHICH WILL ADD APP TO WWW, AND REPLACE THIS FILE --->
	<cfinclude template="installhelper/#appToInstall#.cfm" />
	
	<!--- DELETE THE INSTALLHELPER DIRECTORY --->
	<cfdirectory action="delete" recurse="true" directory="/var/www/installhelper" />
	
<!--- IF NOT, THEN GIVE THE STARTUP MESSAGE --->
<cfelse>
	<http>
		<head>
			<title>Lucee Project Setup</title>
		</head>
		<body>
			<p>
				If you are seeing this screen it is because you are running the lucee project for the first time and have not defined a "BASE_APP_INSTALL" enviornment variable.
			</p>
			<p>
				Don't WORRY!  You can install an application right here from this screen administrator.  When the application is installed it will remove this helper app.
				<ul>
					<li><a href="?install=mura">Install Mura</a></li>
					<li><a href="?install=slatwall">Install Slatwall</a></li>	
				</ul>
			</p>
			<p>
				If you would just like to code up your own custom app, go ahead and delete the files in the www directory and get started!
			</p>
			<p>
				TODO: Make this page more informative and better looking :)
			</p>
		</body>
	</http>
</cfif>