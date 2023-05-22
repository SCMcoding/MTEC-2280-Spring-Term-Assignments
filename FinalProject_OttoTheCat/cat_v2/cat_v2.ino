//This code sends serial data from Arduino to Processing by reading the analog sensors 
//and write their values to the serial port.

const int sensorleft = A0;  //Sensorleft is connected to pin A0.  
const int sensorright = A1; //Sensorright is connected to pin A1.  
int valueleft = 0; //stores value for left sensor.  
int valueright = 0; //stores value for right sensor.

void setup() {
  pinMode (sensorleft, INPUT); //Set sensorleft(A0) as an input pin.
  pinMode (sensorright, INPUT); //Set sensorright(A1) as an input pin.
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {

int mappedvalueleft = 0;
int mappedvalueright = 0;

valueleft = analogRead(sensorleft); //read sensor and assign to variable called valueleft
if ((valueleft >= 0) && (valueleft < 60)) //check if the left sensor is being blocked
  mappedvalueleft = map(valueleft, 0, 60, 1, 1); //if yes, change its value to one and store it to 
                                                 //mappedvalueleft.

valueright = analogRead(sensorright); //read sensor and assign to variable called valueright
if ((valueright >= 0) && (valueright<50)) //check if the right sensor is being blocked
mappedvalueright = map(valueright, 0, 60, 2, 2); //if yes, change its value to two and store it to
                                                 //mappedvalueright. 

  delay(1000); // 

  /////////Uncomment Serial.print() OR Serial.write() to test and not both!//////////////
  
  // Serial.print("mappedvalueleft = ");
  // Serial.println(mappedvalueleft); //to send human-readable data to Arduino monitor
  // Serial.print("valueleft= " );
  // Serial.println(valueleft); 
//   Serial.print("mappedvalueright= ");
//  Serial.println(mappedvalueright); //to send human-readable data to Arduino monitor
// Serial.print("valueright= ");  
// Serial.println(valueright);
  Serial.write(mappedvalueleft);  //to send binary data to Processing
Serial.write(mappedvalueright);  //to send binary data to Processing
 }

