class RotateBar{
  int x;
  int y;
  color col;
  float angle;
  float speed;
  int w;
  
  RotateBar(int x, int y, color col, float speed){
    this.x = x;
    this.y = y;
    this.col = col;
    this.speed = speed;
    w = 10;
  }
  
  void drawLine(){
    stroke(col);
    
    float rad = angle * PI*2 / 360;
    int r = 800;
    float endX = r * cos(rad);
    float endY = r * sin(rad);
    
    strokeWeight(w);
    strokeCap(ROUND);
    line(x, y, endX, endY);

  }
  
  
  void update(){
    angle+=speed + random(0, 0.1);
  }
  
  
}