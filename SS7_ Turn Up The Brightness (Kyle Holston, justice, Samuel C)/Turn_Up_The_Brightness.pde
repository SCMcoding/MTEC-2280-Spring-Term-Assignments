/*
Reads values from serial port, written to the port by Arduino.
 The size of an ellipse changes according to the serial values.
 Must assign the correct port, see instructions below!
 */


// Kyle Holston, justice, Samuel C
// Turn up the brightness Sketch
//base code taken from the professors demo
//

import processing.serial.*; //imports Serial library from Processing

Serial myPort; // creates object from Serial class
int val=0; // creates variable for data coming from serial port
int val2=0;
int val3=0;

void setup() {
  size(400, 400);
  /*
   IMPORTANT: We must tell Processing which port to read from.
   Run the sketch and check your console to see the results of printArray(Serial.list());
   and that is how you know the port to use.
   On my Mac, it is port 1 and so I open Serial.list()[1].
   */

  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[2]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
  
}

void draw() {
  
  
//target practice components only  
  int d = 150; 
  float e = 200; 
  float f = 250;
//  
  
  
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }
  
  //two diffrent statements below
    if ( myPort.available() > 10) { // If data is available,
    val2 = myPort.read(); // read it and store it in val
  }
  
     if ( myPort.available() > 15) { // If data is available,
    val3 = myPort.read(); // read it and store it in val
  }

  //draws an ellipse that grows and shrinks in relation to val
background(val2, val, val2);
  //fill (0);
  //ellipse (width/2, height/2, val, val);
  
  
  // code from justice 
  fill(192, 192, 192);
  //outer body shape 1
  rect(width/166, height/50, val, val);
  
  fill(105,105,105);
  rect(width/180, height/160, val, val, val);
   
  //shape 2 

  circle(width/470,height/110 ,val);
  

  //shape 3
  circle(width/395, height/400, val);
  
  // code from Kyle 
  
  fill(val,val,222); //Potentiometer will change the color of the shapes
  ellipse(width/2, height/2, 100,100);
  
  // target practice sam
 
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
  
    fill(val);
   ellipse(mouseX, mouseY, f, f); // target 1
   fill(val2);
   ellipse(mouseX, mouseY, e, e); // target 2
   fill(val3);
   ellipse(mouseX, mouseY, d, d); // target 3
  

  //println (val); //prints to Processing console
}
