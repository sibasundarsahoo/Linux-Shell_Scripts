#!/bin/bash

function user_info {
echo " USE- $0 [OPTIONS]"
echo "----- Options -----"
echo "-c, --create : user creation"
echo "-d, --delete : user delete"
echo "-r, --reset : user's password reset"
echo "-l, --list : user lists"

}

function create_user {
read -p "Enter a user name: " username
if ! id $username >&/dev/null; then
	sudo useradd -m $username
	sudo passwd $username 
	echo "The user $username created successfully"
else 
	echo "User id Exist !!!"
fi
}


function delete_user {
read -p "Enter username for Delete: " username

if ! id "$username" >&/dev/null; then
        echo "User is not present!!"
else
        sudo userdel -r $username >&/dev/null
        echo "The $username is deleted Successfully....!!!!"
fi

}

function reset_passwd {
read -p "Enter the name of the user to reset password: " username
if id $username >&/dev/null; then
        echo "----- Enter your New Password -----"
        sudo passwd $username
        echo "password sucessfully chnaged !!"
else
        echo "User id is not Exist..!!!"
fi
}

function list_user {
echo "------ User List ------"
cat /etc/passwd |awk -F: '$3 >= 1000 { print "User: " $1 " UID: " $3 }'
}

if [ $# -eq 0 ] || [ $1 = "-h" ] || [ $1 = "-help" ]; then
	user_info
fi

while [ $# -gt 0 ]; do
	case "$1" in
		-c|--create)
			create_user
			;;
		-d|--delete)
			delete_user
			;;
		-r|--reset)
			reset_passwd
			;;
		-l|--list)
			list_user
			;;
		*)
			echo "Invalid input check using -h/--help "
			exit 1
			;;
	esac
	shift
done
