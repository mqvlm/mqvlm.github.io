/* 

  __
 (  ->
 / )\
<_/_/
 " "    mqvlm.github.io 

*/


//Experimento con blobDetection y Theo van Doesburg

/*Código para jugar con la presencia de un usuario y
los vértices de una imagen estática y */

//http://mqvlm.github.io/blobDetection/hola.html

/*Basado en: 
- Super Fast Blur v1.1 by Mario Klingemann <http://incubator.quasimondo.com>
- BlobDetection library 

*/


import processing.video.*;
import blobDetection.*;

Capture cam;
BlobDetection theBlobDetection;

PImage img;
boolean newFrame=false;

int posx;
int posy;

int vertexX;
int vertexY;

void setup ()
{
  size (displayWidth,displayHeight);
  background (255);
 
  vertexX=0;
  vertexY=0;
  
  posx=0;
  posy=0;
  
  cam = new Capture(this, 40*4, 30*4, 15);
        // Comment the following line if you use Processing 1.5
        cam.start();
        
  // BlobDetection
  // img which will be sent to detection (a smaller copy of the cam frame);
  img = new PImage(80,60); 
  theBlobDetection = new BlobDetection(img.width, img.height);
  theBlobDetection.setPosDiscrimination(true);
  theBlobDetection.setThreshold(0f); // will detect bright areas whose luminosity > 0.2f;
}

void draw() {
//background(201,182,129);
background(255);
rect (20,20,440,440);

fill (255);
stroke(0);
strokeWeight(0.3);
rect (480,440,40,20);


  if (newFrame)
  {
    newFrame=false;
    //image(cam,0,0,width,height);
    img.copy(cam, 0, 0, cam.width, cam.height, 
        0, 0, img.width, img.height);
    fastblur(img, 2); 
    theBlobDetection.computeBlobs(img.pixels);
    drawBlobsAndEdges(true,false);
  }


drawLines();
}

void drawLines() {

//rojo parado grande
fill(150,48,26);
stroke(0,0,0);
strokeWeight(0.4);
beginShape();
vertex(posx+vertexX+128, posy+vertexY+100);
vertex(posx+168, 137);
vertex(posx+168, 217);
vertex(posx+128, 191);
endShape(CLOSE); 
  
  
//blanco fondo
fill(214,213,210);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+229, 364);
vertex(posx+264, 397);
vertex(posx+364, 297);
vertex(posx+vertexX+329, vertexY+264);
endShape(CLOSE);


fill(257,257,257);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+229, 354);
vertex(posx+264, 387);
vertex(posx+vertexX+364,vertexY+287);
vertex(posx+329, 254);
endShape(CLOSE);


fill(214,213,210);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+229, vertexY+354);
vertex(posx+229, 364);
vertex(posx+264, 397);
vertex(posx+264, 387);
vertex(posx+229, 354);
endShape(CLOSE);


fill(214,213,210);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(264, 397);
vertex(posx+vertexX+264, vertexY+387);
vertex(posx+364, 287);
vertex(posx+364, 297);
endShape(CLOSE);


//negro grande

fill(90,91,92);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+120, vertexY+311);
vertex(posx+170, 361);
vertex(posx+220, 311);
vertex(posx+170, 261);
endShape(CLOSE); 

fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+120, vertexY+306);
vertex(posx+170, 356);
vertex(posx+220, 306);
vertex(posx+170, 256);
endShape(CLOSE);   

fill(94,98,107);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+120, 306);
vertex(posx+120, 311);
vertex(posx+vertexX+170,vertexY+361);
vertex(posx+170, 356);
endShape(CLOSE);

//blanco mediano

fill(90,91,92);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+114, 275);
vertex(posx+166, 326);
vertex(posx+206, 286);
vertex(posx+vertexX+154, vertexY+235);
endShape(CLOSE);

fill(257,257,257);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+114, 271);
vertex(posx+166, 322);
vertex(posx+206, 282);
vertex(posx+vertexX+154, vertexY+231);
endShape(CLOSE);



//azul grande

fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+192, 291);
vertex(posx+262, 361);
vertex(posx+356, 267);
vertex(posx+vertexX+286, vertexY+192);
endShape(CLOSE); 

fill(70,106,184);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+192, 286);
vertex(posx+262, 356);
vertex(posx+356, 262);
vertex(posx+vertexX+286, vertexY+192);
endShape(CLOSE); 

fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+192, 286);
vertex(posx+192, 291);
vertex(posx+262, 361);
vertex(posx+vertexX+262, vertexY+356);

fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+356, 267);
vertex(posx+356, 262);
vertex(posx+vertexX+262, vertexY+356);
vertex(posx+262, 361);
endShape(CLOSE); 

//azul pequeño flat
fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+115, vertexY+191);
vertex(posx+157, 234);
vertex(posx+182, 209);
vertex(posx+140, 166);
endShape(CLOSE);  
  
fill(70,106,184);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+115, 187);
vertex(posx+157, 230);
vertex(posx+vertexX+182, vertexY+205);
vertex(posx+140, 162);
endShape(CLOSE);  
   



//biombo

//azul oscuro
fill(36,70,143);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+131, 257);
vertex(posx+vertexX+179,vertexY+ 299);
vertex(posx+179, 245);
vertex(posx+131, 203);
endShape(CLOSE);  

//blanco oscuro 1
fill(214,213,210);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+179, 299);
vertex(vertexX+179, vertexY+245);
vertex(posx+210, 215);
vertex(posx+210, 269);
endShape(CLOSE); 


//blanco claro 1
fill(257,257,257);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+210, 215);
vertex(posx+210, 269);
vertex(posx+vertexX+246,vertexY+ 310);
vertex(posx+246, 256);
endShape(CLOSE);  

//sombra verde
fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+240, 250);
vertex(posx+240, 302);
vertex(posx+vertexX+266, vertexY+279);
vertex(posx+266, 227);
endShape(CLOSE); 

//verde
fill(201,195,105);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+242,vertexY+ 251);
vertex(posx+242, 303);
vertex(posx+268, 280);
vertex(posx+268, 228);
endShape(CLOSE);  

//blanco oscuro 2
fill(214,213,210);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+265, 222);
vertex(posx+vertexX+265, vertexY+276);
vertex(posx+278, 288);
vertex(posx+278, 234);
endShape(CLOSE);  

//blanco claro tapa
fill(257,257,257);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+265, 222);
vertex(posx+vertexX+277,vertexY+ 232);
vertex(posx+304, 205);
vertex(posx+292, 195);
endShape(CLOSE);  

//rojo
fill(150,48,26);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+277, 232);
vertex(posx+278, 288);
vertex(posx+vertexX+322, vertexY+243);
vertex(posx+322, 187);
endShape(CLOSE); 

//cubo blanco cara negra
fill(256,256,256);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+278, 288);
vertex(posx+283, 292);
vertex(posx+283, 275);
vertex(posx+vertexX+278, vertexY+271);
endShape(CLOSE); 

fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+283, 275);
vertex(posx+283, 292);
vertex(posx+vertexX+315, vertexY+261);
vertex(posx+315, 244);
endShape(CLOSE); 
fill(posx+256,256,256);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+277, 271);
vertex(posx+vertexX+283, vertexY+275);
vertex(posx+315, 243);
vertex(posx+309, 239);
endShape(CLOSE); 

//fin biombo



//azul pequeño flat
fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+115, 191);
vertex(posx+vertexX+157,vertexY+ 234);
vertex(posx+182, 209);
vertex(posx+140, 166);
endShape(CLOSE);  
  
fill(36,70,143);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+115, 187);
vertex(posx+157, 230);
vertex(posx+vertexX+182, vertexY+205);
vertex(posx+140, 162);
endShape(CLOSE);  

//azul pequeno parado
fill(70,106,184);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+287, 171);
vertex(posx+287, 187);
vertex(posx+vertexX+314, vertexY+160);
vertex(posx+314, 144);
endShape(CLOSE); 

//blanco parado
fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+259, vertexY+138);
vertex(posx+259, 113);
vertex(posx+283, 90);
vertex(posx+283, 115);
endShape(CLOSE);

fill(257,257,257);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+260, vertexY+139);
vertex(posx+260, 114);
vertex(posx+284, 91);
vertex(posx+284, 116);
endShape(CLOSE); 

//verde flat

fill(0,0,0);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+260, vertexY+139);
vertex(posx+290, 169);
vertex(posx+325, 134);
vertex(posx+vertexX+295, vertexY+104);
endShape(CLOSE);  

fill(201,195,105);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+260, 136);
vertex(posx+vertexX+290, vertexY+166);
vertex(posx+325, 131);
vertex(posx+295, 101);
endShape(CLOSE); 



