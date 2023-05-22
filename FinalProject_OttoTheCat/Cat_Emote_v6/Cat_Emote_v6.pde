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
import processing.serial.*; //imports Serial library

Cat myCat; //Declare a cat object as a global variable
SoundFile meo;//define SoundFile object meo
Serial myPort; //define serial object myPort

int value = 0; 
boolean valueleft; //this becomes true when the value coming to this sketch are 1s. 
boolean valueright; //this becomes true when the value coming to this sketch are 2s. 

void setup() {
size(1000,1000);//define canvas size
myCat = new Cat(color(64,64,64), color(192,255,213),400,600);  //construct a new cat object by passing the cat body color, eye color, left eartip X position, right eartip x position to the constructor. 
meo= new SoundFile(this,"meo.wav"); //create a new soundfile object by calling the meo.wav file which I imported to this sketch and assign it to the varible meo. 
printArray(Serial.list()); // this line prints the port list to the console
String portName = Serial.list()[2]; //change the number in the [] for the port I need
myPort = new Serial(this, portName, 9600); //create a new serial object named myPort, and initializing it with portName and rate.  

}



void draw(){  
  
  if ( myPort.available() > 0) { // If data is available,
    value = myPort.read(); //read the myport value and assign it to value. 
    println("value", + value); //print value to the console. 
    if(value == 1) {// represents the value is coming from the left photo resistor.
      valueleft = true; //assign valueleft to true if the incoming value is a one. 
    } else valueleft=false;
        println("valueleft " + valueleft);//console test. 
   
    if(value == 2) { //represents if value is coming from the right photo resistor.
      valueright = true; //assign rightvalue to true if the incoming value is a two. 
    } else valueright=false;
        println("valueright " + valueright); //console test. 
      }  
      
  background(255);//white. 
  myCat.display(); //call the display function to display the figures.  
  myCat.moveears(); //call the moveears function to change the x position of the cat eartips to move the ears. 
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
  
void display(){ 0
//draw cat
fill(bodycolor); //payne's grey. 

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
ellipse(400, 500, 70, 70); //draw left eye.
}


//my cat is very happy when the right mouse button is clicked. 
if ((valueright)){
noFill();
stroke(eyescolor); //right eyelid color. 
strokeWeight(4);
arc(600, 500, 70, 70, radians(180), radians(360));//draw right eyelid. 
} else {
fill(eyescolor);//right eye color
ellipse(600, 500, 70, 70); //draw the righteye.
valueright = false;}   

//my cat opens its mouth when he is very happy. 
if ((valueright)){
fill(255, 192, 203);//mouth color pink. 
stroke(255);
ellipse(510, 587, 70, 70); //mouth opened.
meo.play(); //play the wav file. 
} else {
noFill();
stroke(bodycolor); //closed mouth
strokeWeight(2);
fill(bodycolor);
ellipse(510, 587, 70, 70);
valueright = false;}  

stroke(5);
//mouth of the cat (top)
fill(bodycolor); //payne's grey. 
stroke(255, 255, 255); //set stroke color to white. 
strokeWeight(5);//set stroke weight.
arc(470, 550, 70, 70, 0, PI);//left mouthlip.
arc(540, 550, 70, 70, 0, PI);//right mouthlip

//Left ear
fill(bodycolor);
noStroke();
triangle(335,450, 470,330, leftearX,250);  

//Right ear
triangle(530,326, 670,450, rightearX,250 );

}

void moveears(){
  leftearX=random(390,410); //generate a random number between 390 and 410 and store in leftearx
  rightearX=random(590,610);  //generate a random number between 590 and 610 and store in rightearx
}

}
