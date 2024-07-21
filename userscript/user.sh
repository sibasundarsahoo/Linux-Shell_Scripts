#!/bin/bash

read -p "Enter a user name: " username
if ! id $username >&/dev/null; then
	sudo adduser $username
	read -p "enter password :" pasword
	sudo passwd $pasword $username
else
	echo "User is exist!!"
fi

