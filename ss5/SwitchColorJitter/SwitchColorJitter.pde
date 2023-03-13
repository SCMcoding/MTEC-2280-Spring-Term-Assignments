float[] gray;
JitterBug[] bugs = new JitterBug[33];
boolean isPurple = true;

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
  }
}
