#!/usr/bin/bash
# check input number
if [[ $# > 1 ]]; then
	echo "Only one parameter allowed";
	exit 1
fi

path=$1;
if [[ ! -d $path ]]; then
	echo "The $path directory doesn't exists";
	exit 1
fi	
cd $path

for d in */ ; do 
	cd $d;
	git config pull.rebase false;
	state=$(git pull);
	uptodate="Already up to date.";
	if [[ "$state" == "$uptodate" ]]; then
		echo $state;
	else
		makepkg -si;
	fi
	cd ..;
done
