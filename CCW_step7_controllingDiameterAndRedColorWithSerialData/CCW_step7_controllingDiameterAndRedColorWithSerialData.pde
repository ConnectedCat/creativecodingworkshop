import processing.serial.*;

Serial myConnection;
String potRead = "";

float redComp = 136;

float diameter;
PVector position, speed;

PFont myFont;
String myText = "TYPE";

PGraphics myLayer;
color bgTextColor = color(255, 0, 0);

int[] blendModes = {
                    BLEND,     //0
                    ADD,       //1
                    SUBTRACT,  //2
                    DARKEST,   //3
                    LIGHTEST,  //4
                    DIFFERENCE,//5
                    EXCLUSION, //6
                    MULTIPLY,  //7
                    SCREEN,    //8
                    OVERLAY,   //9
                    HARD_LIGHT,//10
                    SOFT_LIGHT,//11
                    DODGE,     //12
                    BURN       //13
                    };
int currentBlendMode;

void setup(){
  size(800, 800);
  
  position = new PVector(width/2, height/2);
  speed = new PVector(3.5, 2.7); 
  diameter = 100;
  
  printArray(Serial.list());
  myConnection = new Serial(this, Serial.list()[0], 9600);
  myConnection.bufferUntil(10);
  
  //myFont = loadFont("ArialMT-48.vlw");
  //printArray(PFont.list());
  myFont = createFont(PFont.list()[8], 48);
  textFont(myFont);
  
  myLayer = createGraphics(width, height);
  myLayer.beginDraw();
  myLayer.textAlign(CENTER, CENTER);
  myLayer.textSize(232);
  myLayer.fill(bgTextColor);
  myLayer.text(myText, width/2, height/2);
  myLayer.endDraw();
  
  currentBlendMode = blendModes[5];
}

void draw(){
  //background(136, 189, 212, 70);
  noStroke();
  fill(redComp, 189, 212, 70);
  rect(0, 0, width, height);
  
  strokeWeight(15);
  stroke(20, 13, 117);
  fill(255);
  circle(position.x, position.y, diameter);
  
  position.add(speed);
  
  if(position.x + diameter/2 > width || position.x - diameter/2 < 0){
    speed.x *= - 1;
  }
  if(position.y +diameter/2 > height || position.y - diameter/2 < 0){
    speed.y *= - 1;
  }
  
  blend(myLayer, 0, 0, width, height, 0, 0, width, height, currentBlendMode);
}

void keyReleased(){
  switch(key){
    case '`':
      currentBlendMode = blendModes[0];
      println("BLEND");
      break;
    case '1':
      currentBlendMode = blendModes[1];
      println("ADD");
      break;
    case '2':
      currentBlendMode = blendModes[2];
      println("SUBTRACT");
      break;
    case '3':
      currentBlendMode = blendModes[3];
      println("DARKEST");
      break;
    case '4':
      currentBlendMode = blendModes[4];
      println("LIGHTEST");
      break;
    case '5':
      currentBlendMode = blendModes[5];
      println("DIFFERENCE");
      break;
    case '6':
      currentBlendMode = blendModes[6];
      println("EXCLUSION");
      break;
    case '7':
      currentBlendMode = blendModes[7];
      println("MULTIPLY");
      break;
    case '8':
      currentBlendMode = blendModes[8];
      println("SCREEN");
      break;
    case '9':
      currentBlendMode = blendModes[9];
      println("OVERLAY");
      break;
    case '0':
      currentBlendMode = blendModes[10];
      println("HARD LIGHT");
      break;
    case '-':
      currentBlendMode = blendModes[11];
      println("SOFT LIGHT");
      break;
    case '=':
      currentBlendMode = blendModes[12];
      println("DODGE");
      break;
    case BACKSPACE:
      currentBlendMode = blendModes[13];
      println("BURN");
      break;
    default:
      currentBlendMode = blendModes[5];
      println("defalt - DIFFERENCE");
      break;
  }
}

void serialEvent(Serial conn){
  potRead = conn.readString();
  println("Knob reading: " + potRead);
  
  diameter = float(potRead);
  redComp = map(float(potRead), 0, 1023, 0, 255);
}
