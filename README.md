# musclemeshing
Repo for Proj INF "Generating and Visualizing Muscular Fascicle Arrangements" 
By Jan Kusterer, Niven Ratnamaheson, Raimund Rolfs and Tobias Walter.

Abstract:
In this Paper we discuss a way to implement a pipeline that allows the calculation of muscular fascicles based on the surface CT-scan of the muscle.
	Choi and Blemker showed in advance, that simple skeletal muscles have a fascicle arrangement, which can be computed with a Laplacian vector field. 
	An electrostatic simulation considering a dielectric volume uses the same equation. 
	In this work we use a similar approach and develope a method to calculate  a specifiable amount of fibers, using the finite element mesh generator Gmsh. 
	In addition we visualize the outcome in forms of meshes and 3D-Printing.

3dprint contains the Python script, which converts the Streamlines to tubes, as well as some of the printed models.
The final printed models are biceps.stl, thick_fibre_5.3mf and thick_fibre_51.3mf.
The command for the conversion is as follows streamlines.p musst be in the same directory:
python create_fibre.py numFibres radiusInCM


Biceps cut contains cut biceps model used for computation.

fullBiceps contains first simulation approaches with a full biceps.

L-Figure contains simulation testing on an 3D-L-Model.

Streamline plotter contains the unfinalized version of the streamline plotter used in the pipeline.

Test contains early testing and exploring of gmsh.

data contains the raw biceps stl as well as a triceps, and the cut biceps.

documentation contains the code as well as the final documentation work for the Projekt-Inf.

pipeline contains the final Calculation pipeline. It is executed by running the shell/bat file. 
The working directories have to be changed.

poster contains a tamplate for a latex poster.
