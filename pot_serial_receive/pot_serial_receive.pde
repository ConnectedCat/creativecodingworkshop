import processing.serial.*;

Serial port;

String data;
float value;

void setup() {
  size(600, 600);
  println(Serial.list());
  
  port = new Serial(this, "COM3", 9600);
  port.bufferUntil('\n');  //clear the buffer
  
}

void draw() {
  background(127);
  
  fill(255, 0, 0);
  circle(width/2, height/2, value);

}

void serialEvent(Serial port) {
  data = port.readString();
  //println(data);
  
  value = float(data);
  println(value);
}
