const int LED2 = 2; //create a variable called LED2 and assign it to pin 2
 const int LED3 = 3; //create a variable called LED3 and assign it to pin 3
 const int LED4 = 4;
 const int LED5 = 5;
 const int LED6 = 6;
const int LED7 = 7;
 const int buttonPin = 8; //create a variable called buttonPin and assign it to pin 8int buttonState = 0; // create a variable to track a button state.
void setup() {
 // put your setup code here, to run once:
pinMode(LED1, OUTPUT); // initialize LED1 pin as a output
pinMode(LED2,OUTPUT ); // initialize LED2 pin as a output
pinMode(LED3, OUTPUT); // initialize LED3 pin as a output
pinMode(LED4, OUTPUT); // initialize LED3 pin as a output
pinMode(LED5, OUTPUT); // initialize LED3 pin as a output
pinMode(LED6, OUTPUT); // initialize LED3 pin as a output
pinMode(LED7, OUTPUT); // initialize LED3 pin as a output
pinMode(buttonPin, INPUT); //initialize button pin as an input
}void loop() {
 // put your main code here, to run repeatedly:
buttonState = digitalRead(buttonPin);
delay (10);// small delay for debouncing//conditinal statement
if(buttonState == HIGH){ // if button is pressed
 digitalWrite(LED1, HIGH); // send Voltage to LED pin
 delay (700);
 digitalWrite(LED2, HIGH);
 delay (700);
 digitalWrite(LED3, HIGH);
 delay (700);
  digitalWrite(LED4, HIGH);
 delay (700);
  digitalWrite(LED5, HIGH);
 delay (700);
  digitalWrite(LED6, HIGH);
 delay (700);
} else { // otherwise digitalWrite(LED1, LOW); // turn off voltage to LED1 pin
 delay (500);
 digitalWrite(LED3,LOW);
 delay (500);
 digitalWrite(LED2,LOW);
 delay (500);
 digitalWrite(LED3,LOW);
 delay (500);
 digitalWrite(LED4,LOW);
 delay (500);
  digitalWrite(LED5,LOW);
 delay (500);
  digitalWrite(LED6,LOW);
 delay (500);
   digitalWrite(LED7,LOW);
 delay (500);
 }
 }
