class Ball {
  float diameter;
  PVector position;
  PVector speed;
  color strokeC = color(20, 13, 117);
  color fillC;

  Ball(float _bX, float _bY) {
    diameter = random(60, 130);
    position = new PVector(_bX, _bY);
    
    float sX = random(3, 5) * ( (int)random(2)*2 - 1 );
    float sY = random(1.5, 4) * ( (int)random(2)*2 - 1 );
    speed = new PVector(sX, sY);
    
    fillC = color( random(0, 255) );
  }

  void move() {
    position.add(speed);
  
    if(position.x + diameter/2 > width || position.x - diameter/2 < 0){
      speed.x *= - 1;
    }
    if(position.y +diameter/2 > height || position.y - diameter/2 < 0){
      speed.y *= - 1;
    }
  }

  void display() {
    strokeWeight(15);
    stroke(strokeC);
    fill(fillC);
    circle(position.x, position.y, diameter);
  }
}
