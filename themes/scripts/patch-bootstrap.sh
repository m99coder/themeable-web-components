#!/usr/bin/env bash

for dir in $(find ../demo/* -maxdepth 0 -type d );
do
	theme=$(basename $dir);

	echo "patch bootstrap for theme \"$theme\" under $dir"

	variables="../src/$theme/variables.less"
	if [ -f "$variables" ]; then
		echo "  replaced path to variables.less"
		sed -i "" "s|@import \"variables.less\";|@import \"../../../../src/$theme/variables.less\";|g" $dir/bootstrap/less/bootstrap.less
	fi

	addons="../src/_global/add-ons.less"
	if [ -f "$addons" ]; then
		echo "  added global add-ons"
		echo "" >> $dir/bootstrap/less/bootstrap.less
		echo "// Global Add-Ons" >> $dir/bootstrap/less/bootstrap.less
		echo "@import \"../../../../src/_global/add-ons.less\";" >> $dir/bootstrap/less/bootstrap.less
	fi

	addons="../src/$theme/add-ons.less"
	if [ -f "$addons" ]; then
		echo "  added specific add-ons"
		echo "" >> $dir/bootstrap/less/bootstrap.less
		echo "// Specific Add-Ons" >> $dir/bootstrap/less/bootstrap.less
		echo "@import \"../../../../src/$theme/add-ons.less\";" >> $dir/bootstrap/less/bootstrap.less
	fi

done
