Cat myCat;//Declare a cat object as a global variable

void setup() {
size(1000,1000);
myCat = new Cat(color(64,64,64),color(192,255,213)); // Declare a Cat object as a global variable.  
}
void draw(){
  background(255);
  myCat.display(); //Operate cat object in draw() by calling object display method.  
  }
  
class Cat{ //define a cat object
  color bodycolor;//create bodycolor variable to fill cat body
  color eyescolor;//create "eyecolor" variable which will be used to fill the color of the eyes and eyelids
  Cat(color tempbodycolor, color tempeyescolor){  //This  constructor accepts the body color, and eye color of the cat. 
  bodycolor=tempbodycolor;
  eyescolor=tempeyescolor;}
  
void display(){
//draw cat
fill(bodycolor);

//head
ellipse(504, 500, 350, 350);

//my cat is happy when the left button is clicked.
if (mousePressed&&mouseButton == LEFT){
stroke(eyescolor);//left eyelid color. 
strokeWeight(4); //left eyelid strokeWeight.
arc(400, 500, 70, 70, radians(180), radians(360));//left eyelid. 
} else {
fill(eyescolor);//fill left eye color 
ellipse(400, 500, 70, 70);} //left eye. 

//my cat is very happy when the right mouse button is clicked. 
if (mousePressed&&mouseButton == RIGHT){
noFill();
stroke(eyescolor); //closed eye color
strokeWeight(4);
arc(600, 500, 70, 70, radians(180), radians(360));//right eye lid. 
} else {
fill(eyescolor);//right eye color
ellipse(600, 500, 70, 70); }  //right eye. 

//my cat opens its mouth when she is very happy. 
if (mousePressed&&mouseButton == RIGHT){
fill(255, 192, 203);//mouth color. 
stroke(255);
ellipse(510, 587, 70, 70);
} else {
noFill();
stroke(bodycolor); //closed eye color
strokeWeight(2);
fill(bodycolor);
ellipse(510, 587, 70, 70); }  

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
triangle(335,450, 470,330, 400,250);

//Right ears
triangle(530,326, 670,450, 600,250 );

}




}
