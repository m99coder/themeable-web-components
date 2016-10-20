#!/usr/bin/env bash

echo "publish themes"

for dir in $(find ../demo/* -maxdepth 0 -type d );
do
	theme=$(basename $dir);
	echo "  for theme \"$theme\" under $dir"

	# create directory
	mkdir -p $dir/../../cdn/$theme/bootstrap

	# copy bootstrap dist assets
	cp -R $dir/bootstrap/dist/* $dir/../../cdn/$theme/bootstrap

: << 'END'
	# concat variables files
	mkdir -p ../cdn/$theme/bootstrap/less/
	vars="../cdn/$theme/bootstrap/less/variables.less"

	# 1. check if there is a src/$theme/variables.less
	#    if yes use it, otherwise use demo/$theme/bootstrap/less/variables.less

	variables="../src/$theme/variables.less"
	if [ -f "$variables" ]
	then
		cat $variables >> $vars
	else
		cat ../demo/$theme/bootstrap/less/variables.less >> $vars
	fi

	# 2. check if there is a src/_global/add-ons/variables.less
	#    if yes use it

	variables="../src/_global/add-ons/variables.less"
	if [ -f "$variables" ]; then
		cat $variables >> $vars
	fi

	# 3. check if there is a src/$theme/add-ons/variables.less
	#    if yes use it

	variables="../src/$theme/add-ons/variables.less"
	if [ -f "$variables" ]; then
		cat $variables >> $vars
	fi
END

done
