//Receives data over Serial port from Processing to control 1 LED fade
//Demo Code used as the foundation for this led assignment


byte val1; // stores data received from serial port
byte val2; // stores data received from serial port
byte val3; // stores data received from serial port
byte val4; // stores data received from serial port
const int LED1 = 10; 
const int LED2 = 11;
const int LED3 = 12;
const int LED4 = 13;  


void setup() {

 
pinMode(LED1, OUTPUT); // initialize LED1 pin as a output
Serial.begin(9600); // Start serial communication at 9600 bps

pinMode(LED2,OUTPUT ); // initialize LED2 pin as a output
Serial.begin(9600); // Start serial communication at 8000 bps


pinMode(LED3, OUTPUT); // initialize LED3 pin as a output
Serial.begin(9600); // Start serial communication at 7000 bps


pinMode(LED4, OUTPUT); // initialize LED3 pin as a output
Serial.begin(9600); // Start serial communication at 6000 bps


}

void loop() {


  if (Serial.available()) { // If data is available to read
    val1 = Serial.read(); // read it and store it in val
  }


   if (Serial.available()) { // If data is available to read
    val2 = Serial.read(); // read it and store it in val
  }


   if (Serial.available()) { // If data is available to read
    val3 = Serial.read(); // read it and store it in val
  }

 if (Serial.available()) { // If data is available to read
    val4 = Serial.read(); // read it and store it in val
  }



  analogWrite(LED1, val1);
  delay(10); // Wait 10 milliseconds

   analogWrite(LED2, val2);
  delay(15); // Wait 10 milliseconds

 analogWrite(LED3, val3);
  delay(20); // Wait 10 milliseconds

   analogWrite(LED4, val4);
  delay(30); // Wait 10 milliseconds
}