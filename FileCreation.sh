#!/bin/bash

file_name=$1
start=$2
end=$3

if [ $# -ne 3 ]; then
	echo "Use 3 Arguments like- ./$0 1 15 . Not like $@"
fi

for (( i==$start; i<=$end; i++ )); do
	file=$file_name$i
	touch $file
done
echo "your file is created successfully from $1:$2-$3"
