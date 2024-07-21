#!/bin/bash

#input filename as 1st argument 
file_name=$1
start=$2      #input starting range as 2nd arg
end=$3        #input last range as 3rd arg

# check if input paramiter are 3 or not 
if [ $# -ne 3 ]; then
	echo "Use 3 Arguments like- ./$0 1 15 . Not like $@"
fi

for (( i==$start; i<=$end; i++ )); do
	file=$file_name$i
	touch $file
done
echo "your file is created successfully from $1:$2-$3"
