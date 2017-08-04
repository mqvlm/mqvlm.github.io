/* 

  __
 (  ->
 / )\
<_/_/
 " "    http://mqvlm.github.io/ 

*/


//EXPERIMENTO: VISUALIZAR UN CUADRO CON GRÀFICOS DE TORTA
//Código para reinterpretar la información de color de una imagen

//http://mqvlm.github.io/blog/renoir.html

/*Processing 3.3.5*/

PImage foto;

//variables para tortas
float r, g, b;
float sumaColores;
float anguloR, anguloG, anguloB;
float porcentajeR, porcentajeG, porcentajeB;
//


//resolución (cada cuántos pixeles hacer la captura y pintar la torta)
int res=8;

void setup(){
    
  size(481,650);
  foto = loadImage("renoir.JPG");

  ellipseMode(CORNER);
  smooth();

  sumaColores= 765; /*es la suma de r+g+b (cada uno tiene computacionalmente el valor 255) 
  para después hacer la regla de 3 y saber cuánto de cada uno hay en el total */
  
}



void draw(){
  
  background(255);
 
  foto.loadPixels(); /*carga los pixeles de la imagen para poder recorrerlos uno a uno con el siguiente for:
  (la variable res define cada cuántos pixeles se toma información) */
  
  for (int x = 0; x < foto.width; x= x + res)
    {
      for( int y = 0; y < foto.height; y= y + res)
        {
          
          /*esta función es la que encuentra un pixel dentro de la imagen seleccionada. Con el loop
          lo que hace es ir recorriendo la imagen extrayendo los valores r, g, y b para cada pixel*/
          
          int loc = x + (y*foto.width);
          
          //tomar información de color
          r = red(foto.pixels[loc]);
          g = green(foto.pixels[loc]);
          b = blue(foto.pixels[loc]);
     
          
        
          /* toca equiparar los porcentajes de color a valores de ángulo para poder armar los charts, por eso
          establecemos primero máximos y mínimos de cada uno de los dos, así podremos hacer correspondientes 
          los rangos*/
         
          float minAngulos = 0;
          float maxAngulos = 360;
          
          float minPorcentaje = 0;  
          float maxPorcentaje = 100;
          
          
          //sacamos primero los porcentajes con regla de tres
          sumaColores = r+g+b;
          
          porcentajeR= (r*100)/sumaColores;
          porcentajeG= (g*100)/sumaColores;
          porcentajeB= (b*100)/sumaColores; 
          
          
          /*luego la función map convierte el valor del porcentaje que salió en la regla de
          tres a un valor de ángulo para dibujar el pedazo correspondiente de la torta*/
          
          anguloR= map(porcentajeR,minPorcentaje, maxPorcentaje,minAngulos,maxAngulos);
          anguloG= map(porcentajeG,minPorcentaje, maxPorcentaje,minAngulos,maxAngulos);
          anguloB= map(porcentajeB,minPorcentaje, maxPorcentaje,minAngulos,maxAngulos);

          //ahora se pinta cada uno de los trozos del pie Chart, ángulo por águlo
          noStroke();
          
        
         /*la función arc se determina así:
          arc(coordenadaxcentro, coordenadaycentro, width,height, angulodonde inicia el arco, angulo donde finaliza)*/
          
          
          //pedazo Rojo
          fill(255,0,0);
          arc(x, y, res, res, radians(0), radians(0) +radians(anguloR));
         
          
          //pedazo Verde
          fill(0,255,0);
          arc(x, y, res, res, radians(anguloR), radians(anguloR)+radians(anguloG));
         
          //pedazo Azul  
          fill(0,0,255); 
          arc(x, y, res, res, radians(anguloR)+radians(anguloG), radians(anguloR)+radians(anguloG)+radians(anguloB)); 
       
         
        
        }
    }
  
  


}