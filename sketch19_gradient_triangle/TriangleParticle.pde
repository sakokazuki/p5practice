class TriangleParticle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float angle;
  float rotateSpeed;
  GradientTriangle triangle;
    
    
  TriangleParticle(PVector l){
    acceleration = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    PVector randomVec = new PVector(random(-1, 1) ,random(-1,1)).normalize();
    velocity = randomVec.mult(random(0.1, 1.5));
    location = l.copy();
    lifespan = 255.0;
    angle = (int)random(0, 360);
    rotateSpeed = random(0.005, 0.02);
    
    int randomSize = (int)random(10, 50);
    color randomCol = MAIN_COL[(int)random(0, MAIN_COL.length)];
    triangle = new GradientTriangle(randomSize, randomCol);
  }
    
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    angle += rotateSpeed;
    lifespan -= 1.0;
    
    if(lifespan<100){
      triangle.setAlpha(0,0.1);
    }
     
    triangle.update(location, angle);
  }
    
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
   }
  
}