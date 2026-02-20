#!/bin/bash

create_directory(){
	mkdir $1
}

if ! create_directory demo; then
	echo "This code will not be exectued beccause directory already exist"
	exit 1
fi
echo "This will not work because code is interrupted"

