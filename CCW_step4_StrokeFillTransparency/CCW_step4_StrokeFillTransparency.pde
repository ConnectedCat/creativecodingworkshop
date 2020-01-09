float ball_diameter = 100;
PVector ball_position;
PVector ball_velocity;

void setup(){
  size(800, 800);
  
  ball_position = new PVector(width/2, height/2);
  ball_velocity = new PVector(4.3, 2.7); 
}

void draw(){
  //background(136, 189, 212, 80);
  noStroke();
  fill(136, 189, 212, 70);
  rect(0, 0, width, height);
  
  if(ball_position.x + ball_diameter/2 >= width || ball_position.x - ball_diameter/2 <= 0) {
    ball_velocity.x *= -1;
  }
  
  if(ball_position.y + ball_diameter/2 >= width || ball_position.y - ball_diameter/2 <= 0) {
    ball_velocity.y *= -1;
  }
  
  strokeWeight(15);
  stroke(20, 13, 117);
  fill(255);
  ball_position.add(ball_velocity);
  circle(ball_position.x, ball_position.y, ball_diameter);
}
