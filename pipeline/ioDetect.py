#In/Out Detection
import sys

input_file = open(str(sys.argv[1]),"r")
input_file.readline()
input_file.readline()
input_file.readline()

numNodes = 0
nodes = []
numElements = 0
elements = []
numGroups = 0
groups = []
minZ = float('inf')
maxZ = 0
upperSurface = -1
lowerSurface = -1

print input_file.readline()
#reading Nodes
numNodes = int(input_file.readline())
nodes = [[0 for x in range(3)]for y in range(numNodes)]
for n in nodes:
    line = input_file.readline().split(" ")
    n[0] = float(line[1])
    n[1] = float(line[2])
    n[2] = float(line[3])
    if n[2] > maxZ:
        maxZ = n[2]
    if n[2] < minZ:
        minZ = n[2]
print input_file.readline()
print maxZ
print minZ
print input_file.readline()

#reading elements
numElements = int(input_file.readline())
elements = [[]for x in range(numElements)]
for e in elements:
    line = input_file.readline().split(" ")
    for l in line:
        e.append(float(l))
    
print input_file.readline()
input_file.close()

for e in elements:
    if e[4] > numGroups:
        numGroups = int(e[4])
groups = [[] for x in range(numGroups+1)]

#grouping elements together
for e in elements:
    #only look at surfaces (8 entries)
    if len(e) == 8:
        groups[int(e[4])-1].append(e)

#getting upper surface
elnum = 0
for g in groups:
    isUpper = True
    for e in g:
        for i in range(5, len(e)):
            point = e[i]
            if nodes[int(point)-1][2] != maxZ:
                isUpper = False
                
    if isUpper == True and g != []:
        if len(g) > elnum:
            elnum = len(g)
            upperSurface = int(g[0][4])
            
#getting lower surface
elnum = 0
for g in groups:
    isLower = True
    for e in g:
        for i in range(5, len(e)):
            point = e[i]
            if nodes[int(point)-1][2] > minZ:
                isLower = False
    if isLower == True and g != []:
        if len(g) > elnum :
            elnum = len(g)
            lowerSurface = int(g[0][4])

print lowerSurface
print upperSurface


inFile = "";
input_file = open("src/muscle.geo", "r")
inFile = input_file.read()
input_file.close()

output_file = open("muscle.geo","w")
output_file.write(inFile)
output_file.write("\nPhysical Surface (\"Electrode\",1000) = " + str(upperSurface) +";\n")
output_file.write("Physical Surface (\"Ground\",2000) = " + str(lowerSurface) +";\nSave \"muscle.msh\";\n")          
output_file.close()

#TODO writing postoperation with Streamline boundaries
#finding max/min X/Y on upper surface
minX = float('inf')
maxX = float('-inf')
minY =float('inf')
maxY = float('-inf')
for g in groups:
   for e in g:
      for i in range(5, len(e)):
         point = e[i]
         if nodes[int(point) -1][2] == maxZ:
            if nodes[int(point) -1][0] > maxX :
               maxX =  nodes[int(point) -1][0]
            if( nodes[int(point) -1][0]< minX):
               minX =  nodes[int(point) -1][0]
                 
            if nodes[int(point) -1][1] > maxY:
               maxY =  nodes[int(point) -1][1]
            
            if( nodes[int(point) -1][1]< minY):
               minY =  nodes[int(point) -1][1]

input_file = open("src/muscle.pro","r")
inFile = input_file.read()
input_file.close()

output_file = open("muscle.pro","w")
output_file.write(inFile)
output_file.write("\nPostOperation {\n")
output_file.write("{ Name Map; NameOfPostProcessing EleSta_v;\n Operation {\n")
output_file.write("Print [ v, OnElementsOf Vol_Ele, File \"muscle.pos\" ];\n       Print [ e, OnElementsOf Vol_Ele, File \"muscle.pos\" ];\n")
output_file.write("Echo [Str[\"Plugin(StreamLines).X0="+str(minX)+";\",\"Plugin(StreamLines).Y0="+str(minY)+";\", \"Plugin(StreamLines).Z0="+str(maxZ)+";\",\"Plugin(StreamLines).X1="+str(maxX)+";\",\"Plugin(StreamLines).Y1="+str(minY)+";\",\"Plugin(StreamLines).Z1="+str(maxZ)+";\",\"Plugin(StreamLines).X2="+str(minX)+";\",\"Plugin(StreamLines).Y2="+str(maxY)+";\",\"Plugin(StreamLines).Z2="+str(maxZ)+";\",\"Plugin(StreamLines).NumPointsU = 20;\",\"Plugin(StreamLines).NumPointsV = 20;\",\"Plugin(StreamLines).MaxIter = 300;\",\"Plugin(StreamLines).DT = 0.3;\"],File>> \"muscle.pos\"];")  
output_file.write("\nEcho[\"Plugin(StreamLines).Run;\",File>>\"muscle.pos\"];")
output_file.write("\nEcho[\"Save View[4] 'muscleStreamline.pos';\",File>>\"muscle.pos\"];\n}\n}\n}")
output_file.close()