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
    
ctypedef union num:  #union:
    int z
    int x, y

ctypedef struct mm:  #struct: it's a dict type data
    float real, imag
    num xx

cpdef fun(a):       #ctypedef is not allowed in def function
    cdef mm zz  #initialize: dictionary, dot and literal->mycpx(x, y)
    #cdef num xx = num(z=4, x=5, y=6) 
    #cdef num xx = {'z':1, 'x':5, 'y':6}
    #print type(xx)
    zz.real = np.pi 
    zz.imag = -1
    zz.xx = num(4, 5, 6) 
    #zz.xx = num({'z':1, 'x':5, 'y':6})
    xx = zz.xx
    #xx = zz.num(z=4, x=5, y=6)
    b = xx.z* xx.x + xx.y
    a = a + zz.real + complex(zz.imag)
    return a

