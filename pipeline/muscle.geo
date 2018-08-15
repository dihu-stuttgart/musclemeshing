//gmsh test project
Mesh.RemeshAlgorithm = 1; // automatic
CharacteristicLenghtFactor = 0.5;

Merge "biceps.msh";
CreateTopology;

ss[] = Surface {:};

Compound Surface{ss[]};

Surface Loop(10000) = {ss[]};
Volume(100) = {10000};
Physical Surface (100) = {ss[]};
Physical Volume ("Body",10) = 100;
Mesh 3;
//disable Automatic Remeshing
Solver.AutoMesh = 0;
//set Output Format to .msh
Mesh.Format = 1;
RefineMesh;
RefineMesh;
Physical Surface ("Electrode",1000) = 885;
Physical Surface ("Ground",2000) = 5;
Save "muscle.msh";
