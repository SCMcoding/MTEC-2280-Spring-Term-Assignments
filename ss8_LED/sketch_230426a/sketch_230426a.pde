///////////////////////////////////////////////////////
/*
DEMO: SENDING DATA FROM PROCESSING TO ARDUINO
Pair with Arduino demo sketch to control LED fade.
Note: Be sure to specify correct port number below!
 */
///////////////////////////////////////////////////////

int val1=0;
int val2=0;
int val3 =0;
int val4 =0;
import processing.serial.*;  //import Serial library

Serial myPort;  // create object from Serial class

void setup() {
  size(500, 500); 
  background (255);
  fill(0);
  textSize (22);
  textAlign (CENTER, CENTER);

  //set up Serial communication
  
  
  
  
  printArray(Serial.list()); // prints port list to the console
  String portName = Serial.list()[0]; //change to match your port
  myPort = new Serial(this, portName, 9600); //initialize Serial communication at 9600 baud
}

void draw() {
  //text stuff
  
  
  //difine varibles for target practice
  int d = 150; 
  float e = 200; 
  float f = 250;
  background (200);
  strokeWeight(5);
  ellipse(mouseX, mouseY, f, f); // target 1
  ellipse(mouseX, mouseY, e, e); // target 2






//target practice body change color based on locations of the sketch
 if (mousePressed == true) {
  fill(val1);
} else if (mouseX < 300 && mouseY < 200) {
  fill(val2);
} else if (mouseX > 700 && mouseY < 200) {
  fill(val3);
} else if (mouseX < 300 && mouseY > 800) {
  fill(val4);
//} else if (mouseX > 700 && mouseY > 800) {
//  fill(255, 255, 0);
//} else {
//  fill(255);
//}



//ellipse
ellipse(mouseX, mouseY, d, d); // target 3

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


  //mouse location controls communication to Serial 
  val1= int (map (mouseX, 0, width, 0, 555)); //remaps mouseX to 0-255
  myPort.write(val1); 
  println(val1);
  
  val2= int (map (mouseX, 0, width, 0, 755)); //remaps mouseX to 0-255
  myPort.write(val2); 
  println(val2);
  
  val3= int (map (mouseX, 0, width, 0, 855)); //remaps mouseX to 0-255
  myPort.write(val3); 
  println(val3);
  
    
  val4= int (map (mouseX, 0, width, 0, 955)); //remaps mouseX to 0-255
  myPort.write(val4); 
  println(val4);
  
  
  
  
  
  
  
  
  //NOTE: IMPORTANT TO SEND VALUES 0-255 AS ARDUINO RECEIVES DATA IN BYTE-SIZE
}
