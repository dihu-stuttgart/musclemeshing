 
Group{
    Body = Region[10];
    Electrode = Region[1000];
    Out1 = Region[2000];
    Out2 = Region[2001];

    Ground = Region[{Out1,Out2}];
    Vol_Ele = Region[Body];
    Sur_Neu_Ele = Region[ {} ];
}
Function {
  eps0 = 8.854187818e-12;
  epsilon[Body] = 1. * eps0;
}
Constraint {
  { Name Dirichlet_Ele; Type Assign;
    Case {
      { Region Ground; Value 0.; }
      { Region Electrode; Value 1.e+4; }
    }
  }
}
Group{

    Dom_Hgrad_v_Ele = Region[ {Vol_Ele, Sur_Neu_Ele} ];
}

FunctionSpace {
    { Name Hgrad_v_Ele; Type Form0;
    BasisFunction {
      { Name sn; NameOfCoef vn; Function BF_Node;
        Support Dom_Hgrad_v_Ele; Entity NodesOf[ All ]; }
    }
    Constraint {
      { NameOfCoef vn; EntityType NodesOf; NameOfConstraint Dirichlet_Ele; }
    }
  }
}

Jacobian {
    { Name Vol ;
    Case {
      { Region All ; Jacobian Vol ; }
    }
  }
  { Name Sur ;
    Case {
      { Region All ; Jacobian Sur ; }
    }
  }
}
Integration {
  /* A Gauss quadrature rule with 4 points is used for all integrations below. */

  { Name Int ;
    Case { { Type Gauss ;
             Case { 
	  { GeoElement Point       ; NumberOfPoints  1 ; }
	  { GeoElement Line        ; NumberOfPoints  3 ; }
	  { GeoElement Triangle    ; NumberOfPoints  4 ; }
	  { GeoElement Quadrangle  ; NumberOfPoints  4 ; }
	  { GeoElement Tetrahedron ; NumberOfPoints  4 ; }
	  { GeoElement Hexahedron  ; NumberOfPoints  6 ; }
	  { GeoElement Prism       ; NumberOfPoints  6 ; }}
      }
    }
  }
}
Formulation {
{ Name Electrostatics_v; Type FemEquation;
    Quantity {
      { Name v; Type Local; NameOfSpace Hgrad_v_Ele; }
    }
    Equation {
      Integral { [ epsilon[] * Dof{d v} , {d v} ];
	    In Vol_Ele; Jacobian Vol; Integration Int; }
	    }
  }
}
Resolution {
  { Name EleSta_v;
    System {
      { Name Sys_Ele; NameOfFormulation Electrostatics_v; }
    }
    Operation {
      Generate[Sys_Ele]; Solve[Sys_Ele]; SaveSolution[Sys_Ele];
    }
  }
}
PostProcessing {
  { Name EleSta_v; NameOfFormulation Electrostatics_v;
    Quantity {
      { Name v; Value {
          Term { [ {v} ]; In Dom_Hgrad_v_Ele; Jacobian Vol; }
        }
      }
      { Name e; Value {
          Term { [ -{d v} ]; In Dom_Hgrad_v_Ele; Jacobian Vol; }
        }
      }
      { Name d; Value {
          Term { [ -epsilon[] * {d v} ]; In Dom_Hgrad_v_Ele; Jacobian Vol; }
        }
      }
    }
  }
}


e = 1.e-7; // tolerance to ensure that the cut is inside the simulation domain
h = 2.e-3; // vertical position of the cut

PostOperation {
  { Name Map; NameOfPostProcessing EleSta_v;
     Operation {
       Print [ v, OnElementsOf Vol_Ele, File "L-Ele.pos" ];
       Print [ e, OnElementsOf Vol_Ele, File "L-Ele.pos" ];
     }
  }
  { Name Cut; NameOfPostProcessing EleSta_v;
    // same cut as above, with more points and exported in raw text format
    Operation {
      Print [ e, OnLine {{e,e,0}{14.e-3,e,0}} {500}, Format TimeTable, File "L-Ele-cut.txt" ];
    }
  }
}
