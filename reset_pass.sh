#!/bin/bash

read -p "Enter the name of the user to reset password: " username
if id $username >&/dev/null; then
	echo "----- Enter your New Password -----"
	sudo passwd $username
	echo "password sucessfully chnaged !!"
else
	echo "User id is not Exist..!!!"
fi

