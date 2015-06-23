---
layout: blog
title: intervenir la obra / experimento con blobDetection y Theo van Doesburg
category: blog
tags: [tags for the post, is here]  
summary: Esto es algo que hice hace algunos meses cuando estaba aprendiendo a usar la librería blobDetection para Processing.
image: /images/blog/post2_1.png
---


![Alt text](/images/blog/post2_1.png "theoVanDoesburg_blobDetection")
<br>
![Alt text](/images/blog/post2_2.png "theoVanDoesburg_blobDetection_v2")

<br>

[*(descargar código)*](https://dl.dropboxusercontent.com/u/21566953/mqvlm/post2_theo.zip)
<br>
<br>
<br>

Esto es algo que hice hace algunos meses cuando estaba aprendiendo a usar la librería blobDetection para Processing. 

La idea era jugar un poco con la aparente inmovilidad e imperturbabilidad de las imágenes cuando cuelgan en la pared de un museo o galería, aprovechando de paso la geometría de Theo van Doesburg para estirar sus vértices y así lograr nuevas perspectivas y algo así como una co-creación o reinterpretación de la obra con el visitante que pasa al frente:
<br>
<br>

<p><iframe frameborder="0" height="375" src="//player.vimeo.com/video/84337010" width="500"></iframe></p>
<br>
<br>
Tal vez la parte más complicada fue realmente la construcción vectorial de la imagen original que me tocó hacer a punta de vertex() y beginShape()/endShape() para jugar con los vértices y segmentos, pero realmente con un par de ajustes en la librería y una iluminación controlada digamos que me funcionó relativamente bien. Es claro que funcionaría aún mejor con un kinect para tener más precisión y poder incluir muchos más usuarios (y tal vez incluso asignarle diferentes cambios en la imagen a cada uno de ellos) pero incluso con este camino se pueden lograr efectos interesantes. Algo que no pude hacer en el momento pero que siempre funciona mejor en este tipo de cosas es proyectar desde atrás para que la persona no bote su sombra encima de la imagen, pero bueno, tal vez otro día con más espacio pueda repetir el experimento y lograr un mejor registro.



<br><br>
