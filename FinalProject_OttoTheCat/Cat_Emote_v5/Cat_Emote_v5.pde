/* 
Samuel Cheung
Project Title: Otto The Cat 
This work contains what I have learned in this class demos and examples in the text books learning process by Daniel Shiffman and getting started with processing by Casey Reas and Ben Fry.

The code uses vaues coming from two photo resistors on my arduino board. The values were remapped into ones and twos before they were sent to the arduino A0 and A1 pins.

When the left photo resistor is blocked, the sketch recieves 1s, and draw the left eylid.  When the right photo resistor is blocked, the sketch recieves 2s, draw the right eye, the opened mouth, and play the meo wav file.  

My cat object contains four attributes of my cat: body color, eye color, the x pos of its left ear tip and the x pos of its right ear tip.  Both eartip values are used in my moveears function of my 
Cat class.  The display function contains figures I used for my cat.  Both functions are called in my draw() function.  
    
The foundation techniques of this code is based on the chapter examples of the Getting Started with Processing text books, The Learning Processing text book chapter 8.  
The play sound technique is learned from from chapter 13 of Getting started with Processing textbook.  
    
The wav file which plays the sound of my cat is downloaded mfrom https://freesound.org. 
*/


import processing.sound.*;//import sound library
import processing.serial.*; //imports Serial library from Processing

Cat myCat; //Declare a cat object as a global variable
SoundFile meo;//define SoundFile object meo
Serial myPort; //define serial object myPort

int value = 0; 
boolean valueleft; // creates variable for data coming from serial port
boolean valueright;

void setup() {
size(1000,1000);
myCat = new Cat(color(64,64,64), color(192,255,213),400,600);  //construct a new cat object
meo= new SoundFile(this,"meo.wav");

printArray(Serial.list()); // this line prints the port list to the console
String portName = Serial.list()[2]; //change the number in the [] for the port you need
myPort = new Serial(this, portName, 9600);

}

void draw(){  
  if ( myPort.available() > 0) { // If data is available,
    value = myPort.read();
    println("value", + value);
    if(value == 1) {// represents if the sensor value is a even number - left sensor
      valueleft = true; // if left sensor is covered, the value is one.
    } else valueleft=false;
        println("valueleft " + valueleft);
   
    if(value == 2) { //represents if sensor value is an odd number - right sensor
      valueright = true; // if right sensor is covered, the value is 2.
    } else valueright=false;
        println("valueright " + valueright);
    
  }  
  background(255);
  myCat.display(); //Operate cat object in draw() by calling object display method. 
  myCat.moveears();
  
  //int valueleft = 0; // creates variable for data coming from serial port
  //int valueright = 0;
  }
  
class Cat{ //define a cat object
  color bodycolor;//create bodycolor variable to fill cat body
  color eyescolor;//create "eyecolor" variable which will be used to fill the color of the eyes and eyelids
  float leftearX; //x position of left ear tip
  float rightearX; //x position of right ear tip
  Cat(color tempbodycolor, color tempeyescolor, float templeftearX, float temprightearX){ //the constructors is defined with arguments
  bodycolor=tempbodycolor; 
  eyescolor=tempeyescolor;
  leftearX= templeftearX;
  rightearX= temprightearX;
  
  }
  
void display(){
//draw cat
fill(bodycolor);

//draw cat head
ellipse(504, 500, 350, 350);

//my cat is happy when the left sensor is blocked.
if (valueleft){
noFill();
stroke(eyescolor);//left eyelid color. 
strokeWeight(4);//strokeweight for the left eyelid
arc(400, 500, 70, 70, radians(180), radians(360)); //draw the left eyelid. 
} else {
fill(eyescolor);//fill eye color 
ellipse(400, 500, 70, 70);
}


//my cat is very happy when the right mouse button is clicked. 
if ((valueright)){
noFill();
stroke(eyescolor); //closed eye color
strokeWeight(4);
arc(600, 500, 70, 70, radians(180), radians(360));//draw the right eyelid. 
} else {
fill(eyescolor);//right eye color
ellipse(600, 500, 70, 70); 
valueright = false;}   //right eye. 

//my cat opens its mouth when he is very happy. 
if ((valueright)){
fill(255, 192, 203);//mouth color pink. 
stroke(255);
ellipse(510, 587, 70, 70); //open the mouth
meo.play();
} else {
noFill();
stroke(bodycolor); //closed mouth
strokeWeight(2);
fill(bodycolor);
ellipse(510, 587, 70, 70);
valueright = false;}  

stroke(5);
//mouth of the cat (top)
fill(bodycolor);
stroke(255, 255, 255);
strokeWeight(5);
arc(470, 550, 70, 70, 0, PI);//left side
arc(540, 550, 70, 70, 0, PI);//right side

//Left ears
fill(bodycolor);
noStroke();
triangle(335,450, 470,330, leftearX,250);

//Right ears
triangle(530,326, 670,450, rightearX,250 );

}

void moveears(){
  leftearX=random(390,410); 
  rightearX=random(590,610);  
}

}
