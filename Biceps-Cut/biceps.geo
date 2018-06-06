//gmsh test project
Mesh.RemeshAlgorithm = 1; // automatic
CharacteristicLenghtFactor = 0.5;

Merge "cut-biceps.msh";
CreateTopology;

ss[] = Surface {:};

Compound Surface{ss[]};

Surface Loop(1) = {ss[]};
Volume(1) = {1};
Physical Surface (1) = {ss[]};
Physical Volume ("Body",10) = 1;
//+
Physical Surface("Electrode",1000) = {1714, 1629, 1747, 1630, 1631, 1628, 1689, 1626, 1576, 1632, 1753, 1754, 1755, 1756, 1751, 1719, 1625, 1680, 1665, 1715, 1688, 1627, 1673, 1718, 1672, 1749, 1717, 1716, 1720, 1681, 1748, 1657, 1746, 1750, 1752, 1721, 1664, 1757};
//+
Physical Surface("Ground",2000) = {83, 105, 160, 85, 84, 158, 148, 86, 88, 106, 107, 108, 109, 111, 87, 110, 177, 153, 129, 130, 112, 135, 154, 159, 155, 157, 156, 178, 179, 182, 181, 180, 183, 141, 66, 147, 136, 142};
