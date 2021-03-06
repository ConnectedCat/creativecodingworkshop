//Tomas de Camino Beck
//data order:
//cap3(0),cap2(1),cap0(2),cap1(3),cap12(4),cap6(5),cap9(6),cap10(7),slide(8),
//button_left(9),button_right(10),light(11),sound(12),X(13),Y(14),Z(15),temp(16)


import processing.serial.*;
Serial port;
String data;
int [] capSense= new int[8];
int slide, buttonLeft, buttonRight;
float light, sound, temp;
float aX, aY, aZ;


void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista
  //change port name to wherever playground is connected
  port = new Serial(this, "/dev/ttyACM0", 9600);
  port.bufferUntil('\n');  //clear the buffer
  size(600, 600);
  ellipseMode(CENTER);
  background(0);
}

void draw() {
  //light changes background
  background(light, 250);

  //accelerometer move lines
  stroke(255);
  line(map(aX, 10, -10, 0, width), 0, map(aX, 10, -10, 0, width), height);
  line(0, map(aY, -10, 10, 0, height), width, map(aY, -10, 10, 0, height));

  //slide turns capSense circles on/off
  if (slide==0) {
    //capsense concentric circles
    noFill();
    strokeWeight(10);
    for (int i=0; i<8; i++) {
      stroke(capSense[i]);
      ellipse(width/2, height/2, i*50, i*50);
    }
  }
}

void serialEvent(Serial port) {
  //cap3(0),cap2(1),cap0(2),cap1(3),cap12(4),cap6(5),cap9(6),cap10(7),slide(8),
  //button_left(9),button_right(10),light(11),sound(12),X(13),Y(14),Z(15),temp(16)
  data = port.readString();
  String[] list = split(data, ',');
  if (list.length==17) {
    capSense[0]=int(list[0]);
    capSense[1]=int(list[1]);
    capSense[2]=int(list[2]);
    capSense[3]=int(list[3]);
    capSense[4]=int(list[4]);
    capSense[5]=int(list[5]);
    capSense[6]=int(list[6]);
    capSense[7]=int(list[7]);
    slide=int(list[8]);
    buttonLeft=int(list[9]);
    buttonRight=int(list[10]);
    light=float(list[11]);
    sound=float(list[12]);
    aX=float(list[13]);
    aY=float(list[14]);
    aZ=float(list[15]);
    temp=float(list[16]);
  }
}
