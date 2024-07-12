#!/bin/bash
<<cmnt
#for display the information about options

function user_info {
echo "Usage: ./$0 [OPTIONS]"
echo "Options:"
echo " -c or --create : For User creation"
echo " -d or --delete : For User creation"
echo " -r or --reset : For User creation"
echo " -l or --list : For User creation"
echo " -h or --help : For User creation"

}

#for creating user

function create_user {
read -p "Enter your username: " username

if  id "$username" &>/dev/null; then
	echo "The $username is Already exist!!"
else
	read -sp "Enter a password for $username:" password
	sudo useradd -m -p "$password" "$username"
	echo "The username $username is created successfully."
fi
}

#foe user delete

function delete_user {
read -p "Enter the username which you want to delete: " username

if id "$username" &>/dev/null; then
	sudo userdel -r $username
else
	echo "The $username is not Exist!!"
fi
}

#for reset the password

function psw_reset {
read -p "Enter the user name which you want to set passwprd: " username

if id "$username" &>/dev/null; then
	read -sp "Enter the password for $username: " password
	echo "$username:$password" | chpasswd
	echo "Your Password Changed for $username"
else
	echo "Error!! The $username does not exist"
fi
}

#for list all users

function list_user {
echo "list all users:"
cat /etc/passwd | awk -F: ' $3 >= 1000 { print "-" $1 ," UID:" $3 } '
}

#for help

if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ];then
	user_info
	exit 0
fi

while [ $# -ne 0 ];do
	case "$1" in
		-c|--create)
			create_user
			;;
		-d|--delete)
			delete_user
			;;
		-r|--reset)
			psw_reset
			;;
		-l|--list)
			list_user
			;;
		*)
			echo "Error! please use --help"
			exit 0
	esac
	shift
done
cmnt

# Function to display usage information and available options
function display_usage {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -c, --create     Create a new user account."
    echo "  -d, --delete     Delete an existing user account."
    echo "  -r, --reset      Reset password for an existing user account."
    echo "  -l, --list       List all user accounts on the system."
    echo "  -h, --help       Display this help and exit."
}

# Function to create a new user account
function create_user {
    read -p "Enter the new username: " username

    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "Error: The username '$username' already exists. Please choose a different username."
    else
        # Prompt for password (Note: You might want to use 'read -s' to hide the password input)
        read -p "Enter the password for $username: " password

        # Create the user account
        sudo useradd -m -p "$password" "$username"
        echo "User account '$username' created successfully."
    fi
}

# Function to delete an existing user account
function delete_user {
    read -p "Enter the username to delete: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        sudo userdel -r "$username"  # -r flag removes the user's home directory
        echo "User account '$username' deleted successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}

# Function to reset the password for an existing user account
function reset_password {
    read -p "Enter the username to reset password: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        # Prompt for password (Note: You might want to use 'read -s' to hide the password input)
        read -p "Enter the new password for $username: " password

        # Set the new password
        echo "$username:$password" | chpasswd
        echo "Password for user '$username' reset successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}

# Function to list all user accounts on the system
function list_users {
    echo "User accounts on the system:"
    cat /etc/passwd | awk -F: '{ print "- " $1 " (UID: " $3 ")" }'
}

# Check if no arguments are provided or if the -h or --help option is given
if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    display_usage
    exit 0
fi

# Command-line argument parsing
while [ $# -gt 0 ]; do
    case "$1" in
        -c|--create)
            create_user
            ;;
        -d|--delete)
            delete_user
            ;;
        -r|--reset)
            reset_password
            ;;
        -l|--list)
            list_users
            ;;
        *)
            echo "Error: Invalid option '$1'. Use '--help' to see available options."
            exit 1
            ;;
    esac
    shift
done

