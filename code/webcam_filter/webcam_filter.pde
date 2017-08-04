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
//Para processing 3.0.1

import processing.video.*;  //importar la librería y definir el objeto de captura
Capture cam;
int res;  //le da una “resolución”, define cada cuántos pixeles tomar la información de color

void setup ()

{

  size(640, 480);
  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);

    // Start capturing the images from the camera
    cam.start();
  }
  
  res=30;
}


void draw()
{
  smooth();
  background(0);

  if (cam.available() == true) {
      cam.read();
    }
  
  //image(cam, 0, 0);

  cam.loadPixels();
  
  for (int x = 0; x < cam.width; x= x + res)    //loop para tomar información del color
  {
    for ( int y = 0; y < cam.height; y= y + res)
    {
      int loc = x + (y*cam.width);

      float r = red(cam.pixels[loc]);
      float g = green(cam.pixels[loc]);
      float b = blue(cam.pixels[loc]);
      noStroke();
      fill(r, g, b);
      rect (x, y, res, res);   //dibujo un rectángulo sobre las coordenadas donde se tomó el color y lo rellena con la información de color
    }
  }

  cam.updatePixels();

}