# -*- coding: utf-8 -*-
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

cimport cython

@cython.infer_types(True)   #in case of overflow 
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
