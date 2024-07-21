#!/bin/bash

read -p "Please Enter your Name:" name
read -p "Your Id please:" id

echo "Hiii $name you are Now $USER user and working in $PWD directory."

while true; do
  # Check for arguments and execute BuiltinVar.sh if none are provided
  if [ -z "$1" ]; then
    echo "Running BuiltinVar.sh..."
    ./BuiltinVar.sh
  fi

  # Prompt for arguments or exit
  read -p "Enter argument (Y/n or 'q' to quit): " argument

  # Handle user input (case-insensitive)
  case $argument in
    [Yy])  # Matches uppercase or lowercase "Y" for potential future functionality
      # You could add functionality here if the user wants to run BuiltinVar.sh again
      ;;
    [Nn]*)  # Matches any input starting with "N" or empty input (no argument)
      break;  # Exit the loop
      ;;
    q)
      break;  # Exit the loop on 'q'
      ;;
    *)
      echo "Invalid input. Please enter 'Y' (for potential future use), 'n' (to skip), or 'q' (to quit)."
      ;;
  esac
done

echo "Exiting..."