//cubi negro parado
fill(0,0,0);
stroke(257,257,257);
strokeWeight(0.2);
beginShape();
vertex(posx+200, 187);
vertex(posx+220, 204);
vertex(posx+vertexX+220, vertexY+177);
vertex(posx+200, 158);
endShape(CLOSE);

fill(0,0,0);
stroke(257,257,257);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+220, vertexY+177);
vertex(posx+200, 158);
vertex(posx+208, 150);
vertex(posx+228, 169);
endShape(CLOSE);
fill(0,0,0);
stroke(257,257,257);
strokeWeight(0.2);
beginShape();
vertex(posx+220, 204);
vertex(posx+vertexX+220, vertexY+177);
vertex(posx+228, 169);
vertex(posx+227, 196);
endShape(CLOSE);

//rojo parado pequeno
fill(150,48,26);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+181, 128);
vertex(posx+181, 140);
vertex(posx+vertexX+206,vertexY+ 164);
vertex(posx+206, 152);
endShape(CLOSE);  

//blanco pequeno que conecta con rojo pequeno parado
fill(257,257,257);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+vertexX+181,vertexY+ 128);
vertex(posx+181, 140);
vertex(posx+169, 149);
vertex(posx+169, 137);
endShape(CLOSE);  

//verde parado grande y largo
fill(201,195,105);
stroke(0,0,0);
strokeWeight(0.2);
beginShape();
vertex(posx+151, 118);
vertex(posx+151, 201);
vertex(posx+ vertexX+168, vertexY+216);
vertex(posx+168, 133);
endShape(CLOSE); 


}

/*
void keyPressed (){
  if (key == 'z') {
    vertexX=vertexX+5;
    vertexY=vertexY-5;
  } else if (key== 'x') {
    vertexX=vertexX-5;
    vertexY=vertexY-5;
  } else if (key== 'c') {
    vertexX=vertexX+5;
    vertexY=vertexY+5;
  }else if (key== 'v') {
    vertexX=vertexX-5;
    vertexY=vertexY+5;
  }
}

*/

void captureEvent(Capture cam)
{
  cam.read();
  newFrame = true;
}

void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges)
{
  noFill();
  Blob b;
  EdgeVertex eA,eB;
  for (int n=0 ; n<theBlobDetection.getBlobNb() ; n++)
  {
    b=theBlobDetection.getBlob(n);
    if (b!=null)
    {
      // Edges
      if (drawEdges)
      {
        strokeWeight(3);
        stroke(0,255,0);
        for (int m=0;m<b.getEdgeNb();m++)
        {
          eA = b.getEdgeVertexA(m);
          eB = b.getEdgeVertexB(m);
          if (eA !=null && eB !=null)
            line(
              eA.x*width, eA.y*height, 
              eB.x*width, eB.y*height
              );
        }
      }

      // Blobs
      if (drawBlobs)
      {
        vertexX=int(b.x*width)-(width/2);
        vertexY=int(b.y*height)-(height/2);
 
        strokeWeight(1);
        stroke(255,0,0);
//        rect(
//          b.xMin*width,b.yMin*height,
//          b.w*width,b.h*height
//          );
      }  

    } 

      }
      
      if (theBlobDetection.getBlobNb() ==0)  {vertexX=0; vertexY=0;}
}


void fastblur(PImage img,int radius)
{
 if (radius<1){
    return;
  }
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum,gsum,bsum,x,y,i,p,p1,p2,yp,yi,yw;
  int vmin[] = new int[max(w,h)];
  int vmax[] = new int[max(w,h)];
  int[] pix=img.pixels;
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++){
    dv[i]=(i/div);
  }

  yw=yi=0;

  for (y=0;y<h;y++){
    rsum=gsum=bsum=0;
    for(i=-radius;i<=radius;i++){
      p=pix[yi+min(wm,max(i,0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
    }
    for (x=0;x<w;x++){

      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if(y==0){
        vmin[x]=min(x+radius+1,wm);
        vmax[x]=max(x-radius,0);
      }
      p1=pix[yw+vmin[x]];
      p2=pix[yw+vmax[x]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=w;
  }

  for (x=0;x<w;x++){
    rsum=gsum=bsum=0;
    yp=-radius*w;
    for(i=-radius;i<=radius;i++){
      yi=max(0,yp)+x;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++){
      pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if(x==0){
        vmin[y]=min(y+radius+1,hm)*w;
        vmax[y]=max(y-radius,0)*w;
      }
      p1=x+vmin[y];
      p2=x+vmax[y];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=w;
    }
  }

}
