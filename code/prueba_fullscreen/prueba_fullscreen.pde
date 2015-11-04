/*The formula for calculating the speed of the mouse’s 
horizontal motion is the
absolute value of the difference between mouseX and pmouseX. 
The absolute value of a
number is defined as that number without its sign:
The absolute value of –2 is 2.
The absolute value of 2 is 2.

*/

int grosor;

void setup() {
size(1200,800);
background(255);
smooth();

}

void draw() {
stroke(0);
grosor = abs(mouseX-pmouseX);
strokeWeight(grosor);
line(pmouseX ,pmouseY ,mouseX ,mouseY);


}

void mousePressed() {
background(255);
}