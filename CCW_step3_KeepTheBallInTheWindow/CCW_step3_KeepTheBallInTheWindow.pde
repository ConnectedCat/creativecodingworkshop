float ball_diameter = 100;
PVector ball_position;

//float ball_speed = 5;
PVector ball_velocity;

//boolean ball_moving_right = true;
//boolean ball_moving_up = true;

void setup(){
  size(800, 800);
  
  ball_position = new PVector(width/2, height/2);
  ball_velocity = new PVector(5.0, 3.0); 
}

void draw(){
  background(136, 189, 212);
  
  //if(ball_position.x >= width) ball_moving_right = false;
  //if(ball_position.x <= 0) ball_moving_right = true;
  //if(ball_moving_right) {
  //  ball_position.x += ball_velocity.y;
  //}
  //else {
  //  ball_position.x += ball_velocity.y;
  //}
  
  
  if(ball_position.x + ball_diameter/2 >= width || ball_position.x - ball_diameter/2 <= 0) {
    ball_velocity.x *= -1;
  }
  
  if(ball_position.y + ball_diameter/2 >= width || ball_position.y - ball_diameter/2 <= 0) {
    ball_velocity.y *= -1;
  }
  
  ball_position.add(ball_velocity);
  circle(ball_position.x, ball_position.y, ball_diameter);
}
