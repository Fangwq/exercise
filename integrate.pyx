# -*- coding: utf-8 -*-
import numpy as np
cimport cython

def integrate(a, b, function):
    cdef: 
        int N = 2000
        double dx
        double sum = 0.0
    dx = 1.0*(b-a)/N
    for i in xrange(N):
        sum = sum + 0.5*(function(a+i*dx)+ function(a+(i+1)*dx))*dx
    return sum

def function(x):
    return x**2+2

@cython.infer_types(True)   #in case of overflow, cast int to long type
def more_inference():
    i = 1
    d = 2.0
    c = 3 + 4j
    r = i*d + c
    return r

#it is just like the c code
cpdef long cp_fact(long n):   #cpdef: it is called directly  
    """Computes n!"""        
    if n <= 1:
        return 1
    return n * cp_fact(n - 1)

cdef inline long c_fact(long n):   #cdef: it need to be called by a def function
    if n <= 1:
        return 1
    return n * c_fact(n - 1)

def wrap_c_fact(n):
    return c_fact(n)

def print_address(a):
    cdef void *v = <void*>a     #coercion
    cdef long addr = <long>v
    print "cython address:", "{:}".format(addr)
    print "python address:", "{:}".format(id(a))

cpdef cast_to_list(a):
    cdef list b = <list?>a      #with maker ?, it will check the type of a
    print type(a)
    print type(b)
    print a
    b.append(1)
    return b

#struct is not allowed to define in def function?
    
ctypedef union num:  #union: make it clear
    int z
    int x, y

#def fun(a):
#    cdef num xx
#    xx.z=1
#    xx.x=2
#    xx.y=3
#    return xx

ctypedef struct mm:  #struct: it's a dict type data
    float real, imag
    num xx
    #list test       #C struct/union member cannot be a Python object
    int test[3]


cpdef fun(a):       #ctypedef is not allowed in def function
    cdef num data
    #cdef list test
    #cdef mm zz = mm(np.pi, -1, data)
    cdef mm zz = {'real': np.pi, 'imag': -1, 'xx': data}
    data.z = 2
    data.x = 3
    data.y = 4
    a = a + zz.real + complex(zz.imag)
    b = data.z * data.x + data.y
    zz.test = [1,2,3]
    #test = [1,2,3]
    #========another method to initialize=========
    #cdef mm zz  
    #zz.real = np.pi 
    #zz.imag = -1
    #zz.xx.z = 2
    #zz.xx.x = 3
    #zz.xx.y =4
    #b = zz.xx.z * zz.xx.x + zz.xx.y
    return a, b, zz.test

DEF PI=3.1415926

ctypedef fused integer_or_int: #it combine all the type defined below
    cython.long
    cython.int
    cython.short
    cython.float
    cython.double

cpdef integer_or_int gen(integer_or_int a, integer_or_int b):
    if a > b:
        return a
    else:
        return b
