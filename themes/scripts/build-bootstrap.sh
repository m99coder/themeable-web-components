#!/usr/bin/env bash

echo "build bootstrap"

for dir in $(find ../demo/* -maxdepth 0 -type d );
do
	theme=$(basename $dir);
	echo "  in theme \"$theme\" under $dir"
	cd $dir/bootstrap && npm install && grunt dist && cd -
done
