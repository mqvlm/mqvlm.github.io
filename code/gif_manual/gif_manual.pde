/* 

  __
 (  ->
 / )\
<_/_/
 " "    mqvlm.github.io

*/


//GIFS MANUALES CON PROCESSING
//Código para hacer una especie de gifs que se muevan con el movimiento del mouse

//http://mqvlm.github.io/blog/mar.html

//Usé photoshop para separar un clip de video en imágenes individuales. 
//Importante nombrarlas como 0.png, 1.png y así. SIEMPRE EMPEZAR EN 0


PImage[] imagenes;  //declarar arreglo para guardar las imágenes
PImage prueba;

float cuadro;
float minCuadro, maxCuadro;
int nuevoCuadro;


void setup ()
{
  size(500,256);
  background(255);
  
  cuadro = 0.0;
  minCuadro= 0.0;
  maxCuadro = 15.0;
  nuevoCuadro = 0;
  
  prueba = loadImage("0.png");

  imagenes = new PImage[15];
  for (int i = 0; i < imagenes.length; i++)
  {
    //Así las llamo desde local
    //imagenes[i] = loadImage(i + ".png"); 
    
   //Así si estoy usando este sketch en web, llamaando las imágenes desde el directorio
    imagenes[i] = loadImage("/code/gif_manual/data/"+i + ".png"); 
  }
  
} 


void draw ()
{
  
  //image(prueba,0,0);
  
  nuevoCuadro = int(cuadro);
  image(imagenes[nuevoCuadro],0,0);
  
  //// opción para manejar el gif con forward y rewind con el movimiento horizontal del mouse
  /*
  cuadro = map(mouseX, 0, width, minCuadro, maxCuadro);
  nuevoCuadro = int(cuadro);
  image(imagenes[nuevoCuadro],0,0);
  */
  
  // opción para que el gif se mueva elípticamente con el movimiento del mouse sin forward ni rewind 
  
  if ((mouseX-pmouseX)>=1) {
    //si el mouse va de izquierda a derecha
    cuadro = map(mouseX, 0, width, minCuadro, maxCuadro);
   
  } else if  ((mouseX-pmouseX)<=-1) {
    //si el mouse va de derecha a izquierda 
    cuadro = map(mouseX, 0, width, maxCuadro, minCuadro);
   
   } 
   
   if (mouseX == 0) {
     
     cuadro= 0;
   
   }
 
 

}