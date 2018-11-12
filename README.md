# musclemeshing
Repo for Proj INF

3dprint contains the Python script, which converts the Streamlines to tubes, as well as some of the printed models.
The final printed models are biceps.stl, thick_fibre_5.3mf and thick_fibre_51.3mf.
The command for the conversion is as follows streamlines.p musst be in the same directory:
python create_fibre.py numFibres radiusInCM


Biceps cut contains cut biceps model used for computation.

fullBiceps contains first simulation approaches with a full biceps.

L-Figure contains simulation testing on an 3D-L-Model.

Streamline plotter contains the unfinalized version of the streamline plotter used in the pipeline.

Test contains early testing and exploring of gmsh.

dat contains the raw biceps stl as well as a triceps, and the cut biceps.

documentation contains the code as well as the final documentation work for the Projekt-Inf.

pipeline contains the final Calculation pipeline. It is executed by running the shell/bat file. 
The working directories have to be changed.

poster contains a tamplate for a latex poster.
