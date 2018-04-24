 

 lc = 0.02;
 
 Point(1) = {0  ,0  ,0  };
 Point(2) = {.2 ,0  ,0  };
 Point(3) = {.2 ,.4 ,0  };
 Point(4) = {0  ,.4 ,0  };
 
 Point(5) = {.05 ,.4 ,0};
 Point(6) = {.15 ,.4 ,0};
 Point(7) = {.05 ,0 ,0};
 Point(8) = {.15 ,0 ,0};
 
 Line(1) = {1,7};
 Line(2) = {7,8};
 Line(3) = {8,2};
 Line(4) = {2,3};
 Line(5) = {3,6};
 Line(6) = {6,5};
 Line(7) = {5,4};
 Line(8) = {4,1};
 
 
 Curve Loop(1) = {1,2,3,4,5,6,7,8};
 
 Plane Surface(1) = {1};
 
 Physical Line(1000) = {6};
 Physical Line(1001) = {2};
 
 Physical Surface(2000) = {1};