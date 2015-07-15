/* 

  __
 (  ->
 / )\
<_/_/
 " "    http://mqvlm.github.io/ 

*/


//EXPERIMENTO: Gifs manuales: experimentos con geomrative
//Código con tipografía generativa según el movimiento del mouse

//http://mqvlm.github.io/blog/alfabeto.html

import geomerative.*;

RShape letras;
RShape newLetras;

void setup() {
  
  size (500,500);
  smooth();
  
  RG.init(this);
  
  letras = RG.loadShape("alfabet.svg");
 

}

void draw(){
  
  background(255);
  fill(0);
  stroke(0);
  rect(0,0,500,500);
  
 // float pointSeparation = 1;
  float pointSeparation = map(mouseX, 0, width, 380, 1);
  
  RG.setPolygonizer( RG.UNIFORMLENGTH );
  RG.setPolygonizerLength( pointSeparation );
  newLetras = RG.polygonize( letras );
  
  RG.ignoreStyles();
  noFill();
  stroke(255);
  newLetras.draw();
  
  
  
  
}
