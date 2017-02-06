class GradientLine{
  color _c1, _c2;
  float _alpha;
  float _targetAlpha;
  float _speed;
  int _axis;
  
  GradientLine(color c1, color c2){
    _c1 = c1;
    _c2 = c2;
  }
  
  void update(float x, float y, float w, float h, int angle, int step){
    setGradient((int)x, (int)y, w, h, _c1, _c2, angle, step);
  }
  
  void setAlpha(float a, float speed){
    _targetAlpha = a;
    _speed = speed;
  }

  void setGradient(int x, int y, float w, float h, color c1, color c2, int angle, int step) {
    noFill();
    pushMatrix();
    translate(x, y);
    rotate(radians(angle));
    
    float diffAlpha = _targetAlpha - _alpha;
    float sp = diffAlpha * _speed;
    _alpha += sp;
    
    h -= step;
    for (int i = 0; i <= h; i+=step) {
      float inter = map(i, 0, h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      noStroke();
      fill(c, _alpha);
      rect(0, i, w/2, step);
    }
    
    popMatrix();
    
  }
}