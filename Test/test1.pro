DefineConstant[
  Flag_AnalysisType = {2, Choices{ 0="Steady-state", 2="Transient"},
    Name "Parameters/0Type of analysis"}
]; 
 
Group {
    influx  = Region[1000];
    fixtemp = Region[1001];
    top     = Region[2000] ;
    
    Vol_The = Region[{top}] ;
    Sur_The = Region[{influx}] ;
    Tot_The = Region[{Vol_The,Sur_The}];
}

Function {
  DefineConstant[
    flux = {9645, Min 1e5, Max 1e12, Step 1e4,
      Name "Parameters/1Heat flux"}
    pulse = {5, Min 0.1, Max 5, Step 0.1,
      Name "Parameters/1Pulse length"},
    timemax = {5, Min 0.01, Max 20, Step 0.1,
      Name "Parameters/1Simulation time"}
    dtime = {0.2, Min 0.001, Max 1, Step 0.001,
      Name "Parameters/1Time step"}
    ktop = {298, Min 1, Max 1000, Step 1,
      Name "Parameters/2k (top)" },
    rhoctop = {25000 * 261, Min 1e3, Max 1e8, Step 1e3,
      Name "Parameters/2rho cp (top)" }
  ];
  k[ top ] =  ktop ;
  rhoc  [ top ] = rhoctop ;

  TimeFct[] = ($Time < pulse) ? 1 : 0 ;

  Flux[] = flux * TimeFct[] ;
  qVol[] = 0;

  t0 = 0;
  t1 = timemax;
  dt = dtime;

  SaveFct[] = 0; //!($TimeStep % 20) ;
}

Include "Thermal.pro"

PostOperation {

  { Name map ; NameOfPostProcessing The ;
    Operation {
      Print[ T, OnElementsOf Vol_The , File "map.pos"];
    }
  }

  { Name point ; NameOfPostProcessing The ;
    Operation {
      Print[ T, OnPoint {0.0425,0.011001, 0.003} , File "Tcont" , Format TimeTable];
    }
  }

}

DefineConstant[
  // preset all getdp options and make them invisible
  R_ = {"analysis", Name "GetDP/1ResolutionChoices", Visible 0},
  C_ = {"-solve -pos -v2 -bin", Name "GetDP/9ComputeCommand", Visible 0},
  P_ = {"map", Name "GetDP/2PostOperationChoices", Visible 0}
];