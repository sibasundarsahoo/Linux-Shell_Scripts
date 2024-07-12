#!/bin/bash

# lets put all arguments on each variable

dirname=$1
start_dir=$2
end_dir=$3

#For right arguments
if [ $# -ne 3 ]; then     # $#-> is use for no. of Arguments.
	echo "Please provide 3 Arguments!!  not only $@" # $@-> all arguments list
fi

#using loop directory can start from $2(if 1)-$3(to 90)
for (( i=$start_dir; i<=$end_dir; i++ )); do

dir="$dirname$i"
mkdir $dir
done
echo "Directories created from $start_dir to $end_dir"

