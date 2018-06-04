 
lc = 10;

Point(1) = {0   ,0  ,0  ,lc};
Point(2) = {200   ,0  ,0  ,lc};
Point(3) = {200   ,100  ,0  ,lc};
Point(4) = {100   ,100  ,0  ,lc};
Point(5) = {100   ,300  ,0  ,lc};
Point(6) = {0   ,300  ,0  ,lc};

Point(7) = {0   ,0  ,100  ,lc};
Point(8) = {200   ,0  ,100  ,lc};
Point(9) = {200   ,100  ,100  ,lc};
Point(10) = {100  ,100  ,100  ,lc};
Point(11) = {100  ,300  ,100  ,lc};
Point(12) = {0  ,300  ,100  ,lc};

Line(1) ={1,2};
Line(2) ={2,3};
Line(3) ={3,4};
Line(4) ={4,5};
Line(5) ={5,6};
Line(6) ={6,1};

Line(7) ={7,8};
Line(8) ={8,9};
Line(9) ={9,10};
Line(10) ={10,11};
Line(11) ={11,12};
Line(12) ={12,7};

Line(13) ={1,7};
Line(14) ={2,8};
Line(15) ={3,9};
Line(16) ={4,10};
Line(17) ={5,11};
Line(18) ={6,12};

Line Loop(1) = {1,2,3,4,5,6};
Plane Surface(1) = {1};
Line Loop(2) = {7,8,9,10,11,12};
Plane Surface(2) = {2};
Line Loop(3) = {2,-14,-8,15};
Plane Surface(3) = {3};
Line Loop(4) = {3,16,-9,-15};
Plane Surface(4) = {4};
Line Loop(5) = {4,17,-10,-16};
Plane Surface(5) = {5};
Line Loop(6) = {5,18,-11,-17};
Plane Surface(6)= {6};
Line Loop(7) = {-12,-18,6,13};
Plane Surface(7) = {7};
Line Loop(8) = {-7,-13,1,14};
Plane Surface(8) = {8};

Surface Loop(9) = {1,2,3,4,5,6,7,8};
Volume(10) = {9};

Physical Surface(1000) = {6};
Physical Surface(1001) = {3};

Physical Volume(2000) = {10};