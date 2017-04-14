# -*- coding: utf-8 -*-
# The Computer Language Benchmarks Game
# http://benchmarksgame.alioth.debian.org/
#
# originally by Kevin Carson
# modified by Tupteq, Fredrik Johansson, and Daniel Nanz
# modified by Maciej Fijalkowski
# 2to3
#
#PI = 3.14159265358979323
#SOLAR_MASS =  4*PI**2
#DAYS_PER_YEAR =  365.24
#BODIES = {
#        'sun': ([0.0, 0.0, 0.0], [0.0, 0.0, 0.0], SOLAR_MASS),
#
#        'jupiter': ([4.84143144246472090e+00,
#            -1.16032004402742839e+00,
#            -1.03622044471123109e-01],
#            [1.66007664274403694e-03 * DAYS_PER_YEAR,
#                7.69901118419740425e-03 * DAYS_PER_YEAR,
#                -6.90460016972063023e-05 * DAYS_PER_YEAR],
#            9.54791938424326609e-04 * SOLAR_MASS),
#
#        'saturn': ([8.34336671824457987e+00,
#            4.12479856412430479e+00,
#            -4.03523417114321381e-01],
#            [-2.76742510726862411e-03 * DAYS_PER_YEAR,
#                4.99852801234917238e-03 * DAYS_PER_YEAR,
#                2.30417297573763929e-05 * DAYS_PER_YEAR],
#            2.85885980666130812e-04 * SOLAR_MASS),
#
#        'uranus': ([1.28943695621391310e+01,
#            -1.51111514016986312e+01,
#            -2.23307578892655734e-01],
#            [2.96460137564761618e-03 * DAYS_PER_YEAR,
#                2.37847173959480950e-03 * DAYS_PER_YEAR,
#                -2.96589568540237556e-05 * DAYS_PER_YEAR],
#            4.36624404335156298e-05 * SOLAR_MASS),
#
#        'neptune': ([1.53796971148509165e+01,
#            -2.59193146099879641e+01,
#            1.79258772950371181e-01],
#            [2.68067772490389322e-03 * DAYS_PER_YEAR,
#                1.62824170038242295e-03 * DAYS_PER_YEAR,
#                -9.51592254519715870e-05 * DAYS_PER_YEAR],
#            5.15138902046611451e-05 * SOLAR_MASS) 
#        }
#
#class conserve(object):
#    def __init__(self):
#        pass
#        #self.body = body
#        #self.ref = ref    
#    def combinations(self, l):
#        result = []
#        for x in range(len(l) - 1):
#            ls = l[x+1:]
#            for y in ls:
#                result.append((l[x],y))
#        return result
#
#
#    def offset_momentum(self, ref, bodies):
#    
#        px = py = pz = 0.0
#    
#        for (r, [vx, vy, vz], m) in bodies:
#            px -= vx * m
#            py -= vy * m
#            pz -= vz * m
#        (r, v, m) = ref
#        v[0] = px / m
#        v[1] = py / m
#        v[2] = pz / m
#
#    def advance(self, dt, n, bodies, pairs):
#    
#        for i in range(n):
#            for (([x1, y1, z1], v1, m1),
#                    ([x2, y2, z2], v2, m2)) in pairs:
#                dx = x1 - x2
#                dy = y1 - y2
#                dz = z1 - z2
#                mag = dt * ((dx * dx + dy * dy + dz * dz) ** (-1.5))
#                b1m = m1 * mag
#                b2m = m2 * mag
#                v1[0] -= dx * b2m
#                v1[1] -= dy * b2m
#                v1[2] -= dz * b2m
#                v2[0] += dx * b1m
#                v2[1] += dy * b1m
#                v2[2] += dz * b1m
#            for (r, [vx, vy, vz], m) in bodies:
#                r[0] += dt * vx
#                r[1] += dt * vy
#                r[2] += dt * vz
#    
#
#    def report_energy(self, bodies, pairs):    
#        e = 0.0
#        for (((x1, y1, z1), v1, m1),
#                ((x2, y2, z2), v2, m2)) in pairs:
#            dx = x1 - x2
#            dy = y1 - y2
#            dz = z1 - z2
#            e -= (m1 * m2) / ((dx * dx + dy * dy + dz * dz) ** 0.5)
#        for (r, [vx, vy, vz], m) in bodies:
#            e += m * (vx * vx + vy * vy + vz * vz) / 2.
#        return e
#
#a = conserve()
#bodies = BODIES
#n = 50000
#ref = 'sun'
#system = list(bodies.values())
#pairs = a.combinations(system)
#a.offset_momentum(bodies[ref], system)
#print "{:.9f}".format(a.report_energy(system, pairs))
#a.advance(0.01, n, system, pairs)
#print "{:.9f}".format(a.report_energy(system, pairs))
#

#===========The uper code, I just write if for class type=========
#===I will use cython syntax to rewrite the code===
from numba import jit

DEF PI = 3.14159265358979323
DEF SOLAR_MASS =  4*PI**2
DEF DAYS_PER_YEAR =  365.24

