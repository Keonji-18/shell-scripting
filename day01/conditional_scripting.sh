#!/bin/bash

<< disclaimer
Using conditonal satements
disclaimer

read -p "Enter name of your country: " country

if [[ $country == "india" || $country ==  "India" ]];
then
	echo "You are Indian"
elif [[ $country == "nepal" || $country == "china" || $country == "pakistan" ||$country == "sri lanka" ]];
then
	echo "You are neighbour"  
else
	echo "You are foreniger"
fi
