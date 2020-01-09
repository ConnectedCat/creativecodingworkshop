float ball_diameter = 100;
PVector ball_position;
PVector ball_velocity;

PFont myFont;
String myText = "TYPE";

PGraphics myLayer;
color bgTextColor = color(255, 0, 0);

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
}

void draw(){
  noStroke();
  fill(136, 189, 212, 50);
  rect(0, 0, width, height);
  
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
  
  //image(myLayer, 0, 0);
  blend(myLayer, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
}
