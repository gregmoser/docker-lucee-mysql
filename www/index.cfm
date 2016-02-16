<cfset env = createObject( "java", "java.lang.System" ).getENV() />

<cfif structKeyExists(env, "BASE_APP_INSTALL") and listFindNoCase("mura,slatwall", env.BASE_APP_INSTALL)>
	<cfinclude template="install-#env.BASE_APP_INSALL#" />
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
					<li><a href="install-mura.cfm">Install Mura</a></li>
					<li><a href="install-slatwall.cfm">Install Slatwall</a></li>	
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