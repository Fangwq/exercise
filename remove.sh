#!/bin/bash
#remove a package and its dependence
pip3 uninstall -y $1
for i in $(pip3 show $1 | grep Requires | sed 's/Requires: //g; s/,//g')
do
	pip3 uninstall -y $i
	#echo "remove $i seccessfully"
done

