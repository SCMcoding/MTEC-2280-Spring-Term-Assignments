PImage Ultraman;  //Creates a PImage object called Ultraman
PImage Belial; //Creates a PImage object called Belial
PImage HereGo; //Creates a PImage object called HereGo
PImage Finished; //Creates a PImage object called Finished
PImage GeedRise; //Creates a PImage object called GeedRise
PImage Transform; //Creates a PImage object called Transform
String message = ""; //Creates a String object to store the message entered in the text box

void setup() {
  size (500, 500);
  background (255);
  imageMode(CENTER); //draws images from center point

  //Assign image to object using loadImage() method
  Ultraman = loadImage("GeedUltraman.png");
  Belial = loadImage("GeedBelial.png");
  HereGo = loadImage("Ultraman_and_Belial_inserted_scan.png");
  Finished = loadImage("Geed1.gif");
  GeedRise = loadImage("GeedRise.png");

  //Initialize Transform with Ultraman image
  Transform = Ultraman;
  
  //Create text box with createInput() function
  createInput();
}  

void draw() {
  background(255);  

  //Check if Transform is not null before displaying it
  if (Transform != null) {
    //display image with image() method
    image(Transform, width/2, height/2);
  }
  
  //Display message entered in text box
  fill(0);
  textSize(16);
  text(message, 10, 20);
}

void keyPressed() {
  if (key == '1') {
    Transform = Ultraman;
    message = "Ultraman transformed!";
  }

  if (key == '2') {
    Transform = Belial;
    message = "Belial transformed!";
  }

  if (key == '3') {
    Transform = HereGo;
    message = "Ultraman and Belial fused!";
  }
  
  if (key == '4') {
    Transform = Finished;
    message = "Transformation complete!";
  }
  
  if (key == '5') {
    Transform = GeedRise;
    message = "Geed rising!";
  }
  
  //Clear message String if any other key is pressed
  if (key != '1' && key != '2' && key != '3' && key != '4' && key != '5') {
    message = "";
  }
}

void keyTyped() {
  //Add characters typed to the message String
  if (key != ENTER && key != BACKSPACE) {
    message += key;
  }
  
  //Clear message String if ENTER key is pressed
  if (key == ENTER) {
    message = "";
  }
}
