class GradientTriangle{
  GradientLine[] line = new GradientLine[3];
  int r;
  float alpha = 255;
  
  GradientTriangle(int r, color col){
    this.r = r;
    for(int i=0; i<3; i++){
      color randomCol = col;
      line[i] = new GradientLine(randomCol, white);
    }
    setAlpha(255, 0.05);
  }
  
  void setAlpha(float alpha, float speed){
    for (int i = 0; i < 3; i++) {
      line[i].setAlpha(alpha, speed);      
    }
  }
  
  void update(PVector pos, float angle){
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    for (int i = 0; i < 3; i++) {
      float x = r*cos(radians(360*i/3));
      float y = r*sin(radians(360*i/3));
      float l = r*sqrt(3)+10;

      int lineAngle = 60 + i*120;
      line[i].update(x,y,10,l, lineAngle, 1);
      
    }
    popMatrix();
  }
}