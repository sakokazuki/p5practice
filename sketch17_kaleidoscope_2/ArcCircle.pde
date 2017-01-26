class ArcCircle{
  int x;
  int y;
  color col;
  float angle;
  float speed;
  float startAngle;
  float endAngle;
  boolean isUpdating;
  float targetAngle;
  
  ArcCircle(int x, int y, color col, float start, float end){
    this.x = x;
    this.y = y;
    this.col = col;
    this.startAngle = start;
    this.targetAngle = end;
    this.endAngle = start;
    this.isUpdating = false;
  }
  
  void drawArc(){
    noStroke();
    fill(col);
  
    int r = 800;
    float start = startAngle * PI*2/360;
    float end = endAngle * PI*2/360;
    arc(x, y, r, r, start, end, PIE);
  }
  
  void update(){
    if(isUpdating == true){
      float diff = targetAngle+1 - endAngle;
      float speed = diff * 0.3;
      endAngle += speed;
    }
    if(endAngle >= targetAngle){
      isUpdating = false;
      endAngle = startAngle;
    }
  }
  
  void startAnim(){
    if(isUpdating == true) return;
    isUpdating = true;
  }
}