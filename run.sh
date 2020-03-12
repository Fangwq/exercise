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


# for python3
#LIBDIRSa=-I/Users/fangwq/Library/Python/3.7/lib/python/site-packages/numpy/core/include
#LIBDIRSb=-I/usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/include/python3.7m

#PYTHONLIBa=-L/usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/lib/python3.7/config-3.7m-darwin
#PYTHONLIBb=-lpython3.7

#cython $file.pyx
#gcc-7 -c -fPIC $LIBDIRSa $LIBDIRSb $file.c
#gcc-7 -shared $file.o -o $file.so $PYTHONLIBa $PYTHONLIBb
