#!/bin/bash

<< task
	Deploy the django_app and 
	Handle the code errors
task

code_clone(){
	echo "Cloning the app"
	git clone https://github.com/LondheShubham153/django-notes-app.git

}

install_requirements(){
	echo "Installing dependencies"
	sudo apt-get install docker.io ngnix-y
}

required_restarts(){
	sudo systemctl enable docker
	sudo systemctl enable nginx
}

depoloy(){
	docker build -t notes_app .
	docker run -d -p 8000:8000 notes_app:latest
}


echo "******** DEPLOYMENT STARTED *************"
code clone
install_requirements
required_restarts
deploy
echo "******** DEPLOYMENT DONE *************"
