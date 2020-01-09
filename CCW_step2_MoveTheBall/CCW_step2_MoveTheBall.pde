float ball_diameter = 100;
PVector ball_position;

//float ball_speed = 5;
PVector ball_velocity;

void setup(){
  size(800, 800);
  
  ball_position = new PVector(width/2, height/2);
  ball_velocity = new PVector(5.0, 3.0); 
}

void draw(){
  
  //ball_position.x += ball_velocity.x;
  //ball_position.y += ball_velocity.y;
  
  ball_position.add(ball_velocity);
  
  circle(ball_position.x, ball_position.y, ball_diameter);
}
