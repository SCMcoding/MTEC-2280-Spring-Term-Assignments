// DEMO FOR SENDING SERIAL DATA FROM ARDUINO TO PROCESSING
//READS ANALOG SENSOR AND WRITES VALUE TO SERIAL PORT 



const int sensorleft = A0; //sensor hooked up to analog pin A0
const int sensorright = A1;
int valueleft = 0;
int valueright = 0;


void setup() {
  pinMode (sensorleft, INPUT);
  pinMode (sensorright, INPUT);
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
valueleft = analogRead(sensorleft); //read sensor and assign to variable called valueleft
valueleft = valueleft * 2;
valueright = analogRead(sensorright); //read sensor and assign to variable called valueright
valueright= valueright*2+1;

 
  delay(100); // 

  /////////Uncomment Serial.print() OR Serial.write() and not both!//////////////
  
  // Serial. println(valueleft); //to send human-readable data to Arduino monitor
  // Serial. println(valueright); //to send human-readable data to Arduino monitor
  Serial.write(valueleft);  //to send binary data to Processing
  Serial.write(valueright);  //to send binary data to Processing
}

