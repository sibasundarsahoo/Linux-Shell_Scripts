#!/bin/bash

read -p "Enter username for Delete: " username

if ! id "$username";then
	echo "User is not pesent!!"
else
	sudo userdel -r $username
	echo "The $1 is deleted Successfully....!!!!"
fi
