/* 

  __
 (  ->
 / )\
<_/_/
 " "    mqvlm.github.io 

*/


//WEBCAM Y PROCESSING
//Código para reinterpretar la información que entra por la webcam

//http://mqvlm.github.io/blog/webcam.html
//SÓLO FUNCIONA CON PROCESSING 1.5

import processing.video.*;  //importar la librería y definir el objeto de captura
Capture video;
int posx;
int res;  //le da una “resolución”, define cada cuántos pixeles tomar la información de color

void setup ()

{

  size(640,480);
  video = new Capture (this,screen.width/2,screen.height/2,10);  //se comunica con la webcam, crea el objeto de captura
  posx=0;
  res=30; 

}


void draw()
{
   smooth();
   background(0);

   if( video.available () )
     {
       video.read();
     }

   video.loadPixels();

  
   for (int x = 0; x < video.width; x= x + res)    //loop para tomar información del color
    {
      for( int y = 0; y < video.height; y= y + res)
        {
           int loc = x + (y*video.width);

           float r = red(video.pixels[loc]);
           float g = green(video.pixels[loc]);
           float b = blue(video.pixels[loc]);

           

           noStroke();
           fill(r,g,b);
           rect (x,y,res,res);   //dibujo un rectángulo sobre las coordenadas donde se tomó el color y lo rellena con la información de color

          }
     }

    video.updatePixels();

}
