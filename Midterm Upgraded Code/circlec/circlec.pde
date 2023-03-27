// Midterm Final Revision (Random Shapes)
// code is inspired by the jitter bug program. Using some old aspects from my old target practice code




float[] gray;
JitterBug[] bugs = new JitterBug[33];
boolean isPurple = true;
float angle = 0.0;
float radius = 10.0;
float increment = 0.1;
int numLoops = 10;
int numPoints = 360 * numLoops;
float[] x = new float[numPoints];
float[] y = new float[numPoints];

void setup() {
  size(800, 600); // Increase canvas size to 800x600
  background(0, 0, 255); // Set background color to blue
  
  // Initializing the gray array
  gray = new float[width];
  for (int i = 0; i < gray.length; i++) {
    gray[i] = random(0, 255);
  }
  
  // Initializing the JitterBug array
  for (int i = 0; i < bugs.length; i++) {
    float x = random(width);
    float y = random(height);
    int r = i + 2;
    bugs[i] = new JitterBug(x, y, r);
  }
  
  smooth();
  stroke(0, 100);
}

void draw() {
  // Alternating between purple and light purple lines
  if (isPurple) {
    stroke(128, 0, 128); // Purple color
  } else {
    stroke(204, 153, 255); // Light purple color
  }
  
  // Drawing the lines
  for (int i = 0; i < gray.length; i++) {
    line(i, 0, i, height);
  }
  
  // Moving and displaying the JitterBugs
  for (int i = 0; i < bugs.length; i++) {
    bugs[i].move();
    bugs[i].display();
  }

  // Draw the spiral
  translate(width/2, height/2);
  for (int i = 0; i < numPoints; i++) {
    x[i] = radius * cos(angle);
    y[i] = radius * sin(angle);
    angle += increment;
    radius += 0.001;
  }
  for (int i = 0; i < numPoints - 1; i++) {
    line(x[i], y[i], x[i+1], y[i+1]);
  }
  
  // Changing the color flag every 50 frames
  if (frameCount % 50 == 0) {
    isPurple = !isPurple;
  }
}

class JitterBug {
  float x, y;
  float diameter;
  float speed;
  
  JitterBug(float tempX, float tempY, float tempD) {
    x = tempX;
    y = tempY;
    diameter = tempD;
    speed = 2;
  }
  
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  
  void display() {
    fill(255, 0, 255); // Pink color
    ellipse(x, y, diameter, diameter);
    
     int x = 50;
  
  
  // Target 
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

  fill(random(255), random(255), random(255), random(255));
  stroke(random(255), random(255), random(255), random(255));
  int shapeType = int(random(4)); // choose a random shape type
  int a = int(random(width));
  int b = int(random(height));
  int size = int(random(10, 100)); // choose a random size between 10 and 100
  
  if (shapeType == 0) { // draw a rectangle
    rect(a, b, size, size);
  } else if (shapeType == 1) { // draw an ellipse
    ellipse(a, b, size, size);
  } else if (shapeType == 2) { // draw a triangle
    triangle(a, b, a+size, b, a+size/2, b+size);
  } else { // draw a line
    line(a, b, a+size, b+size);
  }


}
    
  
  }
