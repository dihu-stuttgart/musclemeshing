#DIHU tool for finding Surfaces at the upper and lower edges of the bicpeps
#using numpy-stl for stl processing
#http://numpy-stl.readthedocs.io/en/latest/usage.html
mport numpy 
from stl import mesh
import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d as mplt
#reading repaired and cut stl file
biceps = mesh.Mesh.from_file('cutBiceps.stl')
#setup for plotting
figure = plt.figure()
axes = mplt.Axes3D(figure)
axes.add_collection3d(mplt.art3d.Poly3DCollection(biceps.vectors))
scale = biceps.points.flatten(-1)
axes.auto_scale_xyz(scale,scale,scale)
#finding lower and upper surfaces
#max_/min_ return points with highest/lowest total XYZ
maxZ = biceps.max_[2]
minZ = biceps.min_[2]
#container for Surfaces which need to be added together
upperSurface = []
lowerSurface = []

surfaces = biceps.items()
#TODO iterate over surfaces and add them to the corresponding container

#plt.show()