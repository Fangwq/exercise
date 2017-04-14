# -*- coding: utf-8 -*- 
#usage: create a table and print the kth number in a sorted table
import numpy as np 

try:
    f = open("a.txt","rb")
except:
    print '---The file does not exist, you should enter from keyboard!---'
    data = raw_input("please input three int numbers:")
    n,m,k = map(lambda x: int(x), data.split(' '))
else:
    print '-----The file exists-----'
    data = f.readlines()
    n,m,k = map(lambda x: int(x), data[0].split(' '))
    f.close()

print n,m,k,type(n)   

table = np.array([[1]*m for i in xrange(n)])
for i in xrange(n):
    for j in xrange(m):
        table[i, j] = (i + 1)*(j + 1)

#sort the array
def rec_SelectSort(index):
    templist = np.reshape(table,[1,n*m])[0]
    length = len(templist)
    i = index
    if i < length-1:
	# print range(i+1, length)
	for j in xrange(i+1, length):
            if templist[j] < templist[i]:
		templist[j], templist[i] = templist[i], templist[j]
	rec_SelectSort(i+1)
    return templist
result = rec_SelectSort(0)
print result
print result[k-1]


