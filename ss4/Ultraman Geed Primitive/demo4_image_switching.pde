//Geed Transformation
//Samuel Cheung

PImage Ultraman;
PImage Belial;
PImage HereGo;
PImage Finished;
PImage GeedRise;
PImage Transform;

int transitionDuration = 30;
int transitionFrame = 0;
PImage previousTransform;

String ultramanText = "Geed Ultraman";
String belialText = "Geed Belial";
String hereGoText = "Ultraman and Belial";
String finishedText = "Geed Finished";
String geedRiseText = "Geed Rise";

void setup() {
  size(500, 500);
  background(255);
  imageMode(CENTER);

  Ultraman = loadImage("GeedUltraman.png");
  Belial = loadImage("GeedBelial.png");
  HereGo = loadImage("Ultraman_and_Belial_inserted_scan.png");
  Finished = loadImage("Geed1.gif");
  GeedRise = loadImage("GeedRise.png");

  Transform = Ultraman;
}

void draw() {
  background(255);
  
  if (Transform != null) {
    if (previousTransform == null) {
      image(Transform, width/2, height/2);
    } else {
      float transitionRatio = 1.0 * transitionFrame / transitionDuration;
      if (transitionRatio > 1.0) {
        previousTransform = null;
        transitionFrame = 0;
        image(Transform, width/2, height/2);
      } else {
        image(previousTransform, width/2, height/2, width * (1 - transitionRatio), height * (1 - transitionRatio));
        image(Transform, width/2, height/2, width * transitionRatio, height * transitionRatio);
        transitionFrame++;
      }
    }
    
    // Display text for current image
    textSize(32);
    textAlign(CENTER, CENTER);
    fill(0);
    
    if (Transform == Ultraman) {
      text(ultramanText, width/2, height - 50);
    } else if (Transform == Belial) {
      text(belialText, width/2, height - 50);
    } else if (Transform == HereGo) {
      text(hereGoText, width/2, height - 50);
    } else if (Transform == Finished) {
      text(finishedText, width/2, height - 50);
    } else if (Transform == GeedRise) {
      text(geedRiseText, width/2, height - 50);
    }
  }
}

void keyPressed() {
  if (key == '1') {
    previousTransform = Transform;
    Transform = Ultraman;
  } else if (key == '2') {
    previousTransform = Transform;
    Transform = Belial;
  } else if (key == '3') {
    previousTransform = Transform;
    Transform = HereGo;
  } else if (key == '4') {
    previousTransform = Transform;
    Transform = Finished;
  } else if (key == '5') {
    previousTransform = Transform;
    Transform = GeedRise;
  }
  
  transitionFrame = 0;
}
