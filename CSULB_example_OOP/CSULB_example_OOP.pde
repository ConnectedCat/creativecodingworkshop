PFont myFont;
String myText = "TYPE";

ArrayList<Ball> balls;

void setup(){
  size(800, 800);

  printArray(PFont.list());
  myFont = createFont(PFont.list()[8], 48);
  textFont(myFont);
  balls = new ArrayList<Ball>();
  
  balls.add( new Ball(width/2, height/2) );
  
  //myBall = new Ball(width/2, height/2);
}

void draw(){
  //background(136, 189, 212, 70);
  noStroke();
  fill(136, 189, 212, 70);
  rect(0, 0, width, height);
  
  textAlign(CENTER, CENTER);
  textSize(232);
  text(myText, width/2, height/2);
  
  for(Ball myBall : balls){
    myBall.move();
    myBall.display();
  }
}


void mouseReleased(){
  balls.add( new Ball(mouseX, mouseY) );
}
