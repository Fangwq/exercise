#!/bin/bash
#echo -n "please enter the file name with pyx extension: "
#read name
#usage: ./run.sh filename
file=$1
echo -n "Begin to run the code, wait for a moment..."
printf "\n"
echo "========================="
cython $file.pyx
gcc -c -fPIC -I/usr/include/python2.7/ $file.c
gcc -shared $file.o -o $file.so -lpython2.7
python $file.py
# ====delete the temporary file=======
rm  $file.c
rm  $file.o
rm  $file.so
if [ -e $file.pyc ]; then		#blank is needed in bracket [ ]
		rm $file.pyc
		echo "OK, $file.pyc is removed."
else
		echo "NO, $file.pyc doesn't exist. "
fi
echo "========================="
echo -n "The running finished!"
printf "\n"

