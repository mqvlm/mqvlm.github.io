
/* 

  __
 (  ->
 / )\
<_/_/
 " "    mqvlm.github.io 

*/


//Empezando con simple-openNI para Processing y Kinect

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
 

import SimpleOpenNI.*;   /*Importa la librería, primero toca descargarla en
                         https://code.google.com/p/simple-openni/downloads/list
                         y luego guardarla en 
                         Documentos -> Processing -> libraries */
                      
                         
                         /*ojo: siempre cerrar y volver a abrir Processing 
                         cuando se instala una librería*/

SimpleOpenNI  context; /*declaramos el objeto context, que es el método de
                       la librería que contiene todas las 
                       funcionalidades de la cámara y las imágenes*/


color[]       userClr = new color[]{ color(255,0,0),
                                     color(0,255,0),
                                     color(0,0,255),
                                     color(255,255,0),
                                     color(255,0,255),
                                     color(0,255,255)
                                   };
             
              /*creamos un arreglo de colores llamado userClr, que está 
                compuesto de los 6 colores con los que se va a identificar
                el esqueleto de cada uno de los 6 usuarios que permite la 
                librería*/              
                                   
                                   
                                                                  

void setup()
{
  size(640,480,P2D);
  
  background(0);
  
  context = new SimpleOpenNI(this); /*inicializamos el objeto contexto,
                                    que es el que contiene las funcionalidades 
                                    de cámara e imagen*/
  
  
  if(context.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }   /*--> este if es simplemente para mandar un mensaje en la consola si
         por algún motivo el contexto no pudo ser inializado, por ejemplo en 
         el caso que a uno se le haya olvidado conectar el kinect!*/
  
  
  
  context.enableDepth();  /* se inicializa la función que lee la profundidad
                             del espacio,la cual vemos en los tonos de gris de
                             la imagen, entre más claro el gris es porque 
                             el objeto está más cerca a la cámara*/
                            
   

  context.enableUser(); /*esta función por su parte es a que lee dónde están
                         las articulaciones de cada  usuario para leer el 
                         esqueleto de cada uno de ellos*/
 
  
  

}

void draw()
{
 
  context.update();  /* esta función actualiza la imagen de la cámara 
                     permanentemente*/
  

  image(context.userImage(),0,0); /*aquí dibujamos el contexto que está leyendo
                                   el kinect y los usuarios que posiblemente 
                                   pueda detectar, eso lo vemos cuando se nos 
                                   colorea la masa de nuestro cuerpo*/
  
  /*Si reconoce un esqueleto, lo dibuja con este loop. ¿Que hace este for? 
   Llama  para cada uno de los usuarios la función que 
  tenemos un poco más abajo, en el void drawSkeleton*/  
  
  int[] userList = context.getUsers();  /* -->creamos un arreglo de números 
                                         donde vamos a guardar la lista de 
                                         cuántos usuarios hay en ese momento en el contexto, eso nos lo da la función
                                         context.getUsers. Por ejemplo si hay 
                                         tres usuarios, userlist tendrá tres
                                         números [0,1,2], y ese será 
                                         el ID de cada uno de ellos, según 
                                         quién haya entrado primero al contexto.
                                         por ejemplo si yo entré primero 
                                         seré el 0. */
  
  
  /*Para cada uno de los udsaurio identificados en la lista, pínteles el 
  esqueleto llamando la función drawSkeleton:*/
  for(int i=0;i<userList.length;i++)
  {
    if(context.isTrackingSkeleton(userList[i]))
    {
      stroke(userClr[ (userList[i] - 1) % userClr.length ] ); 
      //esto lo que hace es asignarles un color sin que se repita
      drawSkeleton(userList[i]);
    }      
  }    
  
  
}

/*¿Cómo dibujamos el esqueleto? Con las articulaciones que queramos unir,
so quiere decir que tendremos que dibujarlíneas de una articulación a otra
así:*/

void drawSkeleton(int userId)
{
 
 /*context.drawLimb es una función que nos ayuda a pintar esas líneas de 
 articulación a articulación dándole simplemente tres variables, qué 
 ID de usuario está entrando, que esa ya entra automáticamente, y qué
 partes queremos unir, que eso sí se lo tenemos que decir:

en el primer caso que vemos en la lista estamos uniendo la cabeza SKEL_HEAD,
con el cuello SKEL_NECK, y así:*/

  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);

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
  
  /*para entender mejor esto prueba a borrar algunas de las líneas y verás 
  qué partes desaparecen de la imagen del esqueleto, o crea una nueva línea
  juntando las partes que quieras y que no están ahí,  por ejemplo descomenta
  esta en la que dibujo una línea de la mano izquierda al pie izquierdo:*/
  
  // context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_LEFT_FOOT);
  
}

// -----------------------------------------------------------------

// Otros eventos de la librería

/*estos son sotros eventos necesarios */


void onNewUser(SimpleOpenNI curContext, int userId) 
/*-->este lo que hace es crear un ID de usuario cada vez que entra alguien,
y empezar a rastrearle constantemente las coordenadas del esqueleto*/
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  
  curContext.startTrackingSkeleton(userId);
}



void onLostUser(SimpleOpenNI curContext, int userId) 
//-> este nos dice en consola qué usuario perdimos
{
  println("onLostUser - userId: " + userId);
}


/*UNA ÚLTIMA COSA: el reconocimiento de usuarios no funciona bien si uno está demasiado cerca o demasiado lejos de la cámara del kinect, 
hay una zona a la que hay que limitarse si uno quiere que sus instalaciones funcionen bien. Lo mejor es dejar aprox. un metro y medio de 
distancia entre el kinect y el espacio de intreacción y saber que más o menos de ese metro y medio para atrás hay unos cuatro metros y
medio en los que funciona bien, ya más atrás que eso empieza a fallar!
*/