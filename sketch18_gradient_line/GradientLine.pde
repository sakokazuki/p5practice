class GradientLine{
  color _c1, _c2;
  int _axis;
  int Y_AXIS = 1, X_AXIS = 2;
  
  GradientLine(color c1, color c2, int axis){
    _c1 = c1;
    _c2 = c2;
    _axis = axis;
  }
  
  void update(float x, float y, float w, float h, int step){
    setGradient((int)x, (int)y, w, h, _c1, _c2, _axis, step);
  }
  
  
  
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis, int step) {
    noFill();
    if (axis == Y_AXIS) {
      //x -= w/2;
      
      for (int i = y; i <= y+h; i+=step) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        noStroke();
        fill(c);
        rect(x, i, w/2, step);
      }
    }  
    else if (axis == X_AXIS) {
      y -= h/2;
      for (int i = x; i <= x+w; i+=step) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        noStroke();
        fill(c);
        line(i, y, step, h/2);
      }
    }
  }
}