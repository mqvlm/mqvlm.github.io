/* 

  __
 (  ->
 / )\
<_/_/
 " "    mqvlm.github.io 

*/

//PINTANDO CÍRCULOS CON LAS MANOS
//Empezando con simple-openNI para Processing y Kinect PARTE 2


//OJO: No funciona bien en la versión 2.2.1, es mejor trabajarla en 1.5

//http://mqvlm.github.io/blog/simpleopenNI.html

/*Basado en: 

/* --------------------------------------------------------------------------
 * SimpleOpenNI User Test
 * --------------------------------------------------------------------------
 * Processing Wrapper for the OpenNI/Kinect 2 library
 * http://code.google.com/p/simple-openni
 * --------------------------------------------------------------------------
 * prog:  Max Rheiner / Interaction Design / Zhdk / http://iad.zhdk.ch/
 * date:  12/12/2012 (m/d/y)
 * ----------------------------------------------------------------------------
 */

import SimpleOpenNI.*;



SimpleOpenNI  context;
color[]       userClr = new color[]{ color(255,0,0),
                                     color(0,255,0),
                                     color(0,0,255),
                                     color(255,255,0),
                                     color(255,0,255),
                                     color(0,255,255)
                                   };
                               

void setup()
{
  size(640,480);

  background(0);
  
  context = new SimpleOpenNI(this);
  if(context.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  

  context.enableDepth();
   
 
  context.enableUser();
 
  smooth();  
}

void draw()
{
  
  fill(0,5); 
  noStroke();
  rect(0,0,width, height);
  
  context.update();
  
 // image(context.userImage(),0,0);
  

  int[] userList = context.getUsers();
  for(int i=0;i<userList.length;i++)
  {
    if(context.isTrackingSkeleton(userList[i]))
    {
      //stroke(userClr[ (userList[i] - 1) % userClr.length ] );
      stroke (255);
      drawSkeleton(userList[i]);
    }      
      
   
  }    
}


void drawSkeleton(int userId)
{
  //AQUÍ EMPIEZA!
  
  /*---> Esta era la parte que usábamos para pintar el esqueleto, ya no necesitamos estas líneas, 
  pero vamos a usar este void para dibujar los círculos!
  
  /*context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HAND, SimpleOpenNI.SKEL_RIGHT_KNEE );
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_LEFT_KNEE );
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HAND, SimpleOpenNI.SKEL_HEAD );
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_HEAD );
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HAND, SimpleOpenNI.SKEL_TORSO );
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_TORSO );
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HIP );
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HIP );
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HAND, SimpleOpenNI.SKEL_RIGHT_FOOT );
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_LEFT_FOOT );
  
  //context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_FOOT, SimpleOpenNI.SKEL_RIGHT_FOOT );
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_RIGHT_SHOULDER );
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_LEFT_SHOULDER );
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_FOOT, SimpleOpenNI.SKEL_LEFT_KNEE );
  
   context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_FOOT, SimpleOpenNI.SKEL_RIGHT_KNEE );
   
   */
  
  float relleno = random(150,255);  //le pongo un random para el efecto de grises de los círculos. 
  
  float d = random(40);  /* esta variable "d" será el diámetro de los círculos, 
                          al que le pongo un random entre 0 y 40 pixeles */
  
  noStroke();
  
  //!!!!!!!!!!!!
  
  /*ESTA ES LA PARTE CLAVE DE TODO, LA QUE SIRVE PARA PROGRAMAR CUALQUIER INTERACTIVIDAD CON
  EL CUERPO DE LOS USUARIOS Y EL KINECT*/
  
  //!!!!!!!!!!!!!!!!
  
  /* Qué pasa, tenemos que sacar las coordenadas x,y,z de la articulación del cuerpo que 
  estamos necesitando, en este caso las dos manos. Hay una forma de guardar tres variables  
  en una sola, y estos se llaman los vectores, y en processing, PVECTOR. 
 
  Cuando uno crea un vector, por ejemplo PVector manDer, como el que vamos a crear en la siguiente
 línea para guardar las posiciones x,y,x de la mano derecha, luego podemos pedirle solo la coordenada
 x diciendo manDer.x. , o la y diciendo manDer.y. 
 
 Creamos entonces el vector: */
  
  //mano derecha
  PVector manDer = new PVector();
  
  /*luego, tenemos que usar el método de la librería para extraer las tres coordenadas x,y,z 
  de esa articulación que queremos y guardarlas en ese vector que creamos. 
  Eso se hace con la siguiente línea: */
  
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HAND,manDer);
  
  /*Sin embargo no es suficiente con tener ya las tres coordenadas almacenadas en ese vector,
  hay un paso más. Estamos tomando información de un espacio tridimensional, pero en el computador en 
  la pantalla nos toca "aplanar" esa imagen a un espacio bidimendional, como hacen los pintores con 
  un cuadro y la perspectiva. Para eso, tenemos que pasar esas coordenadas de un mundo real, "RealWorld",
  a uno proyectivo o "Projective". Eso lo hace la librería con el método convertRealWorldToProjective.
  Para esto hay que crear un segundo vector, donde vamos a guardar las nuevas coordenadas "aplanadas"
  
  En mi caso, al vector de la mano manDer le creo uno proyectivo que se llama manDerProj: */

  PVector manDerProj = new PVector();
  context.convertRealWorldToProjective(manDer,manDerProj);
  
  /*Luego ya puedo pintar la ellipse justo encima de la mano del usuario, pero dándole como x y como
  y a las posiciones de la elipse las coordenadas del vector "aplastado", así: */
  
  fill(relleno);
  ellipse(manDerProj.x, manDerProj.y, d, d);
  
  //vuelvo a hacer lo mismo con la mano izquierda:
  
  //mano izquierda
  PVector manIzq = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND,manIzq);

  PVector manIzqProj = new PVector();
  context.convertRealWorldToProjective(manIzq,manIzqProj);
  
  fill(relleno);
  ellipse(manIzqProj.x, manIzqProj.y, d, d);
  
  /*y ya! uno puede usar ese paso a paso para pedirle cualquier coordenada la cuerpo,
  y pasarla al canvas en 2d de processing "aplastando los vectores"*/
  
  
}

// -----------------------------------------------------------------
// SimpleOpenNI events

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  
  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
 /* fill(0);
  noStroke();
  rect(0,0,width, height); */
  
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}



