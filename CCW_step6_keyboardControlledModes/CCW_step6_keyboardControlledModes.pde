float ball_diameter = 100;
PVector ball_position;
PVector ball_velocity;

boolean drawBall = true;

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
  
  //setting up the ball
  ball_position = new PVector(width/2, height/2);
  ball_velocity = new PVector(4.3, 2.7);
  
  //setting up the typography (1 of 2 ways)
  printArray(PFont.list());
  myFont = createFont("Arial", 232);
  textFont(myFont);
  
  //creating a new layer
  myLayer = createGraphics(width, height);
  myLayer.beginDraw();
  myLayer.textAlign(CENTER, CENTER);
  myLayer.textSize(300);
  myLayer.fill(bgTextColor);
  myLayer.text(myText, myLayer.width/2, myLayer.height/2);
  myLayer.endDraw();
  
  currentBlendMode = blendModes[5];
}

void draw(){
  noStroke();
  fill(136, 189, 212, 50);
  rect(0, 0, width, height);
  
  if(drawBall){
  
    if(ball_position.x + ball_diameter/2 >= width || ball_position.x - ball_diameter/2 <= 0) {
      ball_velocity.x *= -1;
    }
    
    if(ball_position.y + ball_diameter/2 >= width || ball_position.y - ball_diameter/2 <= 0) {
      ball_velocity.y *= -1;
    }
    
    strokeWeight(15);
    stroke(20, 13, 117);
    fill(255, 60);
    ball_position.add(ball_velocity);
    circle(ball_position.x, ball_position.y, ball_diameter);
  }
  
  //image(myLayer, 0, 0);
  blend(myLayer, 0, 0, width, height, 0, 0, width, height, currentBlendMode);
}

void mouseReleased(){
  if(mouseButton == LEFT){
    drawBall = !drawBall;
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
