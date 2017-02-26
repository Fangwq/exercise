#accelerate python code with ctype or pypy
#
# accelerate code with ctypes
# import timeit
# from ctypes import cdll
 
# def generate_c(num):
#     #Load standard C library
#     libc = cdll.LoadLibrary("/usr/lib/libc.dylib") #Mac: the path of C library
#     # libc = cdll.LoadLibrary("libc.so.6") #Linux
#     #libc = cdll.msvcrt #Windows
#     while num:
#         yield libc.rand() % 10
#         num -= 1
 
# print(timeit.timeit("sum(generate_c(999))", setup="from __main__ import generate_c", number=1000))


# compile it with pypy, and it's fast
# import timeit
# import random
 
# def generate(num):
#     while num:
#         yield random.randrange(10)
#         num -= 1
 
# def create_list(num):
#     numbers = []
#     while num:
#         numbers.append(random.randrange(10))
#         num -= 1
#     return numbers
        
# print(timeit.timeit("sum(generate(999))", setup="from __main__ import generate", number=1000))
# print(timeit.timeit("sum(create_list(999))", setup="from __main__ import create_list", number=1000))

# create our own C libraries to talk to Python
from ctypes import *
import time

libfunctions = cdll.LoadLibrary("libfunctions.so")
 
def fibRec(n):
    if n < 2:
        return n
    else:
        return fibRec(n-1) + fibRec(n-2)
 
start = time.time() 
fibRec(32)
finish = time.time()
print("Python: " + str(finish - start))
 
#C Fibonacci
start = time.time() 
x = libfunctions.fibRec(32)
finish = time.time()
print("C: " + str(finish - start))


# from random import shuffle, sample
 
# #Generate 9999 random numbers between 0 and 100000
# numbers = sample(range(100000), 9999)
# shuffle(numbers)
# c_numbers = (c_int * len(numbers))(*numbers)
 
# from heapq import merge
 
# def merge_sort(m):
#     if len(m) <= 1:
#         return m
 
#     middle = len(m) // 2
#     left = m[:middle]
#     right = m[middle:]
 
#     left = merge_sort(left)
#     right = merge_sort(right)
#     return list(merge(left, right))
 
# start = time.time()
# numbers = merge_sort(numbers)
# finish = time.time()
# print("Python: " + str(finish - start))
 
# #C Merge Sort
# start = time.time()
# libfunctions.merge_sort(byref(c_numbers), len(numbers))
# finish = time.time()
# print("C: " + str(finish - start))