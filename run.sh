#!/bin/bash
# I still need to enter a file name, it's boring
#echo -n "please enter the file name with pyx extension: "
#read name
#If I run the code with ./run.sh filename, then don't need to read
file=$1
echo -n "Begin to run the code, wait for a moment..."
printf "\n"
cython $file.pyx
gcc -c -fPIC -I/usr/include/python2.7/ $file.c
gcc -shared $file.o -o $file.so -lpython2.7
python $file.py
# ====delete the temporary file=======
rm  $file.c
rm  $file.o
rm  $file.so
if [ -e $file.pyc ]; then		#blank is needed in bracket [ ]
		echo "OK, $file.pyc is removed."
		rm $file.pyc
else
		echo "NO, $file.pyc doesn't exist. "
fi
echo -n "The running finished!"
printf "\n"

