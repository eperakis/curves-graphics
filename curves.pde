//**** NEVILLE INTERPOLATING CURVES AND ANIMATIONS *** Project 1 for CS3451
PNT Neville(float a, PNT A, float b, PNT B, float t) 
  {
  return LERP(A,(t-a)/(b-a),B);
  }
  
PNT Neville(float a, PNT A, float b, PNT B, float c, PNT C, float t) 
  {
    PNT Pab = Neville(a,A,b,B,t);
    PNT Pbc = Neville(b,B,c,C,t);
    PNT Pabc = Neville(a,Pab,c,Pbc,t);
  return Pabc;
  }
  
PNT Neville(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float t) 
  {
    PNT Pabc = Neville(a,A,b,B,c,C,t);
    PNT Pbcd = Neville(b,B,c,C,d,D,t);
    PNT Pabcd = Neville(a,Pabc,d,Pbcd,t);
  return Pabcd;
  }

PNT Neville(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float e, PNT E, float f, PNT F, float t) 
{
  PNT Pabc = Neville(a,A,b,B,c,C,t);
  PNT Pbcd = Neville(b,B,c,C,d,D,t);
  PNT Pdef = Neville(d,D,e,E,f,F,t);
  PNT Pcde = Neville(c,C,d,D,e,E,t);
  PNT Pabcd = Neville(a,Pabc,d,Pbcd,t);
  PNT Pcdef = Neville(c,Pcde,f,Pdef,t);
  PNT Pbcde = Neville(b,Pbcd,e,Pcde,t);
  PNT Pabcde = Neville(a,Pabcd,e,Pbcde,t);
  PNT Pbcdef = Neville(b,Pbcde,f,Pcdef,t);
  PNT Pabcdef = Neville(a,Pabcde,f,Pbcdef,t);
  return Pabcdef;
}

void drawNevilleCurve(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Neville(a,A,b,B,c,C,d,D,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }
    
  void drawNevilleCurveSix(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float e, PNT E, float f, PNT F)
  {
  float du=1./90;
  beginShape(); 
    for(float u=0; u<=1.+du/2; u+=du) 
      vert(Neville(a,A,b,B,c,C,d,D,e,E,f,F,u)); // does not work yet (you must write that Neville function (in Tab points) )
  endShape(); 
  }
    
void drawNevilleCurveThree(float a, PNT A, float b, PNT B, float c, PNT C)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Neville(a,A,b,B,c,C,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }
    
void drawNevilleCurveTwo(float a, PNT A, float b, PNT B)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Neville(a,A,b,B,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }

void showNevilleConstruction(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float time) 
  {
  PNT Pab = Neville(a,A,b,B,time);
  fill(red); drawCircle(Pab,20);
  stroke(red);
  strokeWeight(4); noFill(); drawNevilleCurveTwo(a,A,b,B);
  
  PNT Pbc = Neville(b,B,c,C,time);
  fill(green); drawCircle(Pbc,20);
  stroke(green);
  strokeWeight(4); noFill();  drawNevilleCurveTwo(b,B,c,C);
  
  PNT Pcd = Neville(c,C,d,D,time);
  fill(blue); drawCircle(Pcd,20);
  stroke(blue);
  strokeWeight(4); noFill(); drawNevilleCurveTwo(c,C,d,D);
  
  PNT Pabc = Neville(a,A,b,B,c,C,time);
  fill(brown); drawCircle(Pabc,30);
  stroke(brown);
  strokeWeight(4); noFill(); drawNevilleCurveThree(a,A,b,B,c,C);
  
  PNT Pbcd = Neville(b,B,c,C,d,D,time);
  fill(magenta); drawCircle(Pbcd,30);
  stroke(magenta);
  strokeWeight(4); noFill(); drawNevilleCurveThree(b,B,c,C,d,D);
  
  PNT Pabcd = Neville(a,A,b,B,c,C,d,D,time);
  fill(black); drawCircle(Pabcd,30);
  stroke(black);
  strokeWeight(4); noFill(); drawNevilleCurve(a,A,b,B,c,C,d,D);
  fill(black); noStroke(); for(int i=1; i<19; i++) drawCircle(Neville(a,A,b,B,c,C,d,D,(float)i/19),6);
  
  }

//showNevilleConstruction for 6 points
void showNevilleConstructionSix(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float e, PNT E, float f, PNT F, float time) 
  {
   PNT Pabcdef = Neville(a,A,b,B,c,C,d,D,e,E,f,F,time);
  fill(black); drawCircle(Pabcdef,30);
  stroke(black);
  strokeWeight(4); noFill(); drawNevilleCurveSix(a,A,b,B,c,C,d,D,e,E,f,F);
  fill(black); noStroke(); for(int i=1; i<19; i++) drawCircle(Neville(a,A,b,B,c,C,d,D,e,E,f,F,(float)i/19),6);
  
  }


//**** BEZIER INTERPOLATING CURVES AND ANIMATIONS 
PNT Bezier(PNT A, PNT B, float t) 
  {
  return LERP(A,t,B);  
  }
  
PNT Bezier(PNT A, PNT B, PNT C, float t) 
  {
  PNT S = Bezier(A,B,t);
  PNT E = Bezier(B,C,t);
  return  Bezier(S,E,t);
  }
  
PNT Bezier(PNT A, PNT B, PNT C, PNT D, float t) 
  {
  PNT S = Bezier(A,B,C,t);
  PNT E = Bezier(B,C,D,t);
  return  Bezier(S,E,t);
  }

void drawBezierCurve(PNT A, PNT B, PNT C)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Bezier(A,B,C,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }

void drawBezierCurve(PNT A, PNT B, PNT C, PNT D)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Bezier(A,B,C,D,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }

void showBezierConstruction(PNT A, PNT B, PNT C, PNT D, float t)
  {
  PNT Pab = Bezier(A,B,t),  Pbc = Bezier(B,C,t),  Pcd = Bezier(C,D,t);
  PNT          Pabc = Bezier(Pab,Pbc,t),      Pbcd = Bezier(Pbc,Pcd,t);
  PNT                   Pabcd = Bezier(Pabc,Pbcd,t);
  noFill();

  strokeWeight(14);
  stroke(orange,40); drawBezierCurve(A,B,C);   
  stroke(magenta,40); drawBezierCurve(B,C,D);  
  
  noStroke();
  fill(orange,100); drawCircle(Pabc,16); 
  fill(magenta,100); drawCircle(Pbcd,16);
  
  noFill();
 
  stroke(blue);
  strokeWeight(2);  drawEdge(A,B); drawEdge(B,C); drawEdge(C,D);
  strokeWeight(6);  drawEdge(A,Pab);  drawEdge(B,Pbc); drawEdge(C,Pcd);

  stroke(green);    
  strokeWeight(2);  drawEdge(Pab,Pbc); drawEdge(Pbc,Pcd); 
  strokeWeight(6); drawEdge(Pab,Pabc);  drawEdge(Pbc,Pbcd); 

  stroke(red);
  strokeWeight(2);  drawEdge(Pabc,Pbcd); 
  strokeWeight(6);  drawEdge(Pabc,Pabcd);  

  noStroke();
  float r=8;
  fill(blue); drawCircle(Pab,r); drawCircle(Pbc,r); drawCircle(Pcd,r);
  fill(green); drawCircle(Pabc,r); drawCircle(Pbcd,r); 
  fill(red); drawCircle(Pabcd,r);
  }
