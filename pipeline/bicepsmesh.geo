//gmsh test project
Mesh.RemeshAlgorithm = 1; // automatic
CharacteristicLenghtFactor = 0.5;
Mesh.SaveAll 1;
Mesh.SaveGroupsOfNodes 1;
Merge "cutBiceps.msh";
Save "biceps.msh";

