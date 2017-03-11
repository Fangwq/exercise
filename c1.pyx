#==================================================
# actually python code

# import math

# def great_circle(lon1,lat1,lon2,lat2):
# 	radius = 3956 #miles
#         x = math.pi/180.0
	
# 	a = (90.0-lat1)*(x)
# 	b = (90.0-lat2)*(x)
# 	theta = (lon2-lon1)*(x)
# 	c = math.acos((math.cos(a)*math.cos(b)) +
# 		(math.sin(a)*math.sin(b)*math.cos(theta)))
# 	return radius*c

#==================================================
# with python math package

# import math
 
# def great_circle(float lon1,float lat1,float lon2,float lat2):
#     cdef float radius = 3956.0
#     cdef float pi = 3.14159265
#     cdef float x = pi/180.0
#     cdef float a,b,theta,c
 
#     a = (90.0-lat1)*x
#     b = (90.0-lat2)*x
#     theta = (lon2-lon1)*x
#     c = math.acos((math.cos(a)*math.cos(b)) + (math.sin(a)*math.sin(b)*math.cos(theta)))
#     return radius*c



#====================================================
# with c library

# cdef extern from "math.h":
#     float cosf(float theta)
#     float sinf(float theta)
#     float acosf(float theta)

# def great_circle(float lon1,float lat1,float lon2,float lat2):
#     cdef float radius = 3956.0 
#     cdef float pi = 3.14159265
#     cdef float x = pi/180.0
#     cdef float a,b,theta,c

#     a = (90.0-lat1)*(x)
#     b = (90.0-lat2)*(x)
#     theta = (lon2-lon1)*(x)
#     c = acosf((cosf(a)*cosf(b)) + (sinf(a)*sinf(b)*cosf(theta)))
#     return radius*c

#=====================================================
# use the pure c function 

cdef extern from "math.h":  
    float cosf(float theta)  
    float sinf(float theta)  
    float acosf(float theta)  
  
cdef float circle(float lon1,float lat1,float lon2,float lat2):  
    cdef float radius = 3956.0  
    cdef float pi = 3.14159265  
    cdef float x = pi/180.0  
    cdef float a,b,theta,c  
  
    a = (90.0-lat1)*(x)  
    b = (90.0-lat2)*(x)  
    theta = (lon2-lon1)*(x)  
    c = acosf((cosf(a)*cosf(b)) + (sinf(a)*sinf(b)*cosf(theta)))  
    return radius*c  
  
def great_circle(float lon1,float lat1,float lon2,float lat2,int num):  
    cdef int i  
    cdef float x  
    for i from 0 <= i < num:  #do not use xrange function
        x = circle(lon1,lat1,lon2,lat2)   #I can't print the result, why?
    return x