/* 

  __
 (  ->
 / )\
<_/_/
 " "    http://mqvlm.github.io/ 

*/


//EXPERIMENTO: Gifs manuales: experimentos con geomrative
//Código con tipografía generativa según el movimiento del mouse // OPCIÓN SOLO ANIMADA

//http://mqvlm.github.io/blog/alfabeto.html

//Processing 3.3.5

PImage[] imagenes;
PImage prueba;

float cuadro;
float minCuadro, maxCuadro;
int nuevoCuadro;


void setup ()
{
  size(500,500);
  background(0);
  
  cuadro = 0.0;
  minCuadro= 0.0;
  maxCuadro = 51.0;
  nuevoCuadro = 0;
  
  //Así las cargo cuando estoy usando este sketch en local
  //prueba = loadImage("0.png");
  
  //Así cargo la imagen inicial cuando estoy usando este sketch en web
  prueba = loadImage("/code/alfabeto/alfabeto_animacion/data/0.png");

  imagenes = new PImage[53];
  for (int i = 0; i < imagenes.length; i++)
  {
    //Así cargo las imágenes cuando estoy usando este sketch en local
    //imagenes[i] = loadImage(i + ".png"); 
    
    //Así cargo las imágenes cuando estoy usando este sketch en web
    imagenes[i] = loadImage("/code/alfabeto/alfabeto_animacion/data/"+ i + ".png"); 
  }
  
} 


void draw ()
{
  
  //image(prueba,0,0);
  
  nuevoCuadro = int(cuadro);
  image(imagenes[nuevoCuadro],0,0);
  
  
  cuadro = map(mouseX, 0, width, minCuadro, maxCuadro);
  nuevoCuadro = int(cuadro);
  image(imagenes[nuevoCuadro],0,0);

}