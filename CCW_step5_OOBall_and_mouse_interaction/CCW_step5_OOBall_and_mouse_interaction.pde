ArrayList<Ball> balls = new ArrayList<Ball>();

PFont myFont;
String myText = "TYPE";

void setup(){
  size(800, 800);
  
  balls.add(new Ball(100.0, width/2, height/2));
  
  printArray(PFont.list());
  myFont = createFont("Arial", 232);
  textFont(myFont);
}

void draw(){
  noStroke();
  fill(136, 189, 212, 50);
  rect(0, 0, width, height);
  
  textAlign(CENTER, CENTER);
  text(myText, width/2, height/2);
  
  for(Ball thisBall : balls){
    thisBall.move();
    thisBall.display();
  }
  
}

void mouseReleased(){
  balls.add(new Ball(random(40, 100), mouseX, mouseY));
}
