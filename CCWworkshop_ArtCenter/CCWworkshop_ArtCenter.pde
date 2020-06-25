import processing.serial.*;
Serial myConnection;

String data;

float ball_diameter = 100;
PVector position;
PVector speed;

//boolean ball_moving_right = true;
//boolean ball_moving_down = true;

color BG_blue = color(136, 189, 212, 70);
color Dark_blue = color(20, 13, 117);
color BG_text = color(255, 0, 0);

PFont myFont;
String myText = "TYPE";

PGraphics myLayer;

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

boolean drawBall = true;
boolean loopFlag = true;

void setup() {
  size(800, 800);
  
  //printArray(PFont.list());
  myFont = createFont("Arial", 232);
  //myFont = loadFont("Georgia-32.vlw");

  position = new PVector(width/2, height/2);
  speed = new PVector(5, 3);
  
  textFont(myFont);
  
  myLayer = createGraphics(width, height);
  myLayer.beginDraw();
  myLayer.textAlign(CENTER, CENTER);
  myLayer.textSize(300);
  myLayer.fill(BG_text);
  myLayer.text(myText, myLayer.width/2, myLayer.height/2);
  myLayer.endDraw();
  
  currentBlendMode = blendModes[5];
  
  myConnection = new Serial(this, "COM3", 9600);
  myConnection.bufferUntil('\n');
}

void draw() {
  //background(136, 189, 212);
  noStroke();
  fill(BG_blue);
  rect(0, 0, width, height);
  
  if(drawBall){
    renderBall();
  }
  
  //image(myLayer, 0, 0);
  blend(myLayer, 0, 0, myLayer.width, myLayer.height, 0, 0, width, height, currentBlendMode);
}


void renderBall(){
  if (position.x + ball_diameter/2 >= width || position.x - ball_diameter/2 <= 0) {
    speed.x *= -1;
  }

  if (position.y + ball_diameter/2 >= height || position.y - ball_diameter/2 <= 0) {
    speed.y *= -1;
  }
  position.add(speed);

  strokeWeight(15);
  stroke(Dark_blue);
  fill(255);
  circle(position.x, position.y, ball_diameter);
}

void mouseReleased(){
  if(mouseButton == LEFT){
    drawBall = !drawBall;
  }
  if(mouseButton == RIGHT){
    if(loopFlag){
      loopFlag = false;
      noLoop();
    }
    else {
      loopFlag = true;
      loop();
    }
  }
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

void serialEvent(Serial port){
  data = port.readString();
  println(data);
  ball_diameter = float(data);
}
