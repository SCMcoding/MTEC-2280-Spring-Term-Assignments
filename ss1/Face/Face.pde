//Face

size(1080,720);
strokeWeight(2);
background(0, 153, 204);
ellipseMode(RADIUS);





strokeWeight(4);
line(0, 0, width, height); 
line(width, 0, 0, height); 




int y = 350;
int d = 100;
strokeWeight(8);
ellipse(770, y, d, d); // Left
ellipse(300, y, d, d); // Middle

//eye pupil 1
fill(200);
strokeWeight(4);
rect(730, 310, 80, 80);

//eye pupil 1
strokeWeight(4);
rect(255, 310, 80, 80);


//eyebrow 1
strokeWeight(8);
rect(100,23 , 850, 20);
//eyebrow 2
strokeWeight(6);
rect(200,70 , 650, 20);
//eyebrow 3
strokeWeight(4);
rect(300,120 , 450, 20);
//eyebrow 4
strokeWeight(4);
rect(400,170 , 250, 20);
strokeWeight(2);
rect(440,230 , 180, 20);
