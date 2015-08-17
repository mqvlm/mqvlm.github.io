/* 

  __
 (  ->
 / )\
<_/_/
 " "    mqvlm.tumblr.com  

*/


//Processing.js, imágenes y SVGs
/*Código base para el señor dramatic chipmunk que está aquí:
  http://mqvlm.tumblr.com/post/77032920497/processing-js-imagenes-y-svgs
*/
 
//seguir las intrucciones que están en la entrada del blog para colgarlo en web 


//declarar los objetos que van a contener los SVGs (ilustraciones hechas en illustrator y guardadas como svg)
PShape bicho;
PShape ojoizq;
PShape ojoder;
PShape brillo;

//variables para mover los ojos siguiendo el mouse
float x;
float y;
float x2;
float y2;

void setup(){
  size(800, 600);
  smooth();
  
  x=0;
  y=0; 
  
  x2=0;
  y2=0;

  //se cargan las imágenes
  //acá las estoy llamando directamente de la carpeta local de ´data´, pero para web se pone el url de donde estàn alojadas
  bicho = loadShape("https://dl.dropboxusercontent.com/u/21566953/mqvlm/post7_dramatic_chipmunk/data/dramatic1.svg");
  ojoizq = loadShape("https://dl.dropboxusercontent.com/u/21566953/mqvlm/post7_dramatic_chipmunk/data/ojoizq.svg");
  ojoder = loadShape("https://dl.dropboxusercontent.com/u/21566953/mqvlm/post7_dramatic_chipmunk/data/ojoder.svg");  
  brillo = loadShape("https://dl.dropboxusercontent.com/u/21566953/mqvlm/post7_dramatic_chipmunk/data/brillo.svg");    
 

} 

 void draw(){
  background(255);

  //con la función map() hacemos coincidir el rango de movimiento del mouse con el desplazamiento de los ojos
  //variable = map(valor a convertir, valor minimo actual del rango del valor a convertir, valor actual maximo del valor a convertir, nuevo minimo, nuevo maximo)
  x= map(mouseX, 0, width, -6,9);
  y= map(mouseY,0, height, -6,5);
  x2= map(mouseX, 0, width, -3,1);
  y2= map(mouseY, 0, width,-2,3);


  //dibujamos los SVGs, pero dandole las variables mapeadas arriba para que se muevan 
  shape(bicho,0-100,0);
  shape(ojoizq,x-100,y);
  shape(ojoder,x2-100,y2);
  shape(brillo,0-100,0);
  
}
