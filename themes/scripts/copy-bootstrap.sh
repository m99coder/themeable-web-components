#!/usr/bin/env bash

echo "copy bootstrap"

for dir in $(find ../demo/* -maxdepth 0 -type d );
do
	theme=$(basename $dir);
	echo "  into theme \"$theme\" under $dir"
	mkdir -p $dir/bootstrap
	cp -R ../../node_modules/bootstrap $dir
done
