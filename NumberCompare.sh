#!/bin/bash

#comparing two Numbers

#ask user to input Numbers 
read -p "Enter 1st number:" num1
read -p "Enter 2nd Number:" num2

#compare numbers
#for number Comparision we use (-eq , -ne , -lt , -gt , -ge)

if [[ "$num1" -eq "$num2" ]];then
	echo "Hey you put same Number!!"
else
	echo "1st num is $num1 ans 2nd num is $num2 :)"
fi

