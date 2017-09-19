#this code is for <<Programming pearls>> in chapter 8
# -*- coding: utf-8 -*-
import numpy as np


x = np.array([31, -41, 59, 26, -53, 58, 97, -93, -23, 84])
maxsofar=0
n = len(x)
for i in xrange(n):
    xsum=0
    tempmax = maxsofar
    for j in xrange(i,n):
        xsum = xsum + x[j]
        maxsofar = max(maxsofar, xsum)
        if (maxsofar > tempmax) and (maxsofar-xsum==0):
            print i, j, tempmax, maxsofar, xsum        #print the maximum list index: last one

print maxsofar


def summation(initial, end):
    if initial > end:
        return 0
    if initial == end:
        return max(0, x[initial])
    mid = (initial + end)/2 
    initial_max = 0
    arraysum = 0
    for i in xrange(mid, initial, -1):   #left biggest
        arraysum = arraysum + x[i]
        initial_max = max(initial_max, arraysum)
        if initial_max - arraysum == 0:
            print 'left index:', i
    end_max = 0
    arraysum = 0
    for i in xrange(mid+1, end):        #right biggest
        arraysum = arraysum + x[i]
        end_max = max(end_max, arraysum)
        if end_max - arraysum == 0:
            print 'right index:', i
    return max(initial_max + end_max, summation(initial, mid), summation(mid+1, end))

print summation(0, n-1)

maxsofar = 0
testmax = 0
for i in xrange(n):
    testmax = max(testmax + x[i], 0)
    maxsofar = max(maxsofar, testmax)
    if maxsofar - testmax == 0:
        print i       

print maxsofar

