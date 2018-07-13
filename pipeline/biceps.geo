//gmsh test project
Mesh.RemeshAlgorithm = 1; // automatic
CharacteristicLenghtFactor = 0.5;

Merge "cutBiceps.msh";
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