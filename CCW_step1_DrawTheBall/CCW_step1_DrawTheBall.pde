float ball_diameter = 100;
PVector ball_position;

void setup(){
  size(800, 800);
  
  ball_position = new PVector(width/2, height/2);
}

void draw(){
  
  circle(ball_position.x, ball_position.y, ball_diameter);
}
