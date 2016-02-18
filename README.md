# Docker Lucee MySQL
This is a starter template git repo for running a Database dirven applications on Docker with Lucee &amp; MySQL. It is designed to be copied and used as a git repo for your next web application project.

If you plan to use an open source CFML application (Mura, Slatwall, etc.), this repo also has some code for installing those types of applications automatically on first run.  We welcome any other open source applications to be added to this repo as well.

Not only will this simplify team development, but it will also allow you to run your application in the cloud using tutum by docker for test, staging & production enviornments.

# Key Features

- Run your application with no install of Lucee or MySQL
- Consistent development enviornment for all team members
- Take DB snapshots during development, and pass around to other team members with the codebase (via git)
- Push application to cloud using Tutum / Cloud Provider (AWS, DigitalOcean, Google, etc.)
- Configure your development enviornments via repo
- Configure your production enviornments via repo


# Requirements

- git
- docker toolbox (with docker-compose version >= 1.6)


# Quickstart

To get up and running simply navigate to where you want to run your project and do:

```
git clone https://github.com/gregmoser/docker-lucee-mysql.git myProjectName
```

Then open up the docker quickstart terminal that was installed with docker toolbox, and make a note of the IP address it is running on.

Navigate to the new project directory

```
cd myProjectName
```

run the following command to start your project

```
docker-compose up
```

Thats It!  Navigate to the IP address of the docker machine you're running (that you noted above when starting the terminal).  You can also open kitematic to see the web app running, and click on the web preview link


# Important Next Steps

Now that you've got the application up and running it's important to take a few next steps so that the repo works for YOUR project.

Open the git config
```
/myProjectName/.git/config
```

It should look something like this:
```
[core]
	symlinks = false
	repositoryformatversion = 0
	filemode = true
	logallrefupdates = true
	precomposeunicode = true
[remote "origin"]
	url = https://github.com/gregmoser/docker-lucee-mysql.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
```

You want to change the url under origin to be something like
```
[remote "origin"]
	url = https://github.com/MY_GITHUB_USERNAME/MY_PROJECT_NAME.git
	fetch = +refs/heads/*:refs/remotes/origin/*
```

From that point forward all of your team members will just pull from this new git repo that you have setup.  They will be starting from the point that you left off.  All of your projects code lives in the /www folder so you and your co-workers can work, commit, push & pull as needed.
