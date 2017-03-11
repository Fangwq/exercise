#this is a program aim to test the speed by using c1.pyx and
#c2.py(pure python function).c1.pyx should be compile by cython and
#generate c1.so(detail step is in my page file)file,
#then it can be used by test.py file.
#refer to the http://blog.csdn.net/gzlaiyonghao/article/details/4561611

import timeit

lon1, lat1, lon2, lat2 = -72.345, 34.323, -61.823, 54.826
num = 50

t = timeit.timeit("c1.great_circle(%f, %f, %f,%f, %f)" % (lon1,lat1,lon2,lat2, num),"import c1")
# t = timeit.timeit("c1.great_circle(%f, %f, %f, %f)" % (lon1,lat1,lon2,lat2),setup="import c1",number=num)
print 'Cython function(not using python math)', t, "sec"
