python ioDetect.py biceps.msh 7 7 2
gmsh muscle.pro -run
python SLConvert.py muscleStreamline.pos
gmsh streamlines.geo
pause
