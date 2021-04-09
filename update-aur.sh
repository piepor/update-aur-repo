#!/usr/bin/bash
# check input number
if [[ $# > 2 ]]; then
	echo "Only two parameters allowed";
	exit 1
fi

path=$1;
username=$2;
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
		sudo -u username makepkg -si;
	fi
	cd ..;
done
