class ArcShot {
  
  int x;
  int y;
  float r;
  float speed;
  int angle;
  int direction;
  color col;
  color bgCol;
  boolean isShotting;
   
  ArcShot(int x, int y, float speed, int angle, int direction, color col){
    this.x = x;
    this.y = y;
    this.r = 0;
    this.speed = speed;
    this.angle = angle;
    this.direction = direction;
    isShotting = false;
    this.col = col;
    this.bgCol = white;
  }
  
  void drawArc(){
    float green= red(col);
    green = this.r/2;
    color drawColor = color(red(col), green, blue(col));
    if(isShotting == false) return;
    noFill();
    
    if(random(0,1)<0.7){
      stroke(bgCol);
    }else{
      stroke(drawColor);
    }
    
    int randomWeight = (int)random(5, 15);
    strokeWeight(randomWeight);
    strokeCap(SQUARE);
    float start = (this.direction-this.angle/2) * PI*2/360;
    float end = (this.direction+this.angle/2) * PI*2/360;
    arc(x, y, r, r, start, end);
  }
  
  void update(){
    
    this.r += this.speed; 
    
    float posX = x + r/2*cos(direction*PI*2/360);
    float posY = y + r/2*sin(direction*PI*2/360);
    if(abs(posX) > width + 100 || abs(posY) > height + 100){
      isShotting = false;
      this.r = 0;
    }
  }
  
  void shot(){
    isShotting = true;
  }
}