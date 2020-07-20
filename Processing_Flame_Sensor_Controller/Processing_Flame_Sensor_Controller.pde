import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

int flame = 2;

color off = color(255, 255, 255);
color on = color(0, 255, 0);

void setup() {
  size(1200, 750);
  arduino = new Arduino(this, Arduino.list()[3], 57600);
  arduino.pinMode(flame, Arduino.INPUT);
    
}

void draw() {
  background(off);
  stroke(on);
  int isFlame = arduino.analogRead(flame);
  
  if (isFlame == Arduino.HIGH)
    fill(off);
  else
    fill(on);
  
  ellipse(width / 2, height / 2, isFlame / 1.5, isFlame / 1.5);
}
