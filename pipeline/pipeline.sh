python ioDetect.py cutBiceps.msh
gmsh biceps.pro -run
python SLConvert.py muscleStreamline.pos
pause