#(position, velocity, mass)
BODIES = {
        'sun': ([0.0, 0.0, 0.0], [0.0, 0.0, 0.0], SOLAR_MASS),

        'jupiter': ([4.84143144246472090e+00,
            -1.16032004402742839e+00,
            -1.03622044471123109e-01],
            [1.66007664274403694e-03 * DAYS_PER_YEAR,
                7.69901118419740425e-03 * DAYS_PER_YEAR,
                -6.90460016972063023e-05 * DAYS_PER_YEAR],
            9.54791938424326609e-04 * SOLAR_MASS),

        'saturn': ([8.34336671824457987e+00,
            4.12479856412430479e+00,
            -4.03523417114321381e-01],
            [-2.76742510726862411e-03 * DAYS_PER_YEAR,
                4.99852801234917238e-03 * DAYS_PER_YEAR,
                2.30417297573763929e-05 * DAYS_PER_YEAR],
            2.85885980666130812e-04 * SOLAR_MASS),

        'uranus': ([1.28943695621391310e+01,
            -1.51111514016986312e+01,
            -2.23307578892655734e-01],
            [2.96460137564761618e-03 * DAYS_PER_YEAR,
                2.37847173959480950e-03 * DAYS_PER_YEAR,
                -2.96589568540237556e-05 * DAYS_PER_YEAR],
            4.36624404335156298e-05 * SOLAR_MASS),

        'neptune': ([1.53796971148509165e+01,
            -2.59193146099879641e+01,
            1.79258772950371181e-01],
            [2.68067772490389322e-03 * DAYS_PER_YEAR,
                1.62824170038242295e-03 * DAYS_PER_YEAR,
                -9.51592254519715870e-05 * DAYS_PER_YEAR],
            5.15138902046611451e-05 * SOLAR_MASS) 
        }

#combination each planet into pair
cpdef combinations(x):
    cdef:
        list result = [ ]
    for i in xrange(len(x)-1):
        ls = x[1+i:]
        for y in ls:
            result.append([x[i],y])
    return result

ctypedef struct tempbody:
    double x[3]
    double v[3]
    double m

DEF NBODIES = 5


cdef advance(dt, n, bodies):
    cdef:
        tempbody *body1
        tempbody *body2
        double dx, dy, dz, b1m, b2m, mag
        tempbody cbody[NBODIES]
        list pylist = [ ] 
        tempbody *pointer
    #c array can't be output 
    for i in xrange(NBODIES):
        pointer = &cbody[i]
        (x, y, z) = bodies[i]
        pointer.x[0],pointer.x[1],pointer.x[2] = x
        pointer.v[0],pointer.v[1],pointer.v[2] = y
        pointer.m = z
    
    for i in xrange(n):
        for ii in xrange(NBODIES):
            body1 = &cbody[ii]
            for jj in xrange(ii+1, NBODIES):
                body2 = &cbody[jj]
                dx = body1.x[0]-body2.x[0]
                dy = body1.x[1]-body2.x[1] 
                dz = body1.x[2]-body2.x[2] 
                mag = dt * ((dx * dx + dy * dy + dz * dz) ** (-1.5))
                b1m = body1.m * mag
                b2m = body2.m * mag
                body1.v[0] -= dx * b2m
                body1.v[1] -= dy * b2m
                body1.v[2] -= dz * b2m
                body2.v[0] += dx * b1m
                body2.v[1] += dy * b1m
                body2.v[2] += dz * b1m
        for ii in xrange(NBODIES):
            body2 = &cbody[ii]
            body2.x[0] += dt * body2.v[0] 
            body2.x[1] += dt * body2.v[1]
            body2.x[2] += dt * body2.v[2]
    #change to the python list
    for i in xrange(NBODIES):
        x = [cbody[i].x[0],cbody[i].x[1],cbody[i].x[2]]
        v = [cbody[i].v[0],cbody[i].v[1],cbody[i].v[2]]
        m = cbody[i].m
        pylist.append((x, v, m))
    return pylist


cdef report_energy(list bodies):
    cdef:
        double e = 0.0
        double dx = 0.0
        double dy = 0.0
        double dz = 0.0
    pairs = combinations(bodies)
    for (((x1, y1, z1), v1, m1), ((x2, y2, z2), v2, m2)) in pairs:
        dx = x1 - x2
        dy = y1 - y2
        dz = z1 - z2
        e -= (m1 * m2) / ((dx * dx + dy * dy + dz * dz) ** 0.5)
    for (r, [vx, vy, vz], m) in bodies:
        e += m * (vx * vx + vy * vy + vz * vz) / 2.
    print("%.9f" % e)


cdef offset_momentum(ref, list bodies):
    cdef:
        double px = 0.0
        double py = 0.0
        double pz = 0.0
      
    for (r, [vx, vy, vz], m) in bodies:
        px -= vx * m
        py -= vy * m
        pz -= vz * m
    (r, v, m) = ref
    v[0] = px / m
    v[1] = py / m
    v[2] = pz / m

def main(n, bodies=BODIES):
    system = list(bodies.values())
    offset_momentum(bodies['sun'], system)
    report_energy(system)
    system = advance(0.01, n, system)
    report_energy(system)
