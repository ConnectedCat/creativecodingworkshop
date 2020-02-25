class Ball{
  float diameter = 100;
  PVector position;
  PVector velocity;
  //PVector acceleration;
  
  Ball(float _bDiameter,float _bX, float _bY){
    position = new PVector(_bX, _bY);
    diameter = _bDiameter;
    //velocity = new PVector(4.3, 2.7);
    //velocity = new PVector(random(3, 5), random(1.5, 4));
    float x = random(3, 5) * ((int)random(2)*2 - 1);
    float y = random(1.5, 4) * ((int)random(2)*2 - 1);
    velocity = new PVector(x, y);
  }
  
  void move(){
    if(position.x + diameter/2 >= width || position.x - diameter/2 <= 0) {
      velocity.x *= -1;
    }
    
    if(position.y + diameter/2 >= width || position.y - diameter/2 <= 0) {
      velocity.y *= -1;
    }
    
    position.add(velocity);
  }
  
  void display(){
    strokeWeight(15);
    stroke(20, 13, 117);
    fill(255);
    
    circle(position.x, position.y, diameter);
  }
}
