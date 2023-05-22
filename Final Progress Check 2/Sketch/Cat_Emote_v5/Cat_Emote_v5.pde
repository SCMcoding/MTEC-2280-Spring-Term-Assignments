

Cat myCat; //Declare a cat object as a global variable

import processing.sound.*;//import sound library
import processing.serial.*; //imports Serial library from Processing
SoundFile meo;//define sound object meo



Serial myPort; // creates object from Serial class
int value = 0;
int valueleft = 0; // creates variable for data coming from serial port
int valueright = 0;



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
    if(value%2 == 0){ // represents if the sensor value is a even number - left sensor
    valueleft = value;
    println("valueleft " + valueleft);
    } else if(value%2 == 1){ //represents if sensor value is an odd number - right sensor
    valueright = value;
    println("valueright " + valueright);
    }    
  }  
  background(255);
  myCat.display(); //Operate cat object in draw() by calling object display method. 
  myCat.moveears();
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

//my cat is happy when the left button is clicked.
if (valueleft<20){
stroke(eyescolor);//left eyelid color. 
strokeWeight(4);//fill left eye color
arc(400, 500, 70, 70, radians(180), radians(360)); //left eye. 
} else {
fill(eyescolor);//fill eye color 
ellipse(400, 500, 70, 70);}

//my cat is very happy when the right mouse button is clicked. 
if ((valueleft<20) && (valueright<15)){
noFill();
stroke(eyescolor); //closed eye color
strokeWeight(4);
arc(600, 500, 70, 70, radians(180), radians(360));//right eye lid. 
} else {
fill(eyescolor);//right eye color
ellipse(600, 500, 70, 70); }   //right eye. 

//my cat opens its mouth when he is very happy. 
if ((valueleft<20) && (valueright<15)){
fill(255, 192, 203);//mouth color. 
stroke(255);
ellipse(510, 587, 70, 70); //open the mouth
meo.play();
} else {
noFill();
stroke(bodycolor); //closed mouth
strokeWeight(2);
fill(bodycolor);
ellipse(510, 587, 70, 70);
}  

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
