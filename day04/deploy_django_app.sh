#!/bin/bash

<< task
	Deploy the django_app and 
	Handle the code errors
	Apply it in ubuntu server using cloud 
task

code_clone(){
	echo "Cloning the app"
	git clone git@github.com:LondheShubham153/django-notes-app.git
}

install_requirements(){
	echo "Installing dependencies"
	# sudo apt-get install docker.io nginx 
	# brew install --cask docker
        brew install nginx docker-compose
}

required_restarts(){
	# sudo chown $USER /var/run/docker.sock  # Permission needed
	# sudo systemctl start docker
	# sudo systemctl  start nginx
	# sudo systemctl restart docker # Not needed in running locally
	
	open -a Docker
	brew services start nginx 

}


deploy(){
	docker build -t notes_app .
	# docker run -d -p 8000:8000 notes_app:latest
	 docker compose up -d
}


echo "******** DEPLOYMENT STARTED *************"


if ! code_clone; then
	echo "The code directory alredy exists"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "Requirements installation failed"
	exit 1
fi

if ! required_restarts; then
	echo "System fault identified"
	exit 1
fi

if ! deploy; then
	echo "Deployment failed"
	# sendmail
	exit 1
fi
echo "******** DEPLOYMENT DONE *************"
