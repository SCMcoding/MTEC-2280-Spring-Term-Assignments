
// Name: Samuel Cheung
// Title: Beta Sketch
// Instructions: Move your mouse over the screen and click to change the color of the circle.



void setup(){
  size (700,700);
}

void draw() {
  // Draw the background for the first sketch
  background(255, 220, 200);
  
  int x = 50;
  
  // Draw rectangles in the top row
  while (x < width) {
    rect(x, height/2 - 112.5, 75, 75);
    x += 100;
  }
  
  x = 75; // Start from the second column
  // Draw rectangles in the bottom row
  while (x < width) {
    rect(x, height/2 + 37.5, 75, 75);
    x += 100;
  }
  
  // Draw the second sketch on top of the first one
  int d = 150; 
  float e = 200; 
  float f = 250;
  strokeWeight(5);
  ellipse(mouseX, mouseY, f, f); // target 1
  ellipse(mouseX, mouseY, e, e); // target 2
 
  if (mousePressed == true) { // conditional statement
    fill(0);
  } else {
    fill(255);
    ellipse(mouseX, mouseY, d, d); // target 3
  }

  line(200,-100,mouseX,mouseY); // line 1
  line(500,-100,mouseX,mouseY); // line 2
  line(800,-100, mouseX,mouseY); // line 3
  line(0,200,mouseX,mouseY); // line 4
  line(0,400,mouseX,mouseY); // line 5
  line(0,600,mouseX,mouseY); // line 6
  line(0,800,mouseX,mouseY); // line 7
  line(0,1000,mouseX,mouseY); // line 8
  line(200,1000,mouseX,mouseY); // line 9
  line(500,1000,mouseX,mouseY); // line 10
  line(800,1000,mouseX,mouseY); // line 11
  line(1100,1000,mouseX,mouseY); // line 12
  line(1100,800,mouseX,mouseY); // line 13
  line(1100,600,mouseX,mouseY); // line 14
  line(1100,400,mouseX,mouseY); // line 15
  line(1100,200,mouseX,mouseY); // line 16
}
