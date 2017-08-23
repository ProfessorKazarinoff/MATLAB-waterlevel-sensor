# MATLAB-waterlevel-sensor
A student project for ENGR114 at Portland Community College. Uses MATLAB to read a water level sensor connected to an Arudino over serial.

## Problem Statement
Our group was tasked with setting up an Arduino red board and coding it to interface
with a water level sensor. Additionally, we created a MATLAB script to convert the Arduino data
output into a format that we could record in real time, outputting the results to a plot graph that
showed water level changes in inches over 0.1 second intervals. The MATLAB script asks a
user to select how many seconds to record the water level, and whether or not to save the data
to a graphical plot.

## Hardware Setup

### Bill of Materials
|component|vendor|
|---|---|
|Arduino|[SparkFun RedBoard - Programmed with Arduino](https://www.sparkfun.com/products/13975)|
|Water Level Sensor|[12" eTape Liquid Level Sensor + extras](https://www.adafruit.com/product/464)|
|560 Ω resistor|[560 Ohm Resistor incldued with Liquid Level Sensor](https://www.adafruit.com/product/464)|
|Breadboard|[Breadboard - Self-Adhesive (White)](https://www.sparkfun.com/products/12002)|
|Jumper wires|[Jumper Wires Premium 6" M/M Pack of 10](https://www.sparkfun.com/products/8431 )|
|Breadboard Base|[Arduino and Breadboard Holder](https://www.sparkfun.com/products/11235)|
|Mini-B USB cable|[SparkFun USB Mini-B Cable - 6 Foot](https://www.sparkfun.com/products/11301)|

### Component Connections
The microcontroller is connected to the computer via a USB cable, which also supplies
the power. The red wire connected to the RedBoard is connected to the 5v pin and drives
voltage to the breadboard via a (+) pin. The green wire connected to the RedBoard is connected
to the ground pin and is grounding the circuit through the breadboard via a (–) pin. The orange
wire connected to the A0 pin on the RedBoard is an analog-to-digital converter which reads the
voltage in the circuit for recording the changes in the water level sensor via the H26 pin on the
breadboard. The power to the breadboard continues through the orange jumper wire connecting
a (+) pin to the J30 pin. Next in the circuit is a resistor connected to pins I30 and I26. From there
another orange jumper wire connects the circuit via pins F26 and E26. The black wire
connected to pin D26 takes the current to a connector plug which plugs into the water level
sensor. The red wire coming off the water level sensor plug connects to pin C14 on the
breadboard. A green jumper wire then connects pin D14 to a (-) pin completing the circuit.

![Alt text](doc/fritzing_diagram.png?raw=true "Title")
![Alt text](doc/watersensor1.jpg?raw=true "Title")
![Alt text](doc/watersensor6.jpg?raw=true "Title")

## Arduino Code

The [water_level.ino](water_level.ino) sketch was uploaded on the Arduino using the Arduino IDE.

## MATLAB Code

The [water_level.m](water_level.m) script was run in MATLAB.

## Results
![Alt text](doc/results.png?raw=true "Title")

## Future Work
Future work could include interfacing with the pump to turn on when the water level falls
below a certain level, and turn off when water level reaches a maximum desirable level.

## License
GNU General Public License v3.0
