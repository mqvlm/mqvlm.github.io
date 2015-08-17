---
layout: blog
title: empezando con kinect
tags: [tags for the post, is here]  
summary:  tutorial para empezar con simple-openNI para Processing y Kinect
category: blog
image: /images/blog/post17/0.png

---

<p><iframe frameborder="0" height="394" src="//player.vimeo.com/video/135920131" width="700"></iframe></p>

_[Ver más grande en Vimeo](https://vimeo.com/135920131)_

<br>
<br>

![Alt text](/images/blog/post17/1.png)  

![Alt text](/images/blog/post17/2.png)  

![Alt text](/images/blog/post17/3.png)  

![Alt text](/images/blog/post17/4.png)  

![Alt text](/images/blog/post17/5.png)  


No es tan difícil empezar a trabajar con kinect. En esta entrada, comparto el código básico para empezar.

Por mi parte he trabajado la librería [*simple-openNI*](https://code.google.com/p/simple-openni/) para conectar el kinect con Processing, aunque sé que hay otras que han venido saliendo y que tal vez incluso funcionen mejor, pero en este caso voy a explicar como hacerlo con la que conozco. 

Pueden empezar por  descargar la librería [*aquí*](https://dl.dropboxusercontent.com/u/21566953/SimpleOpenNI-1.96.zip) e instalarla como siempre se instalan librerías en Processing: Documentos -> Processing -> libreries. No olviden cerrar y volver a abir Processing cada vez que instalan una librería nueva, si no no se las va a reconocer. 

Si están trabajando desde PC también tendrán que instalar los drivers de kinect, es un programa que tienen que descargar [*aquí*](https://www.microsoft.com/en-us/download/details.aspx?id=44561) y seguir el paso a paso para instalarlo. (SOLO PC, mac no necesita esto)

La librería está molestando con las nuevas versiones de Processing, así que recomiendo usarla en Processing 1.5 mientras la actualizan para que funcionen con las nuevas versiones.

Como siempre, lo mejor para entender una librería es meterse a algunos de los ejemplos que trae, y en este caso recomiendo mirar el que se llama "User" que es el básico. Sin embargo,  me tomé el trabajo de comentar el ejemplo línea por línea y se los dejo aquí para que lo descarguen y empiecen a jugar con las variables a ver qué pasa: [*descargar ejemplo comentado*](https://dl.dropboxusercontent.com/u/21566953/mqvlm/post17_simpleOpenNI.zip) 

OJO: no se desesperen muy rápido si no los reconoce el kinect, muevan los brazos o muévase un poco. Si se quedan muy quietos el kinect los pierde o no los reconoce de entrada. 

El video y las imágenes que puse más arriba son ejemplo de cómo moviendo solo algunas funcionalidades básicas que vienen por default en ese ejemplo de "User" se pueden empezar a lograr efectos interesantes, además que es la forma más directa para ir entendiendo los métodos y así lanzarse a empezar a programar interactividad de todo tipo. 

Por eso, también les dejo para descargar [*la parte 2 de este tutorial*](https://dl.dropboxusercontent.com/u/21566953/mqvlm/post17_circulosConLasManos.zip), que es usar el kinect para dibujar con las manos. Este código es el mismo del ejemplo que pongo arriba, solo que ya no para dibujar esqueletos, sino para tomar sólo las coordenadas de las manos y usarlas para dibujar círculos o cualquier otra cosa que se les ocurra. 

En ese código de los círculos que les pongo está la base para programar cualquier tipo de interactividad con el cuerpo. La clave está en la parte en la que se toman las coordenadas de una de las articulaciones. Está súper señalada en el código de pintar círculos con las manos, y si no, la vuelvo a poner acá:

//mano derecha
  PVector manDer = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HAND,manDer);

  PVector manDerProj = new PVector();
  context.convertRealWorldToProjective(manDer,manDerProj);
  
  fill(relleno);
  ellipse(manDerProj.x, manDerProj.y, d, d);
  
  //mano izquierda
  PVector manIzq = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND,manIzq);

  PVector manIzqProj = new PVector();
  context.convertRealWorldToProjective(manIzq,manIzqProj);
  
  fill(relleno);
  ellipse(manIzqProj.x, manIzqProj.y, d, d);


 En este caso, se están tomando las coordenadas de las mano derecha primero, y luego de la mano izquierda. Para entender qué está haciendo el código ahí miren el ejemplo que ahí comento paso por paso todo. 



No escribo nada más aquí porque todo está comentado en los dos ejemplos que dejé para desacrgar. Espero que les sirva!

p.s. A veces surgen muchos problemas a la hora de reconocer el kinect con el computador, depende mucho de qué OS estén usando, de qué Windows, aquí no puedo poner todos los conflictos que me he en encontrado por el camino. En ese caso lo mejor es copy/paste del error y buscar en google a ver qué se puede hacer, como siempre se hace con estas cosas. 




<br>
<br>

