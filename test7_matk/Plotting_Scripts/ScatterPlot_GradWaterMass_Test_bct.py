#!usr/bin/env python
"""Plots any dat file assuming time is in seconds.
"""
import numpy as np
from matplotlib import pyplot as plt
import sys
import math

nruns = 18
c = 0
leg = [None]*nruns
m = [0.01,0.1]
bac = [0.01,0.1,0.22]
bct = [0.02,0.14,0.4]

for i in range(2):
	for j in range(3):
		for k in range(3):
			print m[i]
			leg[c] = ['m=' + str(m[i]) + ' bac=' + str(bac[j]) + ' bct=' + str(bct[k])]
			c = c + 1

		

leg_ordered = [None]*18

# Low-sloping domains: simulations 1-9
# Hi-sloping domains: simulations 10-18

fix,axarr = plt.subplots(2,3,sharey=True,sharex=True)
c = 1
t1 = 10
t2 = 20
for i in range(2):
	for j in range(3):	
		t=np.empty(t2-t1)
		y=np.empty(t2-t1)
		mat = np.loadtxt('run_fromCheckpoint_yr10Debug_EvapFix.' + str(c) + '/subsurface_water_content.dat')
		print(np.shape(mat))
		a = np.shape(mat)
		for k in range(t2-t1):
			a = np.shape(mat)
			if a[0] < 365*(k):
				t[k-t1] = np.nan
				y[k-t1] = np.nan
			else:
				t[k-t1] = mat[365*k,0]/86400/365
				y[k-t1] = mat[365*k,1]
		print(t)
		axarr[i,j].plot(t,np.gradient(y))
		t=np.empty(t2-t1)
		y=np.empty(t2-t1)
		mat = np.loadtxt('run_fromCheckpoint_yr10Debug_EvapFix.' + str(c+1) + '/subsurface_water_content.dat')
		a = np.shape(mat)
		for k in range(t2-t1):
                        a = np.shape(mat)
                        if a[0] < 365*(k):
                                t[k-t1] = np.nan
                                y[k-t1] = np.nan
                        else:
                                t[k-t1] = mat[365*k,0]/86400/365
                                y[k-t1] = mat[365*k,1]
		axarr[i,j].plot(t,np.gradient(y))
		t=np.empty(t2-t1)
		y=np.empty(t2-t1)
		mat = np.loadtxt('run_fromCheckpoint_yr10Debug_EvapFix.' + str(c+2) + '/subsurface_water_content.dat')
		a = np.shape(mat)
		for k in range(t2-t1):
                        if a[0] < 365*(k):
                                t[k-t1] = np.nan
                                y[k-t1] = np.nan
                        else:
                                t[k-t1] = mat[365*k,0]/86400/365
                                y[k-t1] = mat[365*k,1]
		axarr[i,j].plot(t,np.gradient(y))
		axarr[i,j].legend([str(c) + '(min)',str(c+1) + '(mean)',str(c+2) + '(max)'])
		axarr[i,j].set_title(str(int(m[i]*100)) + '% slope, ' + str(int(bac[j]*100)) + 'cm bAC')
		axarr[i,j].set_ylabel('Mass [m3/time]')
		axarr[i,j].set_xlabel('Time [yrs of sim]')
		c = c + 3
		plt.xlim(t1,t2)
		#plt.xlabel('Time [yrs]')
		#plt.title('subsuurface outlet flux')
plt.show() 
