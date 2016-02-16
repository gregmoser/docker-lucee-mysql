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
- docker toolbox


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


All of your projects code lives in the /www folder and you can work and commit as needed.  Then other team members can just pull down the codebase and GO! 
