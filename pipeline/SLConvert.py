# -*- coding: utf-8 -*-
"""
Created on Mon Jun 04 21:35:05 2018

@author: Tobias
"""
import sys
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import matplotlib.pyplot as plt

#Streamline-converter
#Reading Header
input_file = open(str(sys.argv[1]),"r")
input_file.readline()
input_file.read(5)
#container for streamlines
streamlines =[]
#reading Timesteps
time = input_file.readline().split(",")
n = int(time[len(time)-1].split("}")[0])+1
#loop over lines one line per streamline
for line in input_file:
    input = line.split("VP(")
    #check if EOF
    if len(input) == 1:
        break;
    else:
        numbers = input[1].split(",")
        #startpoint of streamline
        start = [0 for x in range(3)]
        start[0] = float(numbers[0])
        start[1] = float(numbers[1])
        temp = numbers[2]
        temp = temp.split("){")
        start[2] = float(temp[0])
        vectors = [[0 for x in range(3)]for y in range(n)]
        vectors[0][0] =start[0] + float(temp[1])
        i = 1;
        j = 0;
        #reading x,y,z coordinates
        for x in range (3, n*3+1):
            if i == 0 :
                vectors[j][0] =  start[0] + float(numbers[x])
                i += 1
            elif i == 1:
                vectors[j][1] = start[1] + float(numbers[x])
                i +=1
            elif i == 2:
                vectors[j][2] = start[2] + float(numbers[x])
                i = 0
                j +=1
        vectors[n-1][2] =start[2] + float(numbers[3*n+1].split("}")[0])
        start = [start]
        vectors = start + vectors
        #put line into container
        streamlines.append(vectors)
        
        
#setting up plot
fig = plt.figure()
ax = fig.gca(projection='3d')
ax.autoscale_view(tight=None,scalex=False,scaley=False,scalez=False)
i=0
#loop over streamlines and draw them
for l in streamlines:
    xs = []
    ys = []
    zs = []
    for x in l:
        xs.append(x[0])
        ys.append(x[1])
        zs.append(x[2])
    ax.plot(xs, ys, zs, label = 'line'+str(i))
    i+=1
ax.set_xlim3d(0,200)
ax.set_ylim3d(0,200)
ax.set_zlim3d(50,250)
fig.show()

   
output_file = open("streamlines.geo", "w+")
i=10000000
j=10000000
for l in streamlines:
    curve = "Bezier("+str(20000+j)+")={"
    for point in l:
        output_file.write("Point("+str(i)+") = {"+str(point[0])+","+str(point[1])+","+str(point[2])+"};\n")
        curve += str(i)+","
        i+=1
    curve = curve[:-1] #removing last character (",")
    curve += "};\n"
    j+=1
    output_file.write(curve)
        
output_file.close()
   
   
   
   
   
   
