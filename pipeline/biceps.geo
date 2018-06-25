//gmsh test project
Mesh.RemeshAlgorithm = 1; // automatic
CharacteristicLenghtFactor = 0.5;

Merge "cutBiceps.stl";
Reclassify2D;
CreateTopology;

ss[] = Surface {:};

Compound Surface{ss[]};

Surface Loop(1) = {ss[]};
Volume(1) = {1};
Physical Surface (1) = {ss[]};
Physical Volume ("Body",10) = 1;
//+
Mesh 3;
Solver.AutoMesh = 0;

