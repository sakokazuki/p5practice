class LineParticle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  GradientLine line;
  
  
  LineParticle(PVector l){
    acceleration = new PVector(0,0.05);
    velocity = new PVector(0.0 ,random(1,0));
    location = l.get();
    lifespan = 255.0;

    color randomCol = getRandomColor();
    line = new GradientLine(randomCol, white, 1);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
   
    line.update(location.x, location.y, 10,200, 10);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
  color getRandomColor(){
    color[] c = {color(150, 150, 255), color(150, 255, 255)};
    int r = (int)random(0, c.length);
    return c[r];
    
  }
}