#!/usr/bin/env bash

echo "remove bootstrap"

for dir in $(find ../demo/* -maxdepth 0 -type d );
do
	theme=$(basename $dir);
	echo "  from theme \"$theme\" under $dir"
	rm -rf $dir/bootstrap
done
