/* Water Level Sensor System
   Author: PCC ENGR114 Student Spring 2017
   Date: 06/01/2017
   Version: 2.0
   Description: This program reads the analog voltage signal from the eTape 
   and displays the measurements digitally in Arduino.

   Connect pin #2 of the sensor to ground, then pin #3 to a 560 ohm resistor. 
   The other side of the 560 ohm resistor to VCC 5V to create a resistor 
   divider. The ADC pin connects to the point between the resistor and sensor.
*/ 
// the value of the resistor (not the eTape)
#define SERIESRESISTOR 560    
 
// Sensor pin input
#define SENSORPIN A0 

// resistance values
#define zero_depth_resistance 550 // Resistance value when no liquid is present. 
#define max_resistance    60    // Resistance when liquid is at max line. 

 
void setup(void) {
  Serial.begin(9600);
}
 
void loop(void) {
  float reading;
 
  reading = analogRead(SENSORPIN); // voltage reading from eTape

 
  // convert the value to resistance
 
  reading = (1023 / reading)  - 1;
  reading = SERIESRESISTOR / reading;
  Serial.println(reading);

 
  delay(100);

}
