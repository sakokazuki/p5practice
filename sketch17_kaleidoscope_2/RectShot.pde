class RectShot {
  
  PVector pos;
  PVector vec;
  PVector target;
  color col;
  color bgCol;
  boolean isShotting;
  float count;
   
  RectShot(int x, int y, PVector vec, color col){
    this.pos = new PVector(x, y);
    this.vec = vec;
    isShotting = false;
    this.col = col;
    this.bgCol = white;
    this.target = vec.mult(width);
    this.count = 0;
  }
  
  void drawRect(){
    float r = red(col);
    r = this.count/2;
    color drawColor = color(r, green(col), blue(col));
    if(isShotting == false) return;
    if(random(0,1)<0.3){
      fill(bgCol);
    }else{
      fill(drawColor);
    }
    
    noStroke();
    rectMode(CENTER);
    float w = random(5, 10);
    float h = random(5, 10);
    rect(pos.x, pos.y, w, h);
  }
  
  void update(){    

    PVector diff = PVector.sub(target, pos);
    PVector speed = PVector.mult(diff, 0.1);
    pos.add(speed);
    this.count += speed.dist(new PVector(0, 0));
    //println(this.count);
    
    if(abs(pos.x) > width - 10 || abs(pos.y) > height - 10){
      isShotting = false;
    }
  }
  
  void shot(){
    isShotting = true;
  }
}
  