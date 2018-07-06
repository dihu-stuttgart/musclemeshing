C:\Users\Tobias\Desktop\ProjektINF\onelab-Windows64\gmsh C:\Users\Tobias\Desktop\ProjektINF\Git-Repo\pipeline\cutBiceps.stl -reclassify 0
python ioDetect.py cutBiceps.msh
C:\Users\Tobias\Desktop\ProjektINF\onelab-Windows64\gmsh C:\Users\Tobias\Desktop\ProjektINF\Git-Repo\pipeline\biceps.pro -run
python Streamline-converter.py 
pause